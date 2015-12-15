require './lib/contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  def initialize(argv=[])
    @input = argv
  end

  def process
    case @input[0]
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
