# frozen_string_literal: true

# Serializer to handle post
class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :published, :author

  def author
    user = object.user
    {
      name: user.name,
      email: user.email,
      id: user.id
    }
  end
end
