module PdflibMini
  module Handle
    class Textflow < Base
      include PdflibMini::InfoReader

      INFO_KEYWORD = PdflibMini::Info::INFO_KEYWORD_TABLE_5_14

      INFO_KEYWORD.each do |keyword, type|
        info_reader(:info_textflow, keyword, type)
      end

      def initialize(textflow, p)
        super(textflow)
        @p = p
      end

      # 5.2 Multi-Line Text with Textflows
      # int add_textflow(int textflow, string text, string optlist)
      def add_textflow(*args)
        @p.add_textflow(self, *args)
      end

      # 5.2 Multi-Line Text with Textflows
      # string fit_textflow(int textflow, float llx, float lly, float urx, float ury, string optlist)
      def fit_textflow(*args)
        @p.fit_textflow(self, *args)
      end

      # 5.2 Multi-Line Text with Textflows
      # float info_textflow(int textflow, string keyword)
      def info_textflow(keyword, _)
        @p.info_textflow(self, keyword)
      end

      # 5.2 Multi-Line Text with Textflow
      # delete_textflow(int textflow)
      def delete_textflow
      @p.delete_textflow(self)
      end
    end
  end
end
