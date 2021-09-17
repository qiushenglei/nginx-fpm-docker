## 本地小鹅通docker

> 安装docker

这一步不做说明了，直接看docker的教程或者blog

> 拉取gitHub库

github库里有

- docker-composer.yaml
- 挂载目录和挂载文件

```bash
git clone https://github.com/qiushenglei/nginx-fpm-docker.git
```

> 本地运行docker

```bash
cd /path/to/git

# docker-compose开启容器
docker-compose up 
```

> 进入容器内部

```
docker exec -it {containerName} bash
```

## xdebug

> 修改镜像挂载的php.ini

因为我的镜像里已经安装了xdebug扩展，所以可以直接修改xdebug配置，如果是自己的镜像需要安装需要的扩展

```shell
# php.ini 

[xdebug]
zend_extension="xdebug"
xdebug.mode=debug
xdebug.remote_handler = dbgp
# 客户端主机 这个是xdebug官方给出的
xdebug.client_host = host.docker.internal
# 客户端端口 监听10010端口
xdebug.client_port = 10010
# ide配置的key,这个根据ide的配置进行修改
xdebug.idekey = qqq
```

> php-cli debug配置

```bash
# 进入phpContainer
docker exec -it phpContainer bash 

# 已进入容器
cd ~
vim .bashrc

# 设置环境变量，用于php系统的不同环境
export APP_ENV="local"
# 设置监听server 感觉好鸡肋啊，如果换成另外一个系统又要来改，真的蠢
export PHP_IDE_CONFIG="serverName=express.local.xiaoe.com"
# idekey
export XDEBUG_CONFIG="idekey=qqq"

# 保存并应用
source .bashrc
```

## 本地连接开发mysql

```bash
# 进入phpContainer
docker exec -it phpContainer bash 

#开启隧道
ssh -p 22 -fNL localport:remote_host:remote_port mysql_name@mysql_host  

#不知道怎么开启隧道这个command加上password，如果可以直接塞到~/.bashrc文件下，开启则应用

localport:本地端口
remote_host:跳板机host
remote_port:跳板机port
mysql_name:dev mysql的账号
mysql_host:dev mysql的主机ip
```



