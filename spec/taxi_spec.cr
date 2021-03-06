require "./spec_helper"

describe Taxi do
  it "renders tags with plain text" do
    str = Taxi.build do
      h1("Hello world!")
    end

    str.should eq("<h1>Hello world!</h1>")
  end

  it "renders trees of tags" do
    str = Taxi.build do
      div(
        p("Hello world!"),
        p("Here's another paragraph.")
      )
    end

    str.should eq("<div><p>Hello world!</p><p>Here's another paragraph.</p></div>")
  end

  it "renders tags with attributes" do
    str = Taxi.build do
      h1("Hello world!", class: "large", id: "title")
    end

    str.should eq("<h1 class=\"large\" id=\"title\">Hello world!</h1>")
  end
end
