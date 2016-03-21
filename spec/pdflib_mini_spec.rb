require 'spec_helper'

describe PdflibMini do
  it 'has a version number' do
    expect(PdflibMini::VERSION).not_to be nil
  end

  it '.new' do
    stub_const('PDFlib', double('PDFlib', new: double('pdflib-instance')))
    PdflibMini.new
  end
end
