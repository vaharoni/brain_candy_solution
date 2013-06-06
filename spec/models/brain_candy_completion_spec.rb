require 'spec_helper'

describe BrainCandyCompletion do
  describe "#status" do
    before do
      @subject = BrainCandyCompletion.new
    end
    context "when someone verified the completion" do
      before do
        @subject.verifying_user_id = 1
      end
      it "returns :solved status" do
        @subject.status.should == :solved
      end
    end
    context "when no one verified the completion" do
      it "returns :claimed status" do
        @subject.status.should == :claimed
      end
    end
  end
end