local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: useInGameUserIds ]]
    -- upvalues: v1 (copy)
    return v1.useMemo(function() --[[ Line: 6 ]]
        -- upvalues: v2 (copy), v3 (copy)
        if not v2 or not v3 then
            return {};
        else
            local v4 = {};
            for v5, _ in v3 do
                if v5 ~= v2 then
                    table.insert(v4, v5);
                end;
            end;
            return v4;
        end;
    end, {
        v2, 
        v3
    });
end;