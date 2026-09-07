default:
    @just --list

# 原地格式化并执行编译与代码规范检查
check:
    cargo fmt --all
    cargo check --workspace --all-targets
    cargo clippy --workspace --all-targets --all-features -- -D warnings

# 锁定依赖与全部特性的全量测试
test:
    cargo test --workspace --all-features --locked

# 依赖漏洞与许可证合规审计
audit:
    cargo deny check

# 只读校验代码格式
fmt-check:
    cargo fmt --all --check
