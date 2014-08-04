macro goal(ex)
    o, al = ex.args
    replace(string(o), r"\(\)", "o") * al
end

println(@goal g("al"))
println(@goal g()("al"))
println(@goal g()()()()()()("al"))
println(@goal g()()()()()()()()()()()()("al"))
