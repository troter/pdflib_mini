module PdflibMini
  module Handle
    class Sharding < Base
      def initialize(sharding, p)
        super(sharding)
        @p = p
      end

      # 8.3 Patterns and Shadings
      # shfill(int shading)
      def shfill
        @p.shfill(self)
      end
    end
  end
end
