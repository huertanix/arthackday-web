# If you set up an S3 bucket outside the graveyard of storm-torn US-EAST-1 the address is formatted differently
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'