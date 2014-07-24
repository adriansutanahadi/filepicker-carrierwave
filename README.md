carrierwave-filepickerio
========================

FilePicker.io support for CarrierWave.

Installation
------------

Install the latest stable release:

    gem install carrierwave-filepickerio

In Rails, add it to your Gemfile:

    gem 'carrierwave-filepickerio'

Configuration
-------------

Add your FilePicker.io API key to the CarrierWave initializer:

    CarrierWave.configure do |config|
      # ... add the following
      config.filepickerio_api_key = '[Your API key]'
    end

Usage
-----

After setting up your CarrierWave uploader as per normal (see the CarrierWave site for more information) you need to configure your page to use the Filepicker.io widget.

First of all, include the filepicker.io JavaScript library in your page (such as your application.html.erb layout):

```erb
<%= filepicker_js_include_tag %>
```

Form Builders
-------------

To use the FilePicker.io uploader you need to call the view helper like so:

```erb
<%= form_for @entry do |f| %>
  <%= f.filepicker_field :remote_image_url %>
  <%= filepicker_save_button 'Save existing image to cloud', @entry.image_url, 'image/jpg' %>
<%- end %>
```

You can change the button text by passing fp-button-text to the data option like this:

```erb
<%= f.filepicker_field :remote_image_url, data: { 'fp-button-text' => 'Pick a picture' } %>
```

To include a drag-n-drop area pass the dragdrop parameter in the options hash, which is the last parameter:

```erb
<%= f.filepicker_field :remote_image_url, dragdrop: true %>
```

You can also attach any other events to the input as normal, for instance you can listen to change events:

```erb
<%= f.filepicker_field :remote_image_url, dragdrop: true, onchange: '$("#pic").attr("src", arguments[0].files[0].url)' %>
```

Specify any Filepicker.io additional data options in the data hash:

```erb
<%= f.filepicker_field :remote_image_url, data: { 'fp-mimetypes' => 'image/jpeg,image/png' } %>
```

You may include any of the additional parameters...

Additional Options
------------------

Any additional Filepicker.io configuration can be passed within an optional data hash passed to the view helper method.

```erb
<%= f.filepicker_field :remote_image_url, data: { 'fp-button-text' => 'Pick a lolcat to upload' } %>
```

See [https://developers.filepicker.io/docs/web/](https://developers.filepicker.io/docs/web/) for a full list of configuration options.
