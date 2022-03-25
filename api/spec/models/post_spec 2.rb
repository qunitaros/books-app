require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  describe "正常値、異常値について" do
    context "バリデーションについて" do
      it "user_id, book_id, cocktail_id, contentがあれば正常であること" do
        expect(post).to be_valid
        expect(post.errors).to be_empty
      end

      it "user_idがなければ無効であること" do
        post.user_id = nil
        post.valid?
        expect(post.errors[:user_id]).to include("can't be blank")
      end

      it "book_idがなければ無効であること" do
        post.book_id = nil
        post.valid?
        expect(post.errors[:book_id]).to include("can't be blank")
      end

      it "cocktail_idがなければ無効であること" do
        post.cocktail_id = nil
        post.valid?
        expect(post.errors[:cocktail_id]).to include("can't be blank")
      end

      it "contentが341文字以上だと無効であること" do
        post.content = "a" * 341
        post.valid?
        expect(post.errors[:content]).to include("is too long (maximum is 340 characters)")
      end
    end
  end
end
