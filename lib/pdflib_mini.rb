require 'delegate'
require_relative 'pdflib_mini/info'
require_relative 'pdflib_mini/info_reader'
require_relative 'pdflib_mini/handle'
require_relative 'pdflib_mini/handle/base'
require_relative 'pdflib_mini/handle/action'
require_relative 'pdflib_mini/handle/asset'
require_relative 'pdflib_mini/handle/bookmark'
require_relative 'pdflib_mini/handle/color'
require_relative 'pdflib_mini/handle/data3d'
require_relative 'pdflib_mini/handle/data3d_view'
require_relative 'pdflib_mini/handle/folder'
require_relative 'pdflib_mini/handle/font'
require_relative 'pdflib_mini/handle/graphics'
require_relative 'pdflib_mini/handle/image'
require_relative 'pdflib_mini/handle/item'
require_relative 'pdflib_mini/handle/layer'
require_relative 'pdflib_mini/handle/path'
require_relative 'pdflib_mini/handle/pattern'
require_relative 'pdflib_mini/handle/pdf'
require_relative 'pdflib_mini/handle/pdf/document'
require_relative 'pdflib_mini/handle/pdf/page'
require_relative 'pdflib_mini/handle/profile'
require_relative 'pdflib_mini/handle/shading'
require_relative 'pdflib_mini/handle/table_cell'
require_relative 'pdflib_mini/handle/template'
require_relative 'pdflib_mini/handle/textflow'
require_relative 'pdflib_mini/handle/textline'
require_relative 'pdflib_mini/pdflib'
require_relative "pdflib_mini/version"

module PdflibMini
  def self.new
    PdflibMini::Pdflib.new(Kernel.const_get(:PDFlib).new)
  end
end

PDFlibMini = PdflibMini
