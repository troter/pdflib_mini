module PdflibMini
  module Handle
    class Layer < Base
      def initialize(layer, p)
        super(layer)
        @p = p
      end

      # 3.4 Layers
      # begin_layer(int layer)
      # end_layer( )
      def with_begin_layer(&block)
        @p.with_begin_layer(self, &block)
      end
    end
  end
end
