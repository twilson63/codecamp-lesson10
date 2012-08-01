div '.reveal', ->
  div '.state-background', ''
  div '.slides', ->
    section ->
      h1 'Exercise 5'
      img src: 'http://charlestoncodes.jpg.to', style: 'padding:20px;'
      script '''
        // Delicously hacky. Look away.
        if( navigator.userAgent.match( /(iPhone|iPad|iPod|Android)/i ) ) document.write( '<p style="color: rgba(0,0,0,0.3); text-shadow: none;">('+'Tap to navigate'+')</p>' );
      '''
    section ->
      section ->
        h3 'Feature New Comments'
        pre -> code '.contenteditable', '''
        Feature: New Comment

        Scenario: Happy Path

        Given I have a course named "Rails" 
        And I visit "/latest"
        And I click link "new comment"
        When I fill in "Comment" with "Foo Bar.............................."
        And I click "Submit"
        Then I should see "Successfully submitted comment"
        And I visit "/latest"
        And I should see "comments (1)"
        '''
      section ->
        h3 'edit "features/comments/new.feature"'
        pre -> code '.contenteditable', '''
        Feature: New Comment

        Scenario: Happy Path

        Given I have a course named "Rails" 
        And I visit "/latest"
        And I click link "new comment"
        When I fill in "Comment" with "Foo Bar.............................."
        And I click "Submit"
        Then I should see "Successfully submitted comment"
        And I visit "/latest"
        And I should see "comments (1)"
        '''
      section ->
        h3 'config/routes.rb'
        pre -> code '.contenteditable', '''
        Chscodes::Application.routes.draw do
          resources :stories do
            resources :comments
          end

          devise_for :users
          ...
        end
        '''
      section ->
        h3 'edit "app/views/stories/_story.html.erb"'
        pre -> code '.contenteditable', '''
        <li>
          ...
          <br />
          <%= link_to 'new comment', new_story_comment_path(story) %>
          <%= link_to "comments (#{story.comments.count})", story_path(story) %>
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
        class CommentsController < ApplicationController

          def new
            @story = Story.find(params[:story_id])
            @comment = @story.comments.build
          end

          def create
            @comment = Story.find(params[:story_id]).comments.build(params[:comment])
            respond_to do |format|
              if @comment.save
                format.html { redirect_to root_path, notice: 'Successfully submitted comment'}
              else
                format.html { render 'new' }
              end
            end
          end
        end
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