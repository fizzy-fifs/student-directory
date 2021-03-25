def input_students
  puts "Please enter the student's name"
  name = gets.chomp
  puts "Please enter the student's age"
  age = gets.chomp
  puts "Please enter the student's height"
  height = gets.chomp
  puts "Please enter the student's country of birth"
  c_o_b = gets.chomp
  # create an empty array
  students = []

  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, age: age, height: height, c_o_b: c_o_b}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------------"
end

def print(students)
  while !students.empty? do
    puts "#{(students[:name])} (#{students[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)