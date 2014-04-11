default['nginx']['user'] = 'www-data'
default['nginx']['worker_processes'] = 4
default['nginx']['pid'] = '/run/nginx.pid'

# events
default['nginx']['events']['worker_connections'] = 768
default['nginx']['events']['multi_accept'] = 'off'

# http
## basic settings
default['nginx']['http']['sendfile'] = 'on'
default['nginx']['http']['tcp_nopush'] = 'on'
default['nginx']['http']['tcp_nodelay'] = 'on'
default['nginx']['http']['keepalive_timeout'] = 65
default['nginx']['http']['types_hash_max_size'] = 2048
default['nginx']['http']['server_tokens'] = 'off'

default['nginx']['http']['server_names_hash_bucket_size'] = 64
default['nginx']['http']['server_name_in_redirect'] = 'off'


default['nginx']['http']['default_type'] = 'application/octet-stream'

## logging settings
default['nginx']['http']['access_log'] = '/var/log/nginx/access.log'
default['nginx']['http']['error_log'] = '/var/log/nginx/error.log'

## gzip settings
default['nginx']['http']['gzip'] = 'on'
default['nginx']['http']['gzip_disable']= 'msie6'

## virtual host configs
default['nginx']['http']['include'] = [
    '/etc/nginx/conf.d/*.conf', 
    '/etc/nginx/sites-enabled/*', 
    '/etc/nginx/mime.types'
]


# mail settings
# default['nginx']['mail']['auth_http'] = 'localhost/auth.php'
# etc etc