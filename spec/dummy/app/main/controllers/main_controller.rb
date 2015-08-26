# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    def index
      #['Dennet', 'Dawkins', 'Darwin'].each do |surname|
      #    store._authors << Author.new({:surname => surname})
      #end
      #store._authors.where({:surname => 'Dawkins'}).first.then do |author|
      #  book = Book.new({:title => 'The selfish gen.', :author => author, :coauthor => 'Darwin'})
      #  store._books << book
      #  p book
      #  self.model = book
      #end
      self.model = store._books.first
    end

    def about
      # Add code for when the about view is loaded
    end

    private

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
