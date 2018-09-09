require_relative 'irb_extension'

module Rails
  class Console
    prepend IRBExtension
  end
end