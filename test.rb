require './lib/dictionary.rb'

text=File.open('input_file.txt').read

new_dict = Dictionary.new

text.each_line do |line|
  line_arr = line.split(':')           # split lines into an array
  method = line_arr.first              # grab method name
  
  if (line_arr[1] && line_arr[2])      # if there are two param
    param1 = line_arr[1][-1] == "\n" ? line_arr[1][0...-1] : line_arr[1]
    param2 = line_arr[2][-1] == "\n" ? line_arr[2][0...-1] : line_arr[2]
    new_dict.send("#{method}", param1, param2)    # invoke method call with 2 params
  elsif (line_arr[1])                  # if there is one param
    param1 = line_arr[1][-1] == "\n" ? line_arr[1][0...-1] : line_arr[1]
    output = new_dict.send("#{method}", param1)   # invoke method call with 1 param

    if output.is_a?(Array)            # if output is an array
      output = output.join(',')       # join them with a comma
    end

    print [param1, output].join(':')  # print output
    print "\n"
  end
end