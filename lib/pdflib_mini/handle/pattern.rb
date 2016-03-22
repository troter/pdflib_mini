module PdflibMini
  module Handle
    class Pattern < Base
      def initialize(pattern, p)
        super(pattern)
        @p = p
      end

      # 8.3 Patterns and Shadings
      # end_pattern( )
      def end_pattern
        @p.end_pattern
      end
    end
  end
end
