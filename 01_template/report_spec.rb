require './report'

describe Report do
  it "should be a defined class" do
    expect(described_class).to eq(Report)
  end
  it "should be a Report" do
    expect(subject).to be_a(Report)
  end

  describe "#output_report" do
    it "should give report" do
      report = Report.new "hello", "world"
      expect{ report.get_report }.to raise_error(NotImplementedError)
    end
  end
end

describe HtmlReport do

  it "should be a defined class" do
    expect(described_class).to eq(HtmlReport)
  end

  it "should instantiate correctly" do
    expect(subject).to be_a(described_class)
  end

  describe "#get_report" do
    it "should get html report" do
      report = HtmlReport.new "hello", "world"
      expected_report =
        """
<html>
<body>
<h1>hello</h1>
<p>world</p>
</body>
</html>
      """.strip
      expect(report.get_report).to eq(expected_report)
    end
  end
end


describe PlainTextReport do

  it "should be a defined class" do
    expect(described_class).to eq(PlainTextReport)
  end

  it "should instantiate correctly" do
    expect(subject).to be_a(described_class)
  end

  describe "#get_report" do
    it "should get plain text report" do
      report = described_class.new "hello", "world"
      expected_report =
        """
*** hello ***
world
        """.strip
      expect(report.get_report).to eq(expected_report)
    end
  end

end
