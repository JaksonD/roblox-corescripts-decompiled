local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_CatalogItemCard_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard;
local l_ItemCardThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local _ = require(l_Modules_0.AvatarExperience.EditEmotes.EmoteTile.useEmoteTileProps);
return v2.forwardRef(function(v8, v9) --[[ Line: 16 ]] --[[ Name: EmoteTile ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_CatalogItemCard_0 (copy), v3 (copy), l_ItemCardThumbnail_0 (copy)
    local v10 = l_useTokens_0();
    return v2.createElement(l_CatalogItemCard_0, {
        onActivated = v8.onActivated, 
        presentationSlot = v2.createElement(v3.Focusable.Frame, {
            Size = UDim2.fromScale(1, 1), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            CornerRadius = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v10.Semantic.Radius.Medium)
            }), 
            EmoteTileThumbnail = v2.createElement(l_ItemCardThumbnail_0, {
                url = ("rbxthumb://type=Asset&id=%*&w=150&h=150&filters=0"):format(v8.itemId)
            })
        }), 
        title = v8.item.name, 
        isSelected = v8.isSelected, 
        Size = UDim2.fromOffset(v8.itemWidth, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ref = v9, 
        LayoutOrder = v8.index, 
        tag = v8.impressionsTag, 
        gridInformation = v8.gridInformation
    });
end);