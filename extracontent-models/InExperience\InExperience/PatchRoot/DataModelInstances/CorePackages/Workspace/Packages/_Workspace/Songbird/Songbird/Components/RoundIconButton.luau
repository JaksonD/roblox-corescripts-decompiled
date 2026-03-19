local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v4) --[[ Line: 17 ]] --[[ Name: RoundIconButton ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v2 (copy)
    local v5 = l_useTokens_0();
    return v1.createElement(v2.View, {
        tag = "auto-xy bg-action-emphasis radius-circle padding-small", 
        onActivated = v4.onActivated, 
        aspectRatio = 1, 
        LayoutOrder = v4.LayoutOrder
    }, {
        Icon = v1.createElement(v2.Icon, {
            Position = v4.iconOffset, 
            name = v4.icon, 
            size = v2.Enums.IconSize.Medium, 
            style = v5.Color.ActionEmphasis.Foreground
        })
    });
end;