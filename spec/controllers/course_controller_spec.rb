RSpec.describe Admin::CoursesController, :type => :controller do
  let!(:admin) {FactoryGirl.create :admin}
  let!(:course1) {FactoryGirl.create :course}
  let!(:course2) {FactoryGirl.create :course}

  before {sign_in admin}

  describe "#index" do
    before {get :index}
    context "Get index successfully" do
      it {expect(response).to be_success}
      it {expect(assigns :courses).to match_array([course1, course2])}
      it {expect(response).to render_template :index}
      it {expect(response).to have_http_status :ok}
    end
  end

  describe "#new" do
    before {get :new}
    context "Get inew successfully" do
      it {expect(response).to be_success}
      it {expect(response).to render_template :new}
      it {expect(response).to have_http_status :ok}
    end
  end

  describe "#create" do
    context "Create with valid attributes" do
      before {post :create, course: FactoryGirl.attributes_for(:course)}
      it {expect(response).to redirect_to action: :show, id: assigns(:course).id}
      it {expect(response).to have_http_status :found}
    end

    context "Create with invalid attributes with name blank" do
      before {post :create, course: FactoryGirl.attributes_for(:invalid_name_course)}
      it {expect(response).to render_template :new}
      it {expect(response).to have_http_status :ok}
    end

    context "Create with invalid attributes with description blank" do
      before {post :create, course: FactoryGirl.attributes_for(:invalid_description_course)}
      it {expect(response).to render_template :new}
      it {expect(response).to have_http_status :ok}
    end
  end

  describe "#show" do
    before {get :show, id: course1}
    context "Get show successfully" do
      it {expect(response).to be_success}
      it {expect(response).to render_template :show}
      it {expect(response).to have_http_status :ok}
    end
  end

  describe "#edit" do
    before {get :edit, id: course1}
    context "Get edit successfully" do
      it {expect(response).to be_success}
      it {expect(response).to render_template :edit}
      it {expect(response).to have_http_status :ok}
    end
  end

  describe "#update" do
    context "Update with valid attributes" do
      before {patch :update, id: course1, course: FactoryGirl.attributes_for(:course)}
      it {expect(response).to redirect_to action: :show, id: assigns(:course).id}
      it {expect(response).to have_http_status :found}
    end

    context "Update with invalid attributes with name blank" do
      before {post :create, id: course1, course: FactoryGirl.attributes_for(:invalid_name_course)}
      it {expect(response).to render_template :new}
      it {expect(response).to have_http_status :ok}
    end
    
    context "Update with invalid attributes with description blank" do
      before {post :create, id: course1, course: FactoryGirl.attributes_for(:invalid_description_course)}
      it {expect(response).to render_template :new}
      it {expect(response).to have_http_status :ok}
    end
  end

  describe "#destroy" do
    before {delete :destroy, id: course1}
    context "Delete successfully" do
      it {expect(response).to redirect_to admin_root_path}
      it {expect(response).to have_http_status :found}
    end
  end
end
