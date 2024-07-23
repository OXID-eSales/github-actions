#!/bin/bash
set -x
set -e
SOURCE_DIR="${1}"

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

    [[ ! -d "${ABSOLUTE_PATH}/tests/Reports" ]] && mkdir "${ABSOLUTE_PATH}/tests/Reports"

    REPORT_DIR="${ABSOLUTE_PATH}/tests/Reports"

    if [ -z "${SOURCE_DIR}" ]; then
        SOURCE_DIR='src'
        if [ ! -d "${ABSOLUTE_PATH}/${SOURCE_DIR}" ]; then
            echo -e "\033[0;31mSource dir '${ABSOLUTE_PATH}/${SOURCE_DIR}' does not exist\033[0m"
            exit 1
        fi
    fi

    if [ -x vendor/bin/phpstan ]; then
    PHPSTAN=vendor/bin/phpstan
    else
        if [ -x /var/www/vendor/bin/phpstan ]; then
            PHPSTAN=/var/www/vendor/bin/phpstan
        else
            echo "Can't find phpstan in vendor/bin or /var/www/vendor/bin"
            exit 1
        fi
    fi
    NEON_FILE="${ABSOLUTE_PATH}/tests/PhpStan/phpstan.neon"
    REPORT_FILE="${ABSOLUTE_PATH}/tests/Reports/phpstan.report.json"

    cat <<EOF
        Path: ${ABSOLUTE_PATH}
        Script directory: ${SCRIPT_DIR}
        Report directory: ${REPORT_DIR}
        Neon file: ${NEON_FILE}
        Source directory: ${SOURCE_DIR}
        PHPStan: ${PHPSTAN}
        Report file: ${REPORT_FILE}
EOF
}

init
"${PHPSTAN}" -c"${NEON_FILE}" analyse "${SOURCE_DIR}/" --error-format=json >"${REPORT_FILE}"
