#!/bin/bash
        function generate_list() {
          local PAYLOAD=""
          local JOB=""
          local SNUM=3
          PAYLOAD=""
          for JOB in ${1}; do
            local NAME=$(echo ${JOB}|sed -e 's|%.*||')
            local S=$(echo ${JOB}|sed -e 's|.*%||')
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
          done
          if [ -n "${PAYLOAD}" ]; then
            PAYLOAD=$( echo -e "              {\"type\": \"divider\"},\n              { \"type\": \"context\",\n                \"elements\": [${PAYLOAD:1}\n                ]\n              },")
        }

        STATUS=(Skipped Success Cancelled Failure)
        EMOJI=(':white_circle:' ':white_check_mark:' ':black_circle:' ':x:')
        OVERALL_STATUS=0
        SUMMARY_LIST=$(echo "${{ inputs.summary_list }}"|tr '\n' ' ')
        SUMMARY_PAYLOAD=""
        for SUMMARY in ${SUMMARY_LIST}; do
          SUMMARY_NAME=$(echo ${SUMMARY}|sed -e 's|%.*||')
          SUMMARY_URL=$(echo ${SUMMARY}|sed -e 's|.*%||')
          echo -e "\033[0;35m### summary '${SUMMARY_NAME}' url '${SUMMARY_URL}' \033[0m"
          SUMMARY_PAYLOAD="${SUMMARY_PAYLOAD},
        { \"type\": \"mrkdwn\", \"text\": \"*${SUMMARY_NAME}:* <${SUMMARY_URL}>\\n\" }"
        done
        generate_list "$(echo "${{ inputs.install_list }}"|tr '\n' ' ')"
        INSTALL_PAYLOAD="${PAYLOAD}"
        generate_list "$(echo "${{ inputs.test_list }}"|tr '\n' ' ')"
        TEST_PAYLOAD="${PAYLOAD}"
        generate_list "$(echo "${{ inputs.report_list }}"|tr '\n' ' ')"
        REPORT_PAYLOAD="${PAYLOAD}"

        cat >'payload.yaml' <<EOF
          {
            "blocks": [
              { "type": "header",
                "text":
                  { "type": "plain_text",
                    "emoji": true,
                    "text": "${EMOJI[OVERALL_STATUS]} ${{ inputs.title }} ${STATUS[OVERALL_STATUS]}"
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
