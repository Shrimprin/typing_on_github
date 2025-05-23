# frozen_string_literal: true

class FileItemSerializer
  include Alba::Serializer

  attributes :id, :name, :type, :status

  attribute :content do |file_item|
    file_item.content || ''
  end

  attribute :children, if: proc { params[:children] } do |file_item|
    file_item.children.map { |child| FileItemSerializer.new(child, params: { children: true }) }
  end
end
