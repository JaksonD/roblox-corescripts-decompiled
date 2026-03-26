local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
return function(v4, v5, v6) --[[ Line: 11 ]] --[[ Name: useHasInGameFriends ]]
    -- upvalues: v1 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    return (v1.useMemo(function() --[[ Line: 13 ]]
        -- upvalues: v4 (copy), v5 (copy), v6 (copy)
        if not v4 or not v5 or not v6 then
            return false;
        else
            for _, v8 in pairs(v6) do
                if v8 ~= v4 then
                    local v9 = v5[v8];
                    if v9 and v9.isFriend then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v4, 
        v5, 
        v6
    } else l_dependencyArray_0(v4, v5, v6)));
end;