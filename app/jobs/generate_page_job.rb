class GeneratePageJob < ApplicationJob
  queue_as :default

  def perform(*args)
    p Doc.first.title
  end
end
