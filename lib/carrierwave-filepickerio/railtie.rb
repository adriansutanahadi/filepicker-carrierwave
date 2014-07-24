# encoding: utf-8

module CarrierWave
  module Filepickerio
    class Railtie < Rails::Railtie

      config.after_initialize do
        config.filepicker_rails.api_key = CarrierWave::Uploader::Base.filepickerio_api_key
      end

    end
  end
end
