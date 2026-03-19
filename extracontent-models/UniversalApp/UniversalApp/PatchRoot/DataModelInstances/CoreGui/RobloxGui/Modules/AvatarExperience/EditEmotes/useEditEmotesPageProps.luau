local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_GridMetrics_0 = require(l_CorePackages_0.Packages.UIBlox).App.Grid.GridMetrics;
local v6 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v8.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v8.AvatarRoute.Hooks.useAvatarRoute;
local v11 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v16 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v17 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_Signal_0 = v11.Signal;
local v19 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v20 = require(l_Modules_0.LuaApp.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v22 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v23 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v24 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v25 = require(l_Modules_0.AvatarExperience.Common.getEmotesCategory);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventoryV2);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedEmoteSlot);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendShopForMoreAnalytics);
local v30 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v32 = v25();
local l_SearchUuid_0 = v32.SearchUuid;
local function v35(v34) --[[ Line: 44 ]] --[[ Name: selectPageFinished ]]
    return v34.AvatarExperience.AvatarEditor.PageFinished;
end;
local function v37(v36) --[[ Line: 48 ]] --[[ Name: selectOwnedItemIds ]]
    -- upvalues: v32 (copy)
    return v36.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[v32.SearchUuid] or {};
end;
local function v39(v38) --[[ Line: 53 ]] --[[ Name: selectScreenSize ]]
    return v38.ScreenSize;
end;
local function v41(v40) --[[ Line: 57 ]] --[[ Name: selectAvatarType ]]
    return v40.AvatarExperience.AvatarEditor.Character.AvatarType;
end;
local function v43(v42) --[[ Line: 61 ]] --[[ Name: selectAnalyticsMetadata ]]
    return v42.AvatarExperience.AnalyticsMetadata;
end;
local function v45(v44) --[[ Line: 65 ]] --[[ Name: selectFetchStatus ]]
    -- upvalues: l_PerformFetch_0 (copy), l_SearchUuid_0 (copy)
    return l_PerformFetch_0.GetStatus(v44, l_SearchUuid_0);
