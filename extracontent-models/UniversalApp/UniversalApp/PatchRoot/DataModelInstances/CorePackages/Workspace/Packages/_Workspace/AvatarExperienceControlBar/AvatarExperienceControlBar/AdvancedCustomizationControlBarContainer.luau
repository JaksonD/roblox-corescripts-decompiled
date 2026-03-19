local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.useAdvancedCustomizationControlBarProps);
local v4 = require(l_script_FirstAncestor_0.BaseControlBarContainer);
return v2.memo(function(v5) --[[ Line: 9 ]] --[[ Name: AdvancedCustomizationControlBarContainer ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    local v6 = v3(v5);
    return v2.createElement(v4, {
        config = v6.config, 
        onActiveMenuItemChanged = v5.onActiveMenuItemChanged, 
        LayoutOrder = v5.LayoutOrder
    });
end);