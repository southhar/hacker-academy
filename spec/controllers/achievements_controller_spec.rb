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

describe AchievementsController do

  # This should return the minimal set of attributes required to create a valid
  # Achievement. As you add validations to Achievement, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :name => "Some Achievement",
      :description => "For being rad",
      :value => 100
    }
  end

  describe "GET index" do
    it "assigns all achievements as @achievements" do
      achievement = Achievement.create! valid_attributes
      get :index
      assigns(:achievements).should eq([achievement])
    end
  end

  describe "GET show" do
    it "assigns the requested achievement as @achievement" do
      achievement = Achievement.create! valid_attributes
      get :show, :id => achievement.id.to_s
      assigns(:achievement).should eq(achievement)
    end
  end

  describe "GET new" do
    it "should fail when not logged in" do
      get :new
      assigns(:achievement).should be_nil
      response.should redirect_to(new_user_session_path)
    end

    it "should fail when logged in as non-admin" do
      sign_in get_user
      get :new
      assigns(:achievement).should be_nil
    end

    it "assigns a new achievement as @achievement" do
      sign_in get_admin_user
      get :new
      assigns(:achievement).should be_a_new(Achievement)
    end
  end

  describe "GET edit" do
    it "should fail when not logged in" do
      achievement = Achievement.create! valid_attributes
      get :edit, :id => achievement.id.to_s
      assigns(:achievement).should be_nil
      response.should redirect_to(new_user_session_path)
    end

    it "assigns the requested achievement as @achievement" do
      sign_in get_admin_user
      achievement = Achievement.create! valid_attributes
      get :edit, :id => achievement.id.to_s
      assigns(:achievement).should eq(achievement)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "should fail when not logged in" do
        post :create, :achievement => valid_attributes
        assigns(:achievement).should be_nil
        response.should redirect_to(new_user_session_path)
      end

      it "should fail when logged in as non-admin" do
        sign_in get_user
        post :create, :achievement => valid_attributes
        assigns(:achievement).should be_nil
      end

      it "creates a new Achievement" do
        sign_in get_admin_user
        expect {
          post :create, :achievement => valid_attributes
        }.to change(Achievement, :count).by(1)
      end

      it "assigns a newly created achievement as @achievement" do
        sign_in get_admin_user
        post :create, :achievement => valid_attributes
        assigns(:achievement).should be_a(Achievement)
        assigns(:achievement).should be_persisted
      end

      it "redirects to the created achievement" do
        sign_in get_admin_user
        post :create, :achievement => valid_attributes
        response.should redirect_to(Achievement.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved achievement as @achievement" do
        sign_in get_admin_user
        # Trigger the behavior that occurs when invalid params are submitted
        Achievement.any_instance.stub(:save).and_return(false)
        post :create, :achievement => {}
        assigns(:achievement).should be_a_new(Achievement)
      end

      it "re-renders the 'new' template" do
        sign_in get_admin_user
        # Trigger the behavior that occurs when invalid params are submitted
        Achievement.any_instance.stub(:save).and_return(false)
        post :create, :achievement => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "should fail when not logged in" do
        achievement = Achievement.create! valid_attributes
        put :update, :id => achievement.id, :achievement => {:name => "New Name"}
        response.should redirect_to(new_user_session_path)
      end

      it "should fail when logged in as non-admin" do
        sign_in get_user
        achievement = Achievement.create! valid_attributes
        achievement.should_receive(:update_attributes).never
        put :update, :id => achievement.id, :achievement => {:name => "New Name"}
      end

      it "updates the requested achievement" do
        achievement = Achievement.create! valid_attributes
        # Assuming there are no other achievements in the database, this
        # specifies that the Achievement created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Achievement.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        sign_in get_admin_user
        put :update, :id => achievement.id, :achievement => {'these' => 'params'}
      end

      it "assigns the requested achievement as @achievement" do
        sign_in get_admin_user
        achievement = Achievement.create! valid_attributes
        put :update, :id => achievement.id, :achievement => valid_attributes
        assigns(:achievement).should eq(achievement)
      end

      it "redirects to the achievement" do
        sign_in get_admin_user
        achievement = Achievement.create! valid_attributes
        put :update, :id => achievement.id, :achievement => valid_attributes
        response.should redirect_to(achievement)
      end
    end

    describe "with invalid params" do
      it "assigns the achievement as @achievement" do
        sign_in get_admin_user
        achievement = Achievement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Achievement.any_instance.stub(:save).and_return(false)
        put :update, :id => achievement.id.to_s, :achievement => {}
        assigns(:achievement).should eq(achievement)
      end

      it "re-renders the 'edit' template" do
        sign_in get_admin_user
        achievement = Achievement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Achievement.any_instance.stub(:save).and_return(false)
        put :update, :id => achievement.id.to_s, :achievement => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "should fail when not logged in" do
      achievement = Achievement.create! valid_attributes
      expect {
        delete :destroy, :id => achievement.id.to_s
      }.to change(Achievement, :count).by(0)
      response.should redirect_to(new_user_session_path)
    end

    it "should fail when logged in as non-admin" do
      sign_in get_user
      achievement = Achievement.create! valid_attributes
      expect {
        delete :destroy, :id => achievement.id.to_s
      }.to change(Achievement, :count).by(0)
    end

    it "destroys the requested achievement" do
      sign_in get_admin_user
      achievement = Achievement.create! valid_attributes
      expect {
        delete :destroy, :id => achievement.id.to_s
      }.to change(Achievement, :count).by(-1)
    end

    it "redirects to the achievements list" do
      sign_in get_admin_user
      achievement = Achievement.create! valid_attributes
      delete :destroy, :id => achievement.id.to_s
      response.should redirect_to(achievements_url)
    end
  end

end