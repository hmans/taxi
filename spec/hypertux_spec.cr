require "./spec_helper"

describe Hypertux do
  it "renders a tag with some text" do
    str = Hypertux.run do
      h1 "Hello world!"
    end

    str.should eq("<h1>Hello world!</h1>")
  end

  it "renders a tree of tags" do
    str = Hypertux.run do
      div [
        p("Hello world!"),
        p("Here's another paragraph.")
      ]
    end

    str.should eq("<div><p>Hello world!</p><p>Here's another paragraph.</p></div>")
  end
end
