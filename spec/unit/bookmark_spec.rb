require 'bookmarks'
require 'database_helpers'

describe Bookmarks do
  describe '.all' do
    it "shows a list of URL's" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers")
      Bookmarks.create(url: "http://www.destroyallsoftware.com", title: "Destroy All")
      Bookmarks.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmarks.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
      expect(bookmarks.first.id).to eq bookmark.id
    end
  end

  describe '.create' do
    it "allows a user to create a new bookmark" do
      bookmark = Bookmarks.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')#.first
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end
end
