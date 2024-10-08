# SQL Server Docker
docker run --name SqlServer -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=pwd' -e 'MSSQL_PID=Developer' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2022-latest

# MariaDB Docker
docker run --name MariaDB -e 'MARIADB_ROOT_PASSWORD=root' -p 3306:3306 -d mariadb:latest

# Redis Docker
docker run -d --name Redis -e REDIS_ARGS="--requirepass root --appendonly yes" -p 6379:6379  redis/redis-stack-server:latest

# MySql Docker
docker run --name Mysql -e 'MYSQL_ROOT_PASSWORD=root' -p 3306:3306 -d mysql:latest

# swap size 
sudo nvim /etc/systemd/zram-generator.conf
[zram0]
zram-size=8192 # replace with desired size

# test emoji notif
notify-send "������������������������������"

# dev stuff
npm run typeorm migration:create ./src/migration/name
npx typeorm init --name pkgname --database mysql
npm run typeorm migration:generate ./src/migration/name -- -d ./src/data-source.ts

# get desktop entry
ls /usr/share/applications | grep dbeaver

# azurite
azurite --silent --location ~/.local/azurite --debug ~/.local/azurite/debug.log

# recursive fing and delete
find . -name 'cache' -type d -prune -print -exec rm -rf '{}' \;
find . -name 'build' -type d -prune -print -exec rm -rf '{}' \;