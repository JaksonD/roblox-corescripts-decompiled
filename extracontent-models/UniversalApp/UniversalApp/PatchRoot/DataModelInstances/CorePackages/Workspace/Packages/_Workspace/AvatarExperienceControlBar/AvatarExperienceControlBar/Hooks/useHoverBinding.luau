local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceControlBar").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
return function() --[[ Line: 7 ]] --[[ Name: useHoverBinding ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3, v4 = v1.useBinding(false);
    return v3, (v1.useCallback(function(v5) --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v4 (copy)
        if v5 == v2.Enums.ControlState.Default then
            v4(false);
            return;
        else
            if v5 == v2.Enums.ControlState.Hover then
                v4(true);
            end;
            return;
        end;
    end, {}));
end;