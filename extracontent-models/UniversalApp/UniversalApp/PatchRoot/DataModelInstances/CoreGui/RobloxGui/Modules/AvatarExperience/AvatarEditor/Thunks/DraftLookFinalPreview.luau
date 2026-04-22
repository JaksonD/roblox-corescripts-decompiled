local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v7 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_WidgetConstants_0 = v3.WidgetConstants;
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_SetLookDetailsPeekViewSelectedTab_0 = v9.Actions.SetLookDetailsPeekViewSelectedTab;
local l_SetTryOnManagerPeekViewState_0 = v9.Actions.SetTryOnManagerPeekViewState;
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.TryOnLooksOutfit);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local function v17(v15) --[[ Line: 27 ]] --[[ Name: processAssetItem ]]
    -- upvalues: l_WidgetConstants_0 (copy)
    local v16 = false;
    if v15.id ~= nil then
        v16 = v15.assetType ~= nil;
    end;
    assert(v16, "Asset is missing required fields");
    return {
        itemId = v15.id, 
        itemType = l_WidgetConstants_0.ContentType.Asset, 
        itemSubType = tostring(v15.assetType), 
        tryOnItemOrder = v15.tryOnItemOrder, 
        isNotSelectable = true
    };
end;
local function v20(v18) --[[ Line: 39 ]] --[[ Name: processAssetItemInBundle ]]
    -- upvalues: l_WidgetConstants_0 (copy)
    local v19 = false;
    if v18.id ~= nil then
        v19 = v18.assetType ~= nil;
    end;
    assert(v19, "Asset is missing required fields");
    return {
        itemId = tostring(v18.id), 
        itemType = l_WidgetConstants_0.ContentType.Asset, 
        itemSubType = tostring(v18.assetType), 
        tryOnItemOrder = v18.tryOnItemOrder
    };
end;
local function v26(v21) --[[ Line: 52 ]] --[[ Name: processBundleItem ]]
    -- upvalues: v20 (copy), l_WidgetConstants_0 (copy)
    local v22 = false;
    if v21.id ~= nil then
        v22 = v21.bundleType ~= nil;
    end;
    assert(v22, "Bundle is missing required fields");
    local v23 = 0;
    v22 = {};
    for v24, v25 in v21.assetsInBundle do
        if v25.isIncluded then
            v25.tryOnItemOrder = v24;
            v23 = v23 + 1;
            table.insert(v22, (v20(v25)));
        end;
    end;
    return {
        itemId = v21.id, 
        itemType = l_WidgetConstants_0.ContentType.Bundle, 
        itemSubType = tostring(v21.bundleType), 
        items = v22, 
        numberOfAssetsIncluded = if v23 > 0 then v23 else nil, 
        tryOnItemOrder = v21.tryOnItemOrder, 
        isNotSelectable = true
    };
end;
return function(v27) --[[ Line: 76 ]]
    -- upvalues: v5 (copy), v17 (copy), v26 (copy), l_SetTryOnManagerPeekViewState_0 (copy), l_PeekViewState_0 (copy), v12 (copy), v7 (copy), l_NavigateWithLock_0 (copy), v14 (copy), l_AvatarScreen_0 (copy), l_SetLookDetailsPeekViewSelectedTab_0 (copy)
    return function(v28) --[[ Line: 77 ]]
        -- upvalues: v5 (ref), v17 (ref), v26 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v12 (ref), v7 (ref), v27 (copy), l_NavigateWithLock_0 (ref), v14 (ref), l_AvatarScreen_0 (ref), l_SetLookDetailsPeekViewSelectedTab_0 (ref)
        local l_DraftLookId_0 = v5.DraftLookId;
        local v30 = v28:getState().AvatarExperience.AvatarScene.Looks[l_DraftLookId_0];
        if not v30 then
            return;
        else
            local l_lookAssetInfos_0 = v30.lookAssetInfos;
            local l_lookBundleInfos_0 = v30.lookBundleInfos;
            local v33 = {};
            for _, v35 in l_lookAssetInfos_0 do
                table.insert(v33, (v17(v35)));
            end;
            local v36 = {};
            for _, v38 in l_lookBundleInfos_0 do
                table.insert(v36, (v26(v38)));
            end;
            v28:dispatch(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.Full));
            v28:dispatch(v12({
                assetItemIdTypeAndSubtype = v33, 
                bundleItemIdTypeAndSubtype = v36, 
                lookId = l_DraftLookId_0, 
                lookType = v30.lookType, 
                bodyColor3s = if v30.avatarProperties then v7.convertBodyColor3HexesToColor3s(v30.avatarProperties.bodyColor3s) else nil, 
                scale = if v30.avatarProperties then v30.avatarProperties.scale else nil
            }));
            if v27 ~= nil then
                v28:dispatch(l_NavigateWithLock_0(function() --[[ Line: 113 ]]
                    -- upvalues: v14 (ref), v27 (ref), l_AvatarScreen_0 (ref), v28 (copy), l_SetLookDetailsPeekViewSelectedTab_0 (ref)
                    v14.closeFiltersAndItemDetails(v27);
                    v27.navigate(l_AvatarScreen_0.LookDetails);
                    v28:dispatch(l_SetLookDetailsPeekViewSelectedTab_0(1));
                end));
            end;
            return;
        end;
    end;
end;