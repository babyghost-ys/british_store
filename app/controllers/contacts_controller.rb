class ContactsController < ApplicationController
  def index
  end

  def show
    @contact_page = PageContent.find_by(page_name: PageName.find_by(name: 'Contact'))
  end
end
