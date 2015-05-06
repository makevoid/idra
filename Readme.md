# Hydro

Tiny wrapper around Typoheus Hydra to make concurrent http requests.

Usually you don't need this, the Typoheus API itself is very good ( https://github.com/typhoeus/typhoeus#making-parallel-requests ), but I like to have an even slimmer API :)


```rb
hydro = Hydro.new

hydro.add_request "https://api.github.com/users/i0rek"
hydro.add_request "https://api.github.com/users/makevoid"
hydro.add_request "https://api.github.com/users/pauldix"
hydro.add_request "https://api.github.com/users/dbalatero"

hydro.run do |request|
  puts request.response.body
end
```

You can read the code

enjoy
