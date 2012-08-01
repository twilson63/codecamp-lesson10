div '.reveal', ->
  div '.state-background', ''
  div '.slides', ->
    section ->
      h1 'Exercise 6'
      img src: 'http://charlestoncodes.jpg.to', style: 'padding:20px;'
      script '''
        // Delicously hacky. Look away.
        if( navigator.userAgent.match( /(iPhone|iPad|iPod|Android)/i ) ) document.write( '<p style="color: rgba(0,0,0,0.3); text-shadow: none;">('+'Tap to navigate'+')</p>' );
      '''
    section ->
      section ->
        h3 'Feature New Comments'
        pre -> code '.contenteditable', '''
        Feature: Vote for Story/Course

        Scenario: Vote Up Story/Course

        Given I have a course named "Ruby on Rails 101" 
        When I visit "/"
        And I should see "up 0 down 0"
        And I click link "Vote Up"
        Then I should see "up 1 down 0"
        '''
      section ->
        h3 'edit "features/stories/vote.feature"'
        pre -> code '.contenteditable', '''
        Feature: Vote for Story/Course

        Scenario: Vote Up Story/Course

        Given I have a course named "Ruby on Rails 101" 
        When I visit "/"
        And I should see "up 0 down 0"
        And I click link "Vote Up"
        Then I should see "up 1 down 0"
        '''
      section ->
        h3 'config/routes.rb'
        pre -> code '.contenteditable', '''
        Chscodes::Application.routes.draw do
          resources :stories do
            resources :comments
            member do
              post 'up'
              post 'down'
            end
          end
          ...
        end
        '''
      section ->
        h3 'add up and down votes'
        pre -> code '.contenteditable', '''
        rails g migration AddVotesToStories
        '''
      section ->
        h3 'edit "db/migrations/2012...add_votes_to_stories.rb"'
        pre -> code '.contenteditable', '''
        class AddPointsToStories < ActiveRecord::Migration
          def up
            add_column :stories, :up, :integer
            add_column :stories, :down, :integer
          end
          def down
            remove_column :stories, :up
            remove_column :stories, :down
          end
        end
        '''
      section ->
        h3 'apply migration'
        pre -> code '.contenteditable', '''
        rake db:migrate
        '''

      section ->
        pre -> code '.contenteditable', '''
        <li>
          ...
          <br />
          <%= link_to "+1", up_story_path(story), :method => :post, :class => 'btn btn-primary' %>
          <%= link_to "-1", down_story_path(story), :method => :post, :class => 'btn btn-secondary' %>
          <p>
           <label>Votes:</label>
           <%= "up #{story.up || 0} down #{story.down || 0}" %>
          </p>
        </li>        
        '''
      section ->
        h3 'edit "app/views/comments/new.html.erb"'
        pre -> code '.contenteditable', '''
        <h1>New Comment for <%= @story.title %></h1>
        <%= form_for [@story, @comment] do |f| %>
          <fieldset>
            <%= f.label :body, "Comment" %>
            <%= f.text_area :body %>
          </fieldset>
          <%= f.submit "Submit" %>
        <% end %>
        '''
      section ->
        h3 'edit "app/controllers/comments_controller.rb"'
        pre -> code '.contenteditable', '''
        class StoriesController < ApplicationController

          def index
            @stories = Story.limit(50).all
          end
          ...
          def up
            @story = Story.find(params[:id])
            up = @story.up.nil? ? 1 : @story.up + 1
            @story.update_attribute('up', up)
            redirect_to root_path
          end

          def down
            @story = Story.find(params[:id])
            @story.down = @story.down.nil? ? 1 : @story.down + 1
            @story.update_attribute('down', down)
            redirect_to root_path
          end
        end
        '''
      section ->
        h3 'edit "app/views/stories/index.html.erb"'
        pre -> code '.contenteditable', '''
        <h1>Top Courses</h1>
        <ul>
          <%= render @stories %>
        </ul>        
        '''
      section ->
        h3 'edit "spec/features/index.feature"'
        pre -> code '.contenteditable', '''
        Feature: First Feature

        Scenario: Valid Cucumber

        Given I am on the home page
        Then I should see "Top Courses"
        '''
      section ->
        h3 'run our cucumber test'
        pre -> code '.contenteditable', '''
        rake cucumber
        '''
        h3 'read errors and debug...'
      section ->
        h3 'run rspec test'
        pre -> code '.contenteditable', '''
        rake spec
        '''
      section ->
        h3 'commit to git'
        pre -> code '.contenteditable', '''
        git add .
        git commit -am "show story"
        '''
  comment 'The navigational controls UI'
  aside '.controls', ->
    a '.left', href: '#', '&#x25C4;'
    a '.right', href: '#', '&#x25BA;'
    a '.up', href: '#', '&#x25B2;'
    a '.down', href: '#', '&#x25BC;'
  comment 'Presentation progress bar'
  div '.progress', ->
    span()