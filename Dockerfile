FROM daxia2023/choreo:v5

# 更新包管理工具和安装必要的软件
RUN apk update \
    && apk add --no-cache bash curl unzip shadow openssl \
    && apk add --no-cache nodejs npm

# 创建用户和设置密码
RUN groupadd sudo \
    && useradd -m pn -u 10016 \
    && echo 'pn:10016' | chpasswd \
    && usermod -aG sudo pn

# 设置工作目录
WORKDIR /app

# 将应用程序代码复制到工作目录
COPY . /app

# 设置容器的默认用户
USER 10016

# 在容器启动时执行的命令
CMD ["npm", "start"]
RUN rm -rf /var/cache/apk/*

# 启动应用程序
CMD ["node", "app.js"]
