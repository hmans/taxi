require "./hypertux/*"

module Hypertux
  def self.tag(name, children : Array(String))
    String::Builder.new.tap do |b|
      b << "<#{name}>"

      children.each do |child|
        b << child
      end

      b << "</#{name}>"
    end.to_s
  end

  def self.tag(name, children : String)
    tag(name, [children])
  end

  def self.run
    with self yield
  end

  # Shortcut macros
  macro h1(*args)
    tag(:h1, {{ *args }})
  end

  macro div(*args)
    tag(:div, {{ *args }})
  end

  macro p(*args)
    tag(:p, {{ *args }})
  end
end
