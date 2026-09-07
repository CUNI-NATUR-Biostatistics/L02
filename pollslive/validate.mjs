import { lstat, readFile } from "node:fs/promises";
import path from "node:path";

const repositoryRoot = process.cwd();
const pollsliveRoot = path.join(repositoryRoot, "pollslive");
const definitionPath = path.join(pollsliveRoot, "quiz.json");
const configPath = path.join(pollsliveRoot, "config.json");
const definition = JSON.parse(await readFile(definitionPath, "utf8"));
const config = JSON.parse(await readFile(configPath, "utf8"));

assert(definition.schemaVersion === 2, "quiz.json schemaVersion must be 2.");
assert(definition.academicYear === "2026-27", "quiz.json academicYear must be 2026-27.");
assert(definition.lesson === "L02", "quiz.json lesson must be L02.");
assert(definition.retrievesLesson === "L01", "quiz.json must retrieve L01.");
assert(definition.lectureDate === "2026-10-12", "quiz.json lectureDate must match the course schedule.");
assert(typeof definition.title === "string" && definition.title.length > 0, "quiz.json requires a title.");
assert(!Object.hasOwn(definition, "remotePollId"), "Poll identity must remain in the central registry.");
assert(Array.isArray(definition.questions) && definition.questions.length === 3, "quiz.json must contain exactly three questions.");

const questionIds = new Set();
for (const question of definition.questions) {
  assertId(question.id, "question");
  assert(!questionIds.has(question.id), `Duplicate question id: ${question.id}.`);
  questionIds.add(question.id);
  assertText(question.text, `${question.id}.text`);
  assertText(question.explanation, `${question.id}.explanation`);
  assert(Array.isArray(question.options) && question.options.length >= 2 && question.options.length <= 6, `${question.id} must have 2-6 options.`);
  const optionIds = new Set();
  for (const option of question.options) {
    assertId(option.id, `${question.id} option`);
    assert(!optionIds.has(option.id), `Duplicate option id in ${question.id}: ${option.id}.`);
    optionIds.add(option.id);
    assertText(option.label, `${question.id}.${option.id}.label`);
  }
  assert(optionIds.has(question.correctOptionId), `${question.id}.correctOptionId must identify one option.`);
  assert(question.media && typeof question.media === "object", `${question.id} requires evidence media.`);
  assertText(question.media.path, `${question.id}.media.path`);
  assertText(question.media.alt, `${question.id}.media.alt`);
  assertText(question.media.provenance, `${question.id}.media.provenance`);
  const mediaPath = path.resolve(pollsliveRoot, question.media.path);
  const relative = path.relative(pollsliveRoot, mediaPath);
  assert(relative && !relative.startsWith("..") && !path.isAbsolute(relative), `${question.id} media must remain below pollslive/.`);
  assert(new Set([".png", ".jpg", ".jpeg", ".webp"]).has(path.extname(mediaPath).toLowerCase()), `${question.id} uses an unsupported media type.`);
  const mediaStatus = await lstat(mediaPath);
  assert(mediaStatus.isFile() && !mediaStatus.isSymbolicLink(), `${question.id} media must be a regular file, not a symlink.`);
}

assert(config.schemaVersion === 1, "config.json schemaVersion must be 1.");
assert(config.clientRepository === "CUNI-NATUR-Biostatistics/_internal", "config.json must use the canonical client repository.");
assert(/^[a-f0-9]{40}$/.test(config.clientRevision ?? ""), "config.json must pin a complete client revision.");
assert(config.definition === "pollslive/quiz.json", "config.json definition path is invalid.");
assert(config.documentDirectory === "Presentation", "config.json documentDirectory is invalid.");
assert(config.generatedDirectory === "pollslive/generated", "config.json generatedDirectory is invalid.");
assert(JSON.stringify(config.assetPreparation?.command) === JSON.stringify(["Rscript", "R/render_pollslive_assets.R"]), "config.json asset preparation command is invalid.");
assert(config.synchronization?.repository === "CUNI-NATUR-Biostatistics/_internal", "config.json synchronization repository is invalid.");
assert(config.synchronization?.workflow === "pollslive-sync.yml", "config.json synchronization workflow is invalid.");
assert(config.synchronization?.ref === "main", "config.json synchronization ref must be main.");

const serialized = JSON.stringify({ definition, config });
assert(!/(api[_-]?key|edit[_-]?url|management[_-]?url|presenter[_-]?url|session[_-]?token|host[_-]?token|temporary[_-]?code)/i.test(serialized), "PollsLive inputs contain a forbidden secret or management field.");
console.log("Validated L02 PollsLive definition, configuration, and evidence assets without credentials.");

function assert(condition, message) {
  if (!condition) throw new Error(message);
}

function assertText(value, label) {
  assert(typeof value === "string" && value.trim().length > 0, `${label} must be non-empty text.`);
}

function assertId(value, label) {
  assert(typeof value === "string" && /^[a-z0-9][a-z0-9-]*$/.test(value), `${label} id is invalid.`);
}
