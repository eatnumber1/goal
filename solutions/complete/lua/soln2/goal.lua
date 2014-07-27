g = setmetatable({}, {
    __call = function(t, s)
        if s == nil then
            oh = (oh or 0) + 1
            return t
        else
            local o = oh
            oh = 0
            return 'g' .. string.rep('o', o) .. s
        end
    end
})

print(g('al'))
print(g()('al'))
print(g()()()()('al'))
print(g()()('al'))
