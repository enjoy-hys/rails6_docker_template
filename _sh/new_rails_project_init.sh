## 初始化 Rails 项目
# 项目第一次启动时, Rails 还未安装，目录下的 Gemfile 只有 rails, Gemfile.lock 为空白
docker-compose run --rm web rails new . --force --no-deps --database=mysql
docker-compose build
sed -i -e "s/password:.*/password: Localpw@/" config/database.yml
sed -i -e "s/host:.*/host: db/" config/database.yml
docker-compose run --rm web rake db:create
## 执行完以上所有命令后，才可以用以下的命令成功启动初始化的 Rails 项目
docker-compose up
