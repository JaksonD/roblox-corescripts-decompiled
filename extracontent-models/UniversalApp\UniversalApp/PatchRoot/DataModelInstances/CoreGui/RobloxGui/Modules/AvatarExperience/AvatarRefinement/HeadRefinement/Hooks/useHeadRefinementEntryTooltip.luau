local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_game_EngineFeature_0 = game:GetEngineFeature("AXMarketplaceHeadTooltipKeys");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v8 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_getShouldShowAdjustmentTooltipFromTime_0 = v5.Utils.getShouldShowAdjustmentTooltipFromTime;
local v10 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectLastTryOnClassicHeadShape);
local v11 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v12 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableHeadRefinementTooltip);
local l_l_AppStorageService_0_0 = l_AppStorageService_0;
local function v22() --[[ Line: 32 ]] --[[ Name: getMockAppStorageService ]]
    return {
        storage = {}, 
        GetItem = function(v16, v17) --[[ Line: 35 ]] --[[ Name: GetItem ]]
            return v16.storage[v17];
        end, 
        SetItem = function(v18, v19, v20) --[[ Line: 38 ]] --[[ Name: SetItem ]]
            v18.storage[v19] = v20;
        end, 
        Flush = function(_) --[[ Line: 41 ]] --[[ Name: Flush ]]

        end
    };
end;
if not l_game_EngineFeature_0 then
    l_l_AppStorageService_0_0 = v22();
end;
local function v24(v23) --[[ Line: 51 ]] --[[ Name: selectIsDynamicHeadEquipped ]]
    -- upvalues: v7 (copy)
    return v7.isDynamicHeadEquipped(v23.AvatarExperience.AvatarEditor.Character.EquippedAssets);
end;
local function v26(v25) --[[ Line: 55 ]] --[[ Name: selectIsTryingOnDynamicHead ]]
    -- upvalues: v8 (copy)
    return v8.isTryingOnDynamicHead(v25.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems or {});
end;
return function(v27) --[[ Line: 67 ]] --[[ Name: useHeadRefinementEntryTooltip ]]
    -- upvalues: v4 (copy), l_useSelector_0 (copy), v24 (copy), v11 (copy), v26 (copy), v10 (copy), l_l_AppStorageService_0_0 (ref), v12 (copy), v14 (copy), l_getShouldShowAdjustmentTooltipFromTime_0 (copy)
    local v28, v29 = v4.useState(false);
    local v30 = l_useSelector_0(v24);
    local v33 = l_useSelector_0(function(v31) --[[ Line: 71 ]]
        -- upvalues: v27 (copy), v11 (ref)
        local v32 = v27.avatarRoute and v27.avatarRoute.opaque and v27.avatarRoute.opaque.name;
        return v11(v31, v32);
    end);
    local v34 = l_useSelector_0(v26);
    local v35 = l_useSelector_0(v10);
    local v36 = v27.appStorageService or l_l_AppStorageService_0_0;
    local v37 = v27.shouldBeVisible and (v35 or not v30) and v33 ~= v12.SceneFullView and not v34;
    v4.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v37 (copy), v36 (copy), v29 (copy), v14 (ref), l_getShouldShowAdjustmentTooltipFromTime_0 (ref)
        if v37 then
            local l_v36_Item_0 = v36:GetItem("AXMarketplaceHeadAdjustmentTooltipSeenTimestamp");
            local v39 = if l_v36_Item_0 then tonumber(l_v36_Item_0) else nil;
            v29(not v14() and l_getShouldShowAdjustmentTooltipFromTime_0({
                prevTime = v39, 
                currentTime = os.time()
            }));
            return;
        else
            v29(false);
            return;
        end;
    end, {
        v37, 
        v27.shouldBeVisible
    });
    return v28, function(v40) --[[ Line: 105 ]]
        -- upvalues: v36 (copy), v29 (copy)
        if v40.saveDismissTime then
            v36:SetItem("AXMarketplaceHeadAdjustmentTooltipSeenTimestamp", (tostring(os.time())));
            v36:Flush();
        end;
        v29(false);
    end;
end;