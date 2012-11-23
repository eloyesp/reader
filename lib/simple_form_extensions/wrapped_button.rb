module SimpleFormExtensions
  module WrappedButton
    def wrapped_button(*args, &block)
      template.content_tag :div, :class => "control-group controls" do
        button(*args, &block)
      end
    end
  end
end

SimpleForm::FormBuilder.send :include, SimpleFormExtensions::WrappedButton
