Rails.application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # The test environment is used exclusively to run your application's
  # test suite.  You never need to work with it otherwise.  Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs.  Don't rely on the data there!
  config.cache_classes = true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true
  # config.logger = Logger.new(config.log_path, 2, 20.megabytes)

  # Don't share cache location with development environment
  config.cache_store = :file_store, "#{Rails.root}/tmp/cache-test"
  

  # Show full error reports and disable caching
  # config.action_controller.consider_all_requests_local = true
  config.action_controller.perform_caching             = false
  config.active_support.deprecation = :stderr

  # Use an in-memory cache (not :null_store) so tests that assert data is
  # cached by locale (motm, tagline, speaker cloud) actually see stored
  # values. Rails.cache.fetch with :null_store never persists.
  config.cache_store = :memory_store
  
  
  # Tell ActionMailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  config.eager_load = false

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true  

end
