local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Interactable_0 = v2.Core.Control.Interactable;
local l_useStyle_0 = v2.Core.Style.useStyle;
return function(v6) --[[ Line: 23 ]] --[[ Name: ItemTileDetailButton ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_Interactable_0 (copy)
    local v7 = l_useStyle_0();
    local l_Theme_0 = v7.Theme;
    local l_Font_0 = v7.Font;
    local v10 = if v6.itemsCount then {
        "Feature.Avatar.Label.Details"; 
        quantity = v6.itemsCount
    } else "Feature.Avatar.Label.DetailsButton";
    local v11 = l_useLocalization_0({
        detail = v10
    });
    return v1.createElement(l_Interactable_0, {
        Size = UDim2.new(1, 0, 0, 28), 
        Position = UDim2.new(0, 0, 1, -28), 
        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
        [v1.Event.Activated] = v6.activateButton, 
        ZIndex = 10, 
        BackgroundTransparency = 1
    }, {
        BoundingFrame = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundColor3 = l_Theme_0.SystemPrimaryDefault.Color
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }), 
            Text = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Font = l_Font_0.CaptionHeader.Font, 
                TextSize = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, 
                Text = v11.detail, 
                TextColor3 = l_Theme_0.SystemPrimaryContent.Color
            })
        })
    });
end;