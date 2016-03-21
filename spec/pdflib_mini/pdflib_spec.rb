require 'spec_helper'

describe PdflibMini::Pdflib do
  let(:pdflib) { double('pdflib-instance') }

  before do
    stub_const('PDFlib', double('PDFlib', new: pdflib))
  end

  it '#load_image' do
    expect(pdflib).to receive(:load_image).with('auto', 'sample.png', '') { 1 }

    p = PdflibMini.new
    image = p.load_image('auto', 'sample.png', '')
    expect(image).to eq 1
    expect(image).to be_a(PdflibMini::Image)
  end

  describe PdflibMini::Pdflib::UsingBlocks do
    describe '#with_begin_document' do
      it 'success' do
        expect(pdflib).to receive(:begin_document).with('output.pdf', 'begin_optlist') { 1 }
        expect(pdflib).to receive(:end_document).with('end_optlist')

        PdflibMini.new.with_begin_document('output.pdf', 'begin_optlist', 'end_optlist') do |result|
          expect(result).to eq 1
        end
      end

      it 'error' do
        expect(pdflib).to receive(:begin_document).with('output.pdf', 'begin_optlist') { -1 }

        PdflibMini.new.with_begin_document('output.pdf', 'begin_optlist', 'end_optlist') do |result|
          expect(result).to eq -1
        end
      end
    end
  end
end
