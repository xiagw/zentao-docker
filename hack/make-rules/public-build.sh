#!/bin/bash
set -e

appName=${1:? "appName is required"}
appVer=${2:? "appVer is required"}
phpVer=${3:? "phpVer is required"}
mysqlVer=${4:? "mysqlVer is required"}
arch=${5:-"linux/amd64,linux/arm64"} # like linux/amd64,linux/arm64
dockerfile=${6:-Dockerfile}
buildEnv=${7:-internal}
buildDate=$(date +%Y%m%d)

publicRepository="hub.zentao.net/app/$appName"
baseImage="hub.zentao.net/ci/zentao-runtime:php${phpVer%.*}-mysql${mysqlVer%.*}"

# 构建基本的标签列表
tags=(-t "$publicRepository:$appVer-$buildDate" -t "$publicRepository:$appVer")

# 如果版本号符合 x.y 格式，添加 latest 标签
if [[ $appVer =~ ^[0-9]+\.[0-9]+ ]]; then
    tags+=(-t "$publicRepository")
fi

docker buildx build \
    --build-arg BASE_IMAGE="$baseImage" \
    --build-arg ZENTAO_VER="$appVer" \
    --build-arg ZENTAO_URL="$ZENTAO_URL" \
    --build-arg PHP_VER="$phpVer" \
    --build-arg MYSQL_VER="$mysqlVer" \
    --build-arg BUILD_ENV="$buildEnv" \
    --platform="$arch" \
    "${tags[@]}" \
    -f "$dockerfile" . --pull --push