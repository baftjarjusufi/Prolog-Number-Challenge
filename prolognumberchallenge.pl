% Define a dynamic predicate to keep track of the number of tries and the start time
:- dynamic tries/1, hints/1, start_time/1.

% Initialize the number of tries, hints and start time before starting the game
random_target :-
% generate a random target number between 1 and 100
random(1, 100, Target),
asserta(target(Target)),
% initialize the number of tries to 0
retractall(tries()),
asserta(tries(0)),
% initialize the number of hints to 3
retractall(hints()),
asserta(hints(3)),
% get the current time and save it as the start time
get_time(Time),
asserta(start_time(Time)).

% Increment the number of tries after each guess
guess(X) :-
target(X),
% get the current time
get_time(Time),
start_time(StartTime),
% calculate the elapsed time
ElapsedTime is Time - StartTime,
% round the elapsed time to one decimal place
RoundedElapsedTime is round(ElapsedTime * 10) / 10,
write('You guessed the correct number!'),
write('It took you '),
% get the number of tries
tries(T),
write(T),
write(' tries and '),
write(RoundedElapsedTime),
write(' seconds.'), nl,
write('Do you want to play again? (yes/no)'),
read(Answer),
% convert the answer to a string
atom_string(Answer,AnswerString),
% check if the answer is "yes" and call the restart predicate if it is
(AnswerString == "yes" -> restart ;
(AnswerString == "no" -> halt ; true)),
% remove the current target and reset the number of tries, hints, and start time
retract(target(X)),
retractall(tries()),
retractall(hints()),
retractall(start_time(_)),
fail.

guess(X) :-
target(T),
X < T,
% increment the number of tries
tries(Tries),
Tries1 is Tries+1,
retractall(tries(_)),
asserta(tries(Tries1)),
write('Too low, try again.'), nl,
check_hint,
fail.

guess(X) :-
target(T),
X > T,
% increment the number of tries
tries(Tries),
Tries1 is Tries+1,
retractall(tries(_)),
asserta(tries(Tries1)),
write('Too high, try again.'), nl,
check_hint,
fail.

guess(X) :-
not(integer(X)),
write('Invalid input, please enter a number.'), nl,
fail.

guess(X) :-
(X < 1; X > 100),
write('Invalid input, please enter a number between 1 and 100.'), nl,
fail.

% main play predicate
play :-
write('Guess a number between 1 and 100: '),
read(X),
guess(X),
check_hint,
!.

% check if the player wants a hint
check_hint :-
tries(T),
% check if the number of tries is divisible by 3 and ask for a hint
(T mod 3 =:= 0 -> (write('Do you want a hint? (yes/no)'), read(Hint), atom_string(Hint, HintString), (HintString == "yes" -> hint ; true)) ; true).

% give a hint if there are still hints available
hint :-
target(T),
hints(H),
H > 0,
H1 is H - 1,
retractall(hints(_)),
asserta(hints(H1)),
(T < 50 -> write('The number is less than 50.') ; write('The number is greater than or equal to 50.')), nl.

% handle the case where the player has run out of hints
hint :-
hints(0),
write('Sorry, you have run out of hints.'), nl.

% start the game
start :-
random_target,
repeat,
play,
!.

% restart the game
restart :-
retractall(target(_)), % remove the current target
random_target, % generate a new target
write('The game has been restarted.'), nl,
play.