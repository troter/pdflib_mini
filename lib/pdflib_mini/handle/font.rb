module PdflibMini
  module Handle
    class Font < Base
      include PdflibMini::InfoReader

      INFO_KEYWORD = PdflibMini::Info::INFO_KEYWORD_TABLE_4_5

      INFO_KEYWORD.each do |keyword, type|
        info_reader(:info_font, keyword, type)
      end

      def initialize(font, p)
        super(font)
        @p = p
      end

      # 4.1 Font Handling
      # close_font(int font)
      def close_font
        @p.close_font(self)
      end

      # 4.1 Font Handling
      # float info_font(int font, string keyword, string optlist)
      def info_font(*args)
        @p.info_font(self, *args)
      end

      # 4.3 Simple Text Output
      # setfont(int font, float fontsize)
      def setfont(*args)
        @p.setfont(self, *args)
      end

      # 4.3 Simple Text Output
      # float stringwidth(string text, int font, float fontsize)
      def stringwidth(text, fontsize)
        @p.stringwidth(text, self, fontsize)
      end

      # 4.1 Font Handling
      # int load_font(string fontname, string encoding, string optlist)
      # close_font(int font)
      def with_load_font(*args, &block)
        @p.with_load_font(*args, &block)
      end
    end
  end
end
