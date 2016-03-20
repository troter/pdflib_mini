module PdflibMini
  class Color < Handle
    def initialize(color, p)
      super(color)
      @p = p
    end
  end
end
