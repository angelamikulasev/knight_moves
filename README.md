# Knight Moves

Knight Moves is a Ruby console application, that when provided with a start position and end position on the command line, responds with:

  1. An array of possible series of moves for a knight to get from the start to end square, eg, `[a1-b3-d4, a1-c2-b4, ...]`
  2. An empty array if there is no path within 4 squares
  3. An appropriate error message in case of bad data / format

#### Some Rules

- Each square the knight travels should be listed with dashes between.
- There should be no looping paths with the same square repeated again in the same series of moves.
- The paths should be sorted alphabetically.
- Ignore any paths with more than 4 moves.


#### Overview

This application is built based off an 8x8 standard Chessboard grid. The y axis of this grid is numerical and the x axis is alphabetical. Please see diagram below for reference:

![](http://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/SCD_algebraic_notation.svg/242px-SCD_algebraic_notation.svg.png)

- check if squares are valid
- calculate the all offsets for potential moves based on the mechanics of the Knight
- calculate the offsets for a specific square
- calculate the next move based off the offset of a valid square
- use recursion to calculate the following moves in order to get to the end square
- once all possible outcomes are calculated, 
    - ignore any paths with more than 4 moves
    - sort each list alphabetically
    - seperate each square in array with dashes


#### Dependencies

Before running the console application, please ensure Ruby is installed on your computer.

```
ruby => 2.1.0p0
```

To check your version run:

```
$ ruby -v
```

To learn how to install ruby visit: https://www.ruby-lang.org/en/installation/]https://www.ruby-lang.org/en/installation/()


#### Testing Instructions

```
gem install rspec
```

To run specs locally: 

```
rspec spec
```

#### Usage Instructions

To run this module:

```
::KnightMoves::Chessboard.calculate_moves(current_position, destination_position, visited_squares)

or 

::KnightMoves::Chessboard.calculate_moves("a1", "d4", [])
```


To calculate the next possible moves based off a given square, run:

```
irb(main):145:0> ::KnightMoves::Chessboard.calculate_next_moves("a1")
=> ["c2", "b3"]
```

#### Discussion

As modules are static(i.e: data stored in a module exists exactly once), I chose to build this console application in a module. 

I started building this application by identifying the key features. This lead me to build each feature in a feature branch to ensure I was isolating each problem.

Working on the algorithm was the most challenging part of this application and due to time constraints, I was unable to finish it.

Moving forward, I would work on the following:
- finish solving algorithm to calculate knights moves
- abstract validation logic into policy object
- move `calculate_next_moves` logic into a service that returns success or failure depending on the result



