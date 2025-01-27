#!/bin/bash
buildTypes=($BUILD_TYPE)
buildEnvs=($BUILD_ENV)
buildBusinessList=($BUILD_BUSINESS)
credentials=$REGITTOKEN
upload_to_playstore=$UPLOAD_TO_PLAYSTORE
repetativeBuildCheck=$REPETATIVE_BUILD_CHECK
hotfix=$HOTFIX
echo "=== Starting Build Script ==="
echo "Branch: $BRANCH"
echo "Build Types: ${buildTypes[@]}"
echo "Build Envs: ${buildEnvs[@]}"
echo "Build Business List: ${buildBusinessList[@]}"
echo "Upload to Playstore: $upload_to_playstore"
echo "Repetitive Build Check: $repetativeBuildCheck"
echo "Hotfix: $hotfix"
echo "=============================="