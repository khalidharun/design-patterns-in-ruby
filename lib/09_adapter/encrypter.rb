class Encrypter
  def initialize(key)
    @key = key
  end

  def encrypt(reader, writer)
    key_index = 0
    until reader.eof?
      clear_char = reader.getc
      encrypted_char = clear_char.ord ^ @key[key_index].ord
      writer.putc(encrypted_char)
      key_index = (key_index + 1) % @key.size
    end
  end
end

class StringIOAdapter

  def initialize(string = "")
    @string = string
    @position = 0
  end

  def getc
    @position += 1
   @string[@position - 1]
  end

  def eof?
    @position >= @string.length
  end
end
