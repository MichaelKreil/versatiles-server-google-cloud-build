
# Usage

## Prepare the data

- Prepare a Google Cloud Storage Bucket.
- Copy the newest version of "planet-*.versatiles" from [download.versatiles.org](https://download.versatiles.org/):
  - In "Bucket details" click on "TRANDFER DATA", "Transfer data in".
  - Select "Source type: URL list" and click on "NEXT STEP".
  - As "URL of TSV file" set: "https://raw.githubusercontent.com/versatiles-org/versatiles-server-google-cloud-build/main/urllist.tsv" and click on "NEXT STEP".
  - Choose a bucket and folder as destination and click on "NEXT STEP".
  - "Run once", "Starting now" and click on "NEXT STEP".
  - Click on "CREATE".
  - This will start the transfer. You can monitor the transfer also in [transfer jobs](https://console.cloud.google.com/transfer/jobs).
  - For unknown reasons, Google transfers the data at a speed of only an annoying 10 MB/s. Alternatives:
    - If you have a fast internet connection at home/work, you can download the file manually with wget/curl and upload it with gscloud.
    - You could also use a Google Compute Engine VM to download and upload the file.
    - During the data transfer, you could have lunch or exercise.
- Either the bucket or the file must be [publicly accessible](https://cloud.google.com/storage/docs/access-control/making-data-public). <details><summary>Details</summary>
    In the current version of VersaTiles, Google authentication is not yet implemented. Therefore, either the entire bucket or the file must be publicly accessible to enable access via HTTPS.
  <details>

## Prepare Google Cloud Run

- Fork this repo
- Go to [Google Cloud Build Triggers](https://console.cloud.google.com/cloud-build/triggers)
- Create a [new trigger](https://console.cloud.google.com/cloud-build/triggers;region=global/add)
  - Choose a "Name" and "Region".
  - "Event": Select "Push to a branch".
  - "Source": Select you repository fork and and select the branch "main". <details><summary>Details</summary>
    You might have to connect to your GitHub account and allow access to your repository fork.
  <details>
  - "Configuration": Select "Cloud Build configuration file"
  - "Advanced": Add a "Substitution variables":
    - "Variable 1": `_VERSATILES_BUCKET_PATH`
    - "Value 1": `bucket/folder/planet.versatiles` <details><summary>Details</summary>
      This value is used as an environment variable in "Dockerfile". Make sure, that it is correct.
      You can verify this value quite easily. In your terminal set it as an environment variable
      `_VERSATILES_BUCKET_PATH="bucket/folder/planet.versatiles"`
      If your bucket is public then this should work:
      `curl -r 0-13 "https://storage.googleapis.com/$_VERSATILES_BUCKET_PATH"`
    <details>
  - When finished click button "Create".
- Build your Google Cloud Run Service be clicking on "RUN" next to your Google Cloud Build Trigger and confirm by clicking on the button "RUN TRIGGER" in the popup.


# What is I doing?

Fetch latest version of versatiles, add latest frontend, build Google Cloud Run service and serve everything at: https://tiles-dev.datenhub.net

This repo will replace datenhub-tiles-server/proxy.

