require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for :classroom
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for :invalid_classroom
  }

  let(:valid_session) { {} }

  let(:classroom) {
    FactoryGirl.create :classroom
  }

  describe "GET #index" do
    it "assigns all classrooms as @classrooms" do
      get :index, params: {}, session: valid_session
      expect(assigns(:classrooms)).to eq([classroom])
    end
  end

  describe "GET #show" do
    it "assigns the requested classroom as @classroom" do
      get :show, id: classroom.to_param, session: valid_session
      expect(assigns(:classroom)).to eq(classroom)
    end
  end

  describe "GET #new" do
    it "assigns a new classroom as @classroom" do
      get :new, params: {}, session: valid_session
      expect(assigns(:classroom)).to be_a_new(Classroom)
    end
  end

  describe "GET #edit" do
    it "assigns the requested classroom as @classroom" do
      classroom = Classroom.create! valid_attributes
      get :edit, id: classroom.to_param, session: valid_session
      expect(assigns(:classroom)).to eq(classroom)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Classroom" do
        expect {
          post :create, classroom: valid_attributes, session: valid_session
        }.to change(Classroom, :count).by(1)
      end

      it "assigns a newly created classroom as @classroom" do
        post :create, classroom: valid_attributes, session: valid_session
        expect(assigns(:classroom)).to be_a(Classroom)
        expect(assigns(:classroom)).to be_persisted
      end

      it "redirects to the created classroom" do
        post :create, classroom: valid_attributes, session: valid_session
        expect(response).to redirect_to(Classroom.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved classroom as @classroom" do
        post :create, classroom: invalid_attributes, session: valid_session
        expect(assigns(:classroom)).to be_a_new(Classroom)
      end

      it "re-renders the 'new' template" do
        post :create, classroom: invalid_attributes, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested classroom" do
      get :show, id: classroom.to_param, session: valid_session
      expect {
        delete :destroy, id: classroom.to_param, session: valid_session
      }.to change(Classroom, :count).by(-1)
    end
  end

end
