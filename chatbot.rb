def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
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
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}'}

puts "Hello, what's your name?"
name = gets.chomp
puts "Hello #{name}"
while(input = gets.chomp) do
	if input == "quit"
		puts "Thank you for chatting please come again!"
		break
	end
  puts get_response(input)
end