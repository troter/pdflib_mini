module PdflibMini
  class Item < Handle
    def initialize(item, p)
      super(item)
      @p = p
    end

    # 14.3 Tagged PDF
    # end_item(int id)
    def end_item
      @p.end_item(self)
    end

    # 14.3 Tagged PDF
    # activate_item(int id)
    def activate_item
      @p.activate_item(self)
    end
  end
end
