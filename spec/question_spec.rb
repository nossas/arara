require 'webmock/rspec'
require "arara"

describe Arara::Question do
  describe ".find_all_by_category_id" do
    let(:questions_page1) { File.open("spec/support/questions_page1.json").read }
    let(:questions_page2) { File.open("spec/support/questions_page2.json").read }
    let(:questions_page3) { File.open("spec/support/questions_page3.json").read }
    let(:time) { Time.now.to_s }
    before{ stub_request(:get, Arara::Question::URL).with(:query => {:token => ENV["VOC_TOKEN"], :by_category_id => 1}).to_return(:body => questions_page1) }
    before{ stub_request(:get, Arara::Question::URL).with(:query => {:token => ENV["VOC_TOKEN"], :by_category_id => 1, :page => 2}).to_return(:body => questions_page2) }
    before{ stub_request(:get, Arara::Question::URL).with(:query => {:token => ENV["VOC_TOKEN"], :by_category_id => 1, :by_updated_at => time}).to_return(:body => questions_page3) }
    it("should return the first page of questions") { Arara::Question.find_all_by_category_id(1).should be_== JSON.parse(questions_page1) }
    it("should return the second page of questions") { Arara::Question.find_all_by_category_id(1, :page => 2).should be_== JSON.parse(questions_page2) }
    it("should return questions filtered by updated_at") { Arara::Question.find_all_by_category_id(1, :by_updated_at => time).should be_== JSON.parse(questions_page3) }
  end
end
