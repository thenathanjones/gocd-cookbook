default[:gocd][:ldap][:search_filter] = 'sAMAccountName'

default[:gocd][:download_path] = 'http://download.go.cd/local'
default[:gocd][:autoregister][:key] = 'ABCD1234'

default[:gocd][:server][:host] = 'localhost'
default[:gocd][:server][:http_port] = 8153
default[:gocd][:server][:https_port] = 8154

default[:gocd][:server][:min_mem] = '512m'
default[:gocd][:server][:max_mem] = '1024m'
default[:gocd][:server][:min_perm_gen] = '128m'
default[:gocd][:server][:max_perm_gen] = '256m'

default[:gocd][:agent][:resources] = []
default[:gocd][:agent][:environments] = []