# Rack::Smack

A no-nonsense force of good in a world of bad. Will prevent malicious bots/users from accessing your content once they are caught red-handed.

## Install
```
$ gem install rack-smack
```

## Usage
```
require 'rack/smack'

use Rack::Smack
run YourApp
```

## Options
`file`  for filename storing the bad guys  
`list`  for the list of keywords you want to ban on  
`asset` for the list of keywords where you want to skip checking  
`anon`  do not log any client ips

### Example with options
```
use Rack::Smack file: 'bad_guys.txt', list: ['wp', 'wordpress', php', 'admin'], anon: true
```

## Defaults
|Option|Value|
|-|-|
|file|'./ban_list.txt'|
|list|['wp', 'wordpress', 'xmlrpc', 'sfn']|
|asset|['css', 'gif', 'jpg', 'jpeg', 'js', 'png', 'ico', 'txt']| 
|anon|false|

## Want to understand?
[Code overview](https://alessandrominali.github.io/block_malicious_users_with_rack_app)
