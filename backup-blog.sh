#!/bin/bash

# editable vars
blog_archive_name_prefix="blog"
wp_container_name="wp-nginx"
web_root_dir="/var/www/html"

sudo docker exec -i ${wp_container_name} /bin/bash <<EOF

cd ${web_root_dir}

tar -cPf blog.tar.gz ./*

mkdir /backup-dir

mv blog.tar.gz /backup-dir

exit

EOF

# 备份sql文件名
time=$(date "+%Y-%m-%d-%H-%M-%S")
blogname="${blog_archive_name_prefix}-${time}.tar.gz"
echo ${blogname}

sh -c "sudo docker cp ${wp_container_name}:/backup-dir/blog.tar.gz ${blogname}"
