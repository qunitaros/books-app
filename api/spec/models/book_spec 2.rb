require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { create(:book) }

  describe "正常値と異常値について" do
    context "バリデーションについて" do
      it "isbn, title, authorがあれば有効であること" do
        expect(book).to be_valid
        expect(book.errors).to be_empty
      end

      it "isbnがなければ無効であること" do
        book.isbn = nil
        book.valid?
        expect(book.errors[:isbn]).to include("can't be blank")
      end

      it "titleがなければ無効であること" do
        book.title = ""
        book.valid?
        expect(book.errors[:title]).to include("can't be blank")
      end

      it "authorがなければ無効であること" do
        book.author = ""
        book.valid?
        expect(book.errors[:author]).to include("can't be blank")
      end
    end
  end
end
