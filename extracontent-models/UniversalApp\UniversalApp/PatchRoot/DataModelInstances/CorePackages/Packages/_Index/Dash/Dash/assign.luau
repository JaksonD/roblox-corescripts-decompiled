local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.None);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.forEach);
local v4 = require(l_Parent_0.forEachArgs);
return function(v5, ...) --[[ Line: 54 ]] --[[ Name: assign ]]
    -- upvalues: v4 (copy), v1 (copy), v3 (copy)
    v4(function(v6) --[[ Line: 56 ]]
        -- upvalues: v1 (ref), v3 (ref), v5 (copy)
        if v6 == nil or v6 == v1 then
            return;
        else
            v3(v6, function(v7, v8) --[[ Line: 62 ]]
                -- upvalues: v1 (ref), v5 (ref)
                if v7 == v1 then
                    v5[v8] = nil;
                    return;
                else
                    v5[v8] = v7;
                    return;
                end;
            end);
            return;
        end;
    end, ...);
    return v5;
end;