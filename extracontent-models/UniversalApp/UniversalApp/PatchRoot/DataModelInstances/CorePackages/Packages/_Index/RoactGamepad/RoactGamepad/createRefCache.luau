local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
return function() --[[ Line: 10 ]] --[[ Name: createRefCache ]]
    -- upvalues: v1 (copy)
    local v2 = {};
    setmetatable(v2, {
        __index = function(_, v4) --[[ Line: 14 ]] --[[ Name: __index ]]
            -- upvalues: v1 (ref), v2 (copy)
            local v5 = v1.createRef();
            v2[v4] = v5;
            return v5;
        end, 
        __tostring = function(v6) --[[ Line: 20 ]] --[[ Name: __tostring ]]
            local v7 = "{";
            for v8, v9 in pairs(v6) do
                v7 = ("%s\n\t%s -> %s"):format(v7, tostring(v8), (tostring(v9)));
            end;
            return v7 .. "\n}";
        end
    });
    return v2;
end;