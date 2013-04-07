

SimpleForm.setup do |config|
  config.wrappers :default, :class => :input, :hint_class => :field_with_hint, :error_class => :field_with_errors do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label_input
    b.use :hint,  :wrap_with => { :tag => :span, :class => :hint }
    b.use :error, :wrap_with => { :tag => :span, :class => :error }
  end

  config.wrappers :bootstrap, :tag => :div, :class => 'control-group', :error_class => 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label_input
    b.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
    b.use :hint,  :wrap_with => { :tag => 'p', :class => 'help-block' }
  end

  config.wrappers :empty, :tag => false, :error_class => 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label_input
    b.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
    b.use :hint,  :wrap_with => { :tag => 'p', :class => 'help-block' }
  end

  config.default_wrapper = :bootstrap
  config.boolean_style = :nested
  config.button_class = 'btn'
  config.error_notification_tag = :div
  config.error_notification_class = 'alert alert-error'
  # You can wrap each item in a collection of radio/check boxes with a tag,
  # defaulting to :span. Please note that when using :boolean_style = :nested,
  # SimpleForm will force this option to be a label.
  config.item_wrapper_tag = nil
  # config.item_wrapper_class = nil
  config.label_text = lambda { |label, required| "#{label} #{required}" }
  config.label_class = 'control-label'
  config.form_class = nil
  config.browser_validations = false
  # config.file_methods = [ :mounted_as, :file?, :public_filename ]
  # config.input_mappings = { /count/ => :integer }
  # config.time_zone_priority = nil
  # config.country_priority = nil
  config.default_input_size = nil
  # config.translate_labels = true
  # config.inputs_discovery = true
  # config.cache_discovery = !Rails.env.development?
end

