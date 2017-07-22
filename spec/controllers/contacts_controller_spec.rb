require 'rails_helper'

describe ContactsController do
  describe 'GET #index' do
    # params[:letter] がある場合
    context 'with params[:letter]' do
      # 指定された文字で始まる連絡先を配列にまとめること
      it 'populates an array of contacts starting with the letter' do
        smith = create(:contact, lastname: 'Smith')
        jones = create(:contact, lastname: 'Jones')
        get :index, letter: 'S'
        expect(assigns(:contacts)).to match_array([smith])
      end

      # :index テンプレートを表示すること
      it 'renders the :index template' do
        get :index, letter: 'S'
        expect(response).to render_template :index
      end
    end

    # params[:letter] がない場合
    describe 'without params[:letter]' do
      # 全ての連絡先を配列にまとめること
      it 'populates an array of all contacts' do
        smith = create(:contact, lastname: 'Smith')
        jones = create(:contact, lastname: 'Jones')
        get :index
        expect(assigns(:contacts)).to match_array([smith, jones])
      end

      # :index テンプレートを表示すること
      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    # @contact に要求された連絡先を割り当てること
    it 'assigns the requested contact to @contact' do
      contact = create(:contact)
      get :show, id: contact
      # assignsでcontrollerのインスタンス変数@contactを取得する
      expect(assigns(:contact)).to eq(contact)
    end

    # :show テンプレートを表示すること
    it 'renders the :show template' do
      contact = create(:contact)
      get :show, id: contact
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    # @contact に新しい連絡先を割り当てること
    xit 'assigns a new Contact to @contact'
    # :new テンプレートを表示すること
    xit 'renders the :new template'
  end

  describe 'GET #edit' do
    # @contact に要求された連絡先を割り当てること
    xit 'assigns the requested contact to @contact'
    # :edit テンプレートを表示すること
    xit 'renders the :edit template'
  end

  describe 'POST #create' do
    # 有効な属性の場合
    context 'with valid attributes' do
      # データベースに新しい連絡先を保存すること
      xit 'saves the new contact in the database'
      # contacts#show にリダイレクトすること
      xit 'redirects to contacts#show'
    end

    # 無効な属性の場合
    context 'with invalid attributes' do
      # データベースに新しい連絡先を保存しないこと
      xit 'does not save the new contact in the database'
      # :new テンプレートを再表示すること
      xit 're-renders the :new template'
    end

    describe 'PATCH #update' do
      # 有効な属性の場合
      context 'valid attributes' do
        # 要求された @contact を取得すること
        xit 'locates the requested @contact'
        # @contact の属性を変更すること
        xit 'changes @contact\'s attributes'
        # 更新した連絡先のページへリダイレクトすること
        xit 'redirects to the updated contact'
      end

      # 無効な属性の場合
      context 'with invalid attributes' do
        # 連絡先の属性を変更しないこと
        xit 'does not change the contact\'s attributes'
        # edit テンプレートを再表示すること
        xit 're-renders the edit template'
      end
    end
  end

  describe 'DELETE #destroy' do
    # 連絡先を削除すること
    xit 'deletes the contact'
    # contacts#index にリダイレクトすること
    xit 'redirects to contacts#index'
  end
end
