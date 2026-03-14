local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_useTokens_0 = v4.Hooks.useTokens;
local _ = require(l_Modules_0.AvatarExperience.AvatarSwitcher.AvatarTile.useAvatarTileProps);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_CatalogItemCard_0 = v5.Components.CatalogItemCard.CatalogItemCard;
local l_ItemCardThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local l_FFlagAXSlotAvatarThumbnailPromptFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotAvatarThumbnailPromptFix;
local v15 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarTileNoDefaultOutfitInfo);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local function v19(v18) --[[ Line: 42 ]] --[[ Name: selectDeviceOrientation ]]
    return v18.DeviceOrientation;
end;
return v2.forwardRef(function(v20, v21) --[[ Line: 46 ]] --[[ Name: AvatarTile ]]
    -- upvalues: l_useTokens_0 (copy), l_useSelector_0 (copy), v19 (copy), v7 (copy), v2 (copy), l_CatalogItemCard_0 (copy), v3 (copy), l_ItemCardThumbnail_0 (copy), l_FFlagAXSlotAvatarThumbnailPromptFix_0 (copy), v15 (copy), v11 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy)
    local v22 = l_useTokens_0();
    local v23 = l_useSelector_0(v19) == v7.Keys.Portrait;
    return v2.createElement(l_CatalogItemCard_0, {
        onActivated = v20.onActivated, 
        presentationSlot = v2.createElement(v3.Focusable.Frame, {
            Size = UDim2.fromScale(1, 1), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            CornerRadius = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v22.Semantic.Radius.Medium)
            }), 
            AvatarTileThumbnail = v2.createElement(l_ItemCardThumbnail_0, {
                url = if l_FFlagAXSlotAvatarThumbnailPromptFix_0 then ("rbxthumb://type=Outfit&id=%*&w=150&h=150&filters=%*"):format(v20.itemId, v20.outfitUpdateCounter) else ("rbxthumb://type=Outfit&id=%*&w=150&h=150&filters=0"):format(v20.itemId)
            })
        }), 
        title = if v15 then v20.item and v20.item.name else v20.item.name, 
        titleTextSize = if v23 then v22.Typography.BodySmall else nil, 
        isSelected = v20.isSelected, 
        Size = UDim2.fromOffset(v20.itemWidth, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ref = v21, 
        headerAspectRatio = if v20.squareAspectRatio then v11.ItemTileSquareAspectRatio else v11.ItemTileTallAspectRatio, 
        LayoutOrder = v20.index, 
        tag = v20.impressionsTag, 
        itemStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v20.itemStatus else nil
    });
end);