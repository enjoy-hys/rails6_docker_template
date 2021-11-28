## 初始化 Rails 项目
### 项目第一次启动时, Rails 还未安装，目录下的 Gemfile 只有 rails, Gemfile.lock 为空白

### 以 `rails new` 创建 Rails 的文件，由于 docker-compose.yml 中 web 部份的 volumes 设置, 主机的目录将作为容器的项目目录, 在容器中生的成 Rails 文件将同时保存在主机目录
docker-compose run --rm web rails new . --force --no-deps --database=mysql

### 以主机目录下的文件为基础，生成 Rails 的容器镜像
docker-compose build

### 将 Rails 数据库连接的初始设置文件进行更改，数据库密码和数据库主机路径的情报可在 docker-compose.yml 中的db 部份查询
sed -i -e "s/password:.*/password: Localpw@/" config/database.yml
sed -i -e "s/host:.*/host: db/" config/database.yml

### 用 Rails 容器在 DB 中创建数据库
docker-compose run --rm web rake db:create

### 执行完以上所有命令后，才可以用以下的命令成功启动初始化的 Rails 项目
docker-compose up
