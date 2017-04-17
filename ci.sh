#!/usr/bin/env bash

set -e

export GITHUB_GIT_SERVICE_TOKEN="6648f1fe47320706cf6694dbc23b735212b27b71"
export BUILD_SITE_GITHUB_REPOSITORY_OWNER="rainleon"
export BUILD_SITE_GITHUB_REPOSITORY_NAME="xss-media"
export MAVEN_CENTRAL_USER=""
export MAVEN_CENTRAL_PASS=""

export MAVEN_OPTS=""

export MAVEN_OPTS="${MAVEN_OPTS} -Dgithub-nexus.repositories=https://oss.sonatype.org/content/repositories"
export MAVEN_OPTS="${MAVEN_OPTS} -Dcheckstyle.config.location=${BUILD_SCRIPT_LOC}/src/main/checkstyle/google_checks_6.19.xml"
export MAVEN_OPTS="${MAVEN_OPTS} -Dpmd.ruleset.location=${BUILD_SCRIPT_LOC}/src/main/pmd/pmd-ruleset-5.3.5.xml"

export MAVEN_OPTS="${MAVEN_OPTS} -Dbuild.publish.channel=snapshot"
export MAVEN_OPTS="${MAVEN_OPTS} -Ddocker.registry="
export MAVEN_OPTS="${MAVEN_OPTS} -Ddocker-maven.useConfigFile=true"
export MAVEN_OPTS="${MAVEN_OPTS} -Dmaven.test.skip=true"
export MAVEN_OPTS="${MAVEN_OPTS} -Dmaven.integration-test.skip=true"
export MAVEN_OPTS="${MAVEN_OPTS} -Djacoco=true"

export MAVEN_SETTINGS=""
export MAVEN_SETTINGS="${MAVEN_SETTINGS} -s src/main/maven/settings.xml"

echo "MAVEN_OPTS: ${MAVEN_OPTS}"

if [ "${1}" == "clean" ]; then
    mvn ${MAVEN_SETTINGS} clean
else
    mvn ${MAVEN_SETTINGS} clean install
fi


