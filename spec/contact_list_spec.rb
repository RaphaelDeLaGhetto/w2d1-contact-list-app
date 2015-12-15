require_relative '../contact_list'

describe ContactList do
  describe '#process' do

    before(:each) do
      data = ['Khurram Virani,kvirani@lighthouselabs.ca', 'Don Burks,don@lighthouselabs.ca']
      allow(CSV).to receive(:read).and_return(CSV.parse(data[0]) << CSV.parse(data[1])[0])
    end

    context 'program is executed without arguments' do
      it "displays a help menu" do
        expect { ContactList.new([]).process }.to output("Here is a list of available commands:\n"\
                                                         "  new    - Create a new contact\n"\
                                                         "  list   - List all contacts\n"\
                                                         "  show   - Show a contact\n"\
                                                         "  search - Search contacts\n").to_stdout
      end
    end
  
    context "program is executed with 'help' argument" do
      it "outputs a list of all contacts" do
        expect { ContactList.new(['all']).process }.to output("1: Khurram Virani (kvirani@lighthouselabs.ca)\n"\
                                                              "2: Don Burks (don@lighthouselabs.ca)\n"\
                                                              "---\n"\
                                                              "2 records total\n").to_stdout
      end
    end
  end
end
