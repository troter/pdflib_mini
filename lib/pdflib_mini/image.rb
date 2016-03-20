module PdflibMini
  class Image < Handle
    include PdflibMini::InfoReader

    INFO_KEYWORD = [
      PdflibMini::Info::INFO_KEYWORD_TABLE_6_3,
      PdflibMini::Info::INFO_KEYWORD_TABLE_9_4,
    ].reduce([], :+)

    INFO_KEYWORD.each do |keyword, type|
      info_reader(:info_image, keyword, type)
    end

    def initialize(image, p)
      super(image)
      @p = p
    end

    # 9.1 Images
    # close_image(int image)
    def close_image
      @p.close_image(self)
    end

    # 9.1 Images
    # fit_image(int image, float x, float y, string optlist)
    def fit_image(*args)
      @p.fit_image(self, *args)
    end

    # 9.1 Images
    # float info_image(int image, string keyword, string optlist)
    def info_image(*args)
      @p.info_image(self, *args)
    end
  end
end
