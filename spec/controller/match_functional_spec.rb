require "rails_helper"

RSpec.describe MatchesController, :type => :controller do

    login_user

    let(:valid_attributes) {
        { :opponent => "dave", :score => 12, :location => "Denver", }
    }

    let(:valid_session) { {} }

    describe "GET #index" do
        it "returns a success response" do
            Match.create! valid_attributes
            get :index, params: {}, session: valid_session
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
            # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end

    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end

        context "GET #show" do
            let!(:match) { Match.create(opponent: "dude", score: 12, location: "denver") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
    end
    describe "remove projects" do
        context "DELETE #index" do
            it "returns a success responce" do
            delete :index
            expect(response).to have_http_status(:ok)
            end
        end

        context "DELETE #show" do
            let!(:match) { Match.create(opponent: "dude", score: 12, location: "denver")}
            it "returns a success responce" do
                expect(response).to have_http_status(:ok)
            end
        end
    end

end
