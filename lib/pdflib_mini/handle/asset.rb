module PdflibMini
  module Handle
    class Asset < Base
      def initialize(asset, p)
        super(asset)
        @p = p
      end
    end
  end
end
