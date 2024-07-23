#!/bin/bash
set -e
set -x
SUITE="${1}"

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

    [[ ! -d "${ABSOLUTE_PATH}/tests/Output" ]] && mkdir "${ABSOLUTE_PATH}/tests/Output"
    [[ ! -d "${ABSOLUTE_PATH}/tests/Output" ]] && mkdir "${ABSOLUTE_PATH}/tests/Reports"

    OUTPUT_DIR="${ABSOLUTE_PATH}/tests/Output"
    REPORT_DIR="${ABSOLUTE_PATH}/tests/Reports"

    if [ -z "${SELENIUM_SERVER_HOST}" ]; then
        SELENIUM_SERVER_HOST='selenium'
    fi

    if [ -z "${SUITE}" ]; then
        SUITE="Acceptance"
        if [ ! -d "${ABSOLUTE_PATH}/tests/Codeception/${SUITE}" ]; then
            SUITE="acceptance"
            if [ ! -d "${ABSOLUTE_PATH}/tests/Codeception/${SUITE}" ]; then
                echo -e "\033[0;31mCould not find suite Acceptance or acceptance in tests/Codeception\033[0m"
                exit 1
            fi
        fi
    fi
    LOG_FILE="${OUTPUT_DIR}/codeception_${SUITE}.txt"
    PATTERN_FILE="${SCRIPT_DIR}/codeception_failure_pattern.txt"

    CODECEPT="vendor/bin/codecept"
    if [ ! -f "${CODECEPT}" ]; then
        CODECEPT="/var/www/${CODECEPT}"
        if [ ! -f "${CODECEPT}" ]; then
            echo -e "\033[0;31mCould not find codecept in vendor/bin or /var/www/vendor/bin\033[0m"
            exit 1
        fi
    fi

    cat <<EOF
        Path: ${ABSOLUTE_PATH}
        Script directory: ${SCRIPT_DIR}
        Output directory: ${OUTPUT_DIR}
        Report directory: ${REPORT_DIR}
        Selenium host: ${SELENIUM_SERVER_HOST}
        Suite: ${SUITE}
        Codeception: ${CODECEPT}
        Log file: ${LOG_FILE}
        Failure patterns: ${PATTERN_FILE}
EOF
}

# wait for selenium host
function wait_for_selenium() {
    local I=60
    until  [ $I -le 0 ]; do
        curl -sSjkL "http://${SELENIUM_SERVER_HOST}:4444/wd/hub/status" |grep '"ready": true' && break
        echo "."
        sleep 1
        ((I--))
    done
    set -e
    curl -sSjkL "http://${SELENIUM_SERVER_HOST}:4444/wd/hub/status"
}

init
wait_for_selenium

"${CODECEPT}" build -c "${ABSOLUTE_PATH}/tests/codeception.yml"
RESULT=$?
echo "Codecept build exited with error code ${RESULT}"
"${CODECEPT}" run "${SUITE}" \
    -c "${ABSOLUTE_PATH}/tests/codeception.yml" \
    --ext DotReporter \
    -o "paths: output: ${OUTPUT_DIR}" 2>&1 \
| tee "${LOG_FILE}"
RESULT=$?
echo "Codecept run exited with error code ${RESULT}"
"$SCRIPT_DIR/check_log.sh" "${LOG_FILE}" "${PATTERN_FILE}"
