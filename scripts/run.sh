#!/bin/bash

[ -z "$SSH_KEY" ] && echo "Please set the \"SSH_KEY\" parameter" && exit 1;
[ -z "$GIT_USER_EMAIL" ] && echo "Please set the \"GIT_USER_EMAIL\" parameter" && exit 1;
[ -z "$GIT_USER_NAME" ] && echo "Please set the \"GIT_USER_NAME\" parameter" && exit 1;
[ -z "$GIT_URL" ] && echo "Please set the \"GIT_URL\" parameter" && exit 1;
[ -z "$PROJECT_PATH" ] && echo "Please set the \"PROJECT_PATH\" parameter" && exit 1;
[ -z "$PROJECT_PO_FILES_PATH" ] && echo "Please set the \"PROJECT_PO_FILES_PATH\" parameter" && exit 1;
[ -z "$PLUGIN_PO_FILES_PATH" ] && echo "Please set the \"PLUGIN_PO_FILES_PATH\" parameter" && exit 1;
[ -z "$POEDITOR_API_TOKEN" ] && echo "Please set the \"poeditor_api_token\" secret" && exit 1;
[ -z "$POEDITOR_PROJECT_ID" ] && echo "Please set the \"poeditor_project_id\" secret" && exit 1;

# Downloading po files
echo "STEP 1. Downloading files from poeditor"
mkdir $PLUGIN_PO_FILES_PATH
bash /bin/scripts/poeditor.sh

# Getting repo and updating po files
echo "STEP 2. Negociating with git to update the po files"
mkdir $PROJECT_PATH
bash /bin/scripts/git.sh