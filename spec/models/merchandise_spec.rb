require 'rails_helper'

RSpec.describe Merchandise, type: :model do
  describe 'Merchandise' do
    it 'has_many :favorite' do
      record_relation = described_class.reflect_on_association(:favorites)
      expect(record_relation.macro).to eq(:has_many)
    end

    it 'has_many :merchandise_image' do
      record_relation = described_class.reflect_on_association(:merchandise_images)
      expect(record_relation.macro).to eq(:has_many)
    end

    it 'has_one :divided_department' do
      record_relation = described_class.reflect_on_association(:divided_department)
      expect(record_relation.macro).to eq(:has_one)
    end

    it 'belongd_to :seller' do
      record_relation = described_class.reflect_on_association(:seller)
      expect(record_relation.macro).to eq(:belongs_to)
    end

    it 'belongd_to :buyer' do
      record_relation = described_class.reflect_on_association(:buyer)
      expect(record_relation.macro).to eq(:belongs_to)
    end
  end
end
