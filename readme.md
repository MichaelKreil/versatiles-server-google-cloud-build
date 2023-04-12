
# Usage

- Fork this repo
- Go to [Google Cloud Build Triggers](https://console.cloud.google.com/cloud-build/triggers)
- Create a [new trigger](https://console.cloud.google.com/cloud-build/triggers;region=global/add)
  - Choose a "Name" and "Region".
  - "Event": Select "Push to a branch".
  - "Source": Select you forked repository and branch "main".
  - "Configuration": Select "Cloud Build configuration file"
  - "Advanced": Add a "Substitution variables":
    - "Variable 1": `_BUCKET_PATH`
    - "Value 1": `my_bucket/map_data`
  - When finished click button "Create".


# What am I doing?

Fetch latest version of versatiles, add latest frontend, build Google Cloud Run service and serve everything at: https://tiles-dev.datenhub.net

This repo will replace datenhub-tiles-server/proxy.

