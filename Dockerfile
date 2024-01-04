FROM daxia2023/choreo:latest

# 更改Alpine镜像源
RUN sed -i -e 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# 更新软件包并修复漏洞
RUN apk update && \
    apk upgrade && \
    apk add busybox=1.36.1-r1 curl=8.4.0-r0 libcurl ssl_client=1.36.1-r1 && \
    # 其他漏洞修复或安全操作
    echo "漏洞修复步骤" && \
    # 清理apk缓存
    rm -rf /var/cache/apk/*
# 切换用户
USER 10016


