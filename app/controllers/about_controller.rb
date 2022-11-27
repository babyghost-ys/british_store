class AboutController < ApplicationController
  def index
  end

  def show
    @about_page = PageContent.find_by(page_name: PageName.find_by(name: 'About'))
    @categories = Category.all
  end
end
