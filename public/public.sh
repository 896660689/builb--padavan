# cd $WORK_PATH/trunk 执行在这个目录下

# 1.修改一些默认参数 ./user/shared/defaults.h（需要不同设备不同拷贝到相应sh文件就好)

user_name="admin"                        # 用户名 admin
user_password=$user_name                 # 用户密码 admin
lan_ip="192.168.2"                       # lan 地址 192.168.2.1 一定别写后面的 .1
wifi_password="1234567890"               # wifi密码，切记密码最少8位 admin
version_time=$(date "+%Y%m%d")           # 自动时间更新时版本号: 20200320
default_path="./user/shared/defaults.h"  # 默认文件配置目录


echo '修改用户名'
sed -i 's/#define\s*SYS_USER_ROOT\s*"admin"/#define  SYS_USER_ROOT     "'$user_name'"/g' $default_path

echo '修改密码'
sed -i 's/#define\s*DEF_ROOT_PASSWORD\s*"admin"/#define  DEF_ROOT_PASSWORD     "'$user_password'"/g' $default_path

echo "修改Lan ip"
sed -i "s/192.168.2/$lan_ip/g" $default_path

echo "修改Wif密码"
sed -i "s/1234567890/$wifi_password/g" $default_path

echo "更新版本号时间"
sed -i "s/FIRMWARE_BUILDS_REV=[0-9]*/FIRMWARE_BUILDS_REV=$version_time/g" ./versions.inc

# 2. 删除预设项
################################################################################################
# 因不同型号配置功能不一样，所以先把配置项删除，如果你自己要添加其他的，也要写上删除这一条，切记！！！
################################################################################################
# Default
#sed -i "/CONFIG_FIRMWARE_INCLUDE_DROPBEAR/d" .config            # 删除配置项 dropbear SSH

# C大
#sed -i "/CONFIG_FIRMWARE_INCLUDE_WYYBIN/d" >> .config     # 删除配置项 网易云解锁GO版本执行文件（4M多）注意固件超大小

# 3. 添加公共自定义功能，设备单个的到设备 sh文件中添加
######################################################################
# 以下选项是定义你需要的功能（y=集成,n=忽略），重新写入到.config文件
######################################################################
        echo "CONFIG_FIRMWARE_INCLUDE_LANG_CN=y" >> .config
        echo "CONFIG_FIRMWARE_ENABLE_IPV6=y" >> .config
        echo "CONFIG_FIRMWARE_ENABLE_EXFAT=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_IPSET=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_TCPDUMP=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_HDPARM=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_SMBD36=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_RPL2TP=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_EAP_PEAP=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_DDNS_SSL=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_HTTPS=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_SFTP=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_OPENSSH=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_OPENVPN=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_OPENSSL_EC=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_OPENSSL_EXE=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_XUPNPD=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_FFMPEG_NEW=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_CURL=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_ADBYBY=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_NAPT66=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_SSSERVER=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_SOCAT=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_ADBYBY=y" >> .config
        echo "#CONFIG_FIRMWARE_INCLUDE_WYY=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_SMARTDNS=y" >> .config
        echo "CONFIG_FIRMWARE_INCLUDE_ADGUARDHOME=y" >> .config

