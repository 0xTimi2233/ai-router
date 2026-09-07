# 默认列出所有可用命令
default:
    @just --list

# 本地日常核心检查：先原地自动格式化，再执行语法检查与 Clippy 规范
check: fmt
    cargo check --workspace --all-targets
    cargo clippy --workspace --all-targets --all-features -- -D warnings

# 原地自动格式化所有代码
fmt:
    cargo fmt --all

# 本地单元与切片测试
test:
    cargo test --workspace

# 本地按需依赖安全与许可证合规审计
audit:
    cargo deny check

# CI 专用：代码格式只读检查门禁
ci-fmt:
    cargo fmt --all --check

# CI 专用：Clippy 规范检查门禁
ci-clippy:
    cargo clippy --workspace --all-targets --all-features -- -D warnings

# CI 专用：工作空间全量测试
ci-test:
    cargo test --workspace --all-features --locked

# 配置本机全局 Git 提交规范模板
apply-git-template:
    git config --global commit.template {{justfile_directory()}}/.gitmessage

# 同步标准工程标签至 GitHub 远程仓库
sync-labels repo="0xTimi2233/ai-router":
    #!/usr/bin/env bash
    set -euo pipefail
    jq -c '.[]' "{{justfile_directory()}}/.github/labels.json" | while read -r item; do
        name=$(echo "$item" | jq -r .name)
        color=$(echo "$item" | jq -r .color)
        desc=$(echo "$item" | jq -r .description)
        gh label create "$name" --color "$color" --description "$desc" --repo "{{repo}}" --force
    done
