require 'rails_helper'

RSpec.describe Fridge, type: :model do
  before do
    @fridge =  FactoryBot.build(:fridge)
  end

  describe '食品登録' do
    context '食品登録できるとき' do
      it 'チェックボックスと食品名、個数、単位、値段が存在すれば登録できる' do
        expect(@fridge).to be_valid
      end
    end

    context '新規登録できない' do
      it 'foodが空では登録できない' do
        @fridge.food = ''
        @fridge.valid?
        expect(@fridge.errors.full_messages).to include "Food can't be blank"
      end

      it 'amountが空では登録できない' do
        @fridge.amount = ''
        @fridge.valid?
        expect(@fridge.errors.full_messages).to include "Amount can't be blank"
      end

      it 'amountが0では登録できない' do
        @fridge.amount = 0
        @fridge.valid?
        expect(@fridge.errors.full_messages).to include "Amount must be greater than 0"
      end

      it 'amountが負の数では登録できない' do
        @fridge.amount = -5
        @fridge.valid?
        expect(@fridge.errors.full_messages).to include "Amount must be greater than 0"
      end

      it 'unitが空では登録できない' do
        @fridge.unit = ''
        @fridge.valid?
        expect(@fridge.errors.full_messages).to include "Unit can't be blank"
      end

      it 'priceが空では登録できない' do
        @fridge.price = ''
        @fridge.valid?
        expect(@fridge.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが負の数では登録できない' do
        @fridge.price = -50
        @fridge.valid?
        expect(@fridge.errors.full_messages).to include "Price must be greater than or equal to 0"
      end

      end
    end
  end
end
