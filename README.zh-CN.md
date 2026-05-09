# PUA-领导高深味

> 小王啊，对齐一下颗粒度。要以过程质量为切入，拆解任务为抓手，核心举措为保障，检验成效为闭环，我来给你赋能。PDCA 要整明白，5W1H 怎么就不会运用？现场 5S 要做，ROI 要看清楚。现在是 TBD 阶段，需要修复底层 Bug，才能最终实现 SWC。你去做个方案，建立策略矩阵，通过关键点带动全局，打通底层逻辑，对共性问题达成一致，形成闭环。

基于 [tanweai/pua](https://github.com/tanweai/pua) 改造的独立版 PUA Skill。

原版 PUA 的精神是：**用 PUA 话术驱动 AI 穷尽所有方案才允许放弃。**

本版的精神是：**用领导高深词驱动 AI 拉齐颗粒度、找到抓手、打通底层逻辑、主动验证并闭环交付。**

它不是“帮你写领导黑话”的玩具，而是把领导黑话反过来变成 AI 的执行约束：不能空口完成，不能表层空转，不能没验证就甩锅环境，不能方案粗到落不了地。

## 它会怎么管 AI

```text
顶层设计 → 颗粒度拉齐 → 抓手落地 → 底层逻辑打通 → 过程质量管控 → 闭环销项 → 方法论沉淀
```

| 场景 | 领导式纠偏 | 强制动作 |
|------|------------|----------|
| 方案太粗 | 颗粒度不够，抓手在哪？ | 拆到文件、命令、步骤、验收标准 |
| 失败打转 | 底层逻辑没打通，别在表层空转。 | 读错误、查上下文、列 3 个不同假设 |
| 空口完成 | 闭环在哪里？数据在哪里？ | 跑测试/检查，给出验证证据 |
| 准备放弃 | 这不是能力边界，是机制空转。 | 最小复现、隔离环境、换完全不同路线 |

## 典型触发

- `颗粒度不够`
- `抓手在哪`
- `闭环在哪`
- `底层逻辑没打通`
- `别空转`
- `为什么还不行`
- `/pua`

## 使用方式

手动触发：

```text
/pua
```

开启全自动模式：

```text
/pua:on
```

关闭全自动模式：

```text
/pua:off
```

配置路径仍兼容原项目：

```text
~/.pua/config.json
```

本独立发行版只保留“领导高深味”。旧配置里如果残留其他模式字段，也会被归一为 `leader`。

## 安装

### Codex

```bash
git clone https://github.com/JUk1-GH/PUA-领导高深味.git ~/.codex/pua
mkdir -p ~/.codex/skills
ln -s ~/.codex/pua/codex/pua ~/.codex/skills/pua
mkdir -p ~/.codex/prompts
ln -s ~/.codex/pua/commands/pua.md ~/.codex/prompts/pua.md
```

### Claude Code / 兼容插件结构

仓库保留 `.claude-plugin/plugin.json`、`.codebuddy-plugin/plugin.json` 和 `plugin.json`，可按对应平台的插件/Skill 安装方式引用。

## 来源与授权

本项目基于 [tanweai/pua](https://github.com/tanweai/pua) 改造，保留 MIT 授权和来源署名。

本项目不是原仓库官方版本，除非由原作者发布或授权。

## License

MIT
