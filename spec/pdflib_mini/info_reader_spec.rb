require 'spec_helper'

describe PdflibMini::InfoReader do
  let(:pdflib) { double('pdflib-instance') }
  let(:p) { PdflibMini.new }

  before do
    stub_const('PDFlib', double('PDFlib', new: pdflib))
  end

  shared_context 'image' do
    let(:image) { p.load_image('auto', 'sample.png', '') }

    before do
      expect(pdflib).to receive(:load_image).with('auto', 'sample.png', '') { 1 }
    end
  end

  shared_context 'font' do
    let(:font) { p.load_font('arielMT', 'unicode', 'embedding') }

    before do
      expect(pdflib).to receive(:load_font).with('arielMT', 'unicode', 'embedding') { 2 }
    end
  end

  describe '.info_reader' do
    context 'Image' do
      include_context 'image'

      before do
        allow(pdflib).to receive(:info_image).with(image, 'imagewidth', '') { 100.0 }
        allow(pdflib).to receive(:info_image).with(image, 'filename', '') { 1.0 }
        allow(pdflib).to receive(:info_image).with(image, 'clippingpath', '') { 2.0 }
        allow(pdflib).to receive(:get_string).with(1, '') { '/tmp/sample.png' }
      end

      it '#imagewidth' do
        expect(image.imagewidth).to eq 100.0
        expect(image.imagewidth('')).to eq 100.0
        expect(image.imagewidth('', as: :raw)).to eq 100.0
        expect(image.imagewidth(as: :raw)).to eq 100.0
      end

      it '#filename' do
        filenames = [
          image.filename,
          image.filename(''),
          image.filename(as: :string),
          image.filename('', as: :string),
        ]
        expect(filenames).to all(eq('/tmp/sample.png'))
        expect(image.filename(as: :raw)).to eq 1.0
      end

      it '#clippingpath' do
        clippingpaths = [
          image.clippingpath,
          image.clippingpath(''),
          image.clippingpath(as: :path),
          image.clippingpath('', as: :path),
        ]
        expect(clippingpaths).to all(be_a(PdflibMini::Handle::Path))
        expect(image.clippingpath(as: :raw)).to eq 2.0
      end
    end

    context 'Font' do
      include_context 'font'

      before do
        allow(pdflib).to receive(:info_font).with(font, 'feature', 'name=ital') { -1 }
      end

      it '#feature' do
        expect(font.feature('name=ital')).to eq -1
      end
    end
  end
end
