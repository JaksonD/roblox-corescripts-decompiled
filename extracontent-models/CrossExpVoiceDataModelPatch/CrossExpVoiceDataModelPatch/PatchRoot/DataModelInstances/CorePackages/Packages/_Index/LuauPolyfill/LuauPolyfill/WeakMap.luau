local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _weakMap = setmetatable({}, {
            __mode = "k"
        })
    }, v0));
end;
v0.get = function(v1, v2) --[[ Line: 28 ]] --[[ Name: get ]]
    return v1._weakMap[v2];
end;
v0.set = function(v3, v4, v5) --[[ Line: 32 ]] --[[ Name: set ]]
    v3._weakMap[v4] = v5;
    return v3;
end;
v0.has = function(v6, v7) --[[ Line: 37 ]] --[[ Name: has ]]
    return v6._weakMap[v7] ~= nil;
end;
return v0;