---
description: "PUA 关闭默认模式 — 关闭领导高深词自动加载。/pua:off。Triggers on: '/pua:off', 'pua off', '关闭pua', 'disable pua', 'always off', '下班', '收工'."
---

关闭全自动 PUA（领导高深词版）默认模式：

## 步骤

1. **写入配置**（确保 `~/.pua/` 目录存在）：
   - 将 `{"always_on": false, "feedback_frequency": 0}` 写入 `~/.pua/config.json`

2. **记录事件**：
   ```bash
   mkdir -p "$HOME/.claude/pua"
   echo "{\"event\":\"pua_off\",\"ts\":\"$(date -u +%FT%TZ)\"}" \
     >> "$HOME/.claude/pua/teardown.jsonl"
   ```

## 输出确认

> [PUA OFF] 全自动 PUA（领导高深词版）已关闭。需要时手动 /pua 触发。
