# Now with a less cheesy use of macros!
function parse_ast(ex::Expr)
    result = parse_ast(ex.args[1])
    if length(ex.args) == 1
        result *= "o"
    else
        result *= join(ex.args[2:end])
    end
    return result
end
parse_ast(ex::Symbol) = string(ex)

macro goal(ex)
    parse_ast(ex)
end

println(@goal g("al"))
println(@goal g()("al"))
println(@goal g()()()()()()("al"))
println(@goal g()()()()()()()()()()()()("al"))

# Also supports mixing whatever you want in between, as long as it is valid Julia
println(@goal goo()()()("al"))
# => goooooal
println(@goal including(" arbitrary ")(c)()("ntent."))
# => including arbitrary content.
