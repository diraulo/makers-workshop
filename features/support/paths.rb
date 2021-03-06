# Taken from the cucumber-rails project.

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the Course index page/
      '/courses/index'
    when /Create course page/
      '/courses/create'
    when /Registration page/
      '/users/register'
    when /Log in page/
      '/users/login'
    when /^(.*) show page$/i
      delivery = Delivery.find(date: $1).first
      "/courses/deliveries/show/#{delivery.id}"
    when /the valid certificate page/
      c = Certificate.last
      "/verify/#{c.identifier}"
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
