local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local l_getPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.getPageMargin;
return function() --[[ Line: 10 ]]
    -- upvalues: v1 (copy), l_getPageMargin_0 (copy)
    local v3, v4 = v1.useState(24);
    return v3, (v1.useCallback(function(v5) --[[ Line: 13 ]]
        -- upvalues: l_getPageMargin_0 (ref), v4 (copy)
        local v6 = l_getPageMargin_0(v5.AbsoluteSize.X);
        v4(v6);
    end, {}));
end;