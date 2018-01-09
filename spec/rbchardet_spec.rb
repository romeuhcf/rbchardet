RSpec.describe Rbchardet do
  it "has a version number" do
    expect(Rbchardet::VERSION).not_to be nil
  end
  
  it "detects encoding" do
    expect(Rbchardet.chardet( "oiiiii")).to eq "ASCII"
    expect(Rbchardet.chardet( "emoção")).to eq "UTF-8"
    expect(Rbchardet.chardet( "emoção".encode('ISO-8859-1'))).to eq "WINDOWS-1252"
    expect(Rbchardet.chardet( "01001".encode('ISO-8859-1'))).to eq "ASCII"
  end
end
