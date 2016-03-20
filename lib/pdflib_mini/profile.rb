module PdflibMini
  class Profile < Handle
    def initialize(profile, p)
      super(profile)
      @p = p
    end
  end
end
