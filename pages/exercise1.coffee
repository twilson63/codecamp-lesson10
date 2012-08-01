div '.reveal', ->
  div '.state-background', ''
  div '.slides', ->
    section ->
      h1 'Exercise 1'
      a href: '/#/1', ->
        img src: 'http://charlestoncodes.jpg.to', style: 'padding:20px;'
      script '''
        // Delicously hacky. Look away.
        if( navigator.userAgent.match( /(iPhone|iPad|iPod|Android)/i ) ) document.write( '<p style="color: rgba(0,0,0,0.3); text-shadow: none;">('+'Tap to navigate'+')</p>' );
      '''
      h3 'Final Lesson'
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
    section ->
      section ->
        h1 'Migrate the Database'
        h3 'run "rake db:migrate" on the command-line'
      section ->
        h3 'run rake db:migrate'
        pre -> code '.contenteditable', '''
        rake db:migrate
        '''
    section ->
      section ->
        h1 'Create Repository'
        h3 'Initialize Git Repository'
        h3 'Run First Commit'
      section ->
        h3 'Create and Commit Git Repo'
        pre -> code '.contenteditable', '''
        git init
        git add .
        git commit -am "first commit"
        '''
    section ->
      section ->
        h1 'Setup Story Model'
        h3 'Story model has many comments'
      section ->
        h3 'Edit "app/models/story.rb"'
        pre -> code '.contenteditable', '''
        class Story < ActiveRecord::Base
          ...
          has_many :comments
        end
        '''
    section ->
      section ->
        h1 'First Cucumber Feature'
        pre -> code '.contenteditable', '''
        Feature: First Feature

        Scenario: Valid Cucumber

        Given I am on the home page
        Then I should see "Hello World"
        '''
      section ->
        h3 'Edit "features/index.feature"'
        pre -> code '.contenteditable', '''
        Feature: First Feature

        Scenario: Valid Cucumber

        Given I am on the home page
        Then I should see "Hello World"
        '''
      section ->
        h3 'Edit "features/steps_definitions/index_steps.rb"'
        pre -> code '.contenteditable', '''
        Given /^I am on the home page$/ do
          visit '/'
        end

        Then /^I should see "(.*?)"$/ do |arg1|
          page.should have_content(arg1)
        end
        '''
        h3 'run cucumber'
        pre -> code '.contenteditable', '''
        rake cucumber
        '''
    section ->
      section ->
        h1 'Feature Submit Course'
        pre -> code '.contenteditable', '''
        Feature: Submit Course

        Scenario: Happy Path

        Given I visit "/submit"
        When I fill in "Title" with "Foo Bar"
        When I fill in "Url" with "http://www.google.com"
        When I click "Submit"
        Then I should see "Successfully submitted course"
        '''
      section ->
        h3 'Edit "features/submit.feature"'
        pre -> code '.contenteditable', '''
        Feature: Submit Course

        Scenario: Happy Path

        Given I visit "/submit"
        When I fill in "Title" with "Foo Bar"
        When I fill in "Url" with "http://www.google.com"
        When I click "Submit"
        Then I should see "Successfully submitted course"
        '''
      section ->
        h3 'Edit "features/step_definitions/web_steps.rb"'
        pre -> code '.contenteditable', '''
        Given /^I visit "(.*?)"$/ do |url|
          visit url
        end

        When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
          fill_in field, with: value
        end

        When /^I click "(.*?)"$/ do |text|
          click_button text
        end
        '''
        h3 'run cucumber'
        pre -> code '.contenteditable', '''
        rake cucumber
        '''
      section ->
        h1 'Cucumber should fail...'
    section ->
      section ->
        h1 'Code Feature Submit Course'
        ul ->
          li 'Add "/submit" route'
          li 'Create "stories/new.html.erb" Form'
          li 'Create "new" action in Stories Controller'
          li 'Create "create" action in Stories Controlller'
          li 'Add Flash Notice to Layout'
      section ->
        h3 'Add "/submit" route'
        h3 'edit "config/routes.rb"'
        pre -> code '.contenteditable', '''
        HackerCourses::Application.routes.draw do
          ...
          root :to => "stories#index"
          match '/submit', to: "stories#new"
          ...
        end
        '''
      section ->
        h3 'edit "views/stories/new.html.erb"'
        newView1 = escape '''
        <h1>Submit Course</h1>
        <%= form_for @story do |f| %>
          <fieldset>
            <%= f.label :title %>
            <%= f.text_field :title %>
          </fieldset>
          <fieldset>
            <%= f.label :url %>
            <%= f.text_field :url %>
          </fieldset>
          <fieldset>
            <%= f.label :body, 'Text' %>
            <%= f.text_field :body %>
          </fieldset>
          <%= f.submit "Submit" %>
        <% end %>
        '''
        pre -> code '.contenteditable', newView1
      section ->
        h3 'Create "new" action in Stories Controller'
        h3 'edit "app/controllers/stories_controller.rb"'
        pre -> code '.contenteditable', '''
        class StoriesController < ApplicationController
          ...
          def new
            @story = Story.new
          end
          ...
        end
        '''
      section ->
        h3 'Create "create" action in Stories Controller'
        h3 'edit "app/controllers/stories_controller.rb"'
        pre -> code '.contenteditable', '''
        class StoriesController < ApplicationController
          ...
          def create
            @story = Story.new(params[:story])
            respond_to do |format|
              if @story.save
                format.html { redirect_to root_path,
                  notice: 'Successfully submitted course' }
              else
                format.html { render action: 'new' }
              end
            end
          end
          ...
        end
        '''
      section ->
        h3 'edit "app/views/layouts/application.html.erb"'
        pre -> code '.contenteditable', '''
        <!DOCTYPE html>
        <html lang="en">
          ...
          <body>
            ...
            <% if flash[:notice] %>
              <div class="alert-message info">
                <%= content_tag :div, flash[:notice] %>
              </div>
            <% end %>
            ...
          </body>
        </html>
        '''
      section ->
        h3 'run our cucumber test'
        pre -> code '.contenteditable', '''
        rake cucumber
        '''
        h3 'read errors and debug...'
    section ->
      section ->
        h3 'Submit Story'
        h3 'Sad Path'
        pre -> code '.contenteditable', '''
        Scenario: Sad Path

        Given I visit "/submit"
        When I fill in "Title" with "Foo Bar"
        When I click "Submit"
        Then I should not see "Successfully submitted course"
        '''
        h3 'press the down arrow to see the steps...'
      section ->
        h1 'steps'
        ul ->
          li 'Add scenario to "submit.feature"'
          li 'Add step defintion'
          li ->
            p 'Add validation to story model'
            p 'title should be required'
            p 'url or body should required'
          li 'Create RSpec Test for story model validation'
      section ->
        h3 'edit "features/submit.feature"'
        pre -> code '.contenteditable', '''
        Feature: Submit Course
        ...
        Scenario: Sad Path

        Given I visit "/submit"
        When I fill in "Title" with "Foo Bar"
        When I click "Submit"
        Then I should not see "Successfully submitted course"
        ...
        '''
      section ->
        h3 'edit "features/step_definitions/web_steps.rb"'
        pre -> code '.contenteditable', '''
        ...
        Then /^I should not see "(.*?)"$/ do |arg1|
          page.should_not have_content(arg1)
        end
        '''
      section ->
        h3 'edit "app/models/story.rb"'
        pre -> code '.contenteditable', '''
        class Story < ActiveRecord::Base
          ...
          # validations
          validates :title, :presence => true
          validates :url, :presence => true, :if => "body.blank?"
          validates :body, :presence => true, :if => "url.blank?"
        end
        '''
      section ->
        h3 'edit "spec/models/story_spec.rb"'
        pre -> code '.contenteditable', '''
        require 'spec_helper'

        describe Story do
          it 'requires url if no body' do
            subject.title = 'test'
            subject.url = 'http://foo.com'
            subject.body = nil
            subject.should be_valid
          end

          it 'requires body if no url' do
            subject.title = 'test'
            subject.body = 'foo bar'
            subject.url = nil
            subject.should be_valid
          end
        end  
        
        '''
      section ->
        h3 'run rspec test'
        pre -> code '.contenteditable', '''
        rake spec
        '''
      section ->
        h3 'commit to git'
        pre -> code '.contenteditable', '''
        git add .
        git commit -am "feature submit story"
        '''
      section ->
        h1 'Completed Exercise 1'
        a href: '/#/1', ->
          img src: 'http://charlestoncodes.jpg.to', style: 'padding:20px;'
        script '''
          // Delicously hacky. Look away.
          if( navigator.userAgent.match( /(iPhone|iPad|iPod|Android)/i ) ) document.write( '<p style="color: rgba(0,0,0,0.3); text-shadow: none;">('+'Tap to navigate'+')</p>' );
        '''
        h3 'Final Lesson'
      
  comment 'The navigational controls UI'
  aside '.controls', ->
    a '.left', href: '#', '&#x25C4;'
    a '.right', href: '#', '&#x25BA;'
    a '.up', href: '#', '&#x25B2;'
    a '.down', href: '#', '&#x25BC;'
  
  comment 'Presentation progress bar'
  div '.progress', ->
    span()