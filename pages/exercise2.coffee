div '.reveal', ->
  div '.state-background', ''
  div '.slides', ->
    section ->
      h1 'Exercise 2'
      img src: 'http://charlestoncodes.jpg.to', style: 'padding:20px;'
      script '''
        // Delicously hacky. Look away.
        if( navigator.userAgent.match( /(iPhone|iPad|iPod|Android)/i ) ) document.write( '<p style="color: rgba(0,0,0,0.3); text-shadow: none;">('+'Tap to navigate'+')</p>' );
      '''
    section ->
      section ->
        h1 'Feature List Courses'
        pre -> code '.contenteditable', '''
        Feature: List Courses by latest

        Scenario: Happy Path should list courses

        Given I have a course named "Ruby on Rails 101" 
        And I have a course named "NodeJs 101" 
        And I have a course named "JQuery 101"
        When I visit "/latest"
        Then I should see "Ruby on Rails 101"
        And I should see "NodeJs 101"
        And I should see "JQuery 101"
        '''
      section ->
        h3 'Edit "features/latest.feature"'
        pre -> code '.contenteditable', '''
        Feature: List Courses by latest

        Scenario: Happy Path should list courses

        Given I have a course named "Ruby on Rails 101" 
        And I have a course named "NodeJs 101" 
        And I have a course named "JQuery 101"
        When I visit "/latest"
        Then I should see "Ruby on Rails 101"
        And I should see "NodeJs 101"
        And I should see "JQuery 101"
        '''
      section ->
        h3 'Edit "features/step_definitions/story_steps.rb"'
        pre -> code '.contenteditable', '''
        Given /^I have a course named "(.*?)"$/ do |title|
          Story.create(title: title, body: 'FooBarBaz')
        end        '''
        h3 'run cucumber'
        pre -> code '.contenteditable', '''
        rake cucumber
        '''
      section ->
        h1 'Cucumber should fail...'
    section ->
      section ->
        h1 'Code Feature Latest Course'
        ul ->
          li 'Add "/latest" route'
          li 'Create "stories/latest.html.erb" View'
          li 'Create "stories/_story.html.erb" Partial'
          li 'Add scope to stories model'
          li 'Create "story_link" helper'
          li 'Add "latest" action to stories controller'
      section ->
        h3 'Add "/submit" route'
        h3 'edit "config/routes.rb"'
        pre -> code '.contenteditable', '''
        HackerCourses::Application.routes.draw do
          ...
          match '/submit', to: "stories#submit"
          match '/latest', to: "stories#latest"
          ...
        end
        '''
      section ->
        h3 'edit "views/stories/latest.html.erb"'
        latestView1 = escape '''
        <h1>Latest Stories</h1>
        <ul>
          <%= render @stories %>
        </ul>
        '''
        pre -> code '.contenteditable', latestView1
      section ->
        h3 'edit "views/stories/_story.html.erb"'
        partialView1 = escape '''
        <li>
          <%= link_to story.title, story_link(story) %>
        </li>        
        '''
        pre -> code '.contenteditable', partialView1
      section ->
        h3 'edit "app/helpers/stories_helper.rb"'
        pre -> code '.contenteditable', '''
        module StoriesHelper
          def story_link(story)
            story.url.blank? ? story_path(story) : story.url
          end
        end
        '''
      section ->
        h3 'edit "spec/helpers/stories_helper_spec.rb"'
        pre -> code '.contenteditable', '''
        require 'spec_helper'
        describe StoriesHelper do
          describe 'Story Link' do
            context 'with url' do
              let(:story) { Story.create(title: 'foo', url: 'http://foo.com') }
              it 'should return url' do
                story_link(story).should == 'http://foo.com'
              end
            end
            context 'with body' do
              let(:story) { Story.create(title: 'foo', body: 'bar-baz') }
              it 'should return show path if url is blank' do
                story_link(story).should == '/stories/1'
              end
            end
          end
        end
        '''
      section ->
        h3 'edit "spec/models/story_spec.rb"'
        pre -> code '.contenteditable', '''
        require 'spec_helper'
        describe Story do
          it 'requires url if no body' do
            subject.title = "foo"
            ...
          end
          it 'requires body if no url' do
            subject.title = "foo"
            ...
          end
          describe '#latest' do
            before do
              %w{ Foo Bar Baz }.each do |title|
                Story.create title: title, body: title
              end
            end
            it 'should return the last 50 stories' do
              Story.latest.first.title.should == "Baz"
              Story.latest.last.title.should == "Foo"
            end
          end
        end
        '''
      section ->
        h3 'edit "app/models/story.rb"'
        pre -> code '.contenteditable', '''
        class Story < ActiveRecord::Base
          ...
          scope :latest, :order => 'created_at desc', :limit => 50
        end
        '''
      section ->
        h3 'edit "app/controllers/stories_controller.rb"'
        pre -> code '.contenteditable', '''
        class StoriesController < ApplicationController
          ...
          def latest
            @stories = Story.latest
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
        git commit -am "feature latest story"
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