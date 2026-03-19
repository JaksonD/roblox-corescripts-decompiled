local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        _weakMap = setmetatable({}, {
            __mode = "k"
        })
    }, v2));
end;
v2.get = function(v3, v4) --[[ Line: 42 ]] --[[ Name: get ]]
    return v3._weakMap[v4];
end;
v2.set = function(v5, v6, v7) --[[ Line: 46 ]] --[[ Name: set ]]
    v5._weakMap[v6] = v7;
    return v5;
end;
v2.has = function(v8, v9) --[[ Line: 51 ]] --[[ Name: has ]]
    return v8._weakMap[v9] ~= nil;
end;
return v2;