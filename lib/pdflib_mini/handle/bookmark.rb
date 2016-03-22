module PdflibMini
  module Handle
    class Bookmark < Base
      def initialize(bookmark, p)
        super(bookmark)
        @p = p
      end
    end
  end
end
