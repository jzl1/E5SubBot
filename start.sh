echo "bot_token: $BOTTOKEN
#socks5: 127.0.0.1:1080
bindmax: $MAX
admin: $ADMIN
errlimit: 5
notice: "aaa\nbbb"
cron: "1 */3 * * *"
#docker部署默认无需修改mysql配置
mysql:
  host: $SQLHOST
  port: $SQLPORT
  user: $SQLUSER
  password: $SQLPWD
  database: $SQLDB" >> /app/config.yml
/app/main
