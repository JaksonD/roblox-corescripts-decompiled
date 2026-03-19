local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.InventoryItemsListContainer);
local v3 = require(l_Modules_0.AvatarExperience.Photobooth.Components.TryOnItemCard.TryOnItemCardContainer);
local v4 = require(l_Modules_0.AvatarExperience.Photobooth.photoboothCategories);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Foundation);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local _ = require(l_Modules_0.AvatarExperience.Photobooth.Components.Animations.usePhotoboothAnimationsProps);
local v9 = require(l_Modules_0.AvatarExperience.Photobooth.Components.Animations.PhotoboothAnimationsPillBar);
local l_FFlagAXPhotoboothBugBashFixes_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXPhotoboothBugBashFixes;
return function(v11) --[[ Line: 25 ]] --[[ Name: PhotoboothAnimations ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), v4 (copy), v3 (copy), l_FFlagAXPhotoboothBugBashFixes_0 (copy), v6 (copy), v9 (copy), v2 (copy)
    local v12 = l_useLocalization_0({
        animations = "Feature.Avatar.Heading.Animations"
    });
    local v13 = v5.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v4 (ref), v11 (copy)
        return v4[v11.animationFilter];
    end, {
        v11.animationFilter
    });
    local v20 = v5.useCallback(function(v14, v15) --[[ Line: 35 ]]
        -- upvalues: v5 (ref), v3 (ref), l_FFlagAXPhotoboothBugBashFixes_0 (ref), v11 (copy)
        local l_createElement_0 = v5.createElement;
        local l_v3_0 = v3;
        local v18 = {
            inventoryItemType = v14.item.inventoryItemType, 
            itemId = v14.item.itemId
        };
        local v19 = false;
        if v14.item.itemId ~= nil then
            v19 = v15.ownedItemIdToIsWearing[v14.item.itemId] == true;
        end;
        v18.isSelected = v19;
        v18.impressionsTag = v15.impressionsTag;
        v18.onTileClicked = if l_FFlagAXPhotoboothBugBashFixes_0 then v11.onTileClicked else nil;
        return l_createElement_0(l_v3_0, v18);
    end, if l_FFlagAXPhotoboothBugBashFixes_0 then {
        v11.onTileClicked
    } else {});
    return v5.createElement(v6.View, {
        tag = "col gap-small size-full-full", 
        Position = v11.position, 
        LayoutOrder = 1
    }, {
        Heading = v5.createElement(v6.Text, {
            tag = "text-color-primary text-heading-medium text-align-x-left text-align-y-top auto-xy", 
            Text = v12.animations, 
            LayoutOrder = 1
        }), 
        PillBarScrollContainer = v5.createElement(v6.View, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = 2
        }, {
            PillBar = v5.createElement(v9, {
                tokens = v11.tokens, 
                animationFilter = v11.animationFilter, 
                onAnimationFilterChanged = v11.onAnimationFilterChanged
            })
        }), 
        ScrollViewContainer = v5.createElement(v6.View, {
            tag = "grow-1 size-full-0", 
            LayoutOrder = 3
        }, {
            ItemsList = v5.createElement(v2, {
                categoryInfo = v13, 
                showRecommendedItems = false, 
                disableSortsAndFilters = true, 
                renderItem = v20
            })
        })
    });
end;