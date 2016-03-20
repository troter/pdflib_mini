module PdflibMini
  module Pdf
    class Page < Handle
      include PdflibMini::InfoReader

      INFO_KEYWORD = [
        PdflibMini::Info::INFO_KEYWORD_TABLE_6_3,
        PdflibMini::Info::INFO_KEYWORD_TABLE_10_4,
      ].reduce([], :+)

      INFO_KEYWORD.each do |keyword, type|
        info_reader(:info_pdi_page, keyword, type)
      end

      def initialize(page, doc, p)
        super(page)
        @doc = doc
        @p = p
      end

      # 10.2 Page Functions
      # close_pdi_page(int page)
      def close_pdi_page
        @p.close_pdi_page(self)
      end

      # 10.2 Page Functions
      # fit_pdi_page(int page, float x, float y, string optlist)
      def fit_pdi_page(x, y, optlist)
        @p.fit_pdi_page(self, x, y, optlist)
      end

      # 10.2 Page Functions
      # float info_pdi_page(int page, string keyword, string optlist)
      def info_pdi_page(keyword, optlist)
        @p.info_pdi_page(self, keyword, optlist)
      end

      # 10.3 Other PDI Processing
      # int process_pdi(int doc, int page, string optlist)
      def process_pdi(*args)
        @doc.process_pdi(self, *args)
      end

      # 11.2 Textline and Textflow Blocks
      # int fill_textblock(int page, string blockname, string text, string optlist)
      def fill_textblock(*args)
        @p.fill_textblock(self, *args)
      end

      # 11.3 Image Blocks
      # int fill_imageblock(int page, string blockname, int image, string optlist)
      def fill_imageblock(*args)
        @p.fill_imageblock(self, *args)
      end

      # 11.4 PDF Blocks
      # int fill_pdfblock(int page, string blockname, int contents, string optlist)
      def fill_pdfblock(*args)
        @p.fill_pdfblock(self, *args)
      end

      # 11.5 Graphics Blocks
      # int fill_graphicsblock(int page, string blockname, int contents, string optlist)
      def fill_graphicsblock(*args)
        @p.fill_graphicsblock(self, *args)
      end
    end
  end
end
