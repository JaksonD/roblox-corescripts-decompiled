local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_GridMetrics_0 = require(l_CorePackages_0.Packages.UIBlox).App.Grid.GridMetrics;
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v7 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v10 = require(l_Modules_0.AvatarExperience.Flags.FFlagAEGetEditableOutfitsType);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useAvatarRoute_0 = v6.AvatarRoute.Hooks.useAvatarRoute;
local v15 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_Signal_0 = v7.Signal;
local v17 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v18 = require(l_Modules_0.LuaApp.Constants);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v21 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v22 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v23 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfits);
local l_EditableCharacterKey_0 = v19.EditableCharacterKey;
local function v27(v26) --[[ Line: 36 ]] --[[ Name: selectPageFinished ]]
    return v26.AvatarExperience.AvatarEditor.PageFinished;
end;
local function v43(v28) --[[ Line: 40 ]] --[[ Name: selectOwnedItemIdsWearing ]]
    -- upvalues: l_EditableCharacterKey_0 (copy), v20 (copy)
    local l_OutfitInfos_0 = v28.AvatarExperience.AvatarEditor.OutfitInfos;
    local l_EquippedAssets_0 = v28.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AvatarType_0 = v28.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_BodyColor3s_0 = v28.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    local l_AvatarScales_0 = v28.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local l_OwnedItemIdsBySubtype_0 = v28.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
    local v35 = {};
    local v36 = false;
    local v37 = {};
    if l_OwnedItemIdsBySubtype_0 then
        local v38 = l_OwnedItemIdsBySubtype_0[l_EditableCharacterKey_0] or {};
        v37 = table.clone(v38);
    end;
    for _, v40 in v37 do
        local v41 = l_OutfitInfos_0[v40];
        if v41 then
            local v42 = v20.isWearingOutfitNoState(v41, l_AvatarType_0, l_BodyColor3s_0, l_EquippedAssets_0, l_AvatarScales_0);
            v35[v40] = v42;
            if v42 then
                v36 = true;
            end;
        end;
    end;
    return {
        ownedItemIds = v37, 
        itemIdsToIsWearing = v35, 
        hasItemEquipped = v36
    };
end;
local function v45(v44) --[[ Line: 76 ]] --[[ Name: selectScreenSize ]]
    return v44.ScreenSize;
end;
local function v47(v46) --[[ Line: 80 ]] --[[ Name: selectAnalyticsMetadata ]]
    return v46.AvatarExperience.AnalyticsMetadata;
end;
local function v49(v48) --[[ Line: 84 ]] --[[ Name: selectFetchStatus ]]
    -- upvalues: l_PerformFetch_0 (copy), l_EditableCharacterKey_0 (copy)
    return l_PerformFetch_0.GetStatus(v48, l_EditableCharacterKey_0);
