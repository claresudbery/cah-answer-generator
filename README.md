# cah-answer-generator

This was created under a [Creative Commons Attribution-NonCommercial-ShareAlike license (CC BY-NC-SA)](https://creativecommons.org/licenses/by-nc/3.0/) so that you can play [this lip-reading game](https://clare-wiki.herokuapp.com/pages/think/life/Fun-Games#the-lip-reading-game).

All it does is randomly (ish) generate answers from the Cards Against Humanity game.

The answers are split into three categories:

- Safe for work 
	- This is still Cards Against Humanity though. Somebody still might be upset.
	- If you're really worried, you'd probably better find a different source of phrases for your game!
	- see these answers in safe_answers.txt
- Kind of safe for work (assuming your work environment is quite relaxed)
	- all the safe answers plus some extra ones
	- eg, sex is referred to but without the use of explicit language
	- I mean, all I can really tell you is that I felt like I could cope with these phrases being used in a game with my (very relaxed) colleagues. Your mean may vary.
	- see these answers in kind_of_safe_answers.txt
- Not guaranteed to be safe for work 
	- ALL the answers
	- see these answers in all_answers.txt

The initial Sinatra skeleton was created using [this tutorial](http://webapps-for-beginners.rubymonstas.org/sinatra/hello_world.html).

To get the website up, run `bundle install` and then `rackup -p 4567` on the command line in the root folder for this project. Then visit http://127.0.0.1:4567/monstas in the browser.
