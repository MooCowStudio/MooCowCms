namespace :generate_page do
  desc "Generate Static Page"
  task :run => :environment do
    filename = %w( 404 500 522 privacy_policy )
    filename.each do |name|
      GeneratePageJob.perform_later("#{name}")
    end
    Doc.all.pluck(:id).each do |id|
      GeneratePageJob.perform_later("docs", id)
    end
  end
end
