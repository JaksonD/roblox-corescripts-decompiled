local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
return function(v3, v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2.useMemo(function() --[[ Line: 8 ]]
        -- upvalues: v3 (copy), v1 (ref), v4 (copy), v5 (copy)
        local v6 = {};
        local v7 = false;
        for _, v9 in v3 do
            local l_spanOverride_0 = v9.spanOverride;
            if not l_spanOverride_0 then
                table.insert(v6, v9);
            else
                v7 = true;
                local v11 = l_spanOverride_0.colSpan or 1;
                local v12 = l_spanOverride_0.rowSpan or 1;
                table.insert(v6, v1.Dictionary.join(v9, {
                    sizeOverride = UDim2.new(v11, (v4 or 0) * (v11 - 1), v12, (v5 or 0) * (v12 - 1))
                }));
            end;
        end;
        if not v7 then
            return v3;
        else
            return v6;
        end;
    end, {
        v3, 
        v4, 
        v5
    });
end;