#!/usr/bin/env bash

set -e


export GITHUB_SS_PARENT_PREFIX="https://github.com/seek-world/ss-parent/raw/master"
#export GITHUB_GIT_SERVICE_TOKEN=""
export BUILD_SITE_GITHUB_REPOSITORY_OWNER="rainleon"
export BUILD_SITE_GITHUB_REPOSITORY_NAME="xss-media"
export MAVEN_CENTRAL_USER=""
export MAVEN_CENTRAL_PASS=""

export MAVEN_OPTS=""

export MAVEN_OPTS="${MAVEN_OPTS} -Dgithub-nexus.repositories=https://oss.sonatype.org/content/repositories"
export MAVEN_OPTS="${MAVEN_OPTS} -Dcheckstyle.config.location=${GITHUB_SS_PARENT_PREFIX}/src/main/checkstyle/google_checks_6.19.xml"
export MAVEN_OPTS="${MAVEN_OPTS} -Dpmd.ruleset.location=${GITHUB_SS_PARENT_PREFIX}/src/main/pmd/pmd-ruleset-5.3.5.xml"

export MAVEN_OPTS="${MAVEN_OPTS} -Dbuild.publish.channel=snapshot"
export MAVEN_OPTS="${MAVEN_OPTS} -Ddocker.registry="
export MAVEN_OPTS="${MAVEN_OPTS} -Ddocker-maven.useConfigFile=true"
export MAVEN_OPTS="${MAVEN_OPTS} -Dmaven.test.skip=true"
export MAVEN_OPTS="${MAVEN_OPTS} -Dmaven.integration-test.skip=true"
export MAVEN_OPTS="${MAVEN_OPTS} -Djacoco=true"

export MAVEN_SETTINGS=""

COMMIT_ID="$(git rev-parse HEAD)"
CI_CACHE="${HOME}/.ci-cache/${COMMIT_ID}"
mkdir -p ${CI_CACHE}

if [ ! -f "$(pwd)/src/main/maven/settings.xml" ]; then
    MAVEN_SETTINGS_FILE="${CI_CACHE}/settings-${COMMIT_ID}.xml"
    echo "curl -H 'Cache-Control: no-cache' -t utf-8 -s -L -o ${MAVEN_SETTINGS_FILE} ${GITHUB_SS_PARENT_PREFIX}/src/main/maven/settings.xml"
    curl -H 'Cache-Control: no-cache' -t utf-8 -s -L -o ${MAVEN_SETTINGS_FILE} ${GITHUB_SS_PARENT_PREFIX}/src/main/maven/settings.xml
    export MAVEN_SETTINGS="${MAVEN_SETTINGS} -s ${MAVEN_SETTINGS_FILE}"
else
    export MAVEN_SETTINGS="${MAVEN_SETTINGS} -s $(pwd)/src/main/maven/settings.xml"
fi

echo "MAVEN_OPTS: ${MAVEN_OPTS}"

if [ "${1}" == "clean" ]; then
    mvn ${MAVEN_SETTINGS} clean
elif [ "${1}" == "help" ]; then
    mvn ${MAVEN_SETTINGS} help:effective-pom
else
    mvn ${MAVEN_SETTINGS} clean install
fi


