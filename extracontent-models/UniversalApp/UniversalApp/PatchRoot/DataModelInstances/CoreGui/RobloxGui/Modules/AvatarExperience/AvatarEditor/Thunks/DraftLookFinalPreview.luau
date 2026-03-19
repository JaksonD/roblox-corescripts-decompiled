local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v7 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetLookDetailsPeekViewSelectedTab);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.TryOnLooksOutfit);
local v11 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local function v15(v13) --[[ Line: 27 ]] --[[ Name: processAssetItem ]]
    -- upvalues: v7 (copy)
    local v14 = false;
    if v13.id ~= nil then
        v14 = v13.assetType ~= nil;
    end;
    assert(v14, "Asset is missing required fields");
    return {
        itemId = v13.id, 
        itemType = v7.ContentType.Asset, 
        itemSubType = tostring(v13.assetType), 
        tryOnItemOrder = v13.tryOnItemOrder, 
        isNotSelectable = true
    };
end;
local function v18(v16) --[[ Line: 39 ]] --[[ Name: processAssetItemInBundle ]]
    -- upvalues: v7 (copy)
    local v17 = false;
    if v16.id ~= nil then
        v17 = v16.assetType ~= nil;
    end;
    assert(v17, "Asset is missing required fields");
    return {
        itemId = tostring(v16.id), 
        itemType = v7.ContentType.Asset, 
        itemSubType = tostring(v16.assetType), 
        tryOnItemOrder = v16.tryOnItemOrder
    };
end;
local function v24(v19) --[[ Line: 52 ]] --[[ Name: processBundleItem ]]
    -- upvalues: v18 (copy), v7 (copy)
    local v20 = false;
    if v19.id ~= nil then
        v20 = v19.bundleType ~= nil;
    end;
    assert(v20, "Bundle is missing required fields");
    local v21 = 0;
    v20 = {};
    for v22, v23 in v19.assetsInBundle do
        if v23.isIncluded then
            v23.tryOnItemOrder = v22;
            v21 = v21 + 1;
            table.insert(v20, (v18(v23)));
        end;
    end;
    return {
        itemId = v19.id, 
        itemType = v7.ContentType.Bundle, 
        itemSubType = tostring(v19.bundleType), 
        items = v20, 
        numberOfAssetsIncluded = if v21 > 0 then v21 else nil, 
        tryOnItemOrder = v19.tryOnItemOrder, 
        isNotSelectable = true
    };
end;
return function(v25) --[[ Line: 76 ]]
    -- upvalues: v4 (copy), v15 (copy), v24 (copy), v9 (copy), l_PeekViewState_0 (copy), v10 (copy), v6 (copy), v11 (copy), v12 (copy), l_AvatarScreen_0 (copy), v8 (copy)
    return function(v26) --[[ Line: 77 ]]
        -- upvalues: v4 (ref), v15 (ref), v24 (ref), v9 (ref), l_PeekViewState_0 (ref), v10 (ref), v6 (ref), v25 (copy), v11 (ref), v12 (ref), l_AvatarScreen_0 (ref), v8 (ref)
        local l_DraftLookId_0 = v4.DraftLookId;
        local v28 = v26:getState().AvatarExperience.AvatarScene.Looks[l_DraftLookId_0];
        if not v28 then
            return;
        else
            local l_lookAssetInfos_0 = v28.lookAssetInfos;
            local l_lookBundleInfos_0 = v28.lookBundleInfos;
            local v31 = {};
            for _, v33 in l_lookAssetInfos_0 do
                table.insert(v31, (v15(v33)));
            end;
            local v34 = {};
            for _, v36 in l_lookBundleInfos_0 do
                table.insert(v34, (v24(v36)));
            end;
            v26:dispatch(v9(l_PeekViewState_0.Full));
            v26:dispatch(v10({
                assetItemIdTypeAndSubtype = v31, 
                bundleItemIdTypeAndSubtype = v34, 
                lookId = l_DraftLookId_0, 
                lookType = v28.lookType, 
                bodyColor3s = if v28.avatarProperties then v6.convertBodyColor3HexesToColor3s(v28.avatarProperties.bodyColor3s) else nil, 
                scale = if v28.avatarProperties then v28.avatarProperties.scale else nil
            }));
            if v25 ~= nil then
                v26:dispatch(v11(function() --[[ Line: 113 ]]
                    -- upvalues: v12 (ref), v25 (ref), l_AvatarScreen_0 (ref), v26 (copy), v8 (ref)
                    v12.closeFiltersAndItemDetails(v25);
                    v25.navigate(l_AvatarScreen_0.LookDetails);
                    v26:dispatch(v8(1));
                end));
            end;
            return;
        end;
    end;
end;