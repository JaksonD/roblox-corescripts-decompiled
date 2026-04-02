local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Constants_0 = v10.Constants;
local l_ItemTypeEnum_0 = v10.Enums.ItemTypeEnum;
local l_getTryOnItemReducerKey_0 = v10.Utils.getTryOnItemReducerKey;
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.ToggleTryOn);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v18 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionBarWithExpiredTimedOptions);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local function v22(v21) --[[ Line: 37 ]] --[[ Name: selectDeviceOrientation ]]
    return v21.DeviceOrientation;
end;
local function v24(v23) --[[ Line: 41 ]] --[[ Name: selectTryOnItems ]]
    return v23.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
return v20(function() --[[ Line: 45 ]] --[[ Name: ExpiredUserLookActionBarScreen ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v18 (copy), v16 (copy), v17 (copy), l_useSelector_0 (copy), v22 (copy), v24 (copy), l_DeviceOrientationMode_0 (copy), v3 (copy), l_getTryOnItemReducerKey_0 (copy), l_ItemTypeEnum_0 (copy), v14 (copy), v15 (copy), l_AvatarScreen_0 (copy), v4 (copy), l_Constants_0 (copy), v19 (copy)
    local v25 = l_useNavigation_0();
    local v26 = l_useDispatch_0();
    local v27 = v18(v16);
    local v28 = v18(v17);
    local v29 = l_useSelector_0(v22);
    local v30 = l_useSelector_0(v24);
    local v31 = v29 == l_DeviceOrientationMode_0.Portrait;
    local v32 = v25.state.params or {};
    local v33 = v32.expiredItemCount or 0;
    local l_expiredItems_0 = v32.expiredItems;
    local v38 = v3.useCallback(function() --[[ Line: 58 ]]
        -- upvalues: l_expiredItems_0 (copy), l_getTryOnItemReducerKey_0 (ref), l_ItemTypeEnum_0 (ref), v30 (copy), v26 (copy), v14 (ref), v15 (ref), v28 (copy), v27 (copy), v25 (copy), l_AvatarScreen_0 (ref)
        if l_expiredItems_0 then
            for _, v36 in l_expiredItems_0 do
                local v37 = l_getTryOnItemReducerKey_0(v36.itemId, l_ItemTypeEnum_0.Asset);
                if not v30 or not v30[v37] then
                    v26(v14(l_ItemTypeEnum_0.Asset, v36.itemSubType, v36.itemId, true, v36.order));
                    v26(v15(v28, v27, v36.itemId, l_ItemTypeEnum_0.Asset));
                end;
            end;
        end;
        v25.navigate(l_AvatarScreen_0.ExpiredUserLookCheckout);
    end, {
        v25, 
        v26, 
        l_expiredItems_0, 
        v30, 
        v27, 
        v28
    });
    if v33 > 0 then
        return (v3.createElement(v4.View, {
            tag = "size-full gui-object-defaults", 
            ZIndex = 4
        }, {
            ActionBarInner = v3.createElement(v4.View, {
                tag = "gui-object-defaults", 
                Size = if v31 then UDim2.fromScale(1, 1) else UDim2.fromScale(l_Constants_0.LANDSCAPE_SCENE_WIDTH_PERCENTAGE, 1), 
                Position = if v31 then UDim2.fromScale(0, 0) else UDim2.fromScale(l_Constants_0.LANDSCAPE_UI_WIDTH_PERCENTAGE, 0)
            }, {
                ActionBar = v3.createElement(v19, {
                    expiredItemCount = v33, 
                    onViewPressed = v38
                })
            })
        }));
    else
        return nil;
    end;
end);