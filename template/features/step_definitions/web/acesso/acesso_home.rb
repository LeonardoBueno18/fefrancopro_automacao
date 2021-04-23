Dado('que esteja na home') do
  @home_page = $web_pages.home
  @home_page.load
end
