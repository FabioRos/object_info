require "object_info/version"
require "awesome_print"


#MACRO DEFINITION
def oi  (_object_, all_methods =false)
  ObjectInfo.analyze(_object_, all_methods)
end

#CORE
module ObjectInfo
  # Your code goes here...

  #TODO add dependency to colorize and use it„

  def self.analyze (_object_, all_methods =false)

    options_val = _object_.is_a?(ActiveRecord::Base) ? {} : {raw: true}

    puts "Class: ".red + _object_.class.name.yellow rescue ''
    puts "Class_methods: ".red
    if all_methods
      ap((_object_.class.methods), options = options_val) rescue puts 'not retrieved'
    else
      ap((_object_.class.methods - Object.methods - ActiveRecord::Base.methods), options = options_val) rescue puts 'not retrieved'
    end

    puts "Associations: ".red
    puts "--> has_many: ".blue
    hm_ =(_object_.class.name.constantize.reflect_on_all_associations(:has_many).each { |association| puts "      relation name: " + "#{association.name}".yellow}) rescue nil
    puts '        nothing' unless hm_.present?
    puts "---> belongs_to: ".blue
    bt_ = (_object_.class.name.constantize.reflect_on_all_associations(:belongs_to).each { |association| puts "      relation name: " + "#{association.name}".yellow}) rescue nil
    puts '        nothing' unless bt_.present?

    puts "Instance methods:".red
    ap((eval "#{_object_.class.instance_methods(false)}"), options = options_val) rescue 'not retrieved'

    puts "Callbacks:".red

    callback_types = ['save', 'initialize', 'find', 'touch', 'validation', 'create', 'update', 'destroy', 'commit', 'rollback']

    callback_types.each do |_type_|
      eval("_object_.class.name.constantize._#{_type_}_callbacks").each do |save_callback|
        puts ("        #{save_callback.kind.to_s} #{save_callback.name.to_s}".blue + " >>> " +"#{save_callback.filter.to_s}".yellow)
      end rescue ''
    end



   # _create_callbacks

    puts 'Payload:'.red
    ap  _object_ , options = options_val rescue 'not retrieved'
  end
end