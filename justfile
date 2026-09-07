default:
    @just --list

# 代码格式规范检查
check:
    cargo fmt --check

# 代码规范静态检查
lint:
    cargo clippy

# 全量测试
test:
    cargo test

# 依赖漏洞审计
audit:
    cargo deny check
