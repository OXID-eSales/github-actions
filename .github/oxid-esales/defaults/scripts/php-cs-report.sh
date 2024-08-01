#!/bin/bash
set -e
function init() {
    if [[ ${BASH_SOURCE} = */* ]]; then
        SCRIPT_DIR=${BASH_SOURCE%/*}/
    else
        SCRIPT_DIR=./
    fi
    if [ -z "${ABSOLUTE_PATH}" ]; then
        ABSOLUTE_PATH="$(pwd)"
    else
        ABSOLUTE_PATH="/var/www/${ABSOLUTE_PATH}"
    fi
    TESTDIR='tests'
    if [ ! -d "${ABSOLUTE_PATH}/${TESTDIR}" ]; then
        TESTDIR='Tests'
        if [ ! -d "${ABSOLUTE_PATH}/${TESTDIR}" ]; then
            echo -e "\033[0;31m###  Could not find folder tests or Tests in ${ABSOLUTE_PATH} ###\033[0m"
            exit 1
        fi
    fi
    [[ ! -d "${ABSOLUTE_PATH}/${TESTDIR}/Reports" ]] && mkdir "${ABSOLUTE_PATH}/${TESTDIR}/Reports"

    REPORT_DIR="${ABSOLUTE_PATH}/${TESTDIR}/Reports"

    if [ -x vendor/bin/phpcs ]; then
    PHPCS=vendor/bin/phpcs
    else
        if [ -x /var/www/vendor/bin/phpcs ]; then
            PHPCS=/var/www/vendor/bin/phpcs
        else
            echo "Can't find phpcs in vendor/bin or /var/www/vendor/bin"
            exit 1
        fi
    fi

    XML_FILE="${ABSOLUTE_PATH}/${TESTDIR}/phpcs.xml"
    REPORT_FILE="${REPORT_DIR}phpcs.report.json"
    cat <<EOF
        Path: ${ABSOLUTE_PATH}
        Script directory: ${SCRIPT_DIR}
        Report directory: ${REPORT_DIR}
        Standard: ${XML_FILE}
        PHP Codesniffer: ${PHPCS}
        Report file: ${REPORT_FILE}
EOF
}

init
"${PHPCS}" --standard="${XML_FILE}" --report=json --report-file="${REPORT_FILE}" ||true
# As the first one does not produce legible output, this gives us something to see in the log
"${PHPCS}" --standard="${XML_FILE}" --report=full
