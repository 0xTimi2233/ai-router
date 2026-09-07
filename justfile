default:
    @just --list

# 格式化代码
fmt:
    cargo fmt

# 格式检查
fmt-check:
    cargo fmt --check

# 代码规范静态检查
lint:
    cargo clippy -- -D warnings

# 测试
test:
    cargo test

# 依赖审计
audit:
    cargo deny check
