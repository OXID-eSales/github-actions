#!/bin/bash
set -x
function init() {
    # shellcheck disable=SC2128
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

    if [ -x vendor/bin/phpmd ]; then
    PHPMD=vendor/bin/phpmd
    else
        if [ -x /var/www/vendor/bin/phpmd ]; then
            PHPMD=/var/www/vendor/bin/phpmd
        else
            echo "Can't find phpmd in vendor/bin or /var/www/vendor/bin"
            exit 1
        fi
    fi

    XML_FILE="${ABSOLUTE_PATH}/${TESTDIR}/PhpMd/standard.xml"
    REPORT_FILE="${REPORT_DIR}/phpmd.report.json"

    if [ -z "${SOURCE_DIR}" ]; then
        SOURCE_DIR='src'
        if [ ! -d "${ABSOLUTE_PATH}/${SOURCE_DIR}" ]; then
            echo -e "\033[0;31mSource dir '${ABSOLUTE_PATH}/${SOURCE_DIR}' does not exist\033[0m"
            exit 1
        fi
    fi
    cat <<EOF
        Path: ${ABSOLUTE_PATH}
        Script directory: ${SCRIPT_DIR}
        Report directory: ${REPORT_DIR}
        Standard file: ${XML_FILE}
        Source directory: ${SOURCE_DIR}
        PHP Mess detector: ${PHPMD}
        Report file: ${REPORT_FILE}
EOF
}
init
"${PHPMD}" "${SOURCE_DIR}" json "${XML_FILE}" \
    --ignore-errors-on-exit --ignore-violations-on-exit \
    --reportfile "${REPORT_FILE}"
