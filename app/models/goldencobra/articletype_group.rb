# encoding: utf-8

module Goldencobra
  class ArticletypeGroup < ActiveRecord::Base
    attr_accessible :closed, :expert, :foldable, :sorter, :title, :fields_attributes, :position

    belongs_to :articletype, class_name: Goldencobra::Articletype, foreign_key: :articletype_id
    has_many :fields, class_name: Goldencobra::ArticletypeField, dependent: :delete_all
    accepts_nested_attributes_for :fields, allow_destroy: true

    default_scope { order(:sorter) }
  end
end

# == Schema Information
#
# Table name: goldencobra_articletype_groups
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  expert         :boolean          default(FALSE)
#  foldable       :boolean          default(TRUE)
#  closed         :boolean          default(TRUE)
#  sorter         :integer          default(0)
#  articletype_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  position       :string(255)      default("first_block")
#
