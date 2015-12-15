require 'contact'

describe Contact do
  context 'class methods' do

    before(:each) do
      data = ['Khurram Virani,kvirani@lighthouselabs.ca', 'Don Burks,don@lighthouselabs.ca']
      #allow(CSV).to receive(:foreach).and_yield(data[0]).and_yield(data[1])
      @parsed_data = CSV.parse(data[0]) << CSV.parse(data[1])[0]
      allow(CSV).to receive(:read).and_return(@parsed_data)
    end

    describe '#all'do
      it 'returns a formatted list of all contacts' do
        expect(Contact.all).to eq([['Khurram Virani', 'kvirani@lighthouselabs.ca'], ['Don Burks', 'don@lighthouselabs.ca']])
      end
    end 

    describe '#create'do
      before(:each) do
        @name = 'Dan'
        @email = 'daniel@capitolhll.ca'
        allow(CSV).to receive(:open).and_yield(@parsed_data)
      end

      it 'returns the newly created contact' do
        contact = Contact.create(@name, @email)
        expect(contact.name).to eq(@name)
        expect(contact.email).to eq(@email)
      end

      it 'adds a new contact to the CSV file' do
        contact = Contact.create(@name, @email)
        expect(CSV).to have_received(:open).with('data/contacts.csv', 'ab').once
        expect(@parsed_data[2]).to eq([contact.name, contact.email])
      end
    end 
  end
end


