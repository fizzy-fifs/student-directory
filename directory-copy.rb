@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do    
    print_menu
    process(gets.chomp)
  end
end

def show_students
  print_header
  print_students_list
  print_footer
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
  # create an empty array
  @students = []
  while true do
    #get another student info from the user
    puts "Please enter the student's name. Hit return again to finish"
    name = gets.gsub("\n","")
    break if name.empty?
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
    #add the student hash to the array
    @students << {name: name, cohort: cohort, age: age, height: height, c_o_b: c_o_b}
    puts "Now we have #{@students.count} students"
  end
end

def cohort(students)
  cohorts = []
  @students.each do |x| 
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
  cohort_list = cohort(@students)
  cohort_list.each do |month|
    @students.each do |x| 
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

def print_students_list
  while true do
    @students.each do |student|
      if student[:name] == nil
        puts "You have not entered a student name"
      end
    end
    @students.select.with_index(1) do |student, index| 
      if student[:name].length < 12
        puts "#{index} #{student[:name].center(5)}; Age: #{student[:age].center(5)}; Height: #{student[:height].center(5)}; Born in #{student[:c_o_b].center(5)} (#{student[:cohort]} cohort)".center(10)
      end
    end 
    break
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  elsif @students.count == 0
    puts "There are no students info in the directory"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

#nothing happens until we call the methods
interactive_menu 
print_by_cohort(students)