require 'bookmarks'

describe Bookmarks do
  it "shows a list of URL's" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.askjeeves.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.youtube.com');")

    bookmarks = ["http://www.makersacademy.com", "http://www.askjeeves.com", "http://www.youtube.com"]
    expect(Bookmarks.all).to eq(bookmarks)
  end
end
