class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

 def get_married(person)
    self.partner = person
    person.partner = self
  end
 
  # Add the following two lines:
  class PartnerError < StandardError
  end
end
 
beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name
Now we're ready to use our custom error inside our #get_married method.

Step 2: Raising our custom error
We need to tell our program to raise our brand new PartnerError when the argument passed into the #get_married method is not an instance of the Person class. We can do that with the raise keyword. Place the following code in your #get_married method:

class Person
  attr_accessor :partner, :name
 
  def initialize(name)
    @name = name
  end
 
  def get_married(person)
    self.partner = person
    if person.class != Person
      raise PartnerError
    else
      person.partner = self
    end
  end
 
  class PartnerError < StandardError
  end
end
 
beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name



