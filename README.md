# Simple::Delicious

Simple delicious client API.

## Installation

Add this line to your application's Gemfile:

    gem 'simple-delicious'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple-delicious

## Usage

Parameters are uniform across the functions. All calls can accept:

    :action is the http operation to call, eg:  "/tags/update" would be :action => "update"   
    :params is a map of parameters to pass, eg, tag=git would be {tag:"git"}

### Examples:

Tags:
------

1. Get all Tags:

To get all Tags of a specific account:

```ruby
base = Simple::Delicious::Base.new("login", "password")
base.tags :action => "get" (Possible actions are: get, rename and delete )
```
    
2. Rename Tag:

To Rename a specific Tag:

```ruby
base = Simple::Delicious::Base.new("login", "password")
response = base.tags :action => "rename", :old => "oldname", :new => "newname"
```

Get one tag : eg: (return the git tag)

```ruby
response.element("tag", "git")
```
3. Delete a specific Tag:

  
```ruby
base = Simple::Delicious::Base.new("login", "password")
response = base.tags :action => "delete", :tag => "git"

```

Bundles:
------

1. Get all bundles:

```ruby
base = Simple::Delicious::Base.new("login", "password")
response = base.bundles

```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
