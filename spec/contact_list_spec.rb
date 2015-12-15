require_relative '../contact_list'

describe ContactList do

  context 'program is executed without arguments' do
    it "displays a help menu" do
      expect { ContactList.new([]).process }.to output("Here is a list of available commands:\n"\
                                                       "  new    - Create a new contact\n"\
                                                       "  list   - List all contacts\n"\
                                                       "  show   - Show a contact\n"\
                                                       "  search - Search contacts\n").to_stdout
    end
  end
end


