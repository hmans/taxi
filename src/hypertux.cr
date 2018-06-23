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
  {% for tag in %w[h1 div p] %}
    def self.{{ tag.id }}(*args)
      tag({{ tag }}, *args)
    end
  {% end %}
end
