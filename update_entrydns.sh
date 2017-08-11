#!/bin/bash

([ -z "${AUTH_TOKEN}" ] && [ -z "${AUTH_TOKENS}" ]) && { echo "=> AUTH_TOKEN(S) cannot be empty" && exit 1; }

updateIP() {
  local token="$1"
  echo "IP does not match, updating DNS"
  echo ${IPADDRESS} >|/current_ip
  curl -k -X PUT -d "ip=${IPADDRESS}" "https://entrydns.net/records/modify/$token"  
}

IPADDRESS=`curl -s icanhazip.com`
if [[ "${IPADDRESS}" != "$(cat /current_ip)" ]]; then

  if [[ "${AUTH_TOKENS}" ]]; then
    if [ -n "${AUTH_TOKENS}" ]; then
        declare part
        while read -d "," part; do
          updateIP $part
        done <<< "${AUTH_TOKENS}"
        updateIP $part
    fi
  else
    updateIP ${AUTH_TOKEN}
  fi
else
  echo "DNS record is up to date"
fi
