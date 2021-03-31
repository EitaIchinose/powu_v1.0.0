require 'rails_helper'

RSpec.describe Department, type: :model do
  before do
    @department = FactoryBot.build(:department)
  end

  describe '予定表を作成' do
    context '予定表を作成出来る時' do
      it '名前があれば予定を作成することが出来る' do
        expect(@department).to be_valid
      end
    end

    context '予定表が作成出来ない時' do
      it '名前が無い場合、予定を作成することが出来ない' do
        @department.name = ''
        @department.valid?
        expect(@department.errors.full_messages).to include('名前を入力してください')
      end
    end
  end
end
