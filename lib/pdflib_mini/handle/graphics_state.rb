module PdflibMini
  module Handle
    class GraphicsState < Base
      def initialize(graphics_state, p)
        super(graphics_state)
        @p = p
      end

      # 7.2 Graphics State
      # set_gstate(int gstate)
      def set_gstate
        @p.set_gstate(self)
      end
    end
  end
end
