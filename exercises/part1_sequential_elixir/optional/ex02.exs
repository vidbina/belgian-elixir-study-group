# GOAL: getting acquainted with the syntax and built-in operators

# Write a function prefix that takes a string.
# It should return a new function that takes a second string.
# When that second function is called, it will return a
# string containing the first string, a space, and the second string.

# String (binary) concatentation:   "str1" <> "str2"

prefix = fn pref ->
  fn next -> pref <> " " <> next end
end

mrs = prefix.("Mrs")

IO.inspect mrs.("Smith") #=> "Mrs Smith"
