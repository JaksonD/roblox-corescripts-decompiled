local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local _ = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = v1.Roact;
local v4 = require(l_script_FirstAncestor_0.Enums.LocalizedKeys);
local v5 = require(l_script_FirstAncestor_0.Components.HeaderBarRightView);
return function(v6) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), l_Roact_0 (copy), v5 (copy)
    return {
        headerText = {
            raw = v4.ConnectionsHeader.rawValue(), 
            shouldLocalize = true
        }, 
        useSecondaryHeader = true, 
        shouldExitNavigation = false, 
        tabBarVisible = false, 
        renderRight = function() --[[ Line: 19 ]] --[[ Name: renderRight ]]
            -- upvalues: l_Roact_0 (ref), v5 (ref), v6 (copy)
            return l_Roact_0.createElement(v5, v6);
        end, 
        transparent = true, 
        absorbInputSelectable = false
    };
end;