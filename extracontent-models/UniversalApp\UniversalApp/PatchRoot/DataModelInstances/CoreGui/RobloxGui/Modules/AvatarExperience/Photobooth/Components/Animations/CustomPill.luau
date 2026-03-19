local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v4) --[[ Line: 20 ]] --[[ Name: CustomPill ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v2 (copy)
    local v5 = l_useTokens_0();
    local v6 = if v4.isChecked then v5.Color.ActionSubEmphasis.Background else v5.Color.Shift.Shift_200;
    local v7 = if v4.isChecked then v5.Color.ActionSubEmphasis.Foreground else v5.Color.Content.Emphasis;
    return v1.createElement(v2.View, {
        tag = "auto-xy radius-circle padding-small align-x-center align-y-center", 
        backgroundStyle = v6, 
        onActivated = v4.onActivated, 
        LayoutOrder = v4.LayoutOrder
    }, {
        PillText = v1.createElement(v2.Text, {
            Text = v4.text, 
            textStyle = v7, 
            fontStyle = v5.Typography.CaptionLarge, 
            tag = "auto-xy text-align-x-center text-align-y-center text-no-wrap padding-x-xsmall text-truncate-end"
        })
    });
end;