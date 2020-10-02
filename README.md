# Toy Robot Simulator - Test Task

5 * 5 GRID TABLE, TOY ROBOT SIMULATOR.

## Description

The application that can read in commands of the following form

    PLACE 2,2,NORTH
    MOVEs
    LEFT
    RIGHT
    REPORT

## Example:

a)

	PLACE 2,2,NORTH
  MOVE
  REPORT

	Output: 2,1,SOUTH


## Requirements

- Ruby 2.6.3

- Libraries: Bundler, rspec


## Dependencies, Test and Run

- Dependencies: `bundle install`

- Test: `rspec spec/`

- Run: `ruby start.rb`