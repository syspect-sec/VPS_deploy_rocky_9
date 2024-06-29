# Recursive directory permissions
find ${dirperm[3]} -type d -exec chmod ${dirperm[2]} -- {} +
# Single directory permissions
chmod ${dirperm[1]} ${dirperm[2]}
# Recursive permissions
find ${dirperm[3]} -type f -exec chmod ${dirperm[2]} -- {} +
# Single file permissions
chmod ${dirperm[1]} ${dirperm[2]}
# SELinux recursive Read
find ${dirperm[2]} -type d -exec chcon -t httpd_sys_content_t -R ${dirperm[2]} -- {} +
# SELinux directory Read
chcon -t httpd_sys_content_t ${dirperm[1]}
# SELinux recursive read write
find ${dirperm[2]} -type d -exec chcon -t httpd_sys_rw_content_t -R -- {} +
# SELinux directory read write
chcon -t httpd_sys_rw_content_t ${dirperm[1]}
