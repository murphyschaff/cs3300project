require "rails_helper"

describe "Project Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the opponent is present when creating project" do
      project = Match.new(score: 12, location: "Content of the description")
      expect(project.valid?).to eq(false)
    end
    it "should not be able to save project when opponent is missing" do
      project = Match.new(score: 12, location: "Some description content goes here")
      expect(project.save).to eq(false)
    end
    it "should not be able to save project when score is missing" do
        match = Match.new(opponent: "Bobo", location: "mom")
        expect(match.save).to eq(false)
    end
    it "should not be able to save project when location is missing" do
        match = Match.new(opponent: "bob", score: 12)
        expect(match.save).to eq(false)
    end
    it "should be able to save project when have description and title" do
      project = Match.new(opponent: "Title", score: 12, location: "Content of the description")
      expect(project.save).to eq(true)
    end
  end
end

describe "Match Attribute Requirements on Edit", :type => :model do
  context "Edit Match" do  
    before (:each) do
      @match = Match.create(opponent: "Bob", score: 12, location: "dune", notes: "hi")
 
      end
    it "ensures the title is present when editing project" do
      @match.update(:opponent => "dude")
      expect(@match.opponent == "dude")
    end
    it "ensures score is present when editing project" do
        @match.update(:score => 13)
        expect(@match.score == 13)
    end
    it "ensures location is present when editing project" do
        @match.update(:location => "denver")
        expect(@match.location == "denver")
    end
    it "ensures notes can be changed" do
        @match.update(:notes => "")
        expect(@match.notes == "")
    end
  end
end
