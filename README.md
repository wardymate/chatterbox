Chatterbox Challenge
====================

Instructions
----------

* Test time: up to you
* Feel free to use google, your notes, books, etc but work on your own
* You'll almost certainly need to google some things. This is deliberate.


Tasks:
------

First place the chatbot below in a file such as 'chatbot.rb', run it from the command line and then experiment chatting with it:

```ruby
def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too'}

puts "Hello, what's your name?"
name = gets.chomp
while(input = gets.chomp) do
  puts get_response(input)
end
```

It should go something like this:

```
→ ruby chatbot.rb 
Hello, what's your name?
Dan
Hello Dan
the weather is clement
I hate it when it's clement
I love noodles
I love noodles too
goodbye
bye
```


1. add at least five more reponses so that the bot has a bigger range of conversation
2. add at least another two more responses that use regex capture groups so the bot is using part of what the user types in in the response
3. extend the bot so that there is a key word, e.g. "quit" that will end the session
4. add a prompt in front of each sentence to indicate if either the person or the bot is talking
5. make the bot and the person's chat different colours
6. extend the bot so that it can handle more than two regular expression capture groups
7. extend the bot to that the user can add new kinds of responses through the chat interaction
8. extend the bot so that the set of responses is saved to a file and reloaded when the bot restarts

Resources:

* [Ruby Regular Expressions Tutorial](http://rubylearning.com/satishtalim/ruby_regular_expressions.html)
* [Eliza Chat Bot](http://en.wikipedia.org/wiki/ELIZA)
