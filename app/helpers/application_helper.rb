module ApplicationHelper

  #allows easy access to titling pages
  def full_title(page_title = '')
    base_title = "global(x)"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
