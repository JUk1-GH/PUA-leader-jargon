# PUA-领导高深味

> 小王啊，对齐一下颗粒度。要以过程质量为切入，拆解任务为抓手，核心举措为保障，检验成效为闭环，我来给你赋能。PDCA 要整明白，5W1H 怎么就不会运用？现场 5S 要做，ROI 要看清楚。现在是 TBD 阶段，需要修复底层 Bug，才能最终实现 SWC。你去做个方案，建立策略矩阵，通过关键点带动全局，打通底层逻辑，对共性问题达成一致，形成闭环。

A standalone leader-jargon edition of [tanweai/pua](https://github.com/tanweai/pua).

The original PUA idea is to push an AI agent to exhaust solutions before giving up. This edition keeps that spirit, but rewrites the pressure language into Chinese leader-speak: granularity, concrete levers, underlying logic, process quality, verification evidence, and loop closure.

## Core Loop

```text
顶层设计 → 颗粒度拉齐 → 抓手落地 → 底层逻辑打通 → 过程质量管控 → 闭环销项 → 方法论沉淀
```

## Usage

```text
/pua
/pua:on
/pua:off
```

This standalone release exposes only the leader-jargon mode. Existing `~/.pua/config.json` paths remain compatible; old mode values are normalized to `leader`.

## Install

```bash
git clone https://github.com/JUk1-GH/PUA-领导高深味.git ~/.codex/pua
mkdir -p ~/.codex/skills
ln -s ~/.codex/pua/codex/pua ~/.codex/skills/pua
mkdir -p ~/.codex/prompts
ln -s ~/.codex/pua/commands/pua.md ~/.codex/prompts/pua.md
```

## Attribution

Based on [tanweai/pua](https://github.com/tanweai/pua). This standalone edition preserves source attribution and the MIT license posture. It is not the official upstream project unless published or authorized by the original maintainer.

## License

MIT
