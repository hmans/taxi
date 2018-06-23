require "./hypertux/*"

module Hypertux
  def self.tag(name, *children)
    String::Builder.new.tap do |b|
      b << "<#{name}>"

      children.each do |child|
        b << child
      end

      b << "</#{name}>"
    end.to_s
  end

  def self.run
    with self yield
  end

  # Shortcut macros
  def self.h1(*args)
    tag(:h1, *args)
  end

  def self.div(*args)
    tag(:div, *args)
  end

  def self.p(*args)
    tag(:p, *args)
  end
end
