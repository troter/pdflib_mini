module PdflibMini
  class Pdflib < SimpleDelegator
    def initialize(p)
      super p
    end

    # 3.1 Document Functions
    # int begin_document(string filename, string optlist)
    # end_document(string optlist)
    def begin_document(filename, begin_optlist, end_optlist = '', &block)
      super(filename, begin_optlist).tap do |result|
        if block_given?
          block.call(result, self)
          end_document(end_optlist) if result != -1
        end
      end
    end

    # 3.3 Page Functions
    # begin_page_ext(float width, float height, string optlist)
    # end_page_ext(string optlist)
    def begin_page_ext(width, height, begin_optlist, end_optlist = '', &block)
      super(width, height, begin_optlist).tap do
        if block_given?
          block.call(self)
          end_page_ext(end_optlist)
        end
      end
    end

    # 3.4 Layers
    # int define_layer(string name, string optlist)
    def define_layer(*args)
      Handle::Layer.create(super(*args), self)
    end

    # 3.4 Layers
    # begin_layer(int layer)
    # end_layer( )
    def begin_layer(layer, &block)
      super(layer).tap do
        if block_given?
          block.call(self)
          end_layer
        end
      end
    end

    # 4.1 Font Handling
    # int load_font(string fontname, string encoding, string optlist)
    # close_font(int font)
    def load_font(*args, &block)
      Handle::Font.create(super(*args), self).tap do |font|
        if block_given?
          block.call(font, self)
          font.close_font if font != -1
        end
      end
    end

    # 4.4 User-defined (Type 3) Fonts
    # begin_font(String fontname, double a, double b, double c, double d, double e, double f, String optlist)
    # end_font( )
    def begin_font(*args, &block)
      super(*args).tap do
        if block_given?
          block.call(self)
          end_font
        end
      end
    end

    # 4.4 User-defined (Type 3) Fonts
    # begin_glyph_ext(int uv, string optlist)
    # end_glyph( )
    def begin_glyph_ext(*args, &block)
      super(*args).tap do
        if block_given?
          block.call(self)
          end_glyph
        end
      end
    end

    # 5.1 Single-Line Text with Textlines
    # pseudo
    def create_textline(text)
      Handle::Textline.create(text, self)
    end

    # 5.2 Multi-Line Text with Textflows
    # int add_textflow(int textflow, string text, string optlist)
    # delete_textflow(int textflow)
    def add_textflow(*args, &block)
      Handle::Textflow.create(super(*args), self).tap do |textflow|
        if block_given?
          block.call(textflow, self)
          textflow.delete_textflow if textflow != -1
        end
      end
    end

    # 5.2 Multi-Line Text with Textflows
    # int create_textflow(string text, string optlist)
    # delete_textflow(int textflow)
    def create_textflow(*args, &block)
      Handle::Textflow.create(super(*args), self).tap do |textflow|
        if block_given?
          block.call(textflow, self)
          textflow.delete_textflow if textflow != -1
        end
      end
    end

    # 5.3 Table Formatting
    # int add_table_cell(int table, int column, int row, string text, string optlist)
    # delete_table(int table, string optlist)
    def add_table_cell(table, column, row, text, create_optlist, delete_optlist = '', &block)
      Handle::TableCell.create(super(table, column, row, text, create_optlist), self).tap do |table_cell|
        if block_given?
          block.call(table_cell, self)
          table_cell.delete_table(delete_optlist) if table_cell != -1
        end
      end
    end

    # 7.2 Graphics State
    # int create_gstate(string optlist)
    def create_gstate(*args)
      Handle::GraphicsState.create(super(*args), self)
    end

    # 7.2 Graphics State
    # save( )
    # restore( )
    def save(&block)
      super.tap do
        if block_given?
          block.call(self)
          restore
        end
      end
    end

    # 7.3 Coordinate System Transformations
    # translate(float tx, float ty)
    def translate(*args, &block)
      if block_given?
        save do
          super(*args)
          block.call
        end
      else
        super(*args)
      end
    end

    # 7.3 Coordinate System Transformations
    # scale(float sx, float sy)
    def scale(*args, &block)
      if block_given?
        save do
          super(*args)
          block.call
        end
      else
        super(*args)
      end
    end

    # 7.3 Coordinate System Transformations
    # rotate(float phi)
    def rotate(*args, &block)
      if block_given?
        save do
          super(*args)
          block.call
        end
      else
        super(*args)
      end
    end

    # 7.3 Coordinate System Transformations
    # align(float dx, float dy)
    def align(*args, &block)
      if block_given?
        save do
          super(*args)
          block.call
        end
      else
        super(*args)
      end
    end

    # 7.3 Coordinate System Transformations
    # skew(float alpha, float beta)
    def skew(*args, &block)
      if block_given?
        save do
          super(*args)
          block.call
        end
      else
        super(*args)
      end
    end

    # 7.3 Coordinate System Transformations
    # concat(float a, float b, float c, float d, float e, float f)
    def concat(*args, &block)
      if block_given?
        save do
          super(*args)
          block.call
        end
      else
        super(*args)
      end
    end

    # 7.3 Coordinate System Transformations
    # setmatrix(float a, float b, float c, float d, float e, float f)
    def setmatrix(*args, &block)
      if block_given?
        save do
          super(*args)
          block.call
        end
      else
        super(*args)
      end
    end

    # 7.6 Path Objects
    # int add_path_point(int path, float x, float y, string type, string optlist)
    # delete_path(int path)
    def add_path_point(*args, &block)
      Handle::Path.create(super(*args), self).tap do |path|
        if block_given?
          block.call(path, self)
          path.delete_path if path != -1
        end
      end
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
    # end_template_ext(float width, float height)
    def begin_template_ext(*args, &block)
      Handle::Template.create(super(*args), self).tap do |template|
        if block_given?
          block.call(self)
          template.end_template_ext(0, 0) if template != -1
        end
      end
    end

    # 10.1 Document Functions
    # int open_pdi_document(string filename, string optlist)
    # close_pdi_document(int doc)
    def open_pdi_document(*args, &block)
      Handle::Pdf::Document.create(super(*args), self, args.first).tap do |doc|
        if block_given?
          block.call(doc, self)
          doc.close_pdi_document if doc != -1
        end
      end
    end

    # 10.2 Page Functions
    # int open_pdi_page(int doc, int pagenumber, string optlist)
    # close_pdi_page(int page)
    def open_pdi_page(*args, &block)
      Handle::Pdf::Page.create(super(*args), args.first, self).tap do |page|
        if block_given?
          block.call(page, args.first, self)
          page.close_pdi_page if page != -1
        end
      end
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
    # end_item(int id)
    def begin_item(*args, &block)
      Handle::Item.create(super(*args), self).tap do |item|
        if block_given?
          block.call(item, self)
          item.end_item if item != -1
        end
      end
    end

    # 14.4 Marked Content
    # begin_mc(string tagname, string optlist)
    # end_mc( )
    def begin_mc(*args, &block)
      super(*args).tap do
        if block_given?
          block.call(self)
          end_mc
        end
      end
    end

    # 14.5 Document Part Hierarchy
    # begin_dpart(string optlist)
    # end_dpart(string optlist)
    def begin_dpart(begin_optlist, end_optlist = '', &block)
      super(begin_optlist).tap do
        if block_given?
          block.call(self)
          end_dpart(end_optlist)
        end
      end
    end
  end
end