end;
return function() --[[ Line: 111 ]] --[[ Name: useAvatarSwitcherPageProps ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v4 (copy), v15 (copy), l_useSelector_0 (copy), v45 (copy), l_getUseSelectorDeepEquals_0 (copy), v27 (copy), v23 (copy), v43 (copy), v49 (copy), l_EditableCharacterKey_0 (copy), v17 (copy), v2 (copy), v21 (copy), v22 (copy), l_GridMetrics_0 (copy), v24 (copy), v19 (copy), v10 (copy), v47 (copy), v18 (copy), l_Signal_0 (copy)
    local v50 = l_useDispatch_0();
    local v51 = l_useNavigation_0();
    local v52 = l_useAvatarRoute_0();
    local v53 = v4.Hooks.useTokens();
    local v55 = v15(function(v54) --[[ Line: 117 ]]
        return v54.getEnableContinuousLoad();
    end);
    local v56 = l_useSelector_0(v45, l_getUseSelectorDeepEquals_0());
    local v57 = l_useSelector_0(v27, l_getUseSelectorDeepEquals_0());
    local v59 = l_useSelector_0(function(v58) --[[ Line: 123 ]]
        -- upvalues: v23 (ref), v52 (copy)
        return v23(v58, v52.opaque.name);
    end, l_getUseSelectorDeepEquals_0());
    local v60 = l_useSelector_0(v43, l_getUseSelectorDeepEquals_0());
    local v61 = l_useSelector_0(v49, l_getUseSelectorDeepEquals_0());
    local l_itemIdsToIsWearing_0 = v60.itemIdsToIsWearing;
    local l_hasItemEquipped_0 = v60.hasItemEquipped;
    local v64 = not v57[l_EditableCharacterKey_0];
    local v65 = not v55 and v64 and v61 ~= v17.Fetching;
    local v66, v67 = v2.useState(v56.X * v21.LandscapeNavWidth);
    local v68 = v59 == v22.SceneFullView;
    local v69 = v59 == v22.UIFullView;
    local v70 = v2.useMemo(function() --[[ Line: 142 ]]
        -- upvalues: l_GridMetrics_0 (ref), v66 (copy), v53 (copy)
        return l_GridMetrics_0.getSmallMetrics(math.max(v66 - v53.Size.Size_400 * 2, 0), v53.Size.Size_300);
    end, {
        v66
    });
    local v72 = v2.useCallback(function(v71) --[[ Line: 146 ]]
        -- upvalues: v67 (copy)
        v67(v71.AbsoluteSize.X);
    end, {});
    local v74 = v2.useMemo(function() --[[ Line: 150 ]]
        -- upvalues: v60 (copy)
        if not v60.ownedItemIds then
            return {};
        else
            local v73 = table.clone(v60.ownedItemIds);
            table.insert(v73, 1, "AVATAR_SWITCHER_SETTINGS_TILE");
            return v73;
        end;
    end, {
        v60.ownedItemIds
    });
    local v76 = v2.useCallback(function(v75) --[[ Line: 159 ]]
        return v75 == "AVATAR_SWITCHER_SETTINGS_TILE";
    end, {});
    local v77 = v2.useCallback(function() --[[ Line: 163 ]]
        -- upvalues: v64 (copy), v61 (copy), v17 (ref), v50 (copy), v24 (ref), v19 (ref), l_EditableCharacterKey_0 (ref), v10 (ref), v21 (ref)
        if v64 and v61 ~= v17.Fetching then
            v50(v24(v19.EditableCharacterKey, true, l_EditableCharacterKey_0, if v10 then v21.OutfitTypes.Avatar else nil));
        end;
    end, {
        v50, 
        v64, 
        v61
    });
    local v78 = v2.useCallback(function() --[[ Line: 176 ]]
        -- upvalues: v55 (copy), v77 (copy)
        if v55 then
            v77();
        end;
    end, {
        v55, 
        v77
    });
    local v79 = v2.useCallback(function() --[[ Line: 182 ]]
        -- upvalues: v51 (copy)
        v51.pop();
    end, {
        v51
    });
    v2.useEffect(function() --[[ Line: 187 ]]
        -- upvalues: v77 (copy)
        v77();
    end, {});
    local v80 = l_useSelector_0(v47);
    local l_key_0 = v52.current.key;
    local v82 = v18.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v83 = v2.useMemo(function() --[[ Line: 198 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local v84 = v2.useCallback(function() --[[ Line: 202 ]]
        -- upvalues: l_key_0 (copy), v51 (copy)
        return l_key_0 == v51.state.key;
    end, {
        l_key_0, 
        v51.state.key
    });
    local v85 = v2.useCallback(function() --[[ Line: 206 ]]
        -- upvalues: v83 (copy)
        v83:fire();
    end, {
        v83
    });
    return {
        fetchMoreOutfits = v77, 
        gridMetrics = v70, 
        hasItemFromCurrentPageEquipped = l_hasItemEquipped_0, 
        isSceneFullView = v68, 
        isUIFullView = v69, 
        itemIds = v74, 
        itemIdsToIsWearing = l_itemIdsToIsWearing_0, 
        onAbsoluteSizeChanged = v72, 
        onBackButtonPressed = v79, 
        onScrollingFrameThresholdReached = v78, 
        shouldRenderSettingsTile = v76, 
        impressionsTag = v82, 
        analyticsMetadata = v80, 
        requestImpressionsSignal = v83, 
        impressionsPageFilter = v84, 
        onCanvasPositionChanged = v85, 
        searchUuid = l_EditableCharacterKey_0, 
        showLoadMoreButton = v65
    };
end;