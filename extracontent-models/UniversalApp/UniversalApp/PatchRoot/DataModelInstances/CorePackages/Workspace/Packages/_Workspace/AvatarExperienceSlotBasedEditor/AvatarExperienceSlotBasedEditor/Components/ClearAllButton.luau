local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Icon_0 = v2.Icon;
local l_IconSize_0 = v2.Enums.IconSize;
local v6 = require(script.Parent.Parent.Constants);
local l_Text_0 = v2.Text;
local l_FFlagAXMigrateBuilderIcons_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons;
return function(v9) --[[ Line: 33 ]] --[[ Name: ClearCategoryButton ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Icon_0 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), v6 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    local v10 = l_useTokens_0();
    return v1.createElement("Frame", {
        Size = v9.Size or UDim2.fromOffset(v10.Size.Size_2500, v10.Size.Size_2500), 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.LayoutOrder, 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, {
        v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, -v10.Padding.XSmall)
            }), 
            Icon = v1.createElement(l_Icon_0, {
                name = if l_FFlagAXMigrateBuilderIcons_0 then v6.Icons.Reset.name else v6.Icons.Reset, 
                variant = if l_FFlagAXMigrateBuilderIcons_0 then v6.Icons.Reset.variant else nil, 
                size = l_IconSize_0.Medium, 
                style = {
                    Color3 = v10.Color.Content.Muted.Color3, 
                    Transparency = 0
                }
            }), 
            Text = if v9.text then v1.createElement(l_Text_0, {
                Size = v9.textStyles and v9.textStyles.Size or UDim2.fromScale(1, 0), 
                Text = v9.text, 
                TextWrapped = true, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                fontStyle = v9.textStyles and v9.textStyles.fontStyle or v10.Typography.CaptionMedium, 
                padding = UDim.new(0, v10.Padding.Small)
            }) else nil
        })
    });
end;