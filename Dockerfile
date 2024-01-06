FROM daxia2023/choreo:v5

# 设置环境变量
ARG PW
ENV PW $PW

# 更新系统并安装基本工具
RUN apk update && \
    apk add --no-cache bash curl shadow

# 设置密码，并创建用户
RUN useradd -m -p $(openssl passwd -1 $PW) -u 10016 pn

# 将用户添加到 sudo 组
RUN addgroup sudo && usermod -aG sudo pn

# 更改文件和目录所有者
RUN chown -R pn:pn /

# 设置工作目录
WORKDIR /app

# 复制应用程序代码
COPY . /app

# 设置权限和安装依赖
RUN chmod 755 arg.sh upload.sh upload2.sh cff.js web.js nezha.js && \
    npm install

# 切换到新创建的用户
USER pn

# 清理不必要的系统缓存
RUN rm -rf /var/cache/apk/*

# 启动应用程序
CMD ["node", "app.js"]
