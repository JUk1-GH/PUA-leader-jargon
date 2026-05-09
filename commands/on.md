---
description: "PUA 开启默认模式 — 每次新会话自动加载 PUA 核心 skill，默认领导高深词驱动。/pua:on。Triggers on: '/pua:on', 'pua on', '开启pua', 'enable pua', 'always on'."
---

开启 PUA 默认模式：

1. 确保 `~/.pua/` 目录存在
2. 读取现有 `~/.pua/config.json`（若不存在视为 `{}`），写回时设置 `always_on: true`、`flavor: "leader"`；若 `feedback_frequency` 当前为 0（可能是 `/pua:off` 留下的 tombstone），恢复为默认 5；其他未知字段保留原样
3. 输出确认：> [PUA ON] 从现在起，每个新会话都会自动进入 PUA 领导高深词驱动模式。顶层设计、颗粒度、抓手、闭环销项，一个都不能少。

## 对称性（与 `/pua:off` 的关系）

- `/pua:off` 会把 `feedback_frequency` 置 0，使问卷永不触发
- `/pua:on` **必须**检测并恢复该字段，否则"先 off 再 on"会导致 feedback 永久失效（静默 bug）
- 保留原则：不清楚的字段一律 preserve，不 overwrite 整个 config；旧版残留的其他 flavor 必须归一为 `leader`
