Paperclip::Attachment.default_options.merge!(
    :storage => :fog,
    :fog_credentials => {
        :provider => 'AWS',
        :aws_access_key_id => ENV['AKIAJKFIR5NYZRI2S3JA'],
        :aws_secret_access_key => ENV['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'],
        :region => 'eu-west-1' # in case you need it
    },
    :fog_directory => ENV['tcntd'], # only one of those is needed but I don't remember which
    :bucket => ENV['tcntd']
)