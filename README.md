# Spree Carrierwave

This is a Spree extension that uploads images to Amazon S3 via [CarrierWave](https://github.com/jnicklas/carrierwave) instead of
the default [Paperclip](https://github.com/thoughtbot/paperclip).

## Why?

The Paperclip gem uses the [aws-s3](https://github.com/marcel/aws-s3) gem, which causes problems
when used with Spree:

    superclass mismatch for class PriceBucket (TypeError)

Some have claimed to have gotten around this, but the solutions given haven't
worked for me.

# Installation

Add `spree_carrierwave` to your Gemfile and `bundle`.

# Configuration

Create an initializer for CarrierWave
(`config/initializers/spree_carrierwave.rb`):

    # See the section titled 'Using Amazon S3' at https://github.com/jnicklas/carrierwave
    # for full options.
    #
    CarrierWave.configure do |config|
      config.fog_credentials = {
        :provider               => 'AWS',
        :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
        :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']
      }
      config.fog_directory  = 'my-bucket'
      config.fog_attributes = { 'Cache-Control'=>'max-age=315576000' }
    end

Enjoy!

Copyright (c) 2012 Genuity Technology Services, released under the New BSD License
