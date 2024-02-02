# Prolog-Number-Challenge
This is a simple number-guessing game implemented in Prolog. The game involves the player trying to guess a randomly generated number between 1 and 100. The game keeps track of the number of tries and the start time,  and allows the player to request a hint every three tries.


## Objective: 
Guess a randomly generated number between 1 and 100.
How to play:
Make a guess by entering a number between 1 and 100.
You can request a hint every three tries by answering "yes" when prompted.
The game keeps track of the number of tries and the start time.
Each time you make a guess, the game will inform you whether your guess is too high, too low or correct.
The game ends when you guess the correct number.

## How to run it?

In order to run the code you need to make sure that you have SWI-Prolog installed in your machine and you just simply need to download it and open it with any IDE or code editor, but I recommend using Visual Studio Code since it is a free code editor platform and I used it for this game. After opening the folder of the game in the VS code, write in the terminal the following to start playing the Prolog Number Challenge:
First we need carefully to check the path so if you are not in the correct path always use the “cd (folder name)” but if it is in correct path just write this:
swipl 
And then 
-consult(‘nameofthefile.pl’. In our case consult(‘prolognumberchallenge.pl’).

And start. And you start the game .


![App Screenshot](https://i.imgur.com/IEHEWUC.png)

![App Screenshot](https://i.imgur.com/5fRdRy4.png)


## Conclusion

The Prolog number-guessing game is a simple but fun game that demonstrates the power of Prolog's logic-based programming paradigm. Prolog is a powerful programming language that is well-suited for solving problems that involve reasoning and logical deduction.
The game uses dynamic predicates to keep track of the number of tries, hints, and start time. These predicates are defined using the :- dynamic predicate and are used to store the state of the game. The dynamic predicates are used to assert and retract the state of the game when needed.
The game also uses Prolog's built-in predicates for input/output, random number generation, and time calculation. The random/3 predicate is used to generate a random target number, the get_time/1 predicate is used to get the current time, and the write/1, read/1 predicates are used for input/output.
The code uses a variety of Prolog's control structures such as repeat, fail, and halt which allows to control the flow of the game. The repeat predicate creates a loop that repeatedly calls the play/0 predicate, the fail predicate causes the game to backtrack, and the halt predicate ends the game loop.
The game can be improved by adding more features such as adding a leaderboard, allowing multiple players to play the game, making the game more challenging by increasing the range of the target number , and adding more difficulties to the game for example level easy : 0-50 , level medium 1-100 and level hard 1-1000.
The final slide provides a comprehensive summary of the key takeaways from the game and the project, highlighting the main features of the Prolog number-guessing game, the use of dynamic predicates, built-in predicates, control structures.
It also provides suggestions for improving the game and making it more challenging.
Overall, this project was a great introduction to Prolog and its capabilities as a programming language for solving problems that involve reasoning and logical deduction. It provided an opportunity to learn and experiment with different Prolog predicates, control structures and programming concepts.



