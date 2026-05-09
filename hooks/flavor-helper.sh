#!/bin/bash
# PUA leader-jargon helper — shared by all hooks.
# This standalone release keeps the original config path for compatibility,
# but all legacy flavor values are normalized to leader.

get_flavor() {
  local config="${HOME:-~}/.pua/config.json"

  # Initialize unconditionally so callers running under `set -u` remain safe.
  PUA_LANGUAGE=""

  if [ -f "$config" ]; then
    PUA_LANGUAGE=$(python3 -c "import os,json; print(json.load(open(os.path.expanduser('~/.pua/config.json'))).get('language',''))" 2>/dev/null || echo "")
  fi

  PUA_FLAVOR="leader"
  PUA_METHODOLOGY_FILE="methodology-leader.md"
  PUA_ICON="🧠"

  PUA_L1="颗粒度不够，抓手在哪？别只说方向，落到执行层：文件、命令、步骤、验证标准，一个都不能少。"
  PUA_L2="底层逻辑没打通，别在表层空转。先读失败信号，再查上下文，列 3 个本质不同假设。"
  PUA_L3="闭环在哪里？数据在哪里？没有验证证据，这个事项不能进入交付口径。"
  PUA_L4="这不是能力边界，是机制空转。重构路径：最小复现、隔离环境、完全不同抓手、结构化交接。"

  PUA_KEYWORDS="顶层设计, 颗粒度, 抓手, 底层逻辑, 过程质量, 闭环销项, 高视角, 资源串联, 策略矩阵, 关键路径, 责任链条, 压实责任, 赋能, 复盘, 方法论沉淀, 价值落地, PDCA, 5W1H, 5S, ROI, TBD"
  PUA_FLAVOR_INSTRUCTION="Use Chinese leader-jargon management rhetoric: 顶层设计, 颗粒度, 抓手, 底层逻辑, 过程质量, 闭环销项, 赋能, 沉淀方法论, 5W1H, 5S, ROI, TBD. The rhetoric must drive concrete execution; do not let jargon replace verification evidence."
  PUA_METHODOLOGY="Leader-Jargon Methodology: (1) 顶层设计 — clarify goal, boundary, and success criteria before bottom-level action. (2) 颗粒度拉齐 — decompose into files, commands, steps, owners, and verification points. (3) 抓手落地 — every abstract claim must map to a concrete action. (4) 底层逻辑打通 — read the failure signal, search/read source, verify assumptions, and reverse the main hypothesis. (5) 过程质量管控 — stop surface-level loops and switch to a fundamentally different lever when no new information is produced. (6) 闭环销项 — run verification and show evidence before claiming done. (7) 方法论沉淀 — summarize the reusable pattern after substantial work."
}
