module LayoutHelper
  def title(page_title, show_title = true)
    @show_title = show_title
    @content_for_title = page_title.to_s
  end

  def show_title?
    @show_title
  end

end