module PdflibMini
  module Handle
    class Profile < Base
      def initialize(profile, p)
        super(profile)
        @p = p
      end
    end
  end
end
