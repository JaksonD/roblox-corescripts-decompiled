local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function() --[[ Line: 7 ]] --[[ Name: useRefCache ]]
    -- upvalues: v1 (copy)
    local v2 = v1.useRef(nil);
    if v2.current == nil then
        local v3 = {};
        setmetatable(v3, {
            __index = function(_, v5) --[[ Line: 14 ]] --[[ Name: __index ]]
                -- upvalues: v1 (ref), v3 (copy)
                local v6 = v1.createRef();
                v3[v5] = v6;
                return v6;
            end, 
            __tostring = function(v7) --[[ Line: 19 ]] --[[ Name: __tostring ]]
                local v8 = "{";
                for v9, v10 in pairs(v7) do
                    v8 = ("%s\n\t%s -> %s"):format(v8, tostring(v9), (tostring(v10)));
                end;
                return v8 .. "\n}";
            end
        });
        v2.current = v3;
    end;
    return v2.current;
end;