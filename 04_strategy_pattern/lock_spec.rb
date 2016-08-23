require './lock'

describe Lock do
  context "using UpcaseAuth strategy" do
    lock = Lock.new(UpcaseAuth.new)

    context "given a correct password" do
      it "should unlock" do
        expect(lock.unlock("hello", "HELLO")).to be true
        expect(lock.unlock("HELLO", "HELLO")).to be true
        expect(lock.unlock("foo", "FOO")).to be true
      end
    end

    context "given a incorrect password" do
      it "should stay locked" do
        expect(lock.unlock("hello", "HeLLO")).to be false
        expect(lock.unlock("hello", "asdf")).to be false
        expect(lock.unlock("hello", "hello")).to be false
      end
    end
  end

  context "using DowncaseAuth strategy" do
    lock = Lock.new(DowncaseAuth.new)

    context "given a correct password" do
      it "should unlock" do
        expect(lock.unlock("hello", "hello")).to be true
        expect(lock.unlock("HELLO", "hello")).to be true
        expect(lock.unlock("foo", "foo")).to be true
        expect(lock.unlock("FOO", "foo")).to be true
      end
    end

    context "given a incorrect password" do
      it "should stay locked" do
        expect(lock.unlock("hello", "HELLO")).to be false
        expect(lock.unlock("hello", "asdf")).to be false
        expect(lock.unlock("hllo", "hello")).to be false
      end
    end
  end

end
