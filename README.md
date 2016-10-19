Toy Robot Simulator
===================

## Prerequisites

- bundler
- Ruby

## Installation

Install Ruby and then execute:

    $ bundle

## Usage

1. Create a test file. I've create some fixtures for your in `spec/fixtures/` folder.
2. Execute with given test data or your own file path:

```
$ rake simulate[spec/fixtures/test1]

$ rake simulate[filepath]
```

## Test Suite

    $ rspec
