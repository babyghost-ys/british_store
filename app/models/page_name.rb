class PageName < ApplicationRecord
  has_one :page_content, dependent: :delete
end
