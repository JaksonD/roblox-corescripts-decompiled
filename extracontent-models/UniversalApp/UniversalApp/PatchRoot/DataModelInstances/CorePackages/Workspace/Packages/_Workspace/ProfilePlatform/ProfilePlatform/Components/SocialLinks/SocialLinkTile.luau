local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Medium_0 = l_IconSize_0.Medium;
return function(v7) --[[ Line: 24 ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), l_IconButton_0 (copy), l_Medium_0 (copy)
    local v8 = l_useStyle_0();
    local v9 = v7.tileSize or 80;
    return v1.createElement("Frame", {
        LayoutOrder = v7.layoutOrder, 
        Size = UDim2.new(0, v9, 0, v9 + 24), 
        BackgroundTransparency = 1, 
        Name = "SocialLinkTile_" .. v7.name
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 8)
        }), 
        TextLabel = v1.createElement("TextLabel", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            Text = v7.name, 
            TextColor3 = v8.Theme.TextDefault.Color, 
            TextSize = 14, 
            Font = Enum.Font.GothamMedium, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Name = "NameLabel"
        }), 
        IconBackground = v1.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(84, 84), 
            BackgroundTransparency = 0.9, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BorderSizePixel = 0, 
            Name = "IconBackground"
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            IconButton = v1.createElement(l_IconButton_0, {
                icon = v7.icon, 
                size = UDim2.fromOffset(84, 84), 
                iconColor3 = v8.Theme.IconEmphasis.Color, 
                iconSize = l_Medium_0, 
                onActivated = v7.onActivated, 
                backgroundTransparency = 1
            })
        })
    });
end;