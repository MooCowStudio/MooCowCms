class GeneratePageJob < ApplicationJob
  queue_as :default

  def perform(doc_id)
    doc = Doc.find(doc_id)
    out_dir = File.join(Rails.root, "public", "docs")
    html = DocsController.render :show, assigns: {doc: doc}
    FileUtils.mkdir_p(out_dir) unless FileTest.exist?(out_dir)
    File.open(File.join(out_dir, "#{doc.filename}.html"), mode = "w") do |file|
      file.write(html)
    end
  end
end
