local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = v1 or {};
    setmetatable(v2, {
        __index = v0
    });
    return v2;
end;
v0.GetItem = function(v3, v4) --[[ Line: 13 ]] --[[ Name: GetItem ]]
    return v3[v4];
end;
v0.SetItem = function(v5, v6, v7) --[[ Line: 18 ]] --[[ Name: SetItem ]]
    v5[v6] = tostring(v7);
end;
v0.flush = function(_) --[[ Line: 22 ]] --[[ Name: flush ]]

end;
return v0;