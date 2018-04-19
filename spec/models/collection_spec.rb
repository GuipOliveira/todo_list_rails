require 'rails_helper'

RSpec.describe Collection, type: :model do

    context "scope testes" do
      let (:params){{name: 'Lista Teste',is_public: true, user_id: 1}}
      before(:each) do
        User.create!(email: "teste@teste.com", password:"senha123")
        Collection.create(params)
        Collection.create(params)
        Collection.create(params)
        Collection.create(params)
        Collection.create(params)
        Collection.create(params.merge(is_public: false))
        Collection.create(params.merge(is_public: false))
        Collection.create(params.merge(is_public: false))
      end

      it "should return 5 public lists" do
        #Foram criadas 5 listas publicas
        expect(Collection.where(is_public: true).count).to eq(5)
      end

      it "should return 3 private lists" do
        #Foram criadas 3 listas privadas
        expect(Collection.where(is_public: false).count).to eq(3)
      end
    end
  end
