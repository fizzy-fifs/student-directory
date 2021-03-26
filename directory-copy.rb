def interactive_menu
  students = []
  loop do
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #2. read the input and save it into a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit #this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
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
    "december"
  ]
  month.each do |x| if cohort[0..2].downcase == x[0..2].downcase then cohort = x end end
  cohort.to_sym
end

def input_students
  puts "Please enter the student's name"
  name = gets.gsub("\n","")
  puts "Please enter the student's age"
  age = gets.gsub("\n","")
  puts "Please enter the student's height"
  height = gets.gsub("\n","")
  puts "Please enter the student's country of birth"
  c_o_b = gets.gsub("\n","")
  puts "Please enter the student's cohort"
  cohort = gets.gsub("\n","").to_sym
  cohort = spellcheck(cohort)
  if cohort.empty?
    cohort = :unknown
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
    name = gets.gsub("\n","")
    puts "Please enter the student's age"
    age = gets.gsub("\n","")
    puts "Please enter the student's height"
    height = gets.gsub("\n","")
    puts "Please enter the student's country of birth"
    c_o_b = gets.gsub("\n","")
    puts "Please enter the student's cohort"
    cohort = gets.gsub("\n","").to_sym
    cohort = spellcheck(cohort)
    if cohort.empty?
      cohort = :unknown
    end
  end
  #return the array of students
  students
end

def cohort(students)
  cohorts = []
  students.each do |x| 
    if cohorts.empty?
      cohorts << x[:cohort]
    elsif cohorts.include? x[:cohort]
      next
    else
      cohorts << x[:cohort]
    end
  end
  cohorts
end

def print_by_cohort(students)
  cohort_list = cohort(students)
  cohort_list.each do |month|
    students.each do |x| 
      if x[:cohort] == month
        puts "#{x[:name].center(5)}; Age: #{x[:age].center(5)}; Height: #{x[:height].center(5)}; Born in #{x[:c_o_b].center(5)} (#{x[:cohort]} cohort)".center(10)
      else
        next
      end
    end
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------------"
end

def print(students)
  while true do
    students.each do |student|
      if student[:name] == nil
        puts "You have not entered a student name"
      end
    end
    students.select.with_index(1) do |student, index| 
      if student[:name].length < 12
        puts "#{index} #{student[:name].center(5)}; Age: #{student[:age].center(5)}; Height: #{student[:height].center(5)}; Born in #{student[:c_o_b].center(5)} (#{student[:cohort]} cohort)".center(10)
      end
    end 
    break
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  elsif names.count == 0
    puts "There are no students info in the directory"
  else
    puts "Overall, we have #{names.count} great students"
  end
end


#nothing happens until we call the methods
interactive_menu 
print_by_cohort(students)