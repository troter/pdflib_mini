module PdflibMini
  module Handle
    module Pdf
      class Document < Base
        attr_reader :filename

        def initialize(doc, p, filename)
          super(doc)
          @p = p
          @filename = filename
        end

        # 10.1 Document Functions
        # close_pdi_document(int doc)
        def close_pdi_document
          @p.close_pdi_document(self)
        end

        # 10.2 Page Functions
        # int open_pdi_page(int doc, int pagenumber, string optlist)
        def open_pdi_page(*args, &block)
          @p.open_pdi_page(self, *args, &block)
        end

        # 10.3 Other PDI Processing
        # int process_pdi(int doc, int page, string optlist)
        def process_pdi(*args)
          @p.process_pdi(self, *args)
        end

        # 10.4 pCOS Functions
        # double pcos_get_number(long doc, string path)
        def pcos_get_number(*args)
          @p.pcos_get_number(self, *args)
        end

        # 10.4 pCOS Functions
        # string pcos_get_string(long doc, string path)
        def pcos_get_string(*args)
          @p.pcos_get_string(self, *args)
        end

        # 10.4 pCOS Functions
        # string pcos_get_stream(long doc, string optlist, string path)
        def pcos_get_stream(*args)
          @p.pcos_get_stream(self, *args)
        end
      end
    end
  end
end
