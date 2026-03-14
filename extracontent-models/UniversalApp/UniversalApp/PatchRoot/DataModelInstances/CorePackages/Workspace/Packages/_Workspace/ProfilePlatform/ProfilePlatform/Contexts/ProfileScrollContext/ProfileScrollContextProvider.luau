local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useTopBarHeight_0 = require(l_Parent_0.RobloxAppHooks).useTopBarHeight;
local v4 = require(l_script_FirstAncestor_0.Common.Enums);
local v5 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local v6 = require(script.Parent.ProfileScrollContext);
return function(v7) --[[ Line: 14 ]]
    -- upvalues: v5 (copy), v2 (copy), v4 (copy), l_useTopBarHeight_0 (copy), v6 (copy)
    local v8 = v5();
    local v9, v10 = v2.useState(v8.formFactor == v4.ProfileFormFactor.PeekView and 0 or 1);
    local v11, v12 = v2.useState(0);
    local v13 = l_useTopBarHeight_0();
    local v15 = v2.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: v8 (copy), v13 (copy), v4 (ref), v11 (copy)
        local v14 = v8.isFullView and 0 or v13;
        if v8.formFactor == v4.ProfileFormFactor.PeekView and not v8.isFullView then
            v14 = v14 + 25;
        end;
        return (math.max(v14 - v11, 0));
    end, {
        v13, 
        v11, 
        v8
    });
    local v16 = v2.useMemo(function() --[[ Line: 34 ]]
        -- upvalues: v15 (copy), v12 (copy), v9 (copy), v10 (copy)
        return {
            scrollY = v15, 
            setAbsoluteYPosition = v12, 
            peekViewOpenPercent = v9, 
            setPeekViewOpenPercent = v10
        };
    end, {
        v15, 
        v12, 
        v9, 
        v10
    });
    return v2.createElement(v6.Provider, {
        value = v16
    }, v7.children);
end;