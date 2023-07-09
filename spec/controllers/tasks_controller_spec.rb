require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:task) { FactoryBot.create(:task, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns tasks' do
      get :index
      expect(assigns(:tasks)).to eq([task])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns a new task' do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { description: 'New Task' } }
    let(:invalid_attributes) { { description: nil } }

    context 'with valid attributes' do
      it 'creates a new task' do
        expect {
          post :create, params: { task: valid_attributes }
        }.to change(Task, :count).by(1)
      end

      it 'redirects to the tasks index' do
        post :create, params: { task: valid_attributes }
        expect(response).to redirect_to(tasks_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new task' do
        expect {
          post :create, params: { task: invalid_attributes }
        }.to_not change(Task, :count)
      end

      it 'renders the new template' do
        post :create, params: { task: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: task.id }
      expect(response).to be_successful
    end

    it 'renders the edit template' do
      get :edit, params: { id: task.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:updated_attributes) { { description: 'Updated Task' } }

    it 'updates the task' do
      patch :update, params: { id: task.id, task: updated_attributes }
      task.reload
      expect(task.description).to eq('Updated Task')
    end

    it 'redirects to the tasks index' do
      patch :update, params: { id: task.id, task: updated_attributes }
      expect(response).to redirect_to(tasks_path)
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { description: nil } }

      it 'does not update the task' do
        patch :update, params: { id: task.id, task: invalid_attributes }
        task.reload
        expect(task.description).not_to be_nil
      end

      it 'renders the edit template' do
        patch :update, params: { id: task.id, task: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the task' do
      task # Create the task
      expect {
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
    end

    it 'redirects to the tasks index' do
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to(tasks_path)
    end
  end
end
