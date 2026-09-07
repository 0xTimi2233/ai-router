default:
    @just --list

# 原地格式化代码
fmt:
    cargo fmt --all

# 校验代码格式（只读检查）
fmt-check:
    cargo fmt --all --check

# 语法与编译检查
check:
    cargo check --workspace --all-targets

# Clippy 规范静态检查
lint:
    cargo clippy --workspace --all-targets --all-features -- -D warnings

# 全量测试（锁定依赖与全特性）
test:
    cargo test --workspace --all-features --locked

# 依赖漏洞与许可证合规审计
audit:
    cargo deny check
