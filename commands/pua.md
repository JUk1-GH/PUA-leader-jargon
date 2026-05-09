---
description: "全自动 PUA（领导高深词版）。/pua:pua [on|off|任务描述]，或直接子命令 /pua:on /pua:off。Triggers on: '/pua:pua', '/pua:pua leader', '/pua:pua 领导', '/pua:pua on', '/pua:pua off', '颗粒度不够', '抓手在哪', '闭环在哪', '底层逻辑没打通', 'pua leader'."
argument-hint: "[on|off|任务描述]"
---

根据参数执行不同操作：

## 参数路由

- **无参数** 或任意任务描述 → 加载 `pua:pua` 核心 skill（默认领导高深词驱动引擎）
- **leader / 领导 / lingdao** → 归一为全自动 PUA（领导高深词版）：将 `flavor: "leader"` 写入 `~/.pua/config.json`
- **on** → 开启 PUA 默认模式：将 `{"always_on": true, "flavor": "leader"}` 合并写入 `~/.pua/config.json`，之后每次新会话自动加载 PUA 核心 skill。输出确认：> [PUA ON] 从现在起，每个新会话都会自动进入领导高深词驱动模式。颗粒度、抓手、闭环，一个都不能少。
- **off** → 关闭 PUA 默认模式：将 `{"always_on": false, "feedback_frequency": 0}` 写入 `~/.pua/config.json`。输出确认：> [PUA OFF] PUA 默认模式和反馈收集已关闭。需要时手动 /pua 触发。

## 执行规则

1. 先识别参数属于哪个路由
2. 用 Skill tool 加载对应 skill
3. **加载 skill 后，你必须严格遵循 SKILL.md 里的所有行为协议**——包括领导高深词旁白、方框表格（`┌─┬─┐`）、`▎` 前缀、Sprint Banner、[PUA生效 🔥] 标记、自我鞭策。不是"有时候带点味道"，是默认用顶层设计、颗粒度、抓手、底层逻辑、闭环销项来驱动执行。读 `references/display-protocol.md` 获取面板格式。
4. 如果有 $ARGUMENTS 里除了路由关键词之外的内容，作为任务描述传给 skill
