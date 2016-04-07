module PdflibMini
  module Info
    # 4.1 Font Handling
    # Table4.5 Keywords and options for PDF_info_font()
    INFO_KEYWORD_TABLE_4_5 = [
      ['ascender', :raw],
      ['capheight', :raw],
      ['cid', :raw],
      ['cidfont', :raw], # TODO boolean
      ['code', :raw],
      ['codepage', :raw], # TODO three-valued logic
      ['codepagelist', :raw],
      ['checkcolorspace', :raw], # TODO boolean
      ['descender', :raw],
      ['encoding', :string],
      ['fallbackfont', :font],
      ['familyname', :string],
      ['feature', :raw], # TODO three-valued logic
      ['featurelist', :string],
      ['fontfile', :string],
      ['fontname', :string],
      ['fontstyle', :string],
      ['fonttype', :string],
      ['glyphid', :raw],
      ['glyphname', :string],
      ['hostfont', :raw], # TODO boolean
      ['italicangle', :raw],
      ['keepnative', :raw],
      ['kerningpairs', :raw],
      ['linegap', :raw],
      ['maingid', :raw],
      ['maxcode', :raw],
      ['metricsfile', :string],
      ['maxuvsunicode', :raw],
      ['minuvsunicode', :raw],
      ['monospace', :raw], # Deprecated
      ['numcids', :raw],
      ['numglyphs', :raw],
      ['numusableglyphs', :raw],
      ['numusedglyphs', :raw],
      ['outlineformat', :string],
      ['predefcmap', :string],
      ['replacementchar', :raw],
      ['selector', :raw],
      ['selectorlist', :string],
      ['shapingsupport', :raw], # TODO boolean
      ['singfont', :raw], # TODO boolean
      ['standardfont', :raw], # TODO boolean
      ['supplement', :raw],
      ['symbolfont', :raw], # TODO boolean
      ['unicode', :raw],
      ['unicodefont', :raw],
      ['unmappedglyphs', :raw],
      ['usedglyph', :raw], # TODO boolean
      ['vertical', :raw],
      ['weight', :raw],
      ['willembed', :raw], # TODO boolean
      ['willsubset', :raw], # TODO boolean
      ['xheight', :raw],
    ]

    # 5.1 Single-Line Text with Textlines
    # Table 5.5 Keywords for PDF_info_textline()
    INFO_KEYWORD_TABLE_5_5 = [
      ['angle', :raw],
      ['ascender', :raw],
      ['capheight', :raw],
      ['descender', :raw],
      ['endx', :raw],
      ['endy', :raw],
      ['pathlength', :raw],
      ['perpendiculardirx', :raw],
      ['perpendiculardiry', :raw],
      ['replacedchars', :raw],
      ['righttoleft', :raw],
      ['scalex', :raw], # Deprecated, use fitscalex
      ['scaley', :raw], # Deprecated, use fitscaley
      ['scriptlist', :raw],
      ['startx', :raw],
      ['starty', :raw],
      ['textwidth', :raw],
      ['textheight', :raw],
      ['unknownchars', :raw],
      ['unmappedchars', :raw],
      ['wellformed', :raw], # TODO boolean
      ['writingdirx', :raw],
      ['writingdiry', :raw],
      ['xheight', :raw],
    ]

    # 5.2 Multi-Line Text with Textflows
    # Table 5.14 Keywords for PDF_info_textflow()
    INFO_KEYWORD_TABLE_5_14 = [
      ['boundingbox', :raw],
      ['boxlinecount', :raw],
      ['firstparalinecount', :raw],
      ['firstlinedist', :raw],
      ['fittext', :string],
      ['fontscale', :raw],
      ['lastfont', :font],
      ['lastfontsize', :raw],
      ['lastmark', :raw],
      ['lastlinedist', :raw],
      ['lastparalinecount', :raw],
      ['leading', :raw],
      ['leftlinex', :raw],
      ['leftliney', :raw],
      ['maxlinelength', :raw],
      ['maxliney', :raw],
      ['minlinelength', :raw],
      ['minliney', :raw],
      ['returnreason', :string],
      ['rightlinex', :raw],
      ['rightliney', :raw],
      ['split', :raw], # TODO boolean
      ['textendx', :raw],
      ['textendy', :raw],
      ['textheight', :raw],
      ['textwidth', :raw],
      ['used', :raw],
      ['x1', :raw],
      ['y1', :raw],
      ['x2', :raw],
      ['y2', :raw],
      ['x3', :raw],
      ['y3', :raw],
      ['x4', :raw],
      ['y4', :raw],
    ]

    # 5.3 Table Formatting
    # Table 5.19 Keywords for PDF_info_table()
    INFO_KEYWORD_TABLE_5_19 = [
      ['firstbodyrow', :raw],
      ['horboxgap', :raw],
      ['horshrinking', :raw],
      ['lastbodyrow', :raw],
      ['returnreason', :string],
      ['rowcount', :raw],
      ['rowsplit', :raw], # TODO boolean
      ['tableheight', :raw],
      ['tablewidth', :raw],
      ['vertboxgap', :raw],
      ['vertshrinking', :raw],
      # xvertline
      # yhorline
    ]

    # 6.1 Object Fitting
    # Table 6.3 Common keywords for querying the results of object fitting with
    # PDF_info_image(),
    # PDF_info_graphics(),
    # PDF_ info_path( ),
    # PDF_info_pdi_page( ),
    # PDF_info_table( ),
    # PDF_info_textline( )
    INFO_KEYWORD_TABLE_6_3 = [
      ['boundingbox', :raw],
      ['fitscalex', :raw],
      ['fitscaley', :raw],
      ['height', :raw],
      ['objectheight', :raw],
      ['objectwidth', :raw],
      ['width', :raw],
      ['x1', :raw],
      ['y1', :raw],
      ['x2', :raw],
      ['y2', :raw],
      ['x3', :raw],
      ['y3', :raw],
      ['x4', :raw],
      ['y4', :raw],
    ]

    # 7.6 Path Objects
    # Table 7.8 Keywords for PDF_info_path()
    INFO_KEYWORD_TABLE_7_8 = [
      ['bboxwidth', :raw],
      ['bboxheight', :raw],
      ['numpoints', :raw],
      ['px', :raw],
      ['py', :raw],
    ]

    # 9.1 Images
    # Table 9.4 Keywords for PDF_info_image()
    INFO_KEYWORD_TABLE_9_4 = [
      ['clippingpath', :path],
      ['checkcolorspace', :raw], # TODO boolean
      ['filename', :string],
      ['iccprofile', :profile],
      ['imageheight', :raw],
      ['imagemask', :image],
      ['imagetype', :string],
      ['imagewidth', :raw],
      ['infomode', :raw], # TODO boolean
      ['mirroringx', :raw],
      ['mirroringy', :raw],
      ['orientation', :raw],
      ['resx', :raw],
      ['resy', :raw],
      ['strips', :raw],
      ['transparent', :raw], # TODO boolean
      ['xid', :string],
    ]

    # 9.2 SVG Graphics
    # Table 9.8 Keywords for PDF_info_graphics()
    INFO_KEYWORD_TABLE_9_8 = [
      ['description', :string],
      ['filename', :string],
      ['fittingpossible', :raw], # TODO boolean
      ['graphicswidth', :raw],
      ['graphicsheight', :raw],
      ['istemplate', :raw], # TODO boolean
      ['metadata', :string],
      ['title', :string],
      ['type', :string],
      ['xid', :string],
    ]

    # 10.2 Page Functions
    # Table 10.4 Keywords for PDF_info_pdi_page()
    INFO_KEYWORD_TABLE_10_4 = [
      ['fittingpossible', :raw], # TODO boolean
      ['lang', :string],
      ['mirroringx', :raw],
      ['mirroringy', :raw],
      ['pageheight', :raw],
      ['pagewidth', :raw],
      ['rotate', :raw],
      ['topleveltag', :string],
      ['topleveltagcount', :raw],
      ['xid', :string],
    ]
  end
end
