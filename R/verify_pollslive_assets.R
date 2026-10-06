#----------------------------------------------------------#
# Verify approved local evidence for the L02 retrieval quiz
#----------------------------------------------------------#

library(here)

here::i_am("R/verify_pollslive_assets.R")

# These images are reviewed teaching inputs. Re-rendering text through grid and
# a platform font stack changed their bytes across R sessions and therefore
# made immutable synchronization unreliable. Keep the approved files stable and
# verify their exact bytes before every local PollsLive preparation instead.
approved_assets <-
  c(
    "l01-table-four-mammals.png" =
      "043172ede7e25ce55643491bce2534102659270a04fdef1f24372fcf3f34d5d7",
    "l01-sleep-histogram.png" =
      "212ca9c94c5fb7e78b3e53c9b9a794021cd3f6f1f6beca34b78f5f75426f4181",
    "l01-console-median.png" =
      "bfc5290aec2014926692bc08cffc3adbd18ce817651e119b42740e2c725ad290"
  )

asset_paths <-
  here::here("pollslive", "assets", names(approved_assets))

missing_assets <-
  names(approved_assets)[!file.exists(asset_paths)]

if (length(missing_assets) > 0L) {
  stop(
    "Missing approved PollsLive evidence assets: ",
    paste(missing_assets, collapse = ", ")
  )
}

actual_checksums <-
  unname(
    vapply(
      asset_paths,
      digest::digest,
      character(1),
      algo = "sha256",
      file = TRUE
    )
  )

changed_assets <-
  names(approved_assets)[actual_checksums != unname(approved_assets)]

if (length(changed_assets) > 0L) {
  stop(
    "Approved PollsLive evidence assets changed: ",
    paste(changed_assets, collapse = ", ")
  )
}
