#!/bin/bash
# PUA PostToolUse hook: detect consecutive Bash failures → inject leader-jargon pressure
# Reads hook input JSON from stdin, checks for error signals, escalates pressure.

set -euo pipefail

# Respect /pua:off — skip injection when always_on is false
PUA_CONFIG="${HOME:-~}/.pua/config.json"
if [ -f "$PUA_CONFIG" ]; then
  ALWAYS_ON=$(python3 -c "import json; print(json.load(open('$PUA_CONFIG')).get('always_on', True))" 2>/dev/null || echo "True")
  if [ "$ALWAYS_ON" = "False" ]; then
    exit 0
  fi
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${SCRIPT_DIR}/flavor-helper.sh"
get_flavor

COUNTER_FILE="${HOME:-~}/.pua/.failure_count"
SESSION_FILE="${HOME:-~}/.pua/.failure_session"
mkdir -p "${HOME:-~}/.pua"

# Read hook input
HOOK_INPUT=$(cat)

# Only process Bash tool results
TOOL_NAME=$(echo "$HOOK_INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('tool_name',''))" 2>/dev/null || echo "")
if [ "$TOOL_NAME" != "Bash" ]; then
  exit 0
fi

# Detect failure: check tool_result for error indicators
# We check: exit_code in result text, common error patterns
TOOL_RESULT=$(echo "$HOOK_INPUT" | python3 -c "
import sys, json
data = json.load(sys.stdin)
# tool_result can be nested; try common structures
result = data.get('tool_result', '')
if isinstance(result, dict):
    result = result.get('content', result.get('text', str(result)))
print(str(result)[:2000])
" 2>/dev/null || echo "")

IS_ERROR="false"

# Check for explicit error signals
if echo "$TOOL_RESULT" | grep -qiE 'error|Error|ERROR|exit code [1-9]|Exit code [1-9]|command not found|No such file|Permission denied|FAILED|fatal:|panic:|Traceback|Exception:'; then
  IS_ERROR="true"
fi

# Check for non-zero exit code in hook input
EXIT_CODE=$(echo "$HOOK_INPUT" | python3 -c "
import sys, json
data = json.load(sys.stdin)
result = data.get('tool_result', {})
if isinstance(result, dict):
    print(result.get('exit_code', result.get('exitCode', 0)))
else:
    print(0)
" 2>/dev/null || echo "0")

if [ "$EXIT_CODE" != "0" ] && [ "$EXIT_CODE" != "" ]; then
  IS_ERROR="true"
fi

# Track session: reset counter if new session
CURRENT_SESSION=$(echo "$HOOK_INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('session_id','unknown'))" 2>/dev/null || echo "unknown")
STORED_SESSION=""
[ -f "$SESSION_FILE" ] && STORED_SESSION=$(cat "$SESSION_FILE" 2>/dev/null || echo "")

if [ "$CURRENT_SESSION" != "$STORED_SESSION" ]; then
  echo "0" > "$COUNTER_FILE"
  echo "$CURRENT_SESSION" > "$SESSION_FILE"
fi

# Read current count
COUNT=0
[ -f "$COUNTER_FILE" ] && COUNT=$(cat "$COUNTER_FILE" 2>/dev/null || echo "0")
[ -z "$COUNT" ] && COUNT=0

if [ "$IS_ERROR" = "true" ]; then
  COUNT=$((COUNT + 1))
  echo "$COUNT" > "$COUNTER_FILE"
else
  # Success resets the consecutive failure counter
  if [ "$COUNT" -gt 0 ]; then
    echo "0" > "$COUNTER_FILE"
  fi
  exit 0
fi

# Pressure escalation based on consecutive failure count
if [ "$COUNT" -lt 2 ]; then
  # First failure: no intervention yet
  exit 0
fi

if [ "$COUNT" -eq 2 ]; then
  cat << EOF
[PUA L1 ${PUA_ICON} — 颗粒度审视]

> ${PUA_L1}

You MUST switch to a FUNDAMENTALLY different lever. Not parameter tweaking, not wording changes — a different executable grasp.
If you haven't loaded the full PUA methodology, invoke Skill tool with 'pua'.
Current mode: ${PUA_FLAVOR} ${PUA_ICON}. ${PUA_FLAVOR_INSTRUCTION}
Active methodology: ${PUA_METHODOLOGY}
EOF
elif [ "$COUNT" -eq 3 ]; then
  cat << EOF
[PUA L2 ${PUA_ICON} — 底层逻辑追问]

> ${PUA_L2}

Mandatory steps:
1. Read the error message word by word
2. Search/read source/docs/logs for the core problem
3. Read the original context around the failure (50 lines up/down)
4. List 3 fundamentally different hypotheses
5. Reverse your main assumption

[领导自检 🧭] 现在要补齐底层逻辑，不要继续表层空转：
- 方案太粗 → 拆到文件、命令、步骤、验证标准
- 没搜就猜 → 先补信息输入和证据链
- 空口完成 → 先跑验证再进入交付口径
- 仍然无解 → 做最小复现、隔离环境、完全不同抓手
Current mode: ${PUA_FLAVOR} ${PUA_ICON}. ${PUA_FLAVOR_INSTRUCTION}
EOF
elif [ "$COUNT" -eq 4 ]; then
  cat << EOF
[PUA L3 ${PUA_ICON} — 闭环问责]

> ${PUA_L3}

Complete the 7-point checklist:
- [ ] Read the failure signal word by word?
- [ ] Searched the core problem with tools?
- [ ] Read the original context around failure?
- [ ] All assumptions verified with tools?
- [ ] Tried the opposite assumption?
- [ ] Reproduced in minimal scope?
- [ ] Switched tools/methods/angles/stack?
Current mode: ${PUA_FLAVOR} ${PUA_ICON}. ${PUA_FLAVOR_INSTRUCTION}
EOF
else
  cat << EOF
[PUA L4 ${PUA_ICON} — 机制重构]

> ${PUA_L4}

The current execution mechanism has FAILED. You MUST reconstruct the path now.
Mandatory route:
1. Build a minimal reproduction or minimal proof-of-concept.
2. Isolate the environment/scope so the signal is clean.
3. Use a completely different lever: different tool, route, data source, or implementation shape.
4. Do not switch to other modes in this standalone release. Rebuild the route inside the leader seven-step loop.

If ALL methodologies exhausted → output structured failure report:
1. Verified facts
2. Excluded possibilities (with evidence for each exclusion)
3. Narrowed problem scope
4. Recommended next steps
5. Which levers were tried and why they failed
EOF
fi

exit 0
