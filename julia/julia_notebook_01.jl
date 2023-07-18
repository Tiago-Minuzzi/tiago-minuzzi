function square(x)
    return x * x #the 'return' statement is not necessary
end

square(4)

function hello(nome)
    println("Hello there, ", nome)
end

hello("Tiago")

halver(x) = x // 2

halver(5)

v = [46, 5, 87];

sort(v)

@show v

sort!(v) # the bang, by convention is for mutation

# Now it is sorted
@show v;

# You can define the type of the variable
function show_number(x::Int64) # x can only be an integer
    println("Printing integer value: ", x)
end

show_number(65)

show_number(65.0) # it gives an error for it is not an integer in this case

methods(show_number) # see which "overloaded" methods we have

function collection_log(collection, base=2) # sets the default value of log function to 2, instead of 10 (natural log)
    return [log(base,i) for i in collection]
end

println(log(2))
println(collection_log(2))


