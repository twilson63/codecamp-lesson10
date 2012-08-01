div '.reveal', ->
  div '.state-background', ''
  div '.slides', ->
    section ->
      h1 'Exercise 4'
      img src: 'http://charlestoncodes.jpg.to', style: 'padding:20px;'
      script '''
        // Delicously hacky. Look away.
        if( navigator.userAgent.match( /(iPhone|iPad|iPod|Android)/i ) ) document.write( '<p style="color: rgba(0,0,0,0.3); text-shadow: none;">('+'Tap to navigate'+')</p>' );
      '''
    section ->
      section ->
        h3 'Feature Show Courses'
        pre -> code '.contenteditable', '''
        Feature: Show Story

        Scenario: Story show if text no url

        Given I have a course named "Foo" with "A Foo Bar Course"
        And I visit "/latest"
        When I click link "Foo"
        Then I should see "A Foo Bar Course"
        '''
      section ->
        h3 'edit "features/stories/show_story.feature"'
        pre -> code '.contenteditable', '''
        Feature: Show Story

        Scenario: Story show if text no url

        Given I have a course named "Foo" with "A Foo Bar Course"
        And I visit "/latest"
        When I click link "Foo"
        Then I should see "A Foo Bar Course"
        '''
      section ->
        h3 'edit "app/views/stories/show.html.erb"'
        pre -> code '.contenteditable', '''
        <h1>Show Story</h1>
        <table class="table table-bordered">
          <tr>
            <th>Title</th>
            <td><h2><%= @story.title %></h2></td>
          </tr>
          <tr>
            <th>Body</th>
            <td><%= @story.body %></td>
          </tr>
        </table>
        <div><%= link_to 'Back', root_path, :class => 'btn btn-primary' %></div>        
        '''
      section ->
        h3 'edit "app/controllers/stories_controller.rb"'
        pre -> code '.contenteditable', '''
        class StoriesController < ApplicationController

          def index
          end
          ...
          def show
            @story = Story.find(params[:id])
          end
          ...
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