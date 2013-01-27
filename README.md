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

1. Get all Tags:
        
    base = Simple::Delicious:Base.new("login", "password")
    base.tags

2. Rename Tag:

    base = Simple::Delicious:Base.new("login", "password")
    base.tags :action => "rename", :old => "oldname", :new => "newname"

3. Delete a specific Tag:


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
