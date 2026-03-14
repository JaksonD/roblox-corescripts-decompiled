local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
return function(v3, v4) --[[ Line: 13 ]] --[[ Name: useComputedSignal ]]
    -- upvalues: v1 (copy), v2 (copy)
    return (v1.useMemo(function() --[[ Line: 14 ]]
        -- upvalues: v2 (ref), v3 (copy), v4 (copy)
        return v2.createComputed(v3, v4);
    end, {}));
end;