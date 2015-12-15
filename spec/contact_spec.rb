require 'contact'

describe Contact do
  context 'class methods' do

    before(:each) do
      data = ['Khurram Virani,kvirani@lighthouselabs.ca', 'Don Burks,don@lighthouselabs.ca']
      #allow(CSV).to receive(:foreach).and_yield(data[0]).and_yield(data[1])
      allow(CSV).to receive(:read).and_return(CSV.parse(data[0]) << CSV.parse(data[1])[0])
    end

    describe '#all'do
      it 'returns a formatted list of all contacts' do
        expect(Contact.all).to eq([['Khurram Virani', 'kvirani@lighthouselabs.ca'], ['Don Burks', 'don@lighthouselabs.ca']])
      end
    end 

  end
end


