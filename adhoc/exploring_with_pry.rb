# Run this from the command line:
# > ruby exercises/ruby/adhoc/exploring_with_pry.rb
#
# References:
#   http://pryrepl.org/pry/
#   https://github.com/pry/pry
#   https://github.com/nixme/pry-nav
#   https://github.com/pry/pry-stack_explorer
require 'pry'

def outer(message, number)
  inner(message)
end

def inner(message)
  local = true
  binding.pry
  "done with inner"
end

outer("hello", 1000)

# Here's a transcript of my subsequent pry session.
# My pry prompt is set to [n]> (where n is set to line number), so
# you can duplicate this session by scanning down this transcript
# looking for prompts, and then entering the same commands.

# ---------------Transcript starts here ---------------
# Frame number: 0/2

# From: /Users/skm/Dropbox/Projects/teach/hatchling/exercises/ruby/exploring_with_pry.rb @ line 11 Object#inner:

#      9: def inner(message)
#     10:   local = true
#  => 11:   binding.pry
#     12:   "done with inner"
#     13: end

# [1]> local      # <------ This is the first prompt.  I typed 'local'.
# => true
# [2]> message    # <------ Second prompt. I typed 'message'. You get the idea.
# => "hello"
#
# [3]> number
# NameError: undefined local variable or method `number' for main:Object
# from (pry):3:in `inner'
#
# [4]> show-stack
# Showing all accessible frames in stack (3 in total):
# --
# => #0  inner <Object#inner(message)>
#    #1 [method]  outer <Object#outer(message, number)>
#    #2 [main]    <main>
#
# [5]> up
# Frame number: 1/2
# Frame type: method

# From: /Users/skm/Dropbox/Projects/teach/hatchling/exercises/ruby/exploring_with_pry.rb @ line 6 Object#outer:

#     5: def outer(message, number)
#  => 6:   inner(message)
#     7: end

# [6]> number
# => 1000
#
# [7]> show-stack
# Showing all accessible frames in stack (3 in total):
# --
#    #0  inner <Object#inner(message)>
# => #1 [method]  outer <Object#outer(message, number)>
#    #2 [main]    <main>
#
# [8]> down
# Frame number: 0/2

# From: /Users/skm/Dropbox/Projects/teach/hatchling/exercises/ruby/exploring_with_pry.rb @ line 11 Object#inner:

#      9: def inner(message)
#     10:   local = true
#  => 11:   binding.pry
#     12:   "done with inner"
#     13: end

# [9]> down
# Error: At bottom of stack, cannot go further!
#
# [10]> next
# Frame number: 0/2

# From: /Users/skm/Dropbox/Projects/teach/hatchling/exercises/ruby/exploring_with_pry.rb @ line 12 Object#inner:

#      9: def inner(message)
#     10:   local = true
#     11:   binding.pry
#  => 12:   "done with inner"
#     13: end

# [1]> next
# >

