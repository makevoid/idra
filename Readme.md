# Idra

Idra is a tiny wrapper around Typoheus Hydra to make concurrent http requests.

Usually you don't need this, the Typoheus API itself is very good ( https://github.com/typhoeus/typhoeus#making-parallel-requests ), but I like to have an even slimmer API :)


```rb
idra = Idra.new

idra.add_request :user1, "https://api.github.com/users/i0rek"
idra.add_request :user2, "https://api.github.com/users/makevoid"
idra.add_request :user3, "https://api.github.com/users/pauldix"
idra.add_request :user4, "https://api.github.com/users/dbalatero"

idra.response_for :user1 do |response|
  puts response.body
end

idra.response_for :user2 do |response|
  puts response.body
end

# ...
```

or:

```rb
idra.refresh # makes the requests again

idra.run do |request|
  puts request.name           # => :userX
  puts request.response.body  # => {...}
end
```


You can read the code on github: <https://github.com/makevoid/idra/blob/master/lib/idra.rb> -- It's just few lines.

enjoy


### Changelog

- 0.1.1 - fix #refresh
- 0.1.0 - first release
