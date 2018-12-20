# poeditor-bitbucket-sync

This piece of code allows you to get po files from poeditor and then commit them to a git repository (bitbucket in our case).

Build the image
```
# Useful for local testing
docker build -t image_name .
```

Create the container from the image
```
docker run -e "SSH_KEY=$(cat id_rsa)" \
-e POEDITOR_API_TOKEN='poEditorApiToken' \
-e POEDITOR_PROJECT_ID='poEditorProjectId' \
-e PLUGIN_PO_FILES_PATH='locales/' \
-e PROJECT_PATH='project/' \
-e PROJECT_PO_FILES_PATH='path/to_your_locales/' \
-e GIT_URL='git@bitbucket.org:owner/project.git' \
-e GIT_USER_EMAIL='owner@project.com' \
-e GIT_USER_NAME='Owner name' \
image_name
```

## How to
1. Build the image (safe to be used on docker hub)
2. Add your own private key id_rsa in the root folder
3. Change informations in the docker run command above
4. Launch the docker run command with modified informations

## Alternative to '-e'
As an alternative you can use a `.env` file. The command would look like the following :
```
docker run -e "SSH_KEY=$(cat id_rsa)" --env-file .env image_name
```
Your `.env` file containing vars as `VAR=value`
