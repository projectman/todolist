require 'rails_helper'
require 'date'


describe TodoItem do
  before do
  	 
    @user = User.new(username: "Exampe User", password: "example", 
  				password_confirmation: "example", email: "user@example.ru")
    
    task_date = Date.today + 1
    @todo_list = @user.todo_lists.new(list_name: "TodoList on #{Date.today.strftime("%d %B %Y")} No. 1", 
    								list_due_date: task_date )
    
    @todo_list.save

    @todo_items = Array.new
  	
  	(1..5).each do |i|

  	  @todo_item = @todo_list.todo_items.new(title: "Todo Item on #{Date.today.strftime("%d %B %Y")} No. #{i}", 
  	  										description: "Task No. #{i} must be done. "  )
      @todo_item.save

      @todo_items << @todo_item
    end

  end

  describe "when respond to item_name " do 
    subject {@todo_items[0]}
    it { should respond_to(:title)}
    it { should respond_to(:description)}
  end

  describe "when number of items created matched" do
  	subject { @todo_items.length }
  	it { should eq 5}

  end

  describe "when title matched created " do
  	 
  	subject {@todo_items[0].title} 
    it { should eq "Todo Item on #{Date.today.strftime("%d %B %Y")} No. 1" }

  end

end
