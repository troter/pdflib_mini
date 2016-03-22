module PdflibMini
  module Handle
    class Action < Base
      def initialize(action, p)
        super(action)
        @p = p
      end
    end
  end
end
