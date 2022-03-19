require 'rails_helper'

RSpec.describe Cocktailcase, type: :model do
  let(:cocktailcase) { create(:cocktailcase) }

  describe "正常値と異常値について" do
    context "バリデーションについて" do
      it "user_id, cocktail_idがあれば有効であること" do
        expect(cocktailcase).to be_valid
        expect(cocktailcase.errors).to be_empty
      end

      it "cocktail_idがなければ無効であること" do
        cocktailcase.cocktail_id = nil
        cocktailcase.valid?
        expect(cocktailcase.errors[:cocktail_id]).to include("can't be blank")
      end

      it "user_idがなければ無効であること" do
        cocktailcase.user_id = nil
        cocktailcase.valid?
        expect(cocktailcase.errors[:user_id]).to include("can't be blank")
      end
    end
  end
end
