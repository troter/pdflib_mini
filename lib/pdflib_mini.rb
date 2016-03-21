require 'delegate'
require_relative 'pdflib_mini/info'
require_relative 'pdflib_mini/info_reader'
require_relative 'pdflib_mini/handle'
require_relative 'pdflib_mini/action'
require_relative 'pdflib_mini/asset'
require_relative 'pdflib_mini/bookmark'
require_relative 'pdflib_mini/color'
require_relative 'pdflib_mini/data3d'
require_relative 'pdflib_mini/data3d_view'
require_relative 'pdflib_mini/folder'
require_relative 'pdflib_mini/font'
require_relative 'pdflib_mini/graphics'
require_relative 'pdflib_mini/image'
require_relative 'pdflib_mini/item'
require_relative 'pdflib_mini/layer'
require_relative 'pdflib_mini/path'
require_relative 'pdflib_mini/pattern'
require_relative 'pdflib_mini/pdf'
require_relative 'pdflib_mini/pdf/document'
require_relative 'pdflib_mini/pdf/page'
require_relative 'pdflib_mini/profile'
require_relative 'pdflib_mini/sharding'
require_relative 'pdflib_mini/table_cell'
require_relative 'pdflib_mini/template'
require_relative 'pdflib_mini/textflow'
require_relative 'pdflib_mini/textline'
require_relative 'pdflib_mini/pdflib'
require_relative "pdflib_mini/version"

module PdflibMini
  def self.new
    PdflibMini::Pdflib.new(Kernel.const_get(:PDFlib).new)
  end
end

PDFlibMini = PdflibMini
