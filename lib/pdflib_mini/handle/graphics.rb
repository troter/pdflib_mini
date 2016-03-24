module PdflibMini
  module Handle
    class Graphics < Base
      include PdflibMini::InfoReader

      INFO_KEYWORD = [
        PdflibMini::Info::INFO_KEYWORD_TABLE_6_3,
        PdflibMini::Info::INFO_KEYWORD_TABLE_9_8,
      ].reduce([], :+)

      INFO_KEYWORD.each do |keyword, type|
        info_reader(:info_graphics, keyword, type)
      end

      def initialize(graphics, p)
        super(graphics)
        @p = p
      end

      # 9.2 SVG Graphics
      # close_graphics(int graphics)
      def close_graphics
        @p.close_graphics(self)
      end

      # 9.2 SVG Graphics
      # fit_graphics(int graphics, float x, float y, string optlist)
      def fit_graphics(*args)
        @p.fit_graphics(self, *args)
      end

      # 9.2 SVG Graphics
      # float info_graphics(int graphics, string keyword, string optlist)
      def info_graphics(*args)
        @p.info_graphics(self, *args)
      end
    end
  end
end
