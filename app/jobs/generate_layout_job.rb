class GenerateLayoutJob < ApplicationJob
  queue_as :default

  def perform(layout_id)
    layout = Layout.find_by(id: layout_id)
    out_dir = File.join(Rails.root, "public", layout.site_id.to_s, "assets", "stylesheets")
    FileUtils.mkdir_p(out_dir) unless FileTest.exist?(out_dir)
    File.open(File.join(out_dir,layout.filename), mode = "w"){|f|
      f.write(layout.content)
    }
  end
end
