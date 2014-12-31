def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2, c3: $3, c4: $4}
end

class String
def black;          "\033[30m#{self}\033[0m" end
def red;            "\033[31m#{self}\033[0m" end
def green;          "\033[32m#{self}\033[0m" end
def brown;          "\033[33m#{self}\033[0m" end
def blue;           "\033[34m#{self}\033[0m" end
def magenta;        "\033[35m#{self}\033[0m" end
def cyan;           "\033[36m#{self}\033[0m" end
def gray;           "\033[37m#{self}\033[0m" end
end

def user_prompt
print "User <: ".blue
end

def bot_prompt
 print "Bot ]: ".magenta
end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'How are you?' => 'Very well thank you, and you?',
              'Very good thanks' => 'That is good',
              'I am happy' => 'That is excellent',
              'I am sad' => 'Sorry to hear that can I cheer you up?',
              'Yes please!' => 'Let us try that',
              'What is your name?' => 'Chatterbox - What would you like to talk about?',
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I like (.*) and (.*)' => 'I also like %{c1} but am not a fan of %{c2}',
              'Have you seen (.*)?' => 'Yes %{c1} is brilliant',
              'my favourite foods are (.*) and (.*) i also like (.*) and (.*)' => 'I like %{c1}, %{c2}, %{c3} and %{c4} too!',
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}'}

bot_prompt
puts "Hello, what's your name?"
user_prompt
name = gets.chomp
bot_prompt
puts "Hello #{name}"
user_prompt
while(input = gets.chomp) do
	if input == "quit"
		puts "Thank you for chatting please come again!"
		break
	end
  bot_prompt
  puts get_response(input)
  user_prompt
end