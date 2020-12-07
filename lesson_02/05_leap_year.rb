puts "Day"
day = gets.chomp.to_i

puts "Month"
month = gets.chomp.to_i

puts "Year"
year = gets.chomp.to_i

def leap_year?(year)
  year == 2020 || (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 
end

def days_in_feb(year)
  leap_year?(year) ? 29 : 28
end

def days_by_month(year)
  [
    31,
    days_in_feb(year),
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ]
end

def calc_days(day, month, year)
  return if month == 1
  year_days = days_by_month(year)
  year_days[0, month - 1].sum + day
end

puts calc_days(day, month, year)
