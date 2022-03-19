require 'rails_helper'

RSpec.describe Bookcase, type: :model do
  let(:bookcase) { create(:bookcase) }

  describe "正常値と異常値について" do
    context "バリデーションについて" do
      it "user_id, book_idがあれば有効であること" do
        expect(bookcase).to be_valid
        expect(bookcase.errors).to be_empty
      end

      it "book_idがなければ無効であること" do
        bookcase.book_id = nil
        bookcase.valid?
        expect(bookcase.errors[:book_id]).to include("can't be blank")
      end

      it "user_idがなければ無効であること" do
        bookcase.user_id = nil
        bookcase.valid?
        expect(bookcase.errors[:user_id]).to include("can't be blank")
      end
    end
  end
end
