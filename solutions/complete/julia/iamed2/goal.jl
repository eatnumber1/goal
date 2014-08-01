type g
    ocount = 0
    function g(s="")  # inner constructor
        if s == "al"
            x = ocount
            ocount = 0
            return "g" * "o" ^ x * s
        else
            ocount += 1
            return g
        end
    end
end

println(g()()()()()("al"))
println(g()("al"))
println(g("al"))