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

Setup a CarrierWave uploader as normal. 

Include the filepicker.io JavaScript library in your page (such as your application.html.erb layout):

```erb
<%= javascript_include_tag "//api.filepicker.io/v0/filepicker.js" %>
```

... or, if you're not using the asset pipeline, you can use the expansion:

```erb
<%= javascript_include_tag :filepickerio %>
```

To use the FilePicker.io uploader you need to call the view helper like so:

```erb
<%= form_for @entry do |f| %>
  <%= f.fp_file_field :image %>
  <%= f.fp_save_button :image, "Save existing image to cloud", 'image/jpeg' %>
<%- end %>
```

You can change the button text by passing along a string as the first parameter

```erb
<%= f.fp_file_field :image, "Pick a picture" %>
```

To include a drag-n-drop area pass the dragdrop parameter

```erb
<%= f.fp_file_field :image, "Pick a picture", dragdrop: true %>
```

Specify any Filepicker.io additional data options in the data hash

```erb
<%= f.fp_file_field :image, "Pick a picture", data: { 'fp-mimetypes' => 'image/jpeg,image/png' } %>
```

You may include any of the additional parameters...

Additional Options
------------------

Any additional Filepicker.io configuration can be passed within an optional data hash passed to the view helper method.

```erb
<%= f.fp_file_field :uploader_name, data: { "fp-button-text" => "Pick a lolcat to upload" } %>
```

See [https://developers.filepicker.io/docs/web/](https://developers.filepicker.io/docs/web/) for a full list of configuration options.

Roadmap
-------

* Full spec coverage
* Extract view helpers into non-CarrierWave dependent gem 'filepickerio'
* Use new gem here, where this becomes a wrapper for CarrierWave only changes