class String
  def to_bool
    return false if self.blank? || self.downcase! =~ (/^(false|f|no|n|0|off)$/i)
    return true if self.downcase! =~ (/^(true|t|yes|y|1|on)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
  def to_a
    [self]
  end
end

class Fixnum
  def to_bool
    return true if self == 1
    return false if self == 0
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
  def to_a
    [self]
  end
end

class TrueClass
  def to_i; 1; end
  def to_bool; self; end
end

class FalseClass
  def to_i; 0; end
  def to_bool; self; end
end

class NilClass
  def to_bool; false; end
end
