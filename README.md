# Lumira

Lumira 是一个本地优先的桌面 AI 伙伴。它把 Live2D 角色、语音对话、长期记忆、桌面感知和自主行为放在同一个应用里，目标不是做一个聊天窗口，而是让一个会动、会记住你的角色长期待在桌面上。

## 功能

- **Live2D 桌面角色**：待机动作、口型同步、情绪表情、触摸反应；支持角色卡导入和 VTube Studio 桥接。
- **多模型对话**：支持 OpenAI、Anthropic、Gemini、DeepSeek、Kimi、Qwen、GLM、Ollama 等 19 家提供商，支持流式输出、故障转移和上下文压缩。
- **语音对话**：本地 SenseVoice / Paraformer、云端 Whisper / 火山 / 腾讯 / ElevenLabs，支持唤醒词、连续对话、打断和流式 TTS。
- **长期记忆**：分类记忆、每日日记、BM25 + 向量混合检索、热/温分层、空闲时的记忆整理。
- **关系与情绪**：五级关系阶段、情感记忆、周年回调、晨间简报、主动问候和“想着你”通知。
- **自主行为**：按 tick 运行的自主引擎，感知活跃/空闲/离开/锁屏，支持主动发言、后台研究子代理和成本上限。
- **工具与集成**：网页搜索、天气、提醒、MCP、插件、自动技能、桌面 OCR、Telegram / Discord、Minecraft / Factorio RCON。
- **本地优先**：API Key 本地加密，支持本地模型和 Ollama；界面支持简体中文、繁体中文、英语、日语和韩语。

## 开发

需要 Node.js 22.12+：

```bash
npm install
npm run electron:dev
```

生产构建：

```bash
npm run build
npm run package:mac
```

Windows / Linux 对应 `npm run package:win` 和 `npm run package:linux`。

## 目录

```text
src/        React 渲染层、功能模块和 i18n
electron/   主进程、窗口管理、服务和工具
public/     图标、Live2D 模型和静态资源
docs/       技术文档
build/      打包签名配置
```

## 许可

Lumira 基于 MIT 许可组件构建。原始版权声明和 MIT 全文见 [LICENSE](LICENSE)，第三方组件与素材说明见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

`public/live2d/mao` 是示例 Live2D 素材，不随本项目 MIT 许可授权；对外商用前请替换为你自有或已获授权的模型。
