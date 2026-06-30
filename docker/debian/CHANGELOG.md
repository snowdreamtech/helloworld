# Changelog

## [13.5.0](https://github.com/snowdreamtech/helloworld/compare/debian-v13.5.0...debian-v13.5.0) (2026-06-30)


### 🚀 Features

* add golang source files for multi-stage docker builds ([27c44b3](https://github.com/snowdreamtech/helloworld/commit/27c44b3471bedb7f8dd5a92d4471bd19d0cf678f))
* update Dockerfiles to implement multi-stage build for helloworld ([ee97aeb](https://github.com/snowdreamtech/helloworld/commit/ee97aebf434bb25a7352febc99a6f7d0fe538320))


### 🐛 Bug Fixes

* use ghcr.io for base images to avoid rate limits ([9f1d73a](https://github.com/snowdreamtech/helloworld/commit/9f1d73a75a61f2f368f5572c4bd28f4c92ef8fd5))


### 🛠 Refactoring

* **docker:** align Dockerfiles with base image structure ([232574f](https://github.com/snowdreamtech/helloworld/commit/232574fed8418f8c7f257d001e951361dfa467a0))
* remove redundant docker-entrypoint.sh files ([87c576b](https://github.com/snowdreamtech/helloworld/commit/87c576b27731ad11c5bc0ebc661e07c5a09ff1c1))
* reorganize distribution variants into docker directory ([67a8c91](https://github.com/snowdreamtech/helloworld/commit/67a8c911e21801bf12b3e83d02e22f3b3f59a2ba))
* update workflow actions, registry scan logic, and improve release-please automation processes ([63e042e](https://github.com/snowdreamtech/helloworld/commit/63e042ef23e2162b93b67e22a476c1e28b1edea5))


### 📖 Documentation

* add detailed comments to entrypoint initialization scripts ([f42cbaa](https://github.com/snowdreamtech/helloworld/commit/f42cbaab6edfbc5c38c2a636dfd8651fea900940))


### ♻️ Miscellaneous Chores

* add root go.mod to satisfy govulncheck requirement ([d5fec35](https://github.com/snowdreamtech/helloworld/commit/d5fec358c23cd8b52a783eb9d02936bb061209ad))
* clear changelogs to prepare for new versioning ([708a894](https://github.com/snowdreamtech/helloworld/commit/708a894464a0a3eb88211b2fa55ed279ddec557e))
* **deps:** bump base images to alpine 3.24.0, debian 13.5.0, rocky 10.2.0 ([1688969](https://github.com/snowdreamtech/helloworld/commit/168896956d2f4c7f91309c4c98ffef36ca7e8546))
* release main ([f66597a](https://github.com/snowdreamtech/helloworld/commit/f66597a5feae95e8853f4cc730c81e93e172f6ca))
* release main ([b3a5cc9](https://github.com/snowdreamtech/helloworld/commit/b3a5cc9ef0a64a7bc04ed7c2acf0cca5327c5c26))
* release main ([deb8454](https://github.com/snowdreamtech/helloworld/commit/deb8454df7518d56939ab3851245a4cd7b03d709))
* release main ([d87cb81](https://github.com/snowdreamtech/helloworld/commit/d87cb815685ad9b5b43d4b9a195c68dee2fd8065))
* release main ([78328d2](https://github.com/snowdreamtech/helloworld/commit/78328d20bd3697d48ea90aee8d0eaa6af4ccc09c))
* release main ([b720ad5](https://github.com/snowdreamtech/helloworld/commit/b720ad57dd1691d8ae07dcac7d46d0bd257af3a0))
* release main ([32dd84d](https://github.com/snowdreamtech/helloworld/commit/32dd84de4be973395d0867b5d527d528948a35df))
* release main ([725c69f](https://github.com/snowdreamtech/helloworld/commit/725c69fdcc222b5b83d0690629ce213a68c586ab))
* release main ([070b694](https://github.com/snowdreamtech/helloworld/commit/070b694a702763b60fc6b057a81418320418cafa))
* release main ([36d1211](https://github.com/snowdreamtech/helloworld/commit/36d1211036847a8c6aaa01a21a1c695a47b71d45))
* release main ([9ad4f94](https://github.com/snowdreamtech/helloworld/commit/9ad4f9490832efdc310f2ebbd8c77f3404daf07f))
* release main ([b0684a3](https://github.com/snowdreamtech/helloworld/commit/b0684a32a652e83506451e6056168cfec8b9142c))
* release main ([495e18a](https://github.com/snowdreamtech/helloworld/commit/495e18a4babcb06a12c2f5aec9ea571d97cb32e3))
* release main ([d4a3a34](https://github.com/snowdreamtech/helloworld/commit/d4a3a34b00a6b9f381cd5d556749c257516b2f08))
* release main ([28d9426](https://github.com/snowdreamtech/helloworld/commit/28d94263f4374017274707faef7183917b689be9))
* **release:** deduplicate CHANGELOG headers ([82be3d5](https://github.com/snowdreamtech/helloworld/commit/82be3d5576b65b7f69b1a9afb8604f2c8f0e47f7))
* **release:** deduplicate CHANGELOG headers ([d47fb44](https://github.com/snowdreamtech/helloworld/commit/d47fb44cb105b368722d7d0e210a27b525f82d87))
* **release:** deduplicate CHANGELOG headers ([e795177](https://github.com/snowdreamtech/helloworld/commit/e79517795d98b9f8292ef956586a6dc03932d03c))
* **release:** deduplicate CHANGELOG headers ([27919e4](https://github.com/snowdreamtech/helloworld/commit/27919e4baf4aab5b2a2bf32a7d437b05a717c11b))
* **release:** deduplicate CHANGELOG headers ([438190d](https://github.com/snowdreamtech/helloworld/commit/438190d297c151c75eca4912fdc22c285d5ec1ea))
* **release:** deduplicate CHANGELOG headers ([256f043](https://github.com/snowdreamtech/helloworld/commit/256f04311b2344f2648ca5bcf407146f8c690258))
* **release:** deduplicate CHANGELOG headers ([d263aae](https://github.com/snowdreamtech/helloworld/commit/d263aae7b223103a01dd0e114430381c5d863dd7))
* **release:** deduplicate CHANGELOG headers ([133954e](https://github.com/snowdreamtech/helloworld/commit/133954e95cfae85cbba2fb9c1ac5acbc677ca39d))
* **release:** deduplicate CHANGELOG headers ([1d82410](https://github.com/snowdreamtech/helloworld/commit/1d82410d6038be22d7741f1519826f30023b0f3e))
* **release:** deduplicate CHANGELOG headers ([5e1a539](https://github.com/snowdreamtech/helloworld/commit/5e1a5390319933b48d20ad993714587d826c0aa7))
* **release:** implement automatic changelog deduplication step ([282c220](https://github.com/snowdreamtech/helloworld/commit/282c22081e1ad7a1a010a7f297d20bc7c9b416a7))
* update Go version to 1.24.4 to fix CVE GO-2025-3750 ([1751024](https://github.com/snowdreamtech/helloworld/commit/17510248121cc5dded1a83efd034daf1c7d4ca53))


