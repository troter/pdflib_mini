module PdflibMini
  class Asset < Handle
    def initialize(asset, p)
      super(asset)
      @p = p
    end
  end
end
