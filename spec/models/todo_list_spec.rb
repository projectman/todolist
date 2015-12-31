require 'rails_helper'
require 'date'


describe TodoList do

  before do
  	 
  	@user = User.new(username: "Exampe User", password: "example", 
  				password_confirmation: "example", email: "user@example.ru")
    
    @todo_lists = Array.new
  	
  	(1..5).each do |i|
  	  task_day = Date.new + 1
  	  @todo_list = @user.todo_lists.new(list_name: "TodoList on #{Date.today.strftime("%d %B %Y")} No. #{i}",
  	  									list_due_date: task_day)
      @todo_list.save

      @todo_lists << @todo_list
    end

  end

  describe "when respond to list_name " do 
    subject {@todo_lists[0]}
    it { should respond_to(:list_name)}
    it { should respond_to( :list_due_date)}
  end

  describe "when number of lists created matched" do
  	subject { @todo_lists.length }
  	it { should eq 5}

  end

  describe "when list_name matched created " do
  	 
  	subject {@todo_lists[0].list_name} 
    it { should eq "TodoList on #{Date.today.strftime("%d %B %Y")} No. 1" }

  end

  #check sort of list by ... variable of sort
  
end

