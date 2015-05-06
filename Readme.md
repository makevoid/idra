# Hydro

Tiny wrapper around Typoheus Hydra to make concurrent http requests


```rb
hydro = Hydro.new

hydro.add_request "https://api.github.com/users/makevoid"
hydro.add_request "https://api.github.com/users/i0rek"

hydro.run do |request|
  puts request.response.body
end
```
