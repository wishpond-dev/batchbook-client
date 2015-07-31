# Batchbook API

This gem is designed to communicate with the *Batchbook API* through instantiation of the main class. To instantiate you need the API token and the base site from a Batchbook account.

This Gem supports the following  **Batchbook API** methods:

* People
* Users

All methods in this gem use **JSON** formatting. To read on the Batchbook API please visit (https://github.com/batchblue/batchbook-api)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'batchbook-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install batchbook-client

## Usage

To begin:

```ruby
batchbook = Batchbook::Client.new(base_site, api_key)
```
To check if a successful connection can be made to the API:

```ruby
batchbook.ping
```
This will return *true* or *false*.

The get methods support pagination and the default page size is 200.
To get the people on the first page (first 200):
```ruby
response = batchbook.get_people
```
The response includes metadata for pagination.
```ruby
response["next_page"]
```

You can also get people on a particular page:
```ruby
batchbook.get_people(2)
```
This will get all the users on the second page.

To create a person on *Batchbook*:
```ruby
batchbook.post_person(person)
```
The person parameter has to be formatted according to (https://github.com/batchblue/batchbook-api).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/batchbook-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
