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
      def begin_layer(&block)
        @p.begin_layer(self, &block)
      end
    end
  end
end
