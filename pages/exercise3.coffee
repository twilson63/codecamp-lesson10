div '.reveal', ->
  div '.state-background', ''
  div '.slides', ->
    section ->
      h1 'Exercise 3'
      a href: '/#/1', ->
        img src: 'http://charlestoncodes.jpg.to', style: 'padding:20px;'
      script '''
        // Delicously hacky. Look away.
        if( navigator.userAgent.match( /(iPhone|iPad|iPod|Android)/i ) ) document.write( '<p style="color: rgba(0,0,0,0.3); text-shadow: none;">('+'Tap to navigate'+')</p>' );
      '''
    section ->
      section ->
        h3 'Feature Edit Courses'
        pre -> code '.contenteditable', '''
        Feature: Edit Story

        Scenario: Story can be edited
        # within 25 minutes of create date

        Given I have a course named "Foo"
        And I visit "/latest"
        And I click link "Edit"
        When I fill in "Title" with "Bar"
        And I click "Submit"
        Then I should see "Successfully updated course"        
        '''
      section ->
        h3 'edit "features/stories/edit_story.feature"'
        pre -> code '.contenteditable', '''
        Feature: Edit Story

        Scenario: Story can be edited
        # within 25 minutes of create date

        Given I have a course named "Foo"
        And I visit "/latest"
        And I click link "Edit"
        When I fill in "Title" with "Bar"
        And I click "Submit"
        Then I should see "Successfully updated course"                
        '''
      section ->
        h3 'edit "features/step_definitions/web_steps.rb"'
        pre -> code '.contenteditable', '''
        ...
        When /^I click "(.*?)"$/ do |text|
          click_button text
        end
        ...
        '''
      section ->
        h3 'edit "app/views/_form.html.erb"'
        pre -> code '.contenteditable', '''
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
      section ->
        h3 'edit "app/views/new.html.erb"'
        pre -> code '.contenteditable', '''
        <h1>Submit Course</h1>
        <%= render 'form' %>
        '''
      section ->
        h3 'edit "app/views/edit.html.erb"'
        pre -> code '.contenteditable', '''
        <h1>Edit Course</h1>
        <%= render 'form' %>
        '''
      section ->
        h3 'edit "features/stories/destroy_story.feature"'
        pre -> code '.contenteditable', '''
        Feature: Destroy Story

        Scenario: Story can be destroyed
        # within 25 minutes of create date

        Given I have a course named "Foo"
        And I visit "/latest"
        And I click link "Remove"
        Then I should see "Successfully removed course"
        And I should not see "Foo"
        '''
      section ->
        h3 'edit "app/views/stories/_story.html.erb"'
        pre -> code '.contenteditable', '''
        <li>
          <h2 style="display: inline;>"
            <%= link_to story.title, story_link(story) %>
          </h2>
          <%= link_to 'Edit', edit_story_path(story), :class => 'btn' %>
          |
          <%= link_to 'Remove', story_path(story), :method => :delete, :confirm => 'Are you sure?', :class => 'btn' %>  
        </li>        
        '''
      section ->
        h3 'edit "app/controllers/stories_controller.rb"'
        pre -> code '.contenteditable', '''
        class StoriesController < ApplicationController
          ...
          def edit
            @story = Story.find(params[:id])
          end

          def update
            @story = Story.find(params[:id])
            respond_to do |format|
              if @story.update_attributes(params[:story])
                format.html { redirect_to root_path, notice: 'Successfully updated course' }
              else
                format.html { render action: 'edit' }
              end
            end
          end

          def destroy
            Story.find(params[:id]).destroy
            redirect_to root_path, notice: 'Successfully removed course'
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
        git commit -am "edit and destroy story"
        '''
      section ->
        h1 'Completed Exercise 3'
        a href: '/#/1', ->
          img src: 'http://charlestoncodes.jpg.to', style: 'padding:20px;'

        script '''
          // Delicously hacky. Look away.
          if( navigator.userAgent.match( /(iPhone|iPad|iPod|Android)/i ) ) document.write( '<p style="color: rgba(0,0,0,0.3); text-shadow: none;">('+'Tap to navigate'+')</p>' );
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