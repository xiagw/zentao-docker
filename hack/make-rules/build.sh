#!/bin/bash

appName=${1:? "appName is required"}
appVer=${2:? "appVer is required"}
phpVer=${3:? "phpVer is required"}
mysqlVer=${4:? "mysqlVer is required"}
arch=${5:? "arch is required"}
dockerfile=${6:? "dockerfile is required"}
buildEnv=${7:? "buildEnv is required"}
buildDate=$(date +%Y%m%d)

docker buildx build \
	    --no-cache \
            --build-arg ZENTAO_VER="$appVer" \
            --build-arg ZENTAO_URL="$ZENTAO_URL" \
            --build-arg PHP_VER="$phpVer" \
            --build-arg MYSQL_VER="$mysqlVer" \
            --build-arg OS_ARCH="${arch/linux\/}" \
            --build-arg BUILD_ENV="$buildEnv" \
            --platform="$arch" \
            -t "$appName":"$appVer"-"$buildDate" \
            -t "$appName":"$appVer" \
            -f "$dockerfile" . --push