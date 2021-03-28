require "rails_helper"

RSpec.describe Store, type: :model do
  context "必要な情報が揃っている場合" do
    let(:store) { build(:store) }

    it "店舗登録ができる" do
      expect(store).to be_valid
    end
  end
end
