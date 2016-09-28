require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:course)
  }

  let(:invalid_attributes) {
    attributes_for(:invalid_course)
  }

  let(:course) {
    FactoryGirl.create :course
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all courses as @courses" do
      get :index, params: {}, session: valid_session
      expect(assigns(:courses)).to eq([course])
    end
  end

  describe "GET #show" do
    it "assigns the requested course as @course" do
      get :show, id: course.to_param, session: valid_session
      expect(assigns(:course)).to eq(course)
    end
  end

  describe "GET #new" do
    it "assigns a new course as @course" do
      get :new, params: {}, session: valid_session
      expect(assigns(:course)).to be_a_new(Course)
    end
  end

  describe "GET #edit" do
    it "assigns the requested course as @course" do
      get :show, id: course.to_param, session: valid_session
      get :edit, id: course.to_param, session: valid_session
      expect(assigns(:course)).to eq(course)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Course" do
        expect {
          post :create, course: valid_attributes, session: valid_session
        }.to change(Course, :count).by(1)
      end

      it "assigns a newly created course as @course" do
        post :create, course: valid_attributes, session: valid_session
        expect(assigns(:course)).to be_a(Course)
        expect(assigns(:course)).to be_persisted
      end

      it "redirects to the created course" do
        post :create, course: valid_attributes, session: valid_session
        expect(response).to redirect_to(Course.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved course as @course" do
        post :create, course: invalid_attributes, session: valid_session
        expect(assigns(:course)).to be_a_new(Course)
      end

      it "re-renders the 'new' template" do
        post :create, course: invalid_attributes, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:course, name: 'Sistemas')
      }

      it "updates the requested course" do
      get :show, id: course.to_param, session: valid_session
        put :update, id: course.to_param, course: new_attributes, session: valid_session
        course.reload
        expect(course.name).to eq('Sistemas')
      end

      it "assigns the requested course as @course" do
      get :show, id: course.to_param, session: valid_session
        put :update, id: course.to_param, course: valid_attributes, session: valid_session
        expect(assigns(:course)).to eq(course)
      end

      it "redirects to the course" do
      get :show, id: course.to_param, session: valid_session
        put :update, id: course.to_param, course: valid_attributes, session: valid_session
        expect(response).to redirect_to(course)
      end
    end

    context "with invalid params" do
      it "assigns the course as @course" do
      get :show, id: course.to_param, session: valid_session
        put :update, id: course.to_param, course: invalid_attributes, session: valid_session
        expect(assigns(:course)).to eq(course)
      end

      it "re-renders the 'edit' template" do
      get :show, id: course.to_param, session: valid_session
        put :update, id: course.to_param, course: invalid_attributes, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested course" do
      get :show, id: course.to_param, session: valid_session
      expect {
        delete :destroy, id: course.to_param, session: valid_session
      }.to change(Course, :count).by(-1)
    end

    it "redirects to the courses list" do
      new_course = FactoryGirl.create :course
      get :show, id: new_course.to_param, session: valid_session
      delete :destroy, id: new_course.to_param, session: valid_session
      expect(response).to redirect_to(courses_url)
    end
  end
end
