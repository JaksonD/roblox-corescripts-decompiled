local l_Parent_0 = script:FindFirstAncestor("SocialCards").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_useTokens_0 = v1.Hooks.useTokens;
return function(v4) --[[ Line: 13 ]] --[[ Name: AltTextCard ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v1 (copy)
    local v5 = l_useTokens_0();
    return v2.createElement(v1.Text, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        fontStyle = {
            Font = v5.Typography.BodyMedium.Font, 
            FontSize = v5.Typography.BodyMedium.FontSize
        }, 
        padding = {
            bottom = UDim.new(0, v5.Padding.Medium), 
            left = UDim.new(0, v5.Padding.Medium), 
            right = UDim.new(0, v5.Padding.Medium), 
            top = UDim.new(0, v5.Padding.Medium)
        }, 
        Text = v4.altText, 
        textStyle = {
            Color3 = v5.Color.Content.Muted.Color3, 
            Transparency = v5.Color.Content.Muted.Transparency
        }, 
        TextWrapped = true
    });
end;