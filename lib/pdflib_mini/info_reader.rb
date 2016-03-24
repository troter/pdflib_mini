module PdflibMini
  module InfoReader
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def info_reader(method_name, keyword, default_type)
        define_method(keyword) do |*args|
          optlist = args.first.is_a?(String) ? args.first : ''
          options = args.last.is_a?(Hash) ? args.last : {}
          result = public_send(method_name, keyword, optlist)
          type = options.fetch(:as, default_type)
          case type
          when :raw
            info_result_as_raw(result)
          when :string
            info_result_as_string(result)
          else # handle
            info_result_as_handle(result, type)
          end
        end
      end
    end

    private

    def info_result_as_raw(result)
      result
    end

    def info_result_as_string(result)
      result = result.to_i
      return nil if result == -1
      @p.get_string(result, '')
    end

    def info_result_as_handle(result, handle)
      result = result.to_i
      class_name = handle.to_s.capitalize
      PdflibMini::Handle.const_get(class_name).create(result, @p)
    end
  end
end