end;
return function() --[[ Line: 95 ]] --[[ Name: useEditEmotesPageProps ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v16 (copy), v24 (copy), v26 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), v6 (copy), v17 (copy), l_useSelector_0 (copy), v39 (copy), v35 (copy), v23 (copy), v37 (copy), v41 (copy), v45 (copy), l_SearchUuid_0 (copy), v19 (copy), v2 (copy), v21 (copy), v22 (copy), l_GridMetrics_0 (copy), l_AvatarScreen_0 (copy), v28 (copy), v27 (copy), v32 (copy), v30 (copy), v43 (copy), v20 (copy), l_Signal_0 (copy), v29 (copy)
    local v46 = l_useDispatch_0();
    local v47 = l_useNavigation_0();
    local v48 = l_useAvatarRoute_0();
    local v49 = v16(v24);
    local v50 = v16(v26);
    local v51 = v4.Hooks.useTokens();
    local v52 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useFocusController();
    local v53 = v6.usePreferredInput();
    local v55 = v17(function(v54) --[[ Line: 105 ]]
        return v54.getEnableContinuousLoad();
    end);
    local v56 = l_useSelector_0(v39);
    local v57 = l_useSelector_0(v35);
    local v59 = l_useSelector_0(function(v58) --[[ Line: 111 ]]
        -- upvalues: v23 (ref), v48 (copy)
        return v23(v58, v48.opaque.name);
    end);
    local v60 = l_useSelector_0(v37);
    local v61 = l_useSelector_0(v41);
    local v62 = l_useSelector_0(v45);
    local v63 = not v57[l_SearchUuid_0];
    local v64 = not v55 and v63 and v62 ~= v19.Fetching;
    local v65 = not v63;
    local v66, v67 = v2.useState(v56.X * v21.LandscapeNavWidth);
    local v68 = v59 == v22.SceneFullView;
    local v69 = v59 == v22.UIFullView;
    local v70 = v2.useMemo(function() --[[ Line: 130 ]]
        -- upvalues: l_GridMetrics_0 (ref), v66 (copy), v51 (copy)
        return l_GridMetrics_0.getSmallMetrics(math.max(v66 - v51.Size.Size_400 * 2, 0), v51.Size.Size_300);
    end, {
        v66, 
        v51
    });
    local v72 = v2.useCallback(function(v71) --[[ Line: 134 ]]
        -- upvalues: v67 (copy)
        v67(v71.AbsoluteSize.X);
    end, {});
    local v73 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.useCallback(function() --[[ Line: 140 ]]
        -- upvalues: v53 (copy), v6 (ref), v52 (copy)
        if v53 == v6.Input.Directional then
            v52.captureFocus();
        end;
    end, {
        v53, 
        v52
    });
    local v75 = v2.useCallback(function(v74) --[[ Line: 146 ]]
        -- upvalues: v61 (copy), v21 (ref), v47 (copy), l_AvatarScreen_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v73 (copy), v46 (copy), v28 (ref)
        if v61 == v21.AvatarType.R6 then
            v47.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                onOverlayClosed = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v73, 
                bodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt"
            });
        end;
        v46(v28(v74));
    end, {
        v46, 
        v61, 
        v47, 
        v73
    });
    local v76 = v2.useCallback(function() --[[ Line: 156 ]]
        -- upvalues: v63 (copy), v62 (copy), v19 (ref), v46 (copy), v27 (ref), v49 (copy), v32 (ref), l_SearchUuid_0 (ref)
        if v63 and v62 ~= v19.Fetching then
            v46(v27(v49, v32, l_SearchUuid_0));
        end;
    end, {
        v46, 
        v63, 
        v49, 
        v62
    });
    local v77 = v2.useCallback(function() --[[ Line: 162 ]]
        -- upvalues: v55 (copy), v76 (copy)
        if v55 then
            v76();
        end;
    end, {
        v55, 
        v76
    });
    local v78 = v2.useCallback(function() --[[ Line: 168 ]]
        -- upvalues: v47 (copy)
        v47.pop();
    end, {
        v47
    });
    v2.useEffect(function() --[[ Line: 173 ]]
        -- upvalues: v76 (copy)
        v76();
    end, {});
    v2.useEffect(function() --[[ Line: 178 ]]
        -- upvalues: v46 (copy), v30 (ref)
        return function() --[[ Line: 179 ]]
            -- upvalues: v46 (ref), v30 (ref)
            v46(v30());
        end;
    end, {});
    local v79 = l_useSelector_0(v43);
    local l_key_0 = v48.current.key;
    local v81 = v20.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v82 = v2.useMemo(function() --[[ Line: 191 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local v83 = v2.useCallback(function() --[[ Line: 195 ]]
        -- upvalues: l_key_0 (copy), v47 (copy)
        return l_key_0 == v47.state.key;
    end, {
        l_key_0, 
        v47.state.key
    });
    local v84 = v2.useCallback(function() --[[ Line: 199 ]]
        -- upvalues: v82 (copy)
        v82:fire();
    end, {
        v82
    });
    local v85 = v2.useCallback(function() --[[ Line: 203 ]]
        -- upvalues: v46 (copy), v29 (ref), v50 (copy)
        v46(v29(v50));
    end, {
        v46, 
        v50
    });
    return {
        fetchMoreItems = v76, 
        gridMetrics = v70, 
        isSceneFullView = v68, 
        isUIFullView = v69, 
        itemIds = v60, 
        onAbsoluteSizeChanged = v72, 
        onBackButtonPressed = v78, 
        onScrollingFrameThresholdReached = v77, 
        onSlotActivated = v75, 
        impressionsTag = v81, 
        analyticsMetadata = v79, 
        requestImpressionsSignal = v82, 
        impressionsPageFilter = v83, 
        onCanvasPositionChanged = v84, 
        searchUuid = l_SearchUuid_0, 
        emotesCategory = v32, 
        showLoadMoreButton = v64, 
        showRecommendedItems = v65, 
        sendShopForMoreAnalytics = v85
    };
end;