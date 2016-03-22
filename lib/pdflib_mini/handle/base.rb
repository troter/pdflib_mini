module PdflibMini
  module Handle
    Error = Class.new(SimpleDelegator)
    ERROR = Error.new(-1)

    class Base < SimpleDelegator
      def self.create(*args)
        if args.first == -1
          ERROR
        else
          new(*args)
        end
      end
    end
  end
end
