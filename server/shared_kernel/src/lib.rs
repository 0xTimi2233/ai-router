//! 共享内核模块
//!
//! 提供跨限界上下文共享的基础类型与统一抽象。

/// 统一错误类型占位
#[derive(Debug, PartialEq, Eq)]
pub enum KernelError {
    /// 内部错误
    Internal,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn should_initialize_kernel_error() {
        let err = KernelError::Internal;
        assert_eq!(err, KernelError::Internal);
    }
}
