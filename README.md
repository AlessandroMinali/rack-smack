# Rack::Smack

A no-nonsense force of good in a world of bad. Will prevent malicious bots/users from accessing your content once they are caught red-handed.

## Usage
Require `smack.rb` where you need it and the slide it into your middleware stack:

```
use Rack::Smack
```

## Options
`file`  for filename storing the bad guys  
`list`  for the list of keywords you want to ban on  
`asset` for the list of keywords where you want to skip checking  

### Example with options
```
use Rack::Smack file: 'bad_guys.txt', list: ['wp', 'wordpress', php', 'admin']
```

## Defaults
|Option|Value|
|-|-|
|file|'./ban_list.txt'|
|list|['wp', 'wordpress', 'xmlrpc', 'sfn']|
|asset|['css', 'gif', 'jpg', 'jpeg', 'js', 'png', 'ico', 'txt']| 

## Want to understand?
[Code overview]()
