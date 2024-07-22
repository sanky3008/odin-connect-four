# Connect Four Game

## Project Overview
This project is a command-line implementation of the classic game Connect Four, created as part of The Odin Project curriculum. It's written in Ruby and demonstrates object-oriented programming principles.

## Features
- Two-player gameplay
- Command-line interface
- Automatic win detection (horizontal, vertical, and diagonal)
- Simple and intuitive input system

## How to Play
1. Run the game by executing `ruby main.rb` in your terminal.
2. Players take turns choosing a column (1-7) to drop their piece.
3. The game alternates between 'R' (Red) and 'B' (Blue) players.
4. The first player to connect four of their pieces in a row (horizontally, vertically, or diagonally) wins.
5. The game ends when a player wins or the board is full (resulting in a draw).

## File Structure
- `main.rb`: The entry point of the game.
- `lib/Game.rb`: Contains the `Game` class which manages the game flow.
- `lib/Cage.rb`: Contains the `Cage` class which represents the game board and checks for win conditions.
- `lib/Player.rb`: Contains the `Player` class which represents each player.

## How to Run
Ensure you have Ruby installed on your system, then follow these steps:
1. Clone this repository.
2. Navigate to the project directory in your terminal.
3. Run the command: `ruby main.rb`

## Future Improvements
- Add a single-player mode with AI
- Implement a graphical user interface
- Add options for different board sizes
- Terminate game when the cage is full

## Acknowledgements
This project was completed as part of [The Odin Project](https://www.theodinproject.com/) curriculum.