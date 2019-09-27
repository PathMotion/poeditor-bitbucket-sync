#!/bin/bash

# ssh
mkdir ~/.ssh
echo -e "${SSH_KEY}" > ~/.ssh/id_rsa
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
# For host key verification
echo -e "Host *\n    StrictHostKeyChecking no\n    UserKnownHostsFile=/dev/null\n" > ~/.ssh/config

# Setting up repo
git init
git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"
git remote add origin $GIT_URL
git clone --depth 50 --single-branch --branch develop --progress --verbose $GIT_URL $PROJECT_PATH

# Moving downloaded po files to the project
mv -v $PLUGIN_PO_FILES_PATH* $PROJECT_PATH$PROJECT_PO_FILES_PATH

# Commit and ship
cd $PROJECT_PATH
git add $PROJECT_PO_FILES_PATH
git commit -m "po file update - $(date)"
git push -v origin develop
