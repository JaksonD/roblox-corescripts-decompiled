local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local l_useIsGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useIsGamepad;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton);
local v15 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetLastSavedSort);
local v16 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v17 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v18 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v19 = require(l_Modules_0.AvatarExperience.LayeredMakeupSort.Selectors.selectEquippedLayeredMakeupOrdered);
local v20 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local l_selectEquippedAssets_0 = v6.State.Selectors.selectEquippedAssets;
local l_selectTopBarHeight_0 = v6.State.Selectors.selectTopBarHeight;
local v23 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v24 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v25 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage);
local v26 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.UnlockCharacterUpdates);
local v27 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local _ = require(l_Modules_0.AvatarExperience.LayeredMakeupSort.Components.LayeredMakeupSortPage);
return function(v29) --[[ Line: 39 ]]
    -- upvalues: l_useIsSpatial_0 (copy), l_useDispatch_0 (copy), l_useIsGamepad_0 (copy), l_useAvatarRoute_0 (copy), v12 (copy), v24 (copy), v23 (copy), l_useLocalization_0 (copy), v2 (copy), l_useSelector_0 (copy), v19 (copy), v20 (copy), l_selectEquippedAssets_0 (copy), l_selectTopBarHeight_0 (copy), v26 (copy), v27 (copy), v25 (copy), l_AvatarScreen_0 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy)
    local v30 = l_useIsSpatial_0();
    local v31 = l_useDispatch_0();
    local v32 = l_useIsGamepad_0();
    local v33 = l_useAvatarRoute_0();
    local v34 = v12(v24);
    local v35 = v12(v23);
    local v36 = l_useLocalization_0({
        makeupSorting = "Feature.Avatar.Title.MakeupSortPage", 
        noItemText = "Feature.Avatar.Message.LayeredMakeupSortNoEquipped"
    });
    local v37, v38 = v2.useState(false);
    local v39 = v2.useRef(nil);
    local v40 = l_useSelector_0(v19);
    local v41 = l_useSelector_0(v20);
    local v42 = l_useSelector_0(l_selectEquippedAssets_0);
    local v43 = l_useSelector_0(l_selectTopBarHeight_0);
    if v30 then
        v43 = 0;
    end;
    local v45 = v2.useCallback(function(v44) --[[ Line: 64 ]]
        -- upvalues: v38 (copy)
        v38(v44);
    end, {});
    local v46 = v2.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v31 (copy), v26 (ref), v29 (copy), v27 (ref), v34 (copy), v25 (ref), l_AvatarScreen_0 (ref)
        v31(v26());
        v29.navigation.pop();
        v31(v27(v34.avatarRefineGoBack));
        v31(v25(l_AvatarScreen_0.None));
    end, {
        v31, 
        v29.navigation, 
        v34
    });
    local v48 = v2.useCallback(function() --[[ Line: 86 ]]
        -- upvalues: v32 (copy), v33 (copy), l_AvatarScreen_0 (ref), v13 (ref), v29 (copy)
        local function v47() --[[ Line: 87 ]]
            -- upvalues: v32 (ref), v33 (ref), l_AvatarScreen_0 (ref), v13 (ref)
            if v32 and v33.opaque.name == l_AvatarScreen_0.LayeredMakeupSort then
                v13("LayeredMakeupSort");
            end;
        end;
        v29.navigation.navigate(l_AvatarScreen_0.ResetLayeredItemsSortPrompt, {
            onOverlayClosed = v47
        });
    end, {
        v29.navigation, 
        v32, 
        v33
    });
    local v49 = v2.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: v14 (ref), v46 (copy)
        return v14(v46);
    end, {
        v46
    });
    v2.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: v33 (copy), l_AvatarScreen_0 (ref), v39 (copy), v40 (copy), v42 (copy), v31 (copy), v15 (ref), v16 (ref), v17 (ref), v35 (copy), v18 (ref)
        if v33.opaque.name == l_AvatarScreen_0.LayeredMakeupSort and v39.current ~= l_AvatarScreen_0.LayeredMakeupSort then
            local v50 = {};
            for _, v52 in v40 do
                if v42[v52.typeId] and v42[v52.typeId][v52.id] then
                    v52.equipped = true;
                end;
                table.insert(v50, v52);
            end;
            v31(v15(v50));
            v31(v16(v40));
            v31(v17(v35, l_AvatarScreen_0.LayeredMakeupSort, v18.SceneFullView));
        end;
    end, {
        v33, 
        v40, 
        v42, 
        v35
    });
    v2.useEffect(function() --[[ Line: 132 ]]
        -- upvalues: v39 (copy), v33 (copy)
        v39.current = v33.opaque.name;
    end, {
        v33.opaque.name
    });
    return {
        isSpatial = v30, 
        isGamepad = v32, 
        isDragging = v37, 
        isPortrait = v41, 
        topBarHeight = v43, 
        onDragChange = v45, 
        onGoBack = v46, 
        onOpenResetPrompt = v48, 
        backButton = v49, 
        localized = v36, 
        equippedLayeredMakeupAssetIdsOrdered = v40
    };
end;