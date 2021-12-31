require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User' do
    context 'association test' do
      it 'has_many :listed_merchandises' do
        record_relation = described_class.reflect_on_association(:listed_merchandises)
        expect(record_relation.macro).to eq(:has_many)
      end

      it 'has_many :purchased_merchandises' do
        record_relation = described_class.reflect_on_association(:purchased_merchandises)
        expect(record_relation.macro).to eq(:has_many)
      end

      it 'has_many :favorite' do
        record_relation = described_class.reflect_on_association(:favorites)
        expect(record_relation.macro).to eq(:has_many)
      end
    end

    context 'nameが存在しないとき' do
      let(:user) { build(:user, name: nil) }

      it 'バリデーションに引っかかること' do
        expect(user.invalid?).to eq(true)
      end
    end
  end

  context 'nameが長すぎるとき' do
    let(:user) { build(:user, name: 'w' * 300) }

    it 'バリデーションに引っかかること' do
      expect(user.invalid?).to eq(true)
    end
  end

  context 'emailが存在しないとき' do
    let(:user) { build(:user, email: nil) }

    it 'バリデーションに引っかかること' do
      expect(user.invalid?).to eq(true)
    end
  end

  context 'emailが長すぎるとき' do
    let(:user) { build(:user, email: 'w' * 300) }

    it 'バリデーションに引っかかること' do
      expect(user.invalid?).to eq(true)
    end
  end

  context 'emailが重複したとき' do
    before { create(:user, email: 'test@example.com') }

    let(:user) { build(:user, email: 'test@example.com') }

    it 'バリデーションに引っかかること' do
      expect(user.invalid?).to eq(true)
    end

  end
end
