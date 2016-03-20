module PdflibMini
  class Action < Handle
    def initialize(action, p)
      super(action)
      @p = p
    end
  end
end
