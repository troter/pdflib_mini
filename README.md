# PdflibMini

[![Gem Version](https://badge.fury.io/rb/pdflib_mini.svg)](http://badge.fury.io/rb/pdflib_mini)
[![Build Status](https://travis-ci.org/troter/pdflib_mini.svg?branch=master)](https://travis-ci.org/troter/pdflib_mini)
[![Coverage Status](https://coveralls.io/repos/troter/pdflib_mini/badge.svg)](https://coveralls.io/r/troter/pdflib_mini)
[![Code Climate](https://codeclimate.com/github/troter/pdflib_mini/badges/gpa.svg)](https://codeclimate.com/github/troter/pdflib_mini)

PdflibMini is a mini wrapper for PDFlib. this provides useful methods and some extension point.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdflib_mini'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pdflib_mini

## Usage

Require PDFlib and this gem, and replace PDFlib by PDFlibMini.

```ruby
require './PDFlib'
require 'pdflib_mini'

# p = PDFlib.new
p = PDFlibMini.new
```

PdflibMini does not break the interface of PDFlib.

## Handle object

PdflibMini returns a handle object that wrapping PDFlib's handle in most cases.

```ruby
p = PDFlilbMini.new
p.load_font("Helvetica", "unicode", '').class # => PdflibMini::Handle::Font
p.load_image('auto', imagefile, '').class     # => PdflibMini::Handle::Image
p.open_pdi_document(infile, '').class         # => PdflibMini::Handle::Pdf::Document
```

### Easy access to information for handle object

Handle object has reader methods there easy access to information for itself.

```ruby
# raw (float) values
doc = p.open_pdi_document(infile, '')
page = doc.open_pdi_page(1, '')
page.pagewidth
page.pageheight

# string values
image = p.load_image('auto', imagefile, '')
image.filename
image.imagetype

font = p.load_font('Helvetica', 'unicode', '')
font.feature('name=liga')
font.featurelist

# handle object
font.clippingpath            # PdflibMini::Handle::Path instance

# conversion
font.clippingpath(as: :path) # PdflibMini::Handle::Path instance
font.clippingpath(as: :raw)  # float (PDFlib's handle)
image.imagetype              # string
image.imagetype(as: :raw)    # float (PDFlib's string index)
```

### Handle specific methods.

Handle object has some method like `fit_xxx`, `info_xxx`, and `fit_xxxblock`.

```ruby
doc = p.open_pdi_document(infile, '')
page = doc.open_pdi_page(1, '')
page.fit_pdi_page(0, 0, '')

image = p.load_image('auto', imagefile, '')
image.info_image('imagewidth', '')
```

### Extension point

Handle object is not singleton. it can be easily extended.

```ruby
image = p.load_image('auto', imagefile, '')

module ImagePathname
  def filename(*args)
    Pathname(super(*args))
  end
end

# extend each instance
image.extend ImagePathname

# or prepend module
module PdflibMini
  module Handle
    class Image
      prepend ImagePathname
    end
  end
end

image.filename.expand_path
```

## Using blocks for scope management

Passing blocks to begin_xxx, open_xxx, and some other methods.

```ruby
p = PDFlilbMini.new
p.begin_document(outfile, '') do |result|
  fail if result == -1
  p.open_pdi_document(infile, '') do |indoc|
    fail if indoc == -1
    indoc.open_pdi_page(1, '') do |inpage|
      fail if (inpage == -1)
      p.begin_page_ext(10, 10, '') do
        inpage.fit_pdi_page(0, 0, '')
      end
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/troter/pdflib_mini. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

