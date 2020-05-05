feature 'User can view list of bookmarks' do
  scenario 'User views homepage' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.askjeeves.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.youtube.com');")

    visit('/bookmarks')
    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.askjeeves.com")
    expect(page).to have_content("http://www.youtube.com")
  end
end
