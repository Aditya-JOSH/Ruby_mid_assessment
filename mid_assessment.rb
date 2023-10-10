# Module for Prime Number Checking
module PrimeChecker

    def prime?
      return false if self <= 1
  
      (2..Math.sqrt(self)).none? { |i| (self % i).zero? }
    end
  end
  
  # Module for School Level Determination
  module SchoolLevel
    def determine_school_level(grade)
      case grade
      when 1..5 then 'Elementary'
      when 6..8 then 'Middle School'
      when 9..12 then 'High School'
      else 'College'
      end
    end
  end
  
  # Class for Student
  class Student
    include SchoolLevel
  
    def initialize(grade)
      @grade = grade.to_i
    end
  
    def school_level
        determine_school_level(@grade)    
    end
    end
  
  # Module for Reversing Alphabet
  module ReverseAlphabet
    def self.print_reverse_alphabet
      ('a'..'z').to_a.reverse.join(', ')
    end
  end
  
  # Class for IP Address Classification
  class IPAddress
    def initialize(ip_address)
      @ip_address = ip_address
    end
  
    def find_class
      octets = @ip_address.split('.').map(&:to_i)
      first_octet = octets[0]
  
      case first_octet
      when 1..126 then 'Class A'
      when 128..191 then 'Class B'
      when 192..223 then 'Class C'
      when 224..239 then 'Class D (Multicast)'
      when 240..255 then 'Class E (Reserved)'
      else 'Invalid IP Address'
      end
    end
  end
  
  # Regular Expressions
  class RegexPatterns
    MOBILE_NUMBER_REGEX = /\A\d{10}\z/
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    NAME_REGEX = /\A[A-Za-z\s]+\z/
    GENDER_REGEX = /\A[M|F]\z/i
    AMOUNT_REGEX = /\A\d+(\.\d{1,2})?\z/
  end

  class Integer
    include PrimeChecker
  end
  
  # CLI Application
  class CLIApp
    def start
      loop do
        puts 'Choose an option:'
        puts '1. Check if a number is prime'
        puts '2. Determine school level by grade'
        puts '3. Print alphabet in reverse order'
        puts '4. Display regex patterns'
        puts '5. Find IP address class'
        puts '6. Exit'
        print 'Enter your choice: '
  
        choice = gets.chomp.to_i
  
        case choice
        when 1
          print 'Enter a number: '
          number = gets.chomp.to_i
          puts "#{number} is prime? #{number.prime?}"
        when 2
          print 'Enter the grade: '
          grade = gets.chomp.to_i
          student = Student.new(grade)
          puts "Grade #{grade} corresponds to #{student.school_level}"
        when 3
          reverse_alpha = ReverseAlphabet.print_reverse_alphabet
          puts "Alphabet in reverse order: #{reverse_alpha}"
        when 4
          puts 'Regex Patterns:'
          puts "Mobile Number: #{RegexPatterns::MOBILE_NUMBER_REGEX}"
          puts "Email Address: #{RegexPatterns::EMAIL_REGEX}"
          puts "Name: #{RegexPatterns::NAME_REGEX}"
          puts "Gender (M / F): #{RegexPatterns::GENDER_REGEX}"
          puts "Amount: #{RegexPatterns::AMOUNT_REGEX}"
        when 5
          print 'Enter an IP address: '
          ip_address = gets.chomp
          ip = IPAddress.new(ip_address)
          puts "IP Address Class: #{ip.find_class}"
        when 6
          puts 'Goodbye!'
          break
        else
          puts 'Invalid choice. Please try again.'
        end
      end
    end
  end
  
  # Run the CLI application
  app = CLIApp.new
  app.start
  