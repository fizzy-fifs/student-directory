def input_students
  puts "Please enter the student's name"
  name = gets.chomp
  puts "Please enter the student's age"
  age = gets.chomp
  puts "Please enter the student's height"
  height = gets.chomp
  puts "Please enter the student's country of birth"
  c_o_b = gets.chomp
  puts "Please enter the student's cohort"
  cohort = gets.chomp.to_sym
  if cohort.empty?
    cohort = :november
  end
  # create an empty array
  students = []

  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort, age: age, height: height, c_o_b: c_o_b}
    puts "Now we have #{students.count} students"
  
    #get another student info from the user
    puts "Please enter the student's name. Hit return again to finish"
    name = gets.chomp
    puts "Please enter the student's age"
    age = gets.chomp
    puts "Please enter the student's height"
    height = gets.chomp
    puts "Please enter the student's country of birth"
    c_o_b = gets.chomp
    puts "Please enter the student's cohort"
    cohort = gets.chomp.to_sym
    if cohort.empty?
      cohort = :november
    end
  end
  #return the array of students
  students
end

def spellcheck(cohort)
  month = [
    "january",
    "february",
    "march",
    "april",
    "may",
    "june",
    "july",
    "august",
    "september",
    "october",
    "november",
    "december",
  ]

  month.each do |x| if cohort[0..2].downcase == x[0..2].downcase then cohort = x end end
  cohort.to_sym
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------------"
end

def print(students)
  while true do
    students.select.with_index(1) do |student, index| 
      if student[:name].length < 12
        puts "#{index} #{student[:name].center(2)}. Age: #{student[:age].center(2)} Height: #{student[:height].center(2)}. 
        Born in #{student[:c_o_b].center(2)} (#{student[:cohort]} cohort)"
      end
    end 
    break
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