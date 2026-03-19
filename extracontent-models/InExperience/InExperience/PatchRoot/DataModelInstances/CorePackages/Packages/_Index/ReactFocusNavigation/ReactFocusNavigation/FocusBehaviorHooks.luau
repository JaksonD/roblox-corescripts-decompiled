local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.FocusNavigation);
local v2 = require(l_Parent_0.FocusBehaviors);
local v3 = require(l_Parent_0.React);
local l_default_0 = v2.default;
local l_mostRecent_0 = v2.mostRecent;
local l_mostRecentOrDefault_0 = v2.mostRecentOrDefault;
local v7 = require(script.Parent.useContainerFocusBehavior);
return {
    useDefaultFocusBehavior = function(v8) --[[ Line: 15 ]] --[[ Name: useDefaultFocusBehavior ]]
        -- upvalues: v3 (copy), l_default_0 (copy), v7 (copy)
        local v9, v10 = v3.useState(nil);
        local v11 = v3.useMemo(function() --[[ Line: 20 ]]
            -- upvalues: l_default_0 (ref), v9 (copy)
            return l_default_0(v9);
        end, {
            v9
        });
        return v10, (v7(v11, v8));
    end, 
    useMostRecentFocusBehavior = function(v12) --[[ Line: 29 ]] --[[ Name: useMostRecentFocusBehavior ]]
        -- upvalues: v3 (copy), l_mostRecent_0 (copy), v7 (copy)
        local v13 = v3.useMemo(l_mostRecent_0, {});
        return v7(v13, v12);
    end, 
    useMostRecentOrDefaultFocusBehavior = function(v14) --[[ Line: 35 ]] --[[ Name: useMostRecentOrDefaultFocusBehavior ]]
        -- upvalues: v3 (copy), l_mostRecentOrDefault_0 (copy), v7 (copy)
        local v15, v16 = v3.useState(nil);
        local v17 = v3.useMemo(function() --[[ Line: 40 ]]
            -- upvalues: l_mostRecentOrDefault_0 (ref), v15 (copy)
            return l_mostRecentOrDefault_0(v15);
        end, {
            v15
        });
        return v16, (v7(v17, v14));
    end
};