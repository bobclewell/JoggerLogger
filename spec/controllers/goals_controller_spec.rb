require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe GoalsController do

  # This should return the minimal set of attributes required to create a valid
  # Goal. As you add validations to Goal, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GoalsController. Be sure to keep this updated too.
  # def valid_session
  #   {}
  # end

  #### Removing Controller Specs for the time being...
  # login_user

  # describe "GET index" do
  #   it "assigns all goals as @goals" do
  #     goal = Goal.create! valid_attributes
  #     get :index #, {}, valid_session
  #     assigns(:goals).should eq([goal])
  #   end
  # end

  # describe "GET show" do
  #   it "assigns the requested goal as @goal" do
  #     goal = Goal.create! valid_attributes
  #     get :show, {:id => goal.to_param}, valid_session
  #     assigns(:goal).should eq(goal)
  #   end
  # end

  # describe "GET new" do
  #   it "assigns a new goal as @goal" do
  #     get :new, {}, valid_session
  #     assigns(:goal).should be_a_new(Goal)
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested goal as @goal" do
  #     goal = Goal.create! valid_attributes
  #     get :edit, {:id => goal.to_param}, valid_session
  #     assigns(:goal).should eq(goal)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Goal" do
  #       expect {
  #         post :create, {:goal => valid_attributes}, valid_session
  #       }.to change(Goal, :count).by(1)
  #     end

  #     it "assigns a newly created goal as @goal" do
  #       post :create, {:goal => valid_attributes}, valid_session
  #       assigns(:goal).should be_a(Goal)
  #       assigns(:goal).should be_persisted
  #     end

  #     it "redirects to the created goal" do
  #       post :create, {:goal => valid_attributes}, valid_session
  #       response.should redirect_to(Goal.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved goal as @goal" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Goal.any_instance.stub(:save).and_return(false)
  #       post :create, {:goal => {}}, valid_session
  #       assigns(:goal).should be_a_new(Goal)
  #     end

  #     it "re-renders the 'new' template" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Goal.any_instance.stub(:save).and_return(false)
  #       post :create, {:goal => {}}, valid_session
  #       response.should render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested goal" do
  #       goal = Goal.create! valid_attributes
  #       # Assuming there are no other goals in the database, this
  #       # specifies that the Goal created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       Goal.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, {:id => goal.to_param, :goal => {'these' => 'params'}}, valid_session
  #     end

  #     it "assigns the requested goal as @goal" do
  #       goal = Goal.create! valid_attributes
  #       put :update, {:id => goal.to_param, :goal => valid_attributes}, valid_session
  #       assigns(:goal).should eq(goal)
  #     end

  #     it "redirects to the goal" do
  #       goal = Goal.create! valid_attributes
  #       put :update, {:id => goal.to_param, :goal => valid_attributes}, valid_session
  #       response.should redirect_to(goal)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the goal as @goal" do
  #       goal = Goal.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Goal.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => goal.to_param, :goal => {}}, valid_session
  #       assigns(:goal).should eq(goal)
  #     end

  #     it "re-renders the 'edit' template" do
  #       goal = Goal.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Goal.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => goal.to_param, :goal => {}}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested goal" do
  #     goal = Goal.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => goal.to_param}, valid_session
  #     }.to change(Goal, :count).by(-1)
  #   end

  #   it "redirects to the goals list" do
  #     goal = Goal.create! valid_attributes
  #     delete :destroy, {:id => goal.to_param}, valid_session
  #     response.should redirect_to(goals_url)
  #   end
  # end

end
