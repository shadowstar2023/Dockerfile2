FROM daxia2023/choreo:latest

# 更新软件包并修复漏洞
USER root
RUN apk update && \
    apk upgrade && \
    apk add busybox=1.36.1-r1 curl=8.4.0-r0 libcurl ssl_client=1.36.1-r1 && \
    # 其他漏洞修复或安全操作
    echo "漏洞修复步骤" && \
    # 清理apk缓存
    rm -rf /var/cache/apk/*

# 设置环境变量
ENV PW 8ge8

# 切换用户
USER 10016

# 其他Dockerfile指令
