local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
return function() --[[ Line: 5 ]] --[[ Name: useTagsState ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.useState({});
    return v2, (v1.useCallback(function(...) --[[ Line: 8 ]]
        -- upvalues: v3 (copy)
        local v4 = {};
        for _, v6 in {
            ...
        } do
            for _, v8 in (string.split(v6, " ")) do
                table.insert(v4, v8);
            end;
        end;
        v3(function(v9) --[[ Line: 20 ]]
            -- upvalues: v4 (copy)
            local v10 = false;
            for _, v12 in v4 do
                if v9[v12] ~= true then
                    v10 = true;
                    break;
                end;
            end;
            if v10 then
                local v13 = table.clone(v9);
                for _, v15 in v4 do
                    v13[v15] = true;
                end;
                return v13;
            else
                return v9;
            end;
        end);
    end, {
        v3
    }));
end;