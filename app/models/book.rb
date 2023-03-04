class Book < ApplicationRecord
  # N対1のアソシエーション
  belongs_to :user
end
