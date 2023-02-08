require 'rails_helper'

RSpec.describe Eat, type: :model do
  before do
    @eat =  FactoryBot.build(:eat)
  end

  describe '食事記録' do
    context '食事記録できるとき' do
      it 'title,price,dateが存在すれば登録できる' do
        expect(@eat).to be_valid
      end
    end
  
    context '食事記録できない' do
      it 'titleが空では登録できない' do
        @eat.title = ''
        @eat.valid?
        expect(@eat.errors.full_messages).to include "Title can't be blank"
      end
  
      it 'priceが空では登録できない' do
        @eat.price = ''
        @eat.valid?
        expect(@eat.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが文字列では登録できない' do
        @eat.price = 'ああ'
        @eat.valid?
        expect(@eat.errors.full_messages).to include "Price is not a number"
      end

      it 'dateが空では登録できない' do
        @eat.date = ''
        @eat.valid?
        expect(@eat.errors.full_messages).to include "Date can't be blank"
      end

      it 'imageが空では登録できない' do
        @eat.image = nil
        @eat.valid?
        expect(@eat.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
