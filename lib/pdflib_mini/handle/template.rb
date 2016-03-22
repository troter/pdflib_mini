module PdflibMini
  module Handle
    class Template < Base
      def initialize(template, p)
        super(template)
        @p = p
      end

      # 9.3 Templates
      # end_template_ext(float width, float height)
      def end_template_ext(*args)
        @p.end_template_ext(self, *args)
      end
    end
  end
end
