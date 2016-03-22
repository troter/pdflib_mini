module PdflibMini
  module Handle
    class Textline < Base
      include PdflibMini::InfoReader

      INFO_KEYWORD = [
        PdflibMini::Info::INFO_KEYWORD_TABLE_5_5,
        PdflibMini::Info::INFO_KEYWORD_TABLE_6_3,
      ].reduce([], :+)

      INFO_KEYWORD.each do |keyword, type|
        info_reader(:info_textline, keyword, type)
      end

      def initialize(text, p)
        super(text)
        @p = p
      end

      # 5.1 Single-Line Text with Textlines
      # fit_textline(string text, float x, float y, string optlist)
      def fit_textline(*args)
        @p.fit_textline(self, *args)
      end

      # 5.1 Single-Line Text with Textlines
      # float info_textline(string text, string keyword, string optlist)
      def info_textline(*args)
        @p.info_textline(self, *args)
      end
    end
  end
end
