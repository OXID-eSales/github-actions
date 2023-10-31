#!/bin/bash
        function generate_list() {
          local PAYLOAD=""
          local JOB=""
          local SNUM=3
          local LEFT=""
          local RIGHT=""
          if [ -n "${2}" ]; then
            LEFT="<"
            RIGHT=">"
          fi
          PAYLOAD=""
          for JOB in ${1}; do
            local NAME=$(echo ${JOB}|sed -e 's|%.*||')
            local S=$(echo ${JOB}|sed -e 's|.*%||')
            if [ -z "${2}" ]; then
                case ${S} in
                skipped) STATUS=0 ;;
                success) STATUS=1 ;;
                cancelled) STATUS=2 ;;
                *) STATUS=3 ;;
                esac
                echo -e "\033[0;35m### job '${NAME}' status '${S}' (${SNUM}) \033[0m"
                if [ ${SNUM} -gt ${OVERALL_STATUS} ]; then
                OVERALL_STATUS=$SNUM
                echo -e "\033[0;35m### changed overall job status to ${OVERALL_STATUS} \033[0m"
                fi
                PAYLOAD="${PAYLOAD},
          { \"type\": \"mrkdwn\", \"text\": \"${NAME}: ${EMOJI[SNUM]} ${STATUS[SNUM]}\"}"
            else
                PAYLOAD="${PAYLOAD},
          { \"type\": \"mrkdwn\", \"text\": \"*${NAME}:* <${S}>\\n\" }"
            fi
          done
          if [ -n "${PAYLOAD}" ]; then
            PAYLOAD="              {\"type\": \"divider\"},
              { \"type\": \"context\",
                \"elements\": [${PAYLOAD:1}
                ]
              },"
          fi
        }

        STATUS=(Skipped Success Cancelled Failure)
        EMOJI=(':white_circle:' ':white_check_mark:' ':black_circle:' ':x:')
        OVERALL_STATUS=0
        generate_list "$(echo "${INPUT_SUMMARY_LIST}"|tr '\n' ' ')" true
        SUMMARY_PAYLOAD="${PAYLOAD}"
        generate_list "$(echo "${INPUT_INSTALL_LIST}"|tr '\n' ' ')"
        INSTALL_PAYLOAD="${PAYLOAD}"
        generate_list "$(echo "${INPUT_TEST_LIST}"|tr '\n' ' ')"
        TEST_PAYLOAD="${PAYLOAD}"
        generate_list "$(echo "${INPUT_REPORT_LIST}"|tr '\n' ' ')"
        REPORT_PAYLOAD="${PAYLOAD}"

        cat >'payload.yaml' <<EOF
          {
            "blocks": [
              { "type": "header",
                "text":
                  { "type": "plain_text",
                    "emoji": true,
                    "text": "${EMOJI[OVERALL_STATUS]} ${INPUT_TITLE} ${STATUS[OVERALL_STATUS]}"
                  }
              },
              {
              "type": "divider"
              },
              { "type": "context",
                "elements": [${SUMMARY_PAYLOAD:1}
                ]
              },
        ${INSTALL_PAYLOAD}
        ${TEST_PAYLOAD}
        ${REPORT_PAYLOAD}
              {
              "type": "divider"
              }
            ]
          }
        EOF
        cat payload.yaml
