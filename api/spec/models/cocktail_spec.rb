require 'rails_helper'

RSpec.describe Cocktail, type: :model do
  let(:cocktail) { create(:cocktail) }

  describe "正常値と異常値について" do
    context "バリデーションについて" do
      it "cocktail_id, cocktail_name, alcoholがあれば有効であること" do
        expect(cocktail).to be_valid
        expect(cocktail.errors).to be_empty
      end

      it "cocktail_idがなければ無効であること" do
        cocktail.cocktail_id = nil
        cocktail.valid?
        expect(cocktail.errors[:cocktail_id]).to include("can't be blank")
      end

      it "cocktail_nameがなければ無効であること" do
        cocktail.cocktail_name = ""
        cocktail.valid?
        expect(cocktail.errors[:cocktail_name]).to include("can't be blank")
      end

      it "alcoholがなければ無効であること" do
        cocktail.alcohol = nil
        cocktail.valid?
        expect(cocktail.errors[:alcohol]).to include("can't be blank")
      end
    end
  end
end
