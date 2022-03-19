require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }

  describe "正常値と異常値について" do
    context "バリデーションについて" do
      it "user_id, post_id, commentがあれば有効であること" do
        expect(comment).to be_valid
        expect(comment.errors).to be_empty
      end

      it "user_idがなければ無効であること" do
        comment.user_id = nil
        comment.valid?
        expect(comment.errors[:user_id]).to include("can't be blank")
      end

      it "post_idがなければ無効であること" do
        comment.post_id = nil
        comment.valid?
        expect(comment.errors[:post_id]).to include("can't be blank")
      end

      it "commentの文字数が201文字以上であれば無効であること" do
        comment.comment = "a" * 201
        comment.valid?
        expect(comment.errors[:comment]).to include("is too long (maximum is 200 characters)")
      end
    end
  end
end
