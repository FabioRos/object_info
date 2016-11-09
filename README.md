# ObjectInfo

Thinked for development use.
It produces a list of Methods, attributes, relations and callbacks related to the passed resource.
You can invoke it with ```oi``` or  ```owl``` ( because an owl sees things through the dark ).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'object_info'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install object_info

## Usage

```ruby
   > _user_ = User.first
   > oi _user_
```

It produces a list of Methods, attributes, relations and callbacks related to the passed object or resource.
If you specify true as second parameter, the output will also include attributes and methods of ActiveRecord::Base and Object.

```ruby
   > _user_ = User.first
   > oi _user_, true
```


You can also use ```owl``` instead of  ```oi```, because an owl sees things hide in the dark.


## Sample output
```
> owl Book.first
  Book Load (1.5ms)  SELECT  "books".* FROM "books" ORDER BY "books"."id" ASC LIMIT ?  [["LIMIT", 1]]
Class: Book
Class_methods: 
[
    [0]                  initialize()       Book
    [1]       method_that_do_things()       Book
    [2]        test_below_structure()       Book
    [3] test_net_exception_handling(&block) Book
]
Associations: 
--> has_many: 
        nothing
---> belongs_to: 
      relation name: author
Instance methods:
[
    [0] :tester_method,
    [1] :tester_method_two,
    [2] :belongs_to_counter_cache_after_update,
    [3] :autosave_associated_records_for_author
]
Callbacks:
        after save >>> tester_method_two
        before save >>> autosave_associated_records_for_author
        before save >>> tester_method
Payload:
  Author Load (1.5ms)  SELECT  "authors".* FROM "authors" WHERE "authors"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
#<Book:0x007fc14f188a90> {
            :id => 1,
         :title => "Test title",
      :category => 1,
         :pages => 300,
        :author => #<Author:0x007fc150841480> {
                :id => 1,
              :name => "Chiara",
        :created_at => Tue, 01 Nov 2016 11:24:18 UTC +00:00,
        :updated_at => Tue, 01 Nov 2016 11:24:18 UTC +00:00
    },
    :created_at => Mon, 31 Oct 2016 16:06:24 UTC +00:00,
    :updated_at => Tue, 08 Nov 2016 15:05:44 UTC +00:00,
     :author_id => 1
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/FabioRos/object_info. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).