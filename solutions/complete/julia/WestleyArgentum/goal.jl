
function g(str = nothing)
    goal = "g"

    function _g(str = nothing)
        str != nothing && return goal * str

        goal = goal * "o"
        _g
    end

    _g(str)
end

println(g()("al"))
println(g("al"))
println(g()()()()()()()()()()()()()()()()()()()()()()()()()()("al"))
