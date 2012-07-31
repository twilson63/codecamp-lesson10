div '.reveal', ->
  div '.state-background', ''
  div '.slides', ->
    section ->
      h1 'Lesson 11'
      img src: 'http://charlestoncodes.jpg.to', style: 'padding:20px;'
      script '''
        // Delicously hacky. Look away.
        if( navigator.userAgent.match( /(iPhone|iPad|iPod|Android)/i ) ) document.write( '<p style="color: rgba(0,0,0,0.3); text-shadow: none;">('+'Tap to navigate'+')</p>' );
      '''
      h3 'Final Lesson'
    section ->
      h1 'Review'
      h3 'Revisit HackerCourses'
    section ->
      h1 'Hacker Courses'
      h3 '''
      Build and Deploy a working web application that allows users to create 
      courses and vote up or down the courses they want to take.
      '''
    section ->
      section ->
        h1 'Setup'
        h3 'Create app new called "hackercourses"'
      section ->
        h1 'Code'
        pre -> code '.contenteditable', '''
        cd ~/rails
        rvm use 1.9.3
        rails new hackercourses
        cd hackercourses
        '''
    section ->
      section ->
        h1 'Install Thin Gem'
        h3 'Add "thin" to the top your Gemfile'
        h3 'Bundle Install'
      section ->
        h1 'Code'
        h3 'edit /Gemfile'
        pre -> code '.contenteditable', '''
        gem 'thin'
        '''
        h3 'Install Thin'
        pre -> code '.contenteditable', '''
        bundle install
        '''

    section ->
      section ->
        h1 'Devise Gem'
        h3 'Add "devise" to your Gemfile'
        h3 'Bundle Install and Install Devise'
      section ->
        h1 'Code'
        h3 'edit /Gemfile'
        pre -> code '.contenteditable', '''
        gem 'devise'
        '''
        h3 'Install Devise'
        pre -> code '.contenteditable', '''
        bundle install
        rails g devise:install
        '''
        h3 'Follow the instructions from the devise generator'

    section ->
      section ->
        h1 'Install RSpec Gem'
        h3 'Add "rspec-rails" to your Gemfile test group'
        h3 'Bundle Install and Install RSpec'
      section ->
        h1 'Code'
        h3 'edit /Gemfile'
        pre -> code '.contenteditable', '''
        gem 'rspec-rails', :group => :test
        '''
        h3 'Install RSpec'
        pre -> code '.contenteditable', '''
        bundle install
        rails g rspec:install
        '''
    section ->
      section ->
        h1 'Install Cucumber Gem'
        h3 'Add "cucumber-rails" to your Gemfile test group'
        h3 'Bundle Install and Install Cucumber'
      section ->
        h1 'Code'
        h3 'edit /Gemfile'
        pre -> code '.contenteditable', '''
        gem 'cucumber-rails', :group => :test
        '''
        h3 'Install Cucumber'
        pre -> code '.contenteditable', '''
        bundle install
        rails g cucumber:install
        '''
    section ->
      section ->
        h1 'Install DatabaseCleaner Gem'
        h3 'Add "database_cleaner" to your Gemfile test group'
        h3 'Bundle Install'
      section ->
        h1 'Code'
        h3 'edit /Gemfile'
        pre -> code '.contenteditable', '''
        gem 'database_cleaner', :group => :test
        '''
        h3 'Install DatabaseCleaner'
        pre -> code '.contenteditable', '''
        bundle install
        '''
    section ->
      section ->
        h1 'Install Twitter Bootstrap Gem'
        h3 'Add "twitter-bootstrap-rails" to your Gemfile'
        h3 'Bundle Install and Install Bootstrap'
      section ->
        h1 'Code'
        h3 'edit /Gemfile'
        pre -> code '.contenteditable', '''
        gem 'twitter-bootstrap-rails'
        '''
        h3 'Install TwitterBootstrap'
        pre -> code '.contenteditable', '''
        bundle install
        rails g bootstrap:install
        rails g bootstrap:layout application fixed
        '''
    section ->
      section ->
        h1 'Confirm Rspec is installed'
        h3 'Run "rake spec" on the command line'
      section ->
        h3 'Install RSpec'
        pre -> code '.contenteditable', '''
        rake spec
        '''
        h3 'If no error it should be installed.'
    section ->
      section ->
        h1 'Confirm Cucumber is installed'
        h3 'Run "rake cucumber" on the command line'
      section ->
        h3 'Install Cucumber'
        pre -> code '.contenteditable', '''
        rake cucumber
        '''
        h3 'If no error it should be installed.'
    section ->
      section ->
        h1 'Confirm Rails Server'
        h3 'Run "rails s" on the command line'
        h3 'open browser to http://localhost:3000'
        h3 'should see rails page'
      section ->
        h3 'Run Rails Server'
        pre -> code '.contenteditable', '''
        rails s
        '''
        h3 'open browser to http://localhost:3000'
        h3 'should see rails page'
    section ->
      section ->
        h1 'Create Resources'
        h3 'Run "rails g devise User" on the command line'
        h3 'Run "rails g resource Story title url body:text user:references"'
        h3 'Run "rails g resource Comment body:text story:references user:references"'

      section ->
        h3 'Create Resources'
        pre -> code '.contenteditable', '''
        rails g devise User
        rails g resource Story title url body:text user:references
        rails g resource Comment body:text story:references user:references
        '''

    section ->
      section ->
        h1 'Remove index.html'
        h3 'In the public folder'
        h3 'remove the index.html page'

      section ->
        h3 'Remove "public/index.html"'
        pre -> code '.contenteditable', '''
        rm public/index.html
        '''
    section ->
      section ->
        h1 'Create Root Route'
        h3 'Map root to "stories#index"'

      section ->
        h3 'Edit "config/routes.rb"'
        pre -> code '.contenteditable', '''
        root :to => "stories#index"
        '''
    section ->
      section ->
        h1 'Create Story Index View'
        h3 'Create view "index.html.erb"'
        h3 'Add a h1 tag for Hello World'
      hw = escape("<h1>Hello World</h1>")
      section ->
        h3 'Edit "app/views/stories/index.html.erb"'
        pre -> code '.contenteditable', hw
    section ->
      section ->
        h1 'Edit Layout'
        h3 'Edit layout "application.html.erb"'
        h3 'replace link shortcut images/favicon.ico'
        h3 'with link shortcut /favicon.ico'
      favicon1 = escape('<link rel="shortcut icon" href="/images/favicon.ico">')
      favicon2 = escape('<link rel="shortcut icon" href="/favicon.ico">')
      section ->
        h3 'Edit "app/views/layouts/application.html.erb"'
        pre -> code '.contenteditable', favicon1
        h3 'with'
        pre -> code '.contenteditable', favicon2

  comment 'The navigational controls UI'
  aside '.controls', ->
    a '.left', href: '#', '&#x25C4;'
    a '.right', href: '#', '&#x25BA;'
    a '.up', href: '#', '&#x25B2;'
    a '.down', href: '#', '&#x25BC;'
  comment 'Presentation progress bar'
  div '.progress', ->
    span()