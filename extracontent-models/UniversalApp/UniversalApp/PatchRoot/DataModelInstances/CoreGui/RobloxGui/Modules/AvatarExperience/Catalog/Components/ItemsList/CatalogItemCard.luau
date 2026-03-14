local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local l_CatalogItemCard_0 = v4.Components.CatalogItemCard.CatalogItemCard;
local l_ItemCardThumbnail_0 = v5.ItemCardComponents.ItemCardThumbnail;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.AnimationTabs);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXMigrateAnimationTabsToMVVM_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateAnimationTabsToMVVM;
local v13 = require(script.Parent.CatalogItemCardAnimationIndicatorContainer);
return (v1.forwardRef(function(v14, v15) --[[ Line: 58 ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_ItemCardThumbnail_0 (copy), v2 (copy), l_FFlagAXMigrateAnimationTabsToMVVM_0 (copy), v13 (copy), v9 (copy), l_CatalogItemCard_0 (copy)
    local v16 = l_useTokens_0();
    local v17 = v1.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v14 (copy), v1 (ref), l_ItemCardThumbnail_0 (ref), v2 (ref), v16 (copy)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            if v14.thumbnailUrl then
                return (v1.createElement(l_ItemCardThumbnail_0, {
                    ref = v14.thumbnailRef, 
                    tag = v14.thumbnailTag, 
                    url = v14.thumbnailUrl, 
                    onLoaded = v14.onThumbnailLoaded, 
                    imageRect = v14.thumbnailRect
                }));
            else
                return nil;
            end;
        else
            return (v1.createElement(v2.Focusable.Frame, {
                ref = v14.thumbnailRef, 
                [v1.Tag] = v14.thumbnailTag, 
                inputBindings = v14.inputBindings, 
                Size = UDim2.fromScale(1, 1), 
                ClipsDescendants = true, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                CornerRadius = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v16.Radius.Medium)
                }), 
                Thumbnail = if v14.thumbnailUrl then v1.createElement(l_ItemCardThumbnail_0, {
                    url = v14.thumbnailUrl, 
                    onLoaded = v14.onThumbnailLoaded, 
                    imageRect = v14.thumbnailRect
                }) else nil
            }));
        end;
    end, {
        v14.thumbnailRef, 
        v14.thumbnailTag, 
        v14.inputBindings, 
        v14.thumbnailUrl, 
        v14.onThumbnailLoaded, 
        v14.thumbnailRect, 
        v16.Radius.Medium
    });
    return v1.createElement(v1.Fragment, nil, {
        AnimationTabs = if v14.animationTabsItemData then if l_FFlagAXMigrateAnimationTabsToMVVM_0 then v1.createElement(v13, {
            bundleInfo = v14.animationTabsItemData, 
            ZIndex = 2, 
            paddingTop = UDim.new(0, v16.Gap.XSmall)
        }) else v1.createElement(v9, {
            itemData = v14.animationTabsItemData
        }) else nil, 
        Tile = v1.createElement(l_CatalogItemCard_0, {
            ref = v15, 
            onActivated = v14.onActivated, 
            onOverlayButtonActivated = v14.onOverlayButtonActivated, 
            overlayButtonText = v14.overlayButtonText, 
            presentationSlot = v17, 
            priceLineContent = v14.priceLineContent, 
            creator = v14.creator, 
            title = v14.title, 
            itemType = v14.itemType, 
            itemInfo = v14.itemInfo, 
            itemStatus = v14.itemStatus, 
            headerAspectRatio = v14.headerAspectRatio, 
            headerSize = v14.headerSize, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            isSelected = v14.isSelected, 
            headerBackgroundLayers = v14.backgroundLayers
        })
    });
end));