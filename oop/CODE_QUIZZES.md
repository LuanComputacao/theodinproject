## Learn Ruby - Object Oriented Programming
## 1
### Question
Object oriented programming (OOP) is at the core of Ruby, so even beginners need to know the basic OOP principles. OOP discussions tend to get abstract and I have made an effort to make this introduction concrete with examples.

What is the value of the variable x?
```rb
x = String.new("i wish i was surfing")
```
### Answer
`"i wish i was surfing"`

## 2
### Question
Make the following object: "i thought he said this wasn't going to be abstract..."

### Answer
```rb
x = "i thought he said this wasn't going to be abstract..."
# or
y = String.new("i thought he said this wasn't going to be abstract...")
```


## 3
### Question
What does this return?

"hi".methods()

### Answer
Returns an array containing all methods available in the class String

## 4
### Question
What does this return?

"hello".upcase()
### Answer
`HELLO`


## 5
### Question
What does this return?

"sUp DuDe".swapcase()
### Answer
`"SuP dUdE"`


## 6
### Question
What does this return?

`"This is a sentence, kinda".split()`
### Answer
```rb
["This", "is", "a", "sentence,", "kinda"]
```

## 7
### Question
What is the syntax for calling methods on string objects? Look at the previous examples and observe the pattern.
### Answer
The object identifier followed by a a dot and than the method signature

## 8
### Question
To recap, the String class makes string objects, and the string objects have access to methods like upcase() and downcase(). Create a string object with the text "road trip".
### Answer
```rb
text = "Road trip".downcase()
```

## 9
### Question
What does this code return?
```rb
Array.new()`
```
### Answer
`[]`

## 10
### Question
What does this code print?
```rb
my_array = Array.new()
my_array.push("nice")
my_array.push("hair")
puts my_array.inspect
```
### Answer
`["nice", "hair"]`

## 11
### Question
What is a class?
### Answer
A class is an structure that represents something or a behaviour. And this one also have actions that is called methods and also attributes.

## 3
### Question
### Answer

## 3
### Question
### Answer