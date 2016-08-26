require 'spec_helper'
require '09_adapter/encrypter'
require 'tempfile'

describe Encrypter do

  let(:content) { "Hello world!" }

  let(:filename) {
    f = Tempfile.new
    f.close
    f.path
  }

  let(:filename_encrypted) { filename + ".crypt" }
  let(:filename_encrypted_2) { filename + "_2.crypt" }

  it "should create an encrypted file" do

    File.open(filename, 'w') do |f|
      f.write content
    end

  encrypter = Encrypter.new("my secret key")

    File.open(filename) do |reader|
      File.open(filename_encrypted, "w") do |writer|
        encrypter.encrypt(reader, writer)
      end
    end

    expect(File.read(filename)).not_to eq(File.read(filename_encrypted))

    reader = StringIOAdapter.new(content)
    File.open(filename_encrypted_2, "w") do |writer|
      encrypter.encrypt(reader, writer)
    end

    expect(File.read(filename_encrypted_2)).to eq(File.read(filename_encrypted))
  end
end


describe StringIOAdapter do
  describe "#getc" do
    it "should respond" do
      expect(subject).to respond_to(:getc)
    end
  end

  describe "#eof?" do
    it "should respond" do
      expect(subject).to respond_to(:eof?)
    end
  end

end

