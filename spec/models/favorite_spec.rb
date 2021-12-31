require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'Favorite' do
    context 'association test' do
      it 'belongs_to :merchandise' do
        record_relation = described_class.reflect_on_association(:merchandise)
        expect(record_relation.macro).to eq(:belongs_to)
      end

      it 'belongs_to :user' do
        record_relation = described_class.reflect_on_association(:user)
        expect(record_relation.macro).to eq(:belongs_to)
      end
    end
  end
end
