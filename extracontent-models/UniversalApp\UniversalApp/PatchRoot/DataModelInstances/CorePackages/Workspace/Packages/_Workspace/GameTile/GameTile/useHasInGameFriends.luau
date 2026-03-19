local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
return function(v3, v4, v5) --[[ Line: 9 ]] --[[ Name: useHasInGameFriends ]]
    -- upvalues: v1 (copy), l_dependencyArray_0 (copy)
    return (v1.useMemo(function() --[[ Line: 10 ]]
        -- upvalues: v3 (copy), v4 (copy), v5 (copy)
        if not v3 or not v4 or not v5 then
            return false;
        else
            for _, v7 in pairs(v5) do
                if v7 ~= v3 then
                    local v8 = v4[v7];
                    if v8 and v8.isFriend then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end, l_dependencyArray_0(v3, v4, v5)));
end;