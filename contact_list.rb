require './lib/contact'
require 'active_support/inflector'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  def initialize(argv=[])
    @input = argv
  end

  def process
    case @input[0]
    when 'all'
      contacts = Contact.all
      contacts.each_with_index do |contact, index|
        puts "#{index + 1}: #{contact[0]} (#{contact[1]})"
      end
      puts '---'
      puts "#{contacts.count} records total"
    when 'new'
      # kernel#gets only works if argv is empty
      puts 'Name:'
      name = STDIN.gets.chomp
      puts 'Email:'
      email = STDIN.gets.chomp
      Contact.create(name, email)
    when 'show'
      id = @input[1].to_i
      record = Contact.find(id)
      puts record.nil? ? "That contact doesn't exist" : "#{id}: #{record[0]} (#{record[1]})"
    when 'search'
      # This should be DRYed out
      contacts = Contact.search(@input[1])
      contacts.each do |contact|
        puts "#{contact[2]}: #{contact[0]} (#{contact[1]})"
      end
      puts '---'
      puts "#{contacts.count} #{"record".pluralize(contacts.count)} total"
    when nil 
      puts "Here is a list of available commands:\n"\
           "  new    - Create a new contact\n"\
           "  list   - List all contacts\n"\
           "  show   - Show a contact\n"\
           "  search - Search contacts\n"
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  ContactList.new(ARGV).process
end
