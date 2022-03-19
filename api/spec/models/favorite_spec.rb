require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) { create(:favorite) }

  describe "正常値と異常値について" do
    context "バリデーションについて" do
      it "user_id, post_idがあれば有効であること" do
        expect(favorite).to be_valid
        expect(favorite.errors).to be_empty
      end

      it "user_idがなければ無効であること" do
        favorite.user_id = nil
        favorite.valid?
        expect(favorite.errors[:user_id]).to include("can't be blank")
      end

      it "post_idがなければ無効であること" do
        favorite.post_id = nil
        favorite.valid?
        expect(favorite.errors[:post_id]).to include("can't be blank")
      end

      it "post_idとuser_idの組み合わせが一意でなければ無効であること" do
        @favorite = create(:favorite)
        favorite.user_id = @favorite.user_id
        favorite.post_id = @favorite.post_id
        favorite.valid?
        expect(favorite).to_not be_valid
      end
    end
  end
end
