local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Services.Analytics);
local v3 = {
    v2
};
return function(v4) --[[ Line: 12 ]] --[[ Name: SendCounter ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    return v1.new(script.Name, v3, function(_, v6) --[[ Line: 13 ]]
        -- upvalues: v2 (ref), v4 (copy)
        v6[v2].sendCounter(v4);
    end);
end;