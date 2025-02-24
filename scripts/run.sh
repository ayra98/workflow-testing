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
echo "credentials: $credentials"
echo "Build Types: ${buildTypes[@]}"
echo "Build Envs: ${buildEnvs[@]}"
echo "Build Business List: ${buildBusinessList[@]}"
echo "Upload to Playstore: $upload_to_playstore"
echo "Repetitive Build Check: $repetativeBuildCheck"
echo "Hotfix: $hotfix"
echo "=============================="

echo "test"

for buildBusiness in "${buildBusinessList[@]}";
do
 echo "Build Business is :- " $buildBusiness
 for buildType in "${buildTypes[@]}";
 do
   echo "Build Type is :- " + $buildType
   for buildEnv in "${buildEnvs[@]}";
   do
     echo "Build Env is :- " + $buildEnv
     echo $buildType | awk '{gsub(/^ +| +$/,"")}1'
     echo "New"
     curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $credentials" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  -H "Content-Type: application/json" \
  https://api.github.com/repos/ayra98/workflow-testing/actions/workflows/ci.yml/dispatches \
  -d '{
    "ref": "'"$BRANCH"'",
    "inputs": {
      "BUILD_ENV": "'"$buildEnv"'",
      "BUILD_TYPE": "'"$buildType"'",
      "BUILD_BUSINESS": "'"$buildBusiness"'",
      "UPLOAD_TO_PLAYSTORE": "'"$upload_to_playstore"'",
      "REPETATIVE_BUILD_CHECK": "'"$repetativeBuildCheck"'",
      "HOTFIX": "'"$hotfix"'"
    }
  }'
     # curl --location --request POST 'https://api.github.com/repos/ayra98/workflow-testing/actions/workflows/ci.yml/dispatches' \
     #   --header 'Accept: application/vnd.github.v3+json' \
     #   --header "Authorization: $credentials" \
     #   --header 'Content-Type: application/json' \
     #   --data-raw '{"ref": "'"$BRANCH"'", "inputs": {"BUILD_ENV": "'$buildEnv'", "BUILD_TYPE": "'$buildType'", "BUILD_BUSINESS": "'$buildBusiness'" , "UPLOAD_TO_PLAYSTORE": "'$upload_to_playstore'" , "REPETATIVE_BUILD_CHECK": "'$repetativeBuildCheck'" , "HOTFIX": "'$hotfix'"}}'
   done
 done
done

