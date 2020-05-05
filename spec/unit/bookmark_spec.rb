require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    it "shows a list of URL's" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmarks.create(url: "http://www.makersacademy.com")
      Bookmarks.create(url: "http://www.destroyallsoftware.com")
      Bookmarks.create(url: "http://www.google.com")

      bookmarks = ["http://www.makersacademy.com", "http://www.destroyallsoftware.com", "http://www.google.com"]
      expect(Bookmarks.all).to eq(bookmarks)
    end
  end

  describe '.create' do
    it "allows a user to create a new bookmark" do
      Bookmarks.create(url: 'http://www.testbookmark.com')

      expect(Bookmarks.all).to include('http://www.testbookmark.com')
    end
  end
end
