module PdflibMini
  module Handle
    class Path < Base
      include PdflibMini::InfoReader

      INFO_KEYWORD = [
        PdflibMini::Info::INFO_KEYWORD_TABLE_6_3,
        PdflibMini::Info::INFO_KEYWORD_TABLE_7_8,
      ].reduce([], :+)

      INFO_KEYWORD.each do |keyword, type|
        info_reader(:info_path, keyword, type)
      end

      def initialize(path, p)
        super(path)
        @p = p
      end

      # 7.6 Path Objects
      # int add_path_point(int path, float x, float y, string type, string optlist)
      def add_path_point(*args)
        @p.add_path_point(self, *args)
      end

      # 7.6 Path Objects
      # draw_path(int path, float x, float y, string optlist)
      def draw_path(*args)
        @p.draw_path(self, *args)
      end

      # 7.6 Path Objects
      # float info_path(int path, string keyword, string optlist)
      def info_path(*args)
        @p.info_path(self, *args)
      end

      # 7.6 Path Objects
      # delete_path(int path)
      def delete_path
        @p.delete_path(self)
      end
    end
  end
end
