module PdflibMini
  module Handle
    class TableCell < Base
      include PdflibMini::InfoReader

      INFO_KEYWORD = [
        PdflibMini::Info::INFO_KEYWORD_TABLE_5_19,
        PdflibMini::Info::INFO_KEYWORD_TABLE_6_3,
      ].reduce([], :+)

      INFO_KEYWORD.each do |keyword, type|
        info_reader(:info_table, keyword, type)
      end

      def initialize(table_cell, p)
        super(table_cell)
        @p = p
      end

      # 5.3 Table Formatting
      # string fit_table(int table, float llx, float lly, float urx, float ury, string optlist)
      def fit_table(*args)
        @p.fit_table(self, *args)
      end

      # 5.3 Table Formatting
      # float info_table(int table, string keyword)
      def info_table(keyword, _)
        @p.info_table(keyword)
      end

      # 5.3 Table Formatting
      # delete_table(int table, string optlist)
      def delete_table(*args)
        @p.delete_table(self, *args)
      end
    end
  end
end
