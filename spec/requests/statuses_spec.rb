require 'spec_helper'

# This should return the minimal set of attributes required to create a valid
# User. As you add validations to User, be sure to
# update the return value of this method accordingly.
def valid_attributes
    {  }
end

describe "Statuses" do
  describe "GET /statuses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get statuses_path
      response.status.should be(200)
    end
  end

  describe "GET index" do
    it "assigns all statuses as @statuses" do
      status = Status.create! valid_attributes
      get :index, {}, valid_session
      assigns(:statuses).should eq([status])
    end
  end

  describe "GET show" do
    it "assigns the requested status as @status" do
      status = Status.create! valid_attributes
      get :show, {:id => status.to_param}, valid_session
      assigns(:status).should eq(status)
    end
  end

  describe "GET new" do
    it "assigns a new status as @status" do
      get :new, {}, valid_session
      assigns(:status).should be_a_new(Status)
    end
  end

  describe "GET edit" do
    it "assigns the requested status as @status" do
      status = Status.create! valid_attributes
      get :edit, {:id => status.to_param}, valid_session
      assigns(:status).should eq(status)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Status" do
        expect {
          post :create, {:status => valid_attributes}, valid_session
        }.to change(Status, :count).by(1)
      end

      it "assigns a newly created status as @status" do
        post :create, {:status => valid_attributes}, valid_session
        assigns(:status).should be_a(Status)
        assigns(:status).should be_persisted
      end

      it "redirects to the created status" do
        post :create, {:status => valid_attributes}, valid_session
        response.should redirect_to(Status.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved status as @status" do
        # Trigger the behavior that occurs when invalid params are submitted
        Status.any_instance.stub(:save).and_return(false)
        post :create, {:status => {  }}, valid_session
        assigns(:status).should be_a_new(Status)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Status.any_instance.stub(:save).and_return(false)
        post :create, {:status => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested status" do
        status = Status.create! valid_attributes
        # Assuming there are no other statuses in the database, this
        # specifies that the Status created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Status.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => status.to_param, :status => { "these" => "params" }}, valid_session
      end

      it "assigns the requested status as @status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => valid_attributes}, valid_session
        assigns(:status).should eq(status)
      end

      it "redirects to the status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => valid_attributes}, valid_session
        response.should redirect_to(status)
      end
    end

    describe "with invalid params" do
      it "assigns the status as @status" do
        status = Status.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Status.any_instance.stub(:save).and_return(false)
        put :update, {:id => status.to_param, :status => {  }}, valid_session
        assigns(:status).should eq(status)
      end

      it "re-renders the 'edit' template" do
        status = Status.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Status.any_instance.stub(:save).and_return(false)
        put :update, {:id => status.to_param, :status => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested status" do
      status = Status.create! valid_attributes
      expect {
        delete :destroy, {:id => status.to_param}, valid_session
      }.to change(Status, :count).by(-1)
    end

    it "redirects to the statuses list" do
      status = Status.create! valid_attributes
      delete :destroy, {:id => status.to_param}, valid_session
      response.should redirect_to(statuses_url)
    end
  end
end
