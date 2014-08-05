extension String {
    subscript(s: String) -> String {
        return self + s
    }
    subscript() -> String {
        return self + "o"
    }
}

let g = "g"
println(g[]["al"])
println(g[][]["al"])
println(g[][][]["al"])
println(g[][][][][][][][][]["al"])

