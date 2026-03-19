local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Popover_0 = v2.Popover;
local l_PopoverAlign_0 = v2.Enums.PopoverAlign;
local l_Radius_0 = v2.Enums.Radius;
local v7 = {
    Top = UDim2.fromScale(0.5, 0), 
    Bottom = UDim2.fromScale(0.5, 1), 
    Left = UDim2.fromScale(0, 0.5), 
    Right = UDim2.fromScale(1, 0.5)
};
return function(v8) --[[ Line: 31 ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Popover_0 (copy), v7 (copy), l_PopoverAlign_0 (copy), l_Radius_0 (copy), v2 (copy)
    local v9 = l_useTokens_0();
    return v1.createElement(l_Popover_0.Root, {
        isOpen = v8.isOpen
    }, {
        AXTooltipAnchor = v1.createElement(l_Popover_0.Anchor, {
            Position = v7[v8.popoverSide]
        }), 
        AXTooltipContent = v1.createElement(l_Popover_0.Content, {
            align = l_PopoverAlign_0.Center, 
            side = v8.popoverSide, 
            backgroundStyle = v9.Color.System.Contrast, 
            radius = l_Radius_0.Medium
        }, {
            AXTooltipTextFrame = v1.createElement(v2.View, {
                tag = "col gap-xsmall padding-y-small padding-x-medium auto-xy"
            }, {
                AXTooltipTitle = v1.createElement(v2.Text, {
                    Text = v8.tooltipText, 
                    Size = if v8.maxWidth then UDim2.new(0, v8.maxWidth, 0, 0) else nil, 
                    tag = v8.maxWidth and "auto-y text-title-medium content-inverse-emphasis" or "auto-xy text-title-medium content-inverse-emphasis", 
                    TextWrapped = v8.maxWidth and true or nil
                })
            }), 
            AXTooltipOverlayButton = v1.createElement("TextButton", {
                Transparency = 1, 
                [v1.Event.Activated] = v8.onTooltipActivated, 
                Size = UDim2.fromScale(1, 1)
            })
        })
    });
end;