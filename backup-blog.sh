#!/bin/bash

# 可变参数
blogname_prefix="blog" 
containername="wp-nginx"
blogdirname="blog"
nginxroot="/var/www/html"

sudo docker exec -i  ${containername} /bin/bash << EOF

cd ${nginxroot}

tar -cf blog.tar.gz ${blogdirname}

exit

EOF

# 备份sql文件名
time=$(date "+%Y-%m-%d-%H-%M-%S")
blogname="${blogname_prefix}-${time}.tar.gz"
echo ${blogname}

sh -c "sudo docker cp ${containername}:${nginxroot}/blog.tar.gz ${blogname}"

