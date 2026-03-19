local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_InventoryItemType_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemType;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local v9 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local v13 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v14 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v16 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v17 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v18 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearAnimationPreview);
local _ = require(script.Parent.TryOnItemCard);
return function(v20) --[[ Line: 39 ]] --[[ Name: useTryOnItemCardProps ]]
    -- upvalues: v2 (copy), l_useDispatch_0 (copy), v13 (copy), v14 (copy), v15 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), v3 (copy), l_InventoryItemType_0 (copy), v9 (copy), l_useSelector_0 (copy), v16 (copy), v17 (copy), v18 (copy), v11 (copy), v12 (copy)
    local v21 = v2.useRef(nil);
    local v22 = l_useDispatch_0();
    local v23 = v13(v14);
    local v24 = v13(v15);
    local v25 = l_useAvatarRoute_0();
    local v26 = l_useNavigation_0();
    local v27 = v3.Hooks.useTokens();
    local l_inventoryItemType_0 = v20.inventoryItemType;
    local v30 = v2.useCallback(function(v29) --[[ Line: 50 ]]
        -- upvalues: l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v9 (ref), v20 (copy)
        if l_inventoryItemType_0 == l_InventoryItemType_0.Asset then
            return (v9(v29.AvatarExperience.Common, v20.itemId, l_inventoryItemType_0));
        else
            return nil;
        end;
    end, {
        l_inventoryItemType_0, 
        v20.itemId
    });
    local v31 = l_useSelector_0(v30);
    local v33 = v2.useCallback(function(v32) --[[ Line: 57 ]]
        -- upvalues: l_inventoryItemType_0 (copy), l_InventoryItemType_0 (ref), v20 (copy)
        if l_inventoryItemType_0 == l_InventoryItemType_0.Outfit then
            return v32.AvatarExperience.AvatarEditor.OutfitInfos[v20.itemId];
        else
            return nil;
        end;
    end, {
        l_inventoryItemType_0, 
        v20.itemId
    });
    local v34 = l_useSelector_0(v33);
    local v35 = if v31 then v31.name else if v34 then v34.name else "";
    local v36 = if v31 then v31.assetType else nil;
    local v40 = l_useSelector_0(function(v37) --[[ Line: 67 ]]
        -- upvalues: v20 (copy)
        local l_LastAnimOrEmoteToggledItem_0 = v37.AvatarExperience.AvatarScene.OutfitTryOn.LastAnimOrEmoteToggledItem;
        if l_LastAnimOrEmoteToggledItem_0 and l_LastAnimOrEmoteToggledItem_0.itemId == v20.itemId then
            return true;
        else
            local l_AnimationPreview_0 = v37.AvatarExperience.AvatarScene.TryOn.AnimationPreview;
            if l_AnimationPreview_0 and l_AnimationPreview_0 == v20.itemId then
                return true;
            else
                return false;
            end;
        end;
    end);
    local v43 = v2.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: v20 (copy), v31 (copy), v40 (copy), v36 (copy), v16 (ref), v22 (copy), v17 (ref), v18 (ref), v11 (ref), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v12 (ref)
        if not v20.itemId or not v31 then
            return;
        else
            local v41 = not v40;
            local v42 = v36 and v16.isAnimationAssetType(v36);
            v22(v17());
            v22(v18());
            if v41 then
                v22(v11(v23, v24, "Asset", v31.assetType, v20.itemId, v41, v25, v26, nil));
                if v42 and v41 then
                    v22(v12(v20.itemId, v31.assetType));
                end;
            end;
            if v20.onTileClicked then
                v20.onTileClicked();
            end;
            return;
        end;
    end, {
        v22, 
        v23, 
        v24, 
        v26, 
        v25, 
        v20.itemId, 
        v40, 
        v31, 
        v36, 
        v20.onTileClicked
    });
    return {
        itemId = v20.itemId, 
        inventoryItemType = l_inventoryItemType_0, 
        itemName = v35, 
        showDynamicHeadIcon = false, 
        isSelected = v40, 
        thumbnailRef = v21, 
        onActivated = v43, 
        impressionsTag = v20.impressionsTag, 
        assetType = v36, 
        tokens = v27, 
        ref = v20.ref
    };
end;