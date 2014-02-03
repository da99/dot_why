require "dot_why"

describe "partial()" do

  before do
    @file = "/tmp/" + rand(1000).to_s + '.dot_why.spec.rb'
    File.open(@file, 'w') { |file|
      file.write %~
      title "test"
      ~
    }
    @page = Dot_Why::Template.new(@file)
    def @page.main
      eval_main
    end
  end

  after do
    `rm #{@file}` if File.exists?(@file)
  end

  it "grabs and evals specified file" do
    @page.to_html(:prettyprint=>true)
    .should == "test"
  end

  it "grabs/evals 2nd file based on dir of first arg." do
    @page.to_html(:prettyprint=>true)
    .should == "partial"
  end

end # === describe partial ===
