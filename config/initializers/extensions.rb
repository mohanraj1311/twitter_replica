class Array
  def to_quoted_s(q="'")
    "#{q}#{self.join("#{q}, #{q}")}#{q}"
  end
end
