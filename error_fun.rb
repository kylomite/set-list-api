begin 
    #potentially dangerous code
    "string".gsub
rescue StandardError => error
    #how to handle error
    puts "WRONG!"
end
puts "end of code"
#"string".hey_there
#[1, 2].first("one")