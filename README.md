Contactually Coding Exercises
=============================

To better assess a candidate's development skills, we would like to provide the
following exercises. You have as much time as you'd like (though we ask that you
not spend more than a few hours).

Submission Instructions
-----------------------

1. Complete the exercises as described below.
  - Use separate commits for each solution and put an explanation of your
    solution in the commit message. Don't squash your commits.
  - Your code should be clear and well-documented.
2. When you're done, use `git bundle` to bundle up the repo and send it back to
`engineering@contactually.com`.


Exercises
=========

*Note: Feel free to use Google to look up syntax, method definitions, etc. but
please don't just look up the answers.*

Fibonacci Sequence
------------------

Implement a method that will calculate the Nth number of the Fibonacci sequence
(http://en.wikipedia.org/wiki/Fibonacci_number).

Tests have been pre-written using rspec at `/spec/fibonacci_spec.rb`.


Yaml Parsing
------------

Given a Yaml file of the format found in data/music.yaml parse the file so that
we can access it in Ruby.

Your parsing code should return an object that allows you to access attributes
in two ways:

1. Using the `[]` operator:
  ```
  data["genres"].last["artists"].first["albums"].first["tracks"].last["name"] => "But Not For Me"
  ```

2. Using method calls:
  ```
  data.genres.last.artists.first.albums.first.tracks.last.name => "But Not For Me"
  ```

Tests have been pre-written using rspec in `/spec/music_parser_spec.rb`.


Javascript Regex and DOM manipulation
-------------------------------------

In `/code/movies.html` you'll find a table of movies. Using vanilla javascript
(no jquery, underscore, etc), make it so that clicking the button at the top
of the page will:
- remove any movie released before Y2K OR with a vote count lower than 200,000.
- show the number of removed movies in the `num-of-removed` span.
- fix the titlization of the movies (for simplicity, the first word and any word
greater than 3 characters should be capitalized).
