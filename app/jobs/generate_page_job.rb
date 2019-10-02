class GeneratePageJob < ApplicationJob
  queue_as :default

  def perform(path, doc_id=nil)
    out_dir = File.join(Rails.root, "public")
    out_dir = File.join(Rails.root, "public", "docs") if path == "docs"
    FileUtils.mkdir_p(out_dir) unless FileTest.exist?(out_dir)
    case path
    when "docs"
      doc = Doc.find(doc_id)
      html = DocsController.render :show, assigns: {doc: doc}
      filename = "#{doc.filename}.html"
    when "404"
      html = StaticController.render :not_found
      filename = "404.html"
    when "500"
      html = StaticController.render :server_error
      filename = "500.html"
    when "privacy_policy"
      html = StaticController.render :privacy
      filename = "privacy_policy.html"
    end
    return if html.blank? || filename.blank?
    File.open(File.join(out_dir, filename), mode = "w:utf-8") do |file|
      file.write(html)
    end
  end
end
