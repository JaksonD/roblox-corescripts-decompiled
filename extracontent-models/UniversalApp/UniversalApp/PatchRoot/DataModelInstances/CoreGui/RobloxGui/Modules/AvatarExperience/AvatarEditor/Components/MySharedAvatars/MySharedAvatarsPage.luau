local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Focusable_0 = v3.Focusable;
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v6.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v6.AvatarRoute.Hooks.useAvatarRoute;
local v9 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v17 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v18 = require(l_Common_0.Context.NamedRefsContext);
local v19 = require(l_Common_0.Constants);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v21 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local v22 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v23 = require(l_Common_0.Hooks.useFullView);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.MySharedAvatars.ItemsView);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarEditorTopBar);
local v26 = require(l_Common_0.Components.BoundInputsUpdater);
local v27 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v28 = require(l_Common_0.Components.AvatarExperienceView);
local v29 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v30 = require(l_Common_0.Components.RoactNavigation.withStackVisibilityWrapper);
local v31 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v32 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v33 = require(l_Common_0.Enum.FullView);
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget);
local v36 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.FetchMySharedAvatars);
local l_MySharedAvatars_0 = v31.ContextWidgets.MySharedAvatars;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local function v40(v39) --[[ Line: 65 ]] --[[ Name: selectMySharedAvatarsApiFetchStatus ]]
    -- upvalues: l_PerformFetch_0 (copy), v32 (copy)
    return l_PerformFetch_0.GetStatus(v39, v32.GetMySharedAvatarsKey);
end;
return (v30(function(_) --[[ Line: 71 ]] --[[ Name: MySharedAvatarsPage ]]
    -- upvalues: l_useNavigation_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v2 (copy), v3 (copy), v21 (copy), l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), v14 (copy), v10 (copy), l_useSelector_0 (copy), v40 (copy), v23 (copy), v33 (copy), v22 (copy), v18 (copy), v17 (copy), v9 (copy), l_sendAXCounterV2_0 (copy), v19 (copy), v36 (copy), l_useLocalization_0 (copy), l_MySharedAvatars_0 (copy), v35 (copy), v34 (copy), l_Focusable_0 (copy), l_AvatarScreen_0 (copy), v26 (copy), v27 (copy), v28 (copy), v25 (copy), v29 (copy), v24 (copy)
    local v42 = l_useNavigation_0();
    local v43 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.useRef(v3.createFocusController()).current;
    local v44 = v2.useRef(nil);
    local v45 = v21(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v43);
    local v46 = l_useAvatarRoute_0();
    local v47 = l_useDispatch_0();
    local v48 = v14(v10);
    local v49 = l_useSelector_0(v40);
    local v50, v51 = v23();
    local v52 = v50 == v33.SceneFullView;
    local v53 = v50 == v33.UIFullView;
    local v54 = v2.useRef(nil);
    local v55 = v2.useRef(nil);
    local v56 = v2.useRef(nil);
    local v57 = v2.useRef(nil);
    local v58 = v2.useRef(nil);
    local v59 = v22({
        overlayClosedCallback = v45
    });
    local v60 = v2.useContext(v18);
    local v61 = v3.useRefCache();
    local v63 = v2.useCallback(function() --[[ Line: 103 ]]
        -- upvalues: v17 (ref), v50 (copy), v51 (copy)
        local v62 = v17.getNewFullViewEnum(v50);
        v51(v62);
    end, {
        v50, 
        v51
    });
    v2.useEffect(function() --[[ Line: 108 ]]
        -- upvalues: v49 (copy), v9 (ref), l_sendAXCounterV2_0 (ref), v19 (ref), v47 (copy), v36 (ref), v48 (copy)
        if v49 == v9.NotStarted then
            l_sendAXCounterV2_0(v19.Counter.MySharedAvatars.ReloadTriggedInPage);
            v47(v36(v48));
        end;
    end, {
        v49, 
        v47, 
        v48
    });
    local v64 = l_useLocalization_0({
        mySharedAvatarsTooltip = "Feature.Avatar.Label.MyPostedAvatars.Tooltip"
    });
    v2.useEffect(function() --[[ Line: 121 ]]
        -- upvalues: l_MySharedAvatars_0 (ref), v64 (copy), v47 (copy), v35 (ref), v34 (ref)
        local v65 = nil;
        v65 = {
            title = l_MySharedAvatars_0.Title, 
            localizedTooltip = v64.mySharedAvatarsTooltip
        };
        v47(v35(l_MySharedAvatars_0.RequestId, l_MySharedAvatars_0.WidgetId, v65));
        return function() --[[ Line: 140 ]]
            -- upvalues: v47 (ref), v34 (ref), l_MySharedAvatars_0 (ref)
            v47(v34(l_MySharedAvatars_0.RequestId));
        end;
    end, {
        v47
    });
    return v2.createElement("Frame", {
        ref = v59, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, v2.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ref = v60[l_AvatarScreen_0.MySharedAvatars], 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v43, 
        defaultChild = v58, 
        restorePreviousChildFocus = false
    }, {
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v26), 
        NavigationEventsLogger = v2.createElement(v27, {
            pageName = l_AvatarScreen_0.MySharedAvatars
        }), 
        AvatarExperienceView = v2.createElement(v28, {
            allowAdaptiveScrolling = true, 
            bottomBarEnabled = false, 
            changeViewFunction = v63, 
            isSceneFullView = v52, 
            isUIFullView = v53, 
            topBar = v2.createElement(v25, {
                navigation = v42, 
                avatarRoute = v46, 
                showManageOutfitButton = true, 
                overlayClosedCallback = v45, 
                topBarRef = v54, 
                defaultChildRef = v58, 
                sceneUIContainerRef = v55
            }), 
            refinementButtonsRef = v56, 
            quickButtonsRef = v57, 
            ref = v55, 
            NextSelectionDown = v58, 
            NextSelectionLeft = v54, 
            defaultChildRef = v58, 
            multiTryOnBottomBarRef = v44, 
            itemDetailsPeekViewRefs = v61
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v29, {
                focusController = v43, 
                captureFocusOnMount = true
            }), 
            MySharedAvatarsItemsView = v2.createElement(v24, {
                defaultChildRef = v58, 
                NextSelectionUp = v54, 
                NextSelectionRight = v57, 
                multiTryOnBottomBarRef = v44, 
                itemDetailsPeekViewRefs = v61
            })
        })
    }));
end));