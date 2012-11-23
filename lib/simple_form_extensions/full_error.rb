module SimpleFormExtensions
  module FullError

    def full_error
      error_text_with_prefix if has_errors?
    end

    private

      def error_text_with_prefix
        self.options ||= {}

        options[:error_prefix] ||= if object.class.respond_to?(:human_attribute_name)
          object.class.human_attribute_name(attribute_name.to_s)
        else
          attribute_name.to_s.humanize
        end

        error_text
      end

  end
end

SimpleForm::Inputs::Base.send :include, SimpleFormExtensions::FullError
