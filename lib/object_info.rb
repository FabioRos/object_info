require "object_info/version"

module ObjectInfo
  # Your code goes here...


  def self.analize (_object_)
    puts "Class: " + _object_.class.name
    puts "Class_methods: " + _object_.class.methods - Object.methods - ActiveRecord::Base.methods
    puts "Payload" + object_.attributes
  end
end
