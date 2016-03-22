module PdflibMini
  module Handle
    class Color < Base
      def initialize(color, p)
        super(color)
        @p = p
      end
    end
  end
end
