# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here
  def full_name
    if @middle_name
      @first_name + " " + @middle_name + " " + @last_name
    else
      @first_name + " " + @last_name
    end
  end

  def full_name_with_middle_initial
    if @middle_name
      @first_name + " " + @middle_name.split('')[0] + ". " + @last_name
    else
      @first_name + " " + @last_name
    end
  end

  def initials
    if @middle_name
      @first_name.split('').first + @middle_name.split('').first + @last_name.split('').first
    else
      @first_name.split('').first + @last_name.split('').first
    end
  end
end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new(first_name: "Benjamin", middle_name: "James", last_name: "Skiff")
      expect(person.full_name).to eq("Benjamin James Skiff")
    end
    it "does not add extra spaces if middle name is missing" do
      person = Person.new(first_name: "Benjamin", last_name: "Skiff")
      expect(person.full_name).to eq("Benjamin Skiff")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "concatenates first name, middle initial with period, and last name with spaces" do
      person = Person.new(first_name: "Benjamin", middle_name: "James", last_name: "Skiff")
      expect(person.full_name_with_middle_initial).to eq("Benjamin J. Skiff")
    end
    it "does not add an extra space or period if no middle name entered" do
      person = Person.new(first_name: "Benjamin", last_name: "Skiff")
      expect(person.full_name_with_middle_initial).to eq("Benjamin Skiff")
    end
  end

  describe "#initials" do
    it "concatenates first initial of all 3 names" do
      person = Person.new(first_name: "Benjamin", middle_name: "James", last_name: "Skiff")
      expect(person.initials).to eq("BJS")
    end
    it "returns 2 characters if middle name is missing" do
      person = Person.new(first_name: "Benjamin", last_name: "Skiff")
      expect(person.initials).to eq("BS")
    end
  end
end
