module PdflibMini
  class Bookmark < Handle
    def initialize(bookmark, p)
      super(bookmark)
      @p = p
    end
  end
end
