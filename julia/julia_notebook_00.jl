s = "hey "

# Use caret to repeat strings 'n' times
s^3

versioninfo()

# Single quote = char
letra_a = 'a'
println(letra_a)
println(typeof(letra_a))

# Double quotes = string
primeira_frase = "essa é uma string"
println(primeira_frase)
println(typeof(primeira_frase))

# No new line at the end
println("a")
println("b")

# Julia does not put spaces in print like Python
println('a','b','c')

# Print using variables
var1="valor1"
var2="valor2"
println("var1 é igual a: \"$(var1)\"; var2 é igual a \"$(var2)\"")

# Convert values
numero1=1
println(typeof(numero1))
convertido1=convert(Float64,numero1)
println(typeof(convertido1))

# Julia converts all values in list to float if there is at least one floating in the list
lista01 = [1,2,3,4.0]
println(typeof(lista01))
println("")
for n in lista01
    println(n)
    println(typeof(n))
    println("")
end

# One can join string using the following methods
string01="primeira"
string02="segunda"
# 1
println(string01*string02)
println("")
# 2
println(join([string01,string02]," ")) # join receives a list and a separator as second argument

x = 25
if x > 20
    println("é maior que 20")
end

n = 3
if (n % 3 == 0) && (n % 5 == 0)
    println("FizzBuzz")
elseif n % 3 == 0
    println("Fizz")
elseif n % 5 == 0
    println("Buzz")
else
    println(n)
end

x = 3
y = 6
# If the value of 'x' is greater than the value of 'y', assign the value of 'x' to 'z'; otherwise assign the value of 'y' to 'z'
z = (x > y) ? x : y # condition ? value if true : value if false
println("The value of 'x' is: $(x).")
println("The value of 'y' is: $(y).")
println("The value of 'z' is then: $(z).")

i = 0
while i < 10
    println("'i' is: ", i)
    i+=1
end

for var in 1:10
    println(var)
end

println(typeof(1:10))

collection = [1,2,3,4]

collection = [1,2,3,4.5]

collection = [1,2,3,4//3,5.7]

collection = [1,2,3,4,"5"]

collection = [1,2,3,4]
append!(collection, 60) # functions with the bang (!) at the end mutate the passed object

collection

# Julia uses 1-based index. There is no 0 index
println(collection[0])

println(collection[1])

# Slicing is no inclusive both at the beginnign and end
println(collection[1:5])
println(collection[:])

println(collection[:4])

# print last item
println(collection[end])

collection[1] = 99
println(collection)

# Show macro using '@'
@show collection

@show collection;

# Create a copy of list
copia = copy(collection)
copia

tupla = (1,2,3)

linguagens = ("Python","Julia","C","R","Rust")

println(tupla[2])
println(linguagens[end])

tools = (language = "Julia", ide = "pluto", explorer = "Perserverance")

tools[1]

tools.language

d = Dict("language" => "Julia", "ide" => "pluto")

d["language"]

d["explorer"]="perserverance"

d

@show d

@show d;

pop!(d)

e = Dict("OS"=> "Arch Linux", "language"=>"C")

merge!(d,e) # duplicate keys in 'e' override those in 'd'

@show d;

for (k, v) in d
    println("chave: $(k), valor: $(v)")
end

simple = Dict(:lang => "Julia",:ide=>"Pluto")

simple[:lang]

for (k, v) in simple
    println(k)
end

students = ["jack","jill","john"]

typeof(students)

fibo = [1,1,2,3,5,8,13]

typeof(fibo)

push!(fibo,21)

@show fibo;

pop!(fibo)

@show fibo;

# it is an array of arrays
mat = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

# the size of each array can be different
mat = [
    [2,3],
    [4,5,6],
    [7,8,9,21]
]

typeof(mat)

x = [1 2 3] # notice the lack of commas and the dimensions 

x' # turn this into a column vector (tranpose)

mat = [
    [1 2 3]
    [4 5 6]
    [7 8 9]
]

typeof(mat)

size(mat)

size(x)

size(fibo)

X = [
    [1 2 3]
    [4 5 6]
    [7 8 9]
    [10 11 12]
]

X = reshape(X,2,6)

@show X

X = reshape(X,12,1)

X = reshape(X,4,3)

# Create random matrix
mat = rand(4,3)

mat_2 = mat;

mat_2[1,1] = 100.0

mat_2

mat

mat_3 = copy(mat)

mat_3[1,1] = 999.0

mat_3

mat

[i for i in 1:5]

# cartesian product (aka, nested loop)
[(i,j) for i in 1:5, j in 6:10]

A = rand(10:20, 3, 3) # array of ints

A = rand(10.:20, 3, 3) # array of floats

A' * A
