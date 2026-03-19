local v0 = require(script.Parent.symbols);
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    assert(type(v1) == "function", "Mock Error: Mock.predicate must be given a function");
    return (setmetatable({
        [v0.isPredicate] = true, 
        predicate = v1
    }, {
        __tostring = function() --[[ Line: 10 ]] --[[ Name: __tostring ]]
            return "<Predicate>";
        end
    }));
end;