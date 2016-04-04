module PdflibMini
  class Pdflib < SimpleDelegator
    def initialize(p)
      super p
    end

    # 3.4 Layers
    # int define_layer(string name, string optlist)
    def define_layer(*args)
      Handle::Layer.create(super(*args), self)
    end

    # 4.1 Font Handling
    # int load_font(string fontname, string encoding, string optlist)
    def load_font(*args)
      Handle::Font.create(super(*args), self)
    end

    # 5.1 Single-Line Text with Textlines
    # pseudo
    def create_textline(text)
      Handle::Textline.create(text, self)
    end

    # 5.2 Multi-Line Text with Textflows
    # int add_textflow(int textflow, string text, string optlist)
    def add_textflow(*args)
      Handle::Textflow.create(super(*args), self)
    end

    # 5.2 Multi-Line Text with Textflows
    # int create_textflow(string text, string optlist)
    def create_textflow(*args)
      Handle::Textflow.create(super(*args), self)
    end

    # 5.3 Table Formatting
    # int add_table_cell(int table, int column, int row, string text, string optlist)
    def add_table_cell(*args)
      Handle::TableCell.create(super(*args), self)
    end

    # 7.2 Graphics State
    # int create_gstate(string optlist)
    def create_gstate(*args)
      Handle::GraphicsState.create(super(*args), self)
    end

    # 7.6 Path Objects
    # int add_path_point(int path, float x, float y, string type, string optlist)
    def add_path_point(*args)
      Handle::Path.create(super(*args), self)
    end

    # 8.1 Setting Color
    # int makespotcolor(string spotname)
    def makespotcolor(*args)
      Handle::Color.create(super(*args), self)
    end

    # 8.2 ICC Profiles
    # int load_iccprofile(string profilename, string optlist)
    def load_iccprofile(*args)
      Handle::Profile.create(super(*args), self)
    end

    # 8.3 Patterns and Shadings
    # int begin_pattern_ext(float width, float height, string optlist)
    def begin_pattern_ext(*args)
      Handle::Pattern.create(super(*args), self)
    end

    # 8.3 Patterns and Shadings
    # int shading_pattern(int shading, string optlist)
    def shading_pattern(*args)
      Handle::Pattern.create(super(*args), self)
    end

    # 8.3 Patterns and Shadings
    # int shading(string shtype, float x0, float y0, float x1, float y1, float c1, float c2, float c3, float c4, string optlist)
    def shading(*args)
      Handle::Shading.create(super(*args), self)
    end

    # 9.1 Images
    # int load_image(string imagetype, string filename, string optlist)
    def load_image(*args)
      Handle::Image.create(super(*args), self)
    end

    # 9.2 SVG Graphics
    # int load_graphics(string type, string filename, string optlist)
    def load_graphics(*args)
      Handle::Graphics.create(super(*args), self)
    end

    # 9.3 Templates
    # int begin_template_ext(float width, float height, string optlist)
    def begin_template_ext(*args)
      Handle::Template.create(super(*args), self)
    end

    # 10.1 Document Functions
    # int open_pdi_document(string filename, string optlist)
    def open_pdi_document(*args)
      Handle::Pdf::Document.create(super(*args), self, args.first)
    end

    # 10.2 Page Functions
    # int open_pdi_page(int doc, int pagenumber, string optlist)
    def open_pdi_page(*args)
      Handle::Pdf::Page.create(super(*args), args.first, self)
    end

    # 12.1 Bookmarks
    # int create_bookmark(string text, string optlist)
    def create_bookmark(*args)
      Handle::Bookmark.create(super(*args), self)
    end

    # 12.2 Annotations
    # create_annotation(float llx, float lly, float urx, float ury, string type, string optlist)

    # 12.3 Form Fields
    # create_field(float llx, float lly, float urx, float ury, string name, string type, string optlist)

    # 12.3 Form Fields
    # create_fieldgroup(string name, string optlist)

    # 12.4 Actions
    # int create_action(string type, string optlist)
    def create_action(*args)
      Handle::Action.create(super(*args), self)
    end

    # 12.5 Named Destinations
    # add_nameddest(string name, string optlist)

    # 12.6 PDF Packages and Portfolios
    # int add_portfolio_folder(int parent, string foldername, string optlist)
    def add_portfolio_folder(*args)
      Handle::Folder.create(super(*args), self)
    end

    # pseudo
    def root_portfolio_folder
      Handle::Folder.new(-1, self)
    end

    # 13.1 3D Artwork
    # int load_3ddata(string filename, string optlist)
    def load_3ddata(*args)
      Handle::Data3d.create(super(*args), self)
    end

    # 13.1 3D Artwork
    # int create_3dview(string username, string optlist)
    def create_3dview(*args)
      Handle::Data3dView.create(super(*args), self)
    end

    # 13.2 Asset and Rich Media Features (Flash)
    # int load_asset(string type, string filename, string optlist)
    def load_asset(*args)
      Handle::Asset.create(super(*args), self)
    end

    # 14.3 Tagged PDF
    # int begin_item(string tagname, string optlist)
    def begin_item(*args)
      Handle::Item.create(super(*args), self)
    end

    # 14.4 Marked Content
    # begin_mc(string tagname, string optlist)

    # 14.5 Document Part Hierarchy
    # begin_dpart(string optlist)

    module UsingBlocks
      # 3.1 Document Functions
      # int begin_document(string filename, string optlist)
      # end_document(string optlist)
      def with_begin_document(filename, begin_optlist, end_optlist = '', &block)
        result = begin_document(filename, begin_optlist)
        block.call(result, self)
        end_document(end_optlist) if result != -1
      end

      # 3.3 Page Functions
      # begin_page_ext(float width, float height, string optlist)
      # end_page_ext(string optlist)
      def with_begin_page_ext(width, height, begin_optlist, end_optlist = '', &block)
        begin_page_ext(width, height, begin_optlist)
        block.call(self)
        end_page_ext(end_optlist)
      end

      # 3.4 Layers
      # begin_layer(int layer)
      # end_layer( )
      def with_begin_layer(layer, &block)
        begin_layer(layer)
        block.call(self)
        end_layer
      end

      # 4.1 Font Handling
      # int load_font(string fontname, string encoding, string optlist)
      # close_font(int font)
      def with_load_font(*args, &block)
        font = load_font(*args)
        block.call(font, self)
        font.close_font if font != -1
      end

      # 4.4 User-defined (Type 3) Fonts
      # begin_font(String fontname, double a, double b, double c, double d, double e, double f, String optlist)
      # end_font( )
      def with_begin_font(*args, &block)
        begin_font(*args)
        block.call(self)
        end_font
      end

      # 4.4 User-defined (Type 3) Fonts
      # begin_glyph_ext(int uv, string optlist)
      # end_glyph( )
      def with_begin_glyph_ext(*args, &block)
        begin_glyph_ext(*args)
        block.call(self)
        end_glyph
      end

      # 5.2 Multi-Line Text with Textflow
      # int create_textflow(string text, string optlist)
      # delete_textflow(int textflow)
      def with_create_textflow(*args, &block)
        textflow = create_textflow(*args)
        block.call(textflow, self)
        textflow.delete_textflow if textflow != -1
      end

      # 5.3 Table Formatting
      # int add_table_cell(int table, int column, int row, string text, string optlist)
      # delete_table(int table, string optlist)
      def with_add_table_cell(table, column, row, text, add_optlist, delete_optlist = '', &block)
        table = create_table_cell(table, column, row, text, add_optlist)
        block.call(table, self)
        table.delete_table(delete_optlist) if table != -1
      end

      # 7.6 Path Objects
      # int add_path_point(int path, float x, float y, string type, string optlist)
      # delete_path(int path)
      def with_add_path_point(*args, &block)
        path = add_path_point(*args)
        block.call(path, self)
        path.delete_path if path != -1
      end

      # 9.3 Templates
      # int begin_template_ext(float width, float height, string optlist)
      # end_template_ext(float width, float height)
      def with_begin_template_ext(*args, &block)
        template = begin_template_ext(*args)
        block.call(self)
        template.end_template_ext(0, 0) if template != -1
      end

      # 10.1 Document Functions
      # int open_pdi_document(string filename, string optlist)
      # close_pdi_document(int doc)
      def with_open_pdi_document(*args, &block)
        doc = open_pdi_document(*args)
        block.call(doc, self)
        doc.close_pdi_document if doc != -1
      end

      # 10.2 Page Functions
      # int open_pdi_page(int doc, int pagenumber, string optlist)
      # close_pdi_page(int page)
      def with_open_pdi_page(*args, &block)
        page = open_pdi_page(*args)
        block.call(page, args.first, self)
        page.close_pdi_page if page != -1
      end

      # 14.3 Tagged PDF
      # int begin_item(string tagname, string optlist)
      # end_item(int id)
      def with_begin_item(*args, &block)
        item = begin_item(*args)
        block.call(item, self)
        item.end_item if item != -1
      end

      # 14.4 Marked Content
      # begin_mc(string tagname, string optlist)
      # end_mc( )
      def with_begin_mc(*args, &block)
        begin_mc(*args)
        block.call(self)
        end_mc
      end

      # 14.5 Document Part Hierarchy
      # begin_dpart(string optlist)
      # end_dpart(string optlist)
      def with_begin_dpart(begin_optlist, end_optlist = '', &block)
        begin_dpart(begin_optlist)
        block.call(self)
        end_dpart(end_optlist)
      end
    end

    include UsingBlocks
  end
end
