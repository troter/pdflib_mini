require 'spec_helper'

describe PdflibMini::Pdflib do
  let(:pdflib) { double('pdflib-instance') }

  before do
    stub_const('PDFlib', double('PDFlib', new: pdflib))
  end

  describe 'loader methods' do
    let(:p) { PdflibMini.new }

    it '#define_layer' do
      expect(pdflib).to receive(:define_layer).with('layer-1', '') { 1 }

      handle = p.define_layer('layer-1', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Layer)
    end

    it '#load_font' do
      expect(pdflib).to receive(:load_font).with('arialMT', 'unicode', 'enbedding') { 1 }

      handle = p.load_font('arialMT', 'unicode', 'enbedding')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Font)
    end

    it '#create_textline' do
      handle = p.create_textline('create_textline')
      expect(handle).to eq 'create_textline'
      expect(handle).to be_a(PdflibMini::Handle::Textline)
    end

    it '#add_textflow' do
      expect(pdflib).to receive(:add_textflow).with(-1, 'add_textflow', '') { 1 }

      handle = p.add_textflow(-1, 'add_textflow', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Textflow)
    end

    it '#create_textflow' do
      expect(pdflib).to receive(:create_textflow).with('add_textflow', '') { 1 }

      handle = p.create_textflow('add_textflow', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Textflow)
    end

    it '#add_table_cell' do
      expect(pdflib).to receive(:add_table_cell).with(-1, 11, 22, '') { 1 }

      handle = p.add_table_cell(-1, 11, 22, '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::TableCell)
    end

    it '#add_path_point' do
      expect(pdflib).to receive(:add_path_point).with(-1, 11, 22, 'line', '') { 1 }

      handle = p.add_path_point(-1, 11, 22, 'line', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Path)
    end

    it '#makespotcolor' do
      expect(pdflib).to receive(:makespotcolor).with('sun red') { 1 }

      handle = p.makespotcolor('sun red')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Color)
    end

    it '#load_iccprofile' do
      expect(pdflib).to receive(:load_iccprofile).with('profile', '') { 1 }

      handle = p.load_iccprofile('profile', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Profile)
    end

    it '#begin_pattern_ext' do
      expect(pdflib).to receive(:begin_pattern_ext).with(100, 200, '') { 1 }

      handle = p.begin_pattern_ext(100, 200, '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Pattern)
    end

    it '#shading_pattern' do
      expect(pdflib).to receive(:shading_pattern).with(10, '') { 1 }

      handle = p.shading_pattern(10, '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Pattern)
    end

    it '#shading' do
      expect(pdflib).to receive(:shading).with('radial', 1, 2, 3, 4, 11, 22, 33, 44, '') { 1 }

      handle = p.shading('radial', 1, 2, 3, 4, 11, 22, 33, 44, '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Shading)
    end

    it '#load_image' do
      expect(pdflib).to receive(:load_image).with('auto', 'sample.png', '') { 1 }

      handle = p.load_image('auto', 'sample.png', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Image)
    end

    it '#load_graphics' do
      expect(pdflib).to receive(:load_graphics).with('svg', 'sample.svg', '') { 1 }

      handle = p.load_graphics('svg', 'sample.svg', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Graphics)
    end

    it '#begin_template_ext' do
      expect(pdflib).to receive(:begin_template_ext).with(10, 20, '') { 1 }

      handle = p.begin_template_ext(10, 20, '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Template)
    end

    it '#open_pdi_document' do
      expect(pdflib).to receive(:open_pdi_document).with('sample.pdf', '') { 1 }

      handle = p.open_pdi_document('sample.pdf', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Pdf::Document)
    end

    it '#open_pdi_page' do
      expect(pdflib).to receive(:open_pdi_page).with(10, 1, '') { 1 }

      handle = p.open_pdi_page(10, 1, '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Pdf::Page)
    end

    it '#create_bookmark' do
      expect(pdflib).to receive(:create_bookmark).with('create_bookmark', '') { 1 }

      handle = p.create_bookmark('create_bookmark', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Bookmark)
    end

    it '#create_action' do
      expect(pdflib).to receive(:create_action).with('GoTo', '') { 1 }

      handle = p.create_action('GoTo', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Action)
    end

    it '#add_portfolio_folder' do
      expect(pdflib).to receive(:add_portfolio_folder).with(10, 'folder', '') { 1 }

      handle = p.add_portfolio_folder(10, 'folder', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Folder)
    end

    it '#root_portfolio_folder' do
      handle = p.root_portfolio_folder
      expect(handle).to eq -1
      expect(handle).to be_a(PdflibMini::Handle::Folder)
    end

    it '#load_3ddata' do
      expect(pdflib).to receive(:load_3ddata).with('3ddata', '') { 1 }

      handle = p.load_3ddata('3ddata', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Data3d)
    end

    it '#create_3dview' do
      expect(pdflib).to receive(:create_3dview).with('user', '') { 1 }

      handle = p.create_3dview('user', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Data3dView)
    end

    it '#load_asset' do
      expect(pdflib).to receive(:load_asset).with('Flash', 'sample.swf', '') { 1 }

      handle = p.load_asset('Flash', 'sample.swf', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Asset)
    end

    it '#begin_item' do
      expect(pdflib).to receive(:begin_item).with('tagname', '') { 1 }

      handle = p.begin_item('tagname', '')
      expect(handle).to eq 1
      expect(handle).to be_a(PdflibMini::Handle::Item)
    end
  end

  describe 'block methods' do
    describe '#begin_document' do
      it 'success' do
        expect(pdflib).to receive(:begin_document).with('output.pdf', 'begin_optlist') { 1 }
        expect(pdflib).to receive(:end_document).with('end_optlist')

        PdflibMini.new.begin_document('output.pdf', 'begin_optlist', 'end_optlist') do |result|
          expect(result).to eq 1
        end
      end

      it 'error' do
        expect(pdflib).to receive(:begin_document).with('output.pdf', 'begin_optlist') { -1 }

        PdflibMini.new.begin_document('output.pdf', 'begin_optlist', 'end_optlist') do |result|
          expect(result).to eq -1
        end
      end
    end

    describe '#open_pdi_document' do
      it 'success' do
        expect(pdflib).to receive(:open_pdi_document).with('input.pdf', 'optlist') { 1 }
        expect(pdflib).to receive(:close_pdi_document)

        PdflibMini.new.open_pdi_document('input.pdf', 'optlist') do |doc|
          expect(doc).to eq 1
        end
      end

      it 'error' do
        expect(pdflib).to receive(:open_pdi_document).with('input.pdf', 'optlist') { -1 }

        PdflibMini.new.open_pdi_document('input.pdf', 'optlist') do |doc|
          expect(doc).to eq -1
        end
      end
    end
  end
end
