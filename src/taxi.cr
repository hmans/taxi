require "./taxi/*"

module Taxi
  def self.tag(name, *children, **attrs)
    String::Builder.new.tap do |b|
      b << "<#{name}"

      attrs.each do |k, v|
        b << " #{k}=\"#{v}\""
      end

      b << ">"

      children.each do |child|
        b << child
      end

      b << "</#{name}>"
    end.to_s
  end

  def self.build
    with self yield
  end

  # Shortcut macros
  {% for tag in %w[h1 div p] %}
    def self.{{ tag.id }}(*children, **attrs)
      tag({{ tag }}, *children, **attrs)
    end
  {% end %}
end
