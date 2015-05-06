# Idra

Idra is a tiny wrapper around Typoheus Hydra to make concurrent http requests.

Usually you don't need this, the Typoheus API itself is very good ( https://github.com/typhoeus/typhoeus#making-parallel-requests ), but I like to have an even slimmer API :)


```rb
idra = Idra.new

idra.add_request "https://api.github.com/users/i0rek"
idra.add_request "https://api.github.com/users/makevoid"
idra.add_request "https://api.github.com/users/pauldix"
idra.add_request "https://api.github.com/users/dbalatero"

idra.run do |request|
  puts request.response.body
end
```

You can read the code on github: <https://github.com/makevoid/idra/blob/master/lib/idra.rb>

enjoy
