require "dot_why"

describe "partial()" do

  before do
    `mkdir /tmp/dot_why` unless File.exists?("/tmp/dot_why")
    Dir['/tmp/dot_why/*'].each { |f|
      `rm #{f}`
    }

    @file = "/tmp/dot_why/main.rb"
    @page = Dot_Why::Template.new(@file)
    def @page.main
      eval_main
    end
  end

  it "grabs and evals specified file" do
    f = "/tmp/dot_why/partial.1.rb"
    File.open(@file, 'w') { |file| file.write %~ partial "/tmp/dot_why/partial.1.rb" ~ }
    File.open(f, 'w')     { |file| file.write %~ p "partial 1" ~ }
    @page.to_html(:prettyprint=>true).strip
    .should == "<p>partial 1</p>"
  end

  it "grabs/evals 2nd file based on dir of first arg." do
    f = "/tmp/dot_why/partial.2.rb"
    File.open(@file, 'w') { |file| file.write %~ partial "/tmp/dot_why", "/partial.2.rb" ~ }
    File.open(f, 'w')     { |file| file.write %~ p "partial 2" ~ }
    @page.to_html(:prettyprint=>true).strip
    .should == "<p>partial 2</p>"
  end

  it "grabs/evals 2nd file based on dir of file in first arg (eg File.dirname)" do
    f = "/tmp/dot_why/partial.3.rb"
    File.open(@file, 'w') { |file| file.write %~ partial "#{f}", "/partial.3.rb" ~ }
    File.open(f, 'w')     { |file| file.write %~ p "partial 3" ~ }
    @page.to_html(:prettyprint=>true).strip
    .should == "<p>partial 3</p>"
  end

end # === describe partial ===
