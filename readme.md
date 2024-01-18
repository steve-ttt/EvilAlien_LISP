


# Evil Alien Game

This is a Common Lisp port of the Osbourne BASIC computer space game, "Evil Alien".

## Description

In this game, you are up against Elron, the evil alien. Elron has managed to deactivate all but his short-range weapons but he can still make his ship invisible. You know he is somewhere within the three-dimensional grid you can see on your ship's screen, but where?

You have a certain number of space bombs. Each one can be exploded at a position in the grid specified by three numbers between 0 and 9, which your computer will ask you for. Can you blast the evil Elron out of space before he creeps up on you?

## How to Run

To compile the game, use the following command:

```lisp
(sb-ext:save-lisp-and-die "alien.exe" :executable t :toplevel 'main)
```

Then, you can run the game with the following command:

```bash
./alien.exe
```

## Game Instructions

When you start the game, you will be asked if you need instructions. If you answer yes, the game will print out the instructions for you.

During each turn, you will be asked to enter the X, Y, and Z positions for your space bomb. These positions should be integers between 1 and the grid size.

After each turn, the game will tell you if your shot hit the evil alien, and if not, it will give you some hints about where your shot landed relative to the alien.

The game continues until you run out of bombs or you hit the alien.

## Code Structure

The main code for the game is contained in the `evilAlien.lisp` file. This file defines several functions:

- `main`: This is the starting point for the game.
- `print-inst`: This function prints the game instructions.
- `get-user-input`: This function asks the user for input with a given prompt, and ensures it is an integer between 1 and the grid size.
- `check-shot`: This function checks the shot and prints the result.
- `main-loop`: This function loops through the game, getting user input and then testing the user input with `check-shot`.

## License

This project is licensed under the MIT License.

