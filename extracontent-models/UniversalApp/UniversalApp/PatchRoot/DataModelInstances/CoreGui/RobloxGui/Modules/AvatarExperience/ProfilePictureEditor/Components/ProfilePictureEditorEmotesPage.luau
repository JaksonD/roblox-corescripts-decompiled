local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v11.useFocusGuiObject;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v14 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v8.Style.withStyle;
local v17 = require(l_Modules_0.LuaApp.AppPage);
local v18 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v20 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v27 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_LoadingStateContainer_0 = v8.App.Container.LoadingStateContainer;
local l_LoadingStatePage_0 = v8.App.Container.LoadingStatePage;
local l_RetrievalStatus_0 = v8.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v8.App.Indicator.EmptyState;
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v33 = require(l_Common_0.Services.Analytics);
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v35 = require(l_Common_0.Components.AvatarExperienceView);
local v36 = require(l_Common_0.Components.TopBar.makeTitleDropDown);
local v37 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v38 = require(l_Common_0.Components.BoundInputsUpdater);
local v39 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v40 = require(l_Common_0.Components.RoactNavigation.withStackVisibilityWrapper);
local v41 = require(l_Common_0.Thunks.SetFullView);
local v42 = require(l_Common_0.Enum.FullView);
local v43 = require(l_Common_0.Utils);
local v44 = require(l_Common_0.Thunks.OpenQuickMenu);
local v45 = require(l_Common_0.Thunks.OpenItemPrompt);
local v46 = require(l_Common_0.Actions.SetItemDetailsPeekViewState);
local v47 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local v48 = require(l_Common_0.Selectors.selectIsFullView);
local v49 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v50 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v53 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagUpdateNoInternetConnectionText_0 = v53.FFlagUpdateNoInternetConnectionText;
local v55 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v56 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v55.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_ProfilePictureEditor_0 = l_Modules_0.AvatarExperience.ProfilePictureEditor;
local v60 = require(l_ProfilePictureEditor_0.Services.Analytics);
local v61 = require(l_ProfilePictureEditor_0.Thunks.FetchPPEConfig);
local v62 = require(l_ProfilePictureEditor_0.Components.ProfilePictureEditorBottomBar);
local v63 = require(l_ProfilePictureEditor_0.Components.EmotesScrollView);
local v64 = require(l_ProfilePictureEditor_0.Constants);
local l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXOpaqueMarketplaceTopbar_0 = v53.FFlagAXOpaqueMarketplaceTopbar;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v69 = v3.PureComponent:extend("ProfilePictureEditorEmotesPage");
local v70 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt, 
    [Enum.KeyCode.ButtonL3] = l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu
};
local function v80(v71, v72, v73, v74) --[[ Line: 113 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v11 (copy), v70 (copy), v7 (copy), l_FocusNavigationEventNameEnum_0 (copy), v56 (copy)
    local v75 = v11.useEventMap(v70, v71);
    local v79 = v7.useMemo(function() --[[ Line: 120 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v56 (ref), v72 (copy), v73 (copy), v74 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v56.onRelease(function(v76) --[[ Line: 123 ]]
                    -- upvalues: v72 (ref)
                    v76.cancelled = true;
                    v72();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt] = if v73 then {
                handler = v56.onRelease(function(_) --[[ Line: 130 ]]
                    -- upvalues: v73 (ref)
                    v73();
                end)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu] = if v74 then {
                handler = v56.onRelease(function(_) --[[ Line: 137 ]]
                    -- upvalues: v74 (ref)
                    v74();
                end)
            } else nil
        };
    end, {
        v72, 
        v73, 
        v74
    });
    return v11.useEventHandlerMap(v79, v75);
end;
v69.validateProps = v10.strictInterface({
    avatarRoute = v10.table, 
    navigation = v10.table, 
    networking = v10.callback, 
    avatarExperienceAnalytics = v10.table, 
    profilePictureEditorAnalytics = v10.table, 
    fullView = v10.userdata, 
    fetchingStatus = v10.string, 
    isPortrait = v10.boolean, 
    itemDetailsExpanded = v10.boolean, 
    emoteAssetId = v10.optional(v10.string), 
    tryOnItems = v10.table, 
    fetchPPEConfig = v10.callback, 
    setFullView = v10.callback, 
    navigateIntoQuickMenu = v10.callback, 
    openItemPrompt = v10.callback, 
    setItemDetailsPeekViewState = v10.callback, 
    is10ftUI = v10.boolean, 
    overlayClosedCallback = v10.callback, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v10.table, 
    resolvedFocusNavigationRef = if l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 then v10.table else nil, 
    topBarRef = if l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 then v10.table else nil
});
v69.init = function(v81) --[[ Line: 179 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), v43 (copy), l_AvatarScreen_0 (copy), v17 (copy), v18 (copy), v9 (copy), v62 (copy), v36 (copy)
    v81.sceneUIContainerRef = v3.createRef();
    v81.emotesScrollViewRef = v3.createRef();
    if not l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 then
        v81.topBarRef = v3.createRef();
    end;
    v81.bottomBarRef = v3.createRef();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v81:setState({
        lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0), 
        bottomBarHeight = 72
    });
    v81.fetchPPEConfig = function() --[[ Line: 193 ]]
        -- upvalues: v81 (copy)
        v81.props.fetchPPEConfig(v81.props.networking);
    end;
    v81.onAbsoluteSizeChanged = function(v83) --[[ Line: 197 ]]
        -- upvalues: v81 (copy)
        v81:setState({
            bottomBarHeight = v83.Y
        });
    end;
    v81.changeView = function() --[[ Line: 203 ]]
        -- upvalues: v81 (copy), v43 (ref)
        local l_avatarExperienceAnalytics_0 = v81.props.avatarExperienceAnalytics;
        local v85 = v43.getNewFullViewEnum(v81.props.fullView);
        v81.props.setFullView(l_avatarExperienceAnalytics_0, v81.props.avatarRoute.opaque.name, v85);
    end;
    v81.onBackFromTopBar = function() --[[ Line: 210 ]]
        -- upvalues: v81 (copy), l_AvatarScreen_0 (ref), v17 (ref)
        local v86 = v81.props.navigation.getParam("prevNavPage");
        local v87 = nil;
        v87 = if v86 then v86 else if v81.props.is10ftUI then l_AvatarScreen_0.AvatarExperienceLandingPage else v17.Home;
        v81.props.navigation.navigate(v87);
    end;
    v81.backButton = v18.makeBackButton(v81.onBackFromTopBar);
    v81.onNext = function() --[[ Line: 225 ]]
        -- upvalues: v81 (copy), l_AvatarScreen_0 (ref)
        v81.props.profilePictureEditorAnalytics.clickNextFromEmotesPage(v81.props.emoteAssetId);
        v81.props.navigation.navigate(l_AvatarScreen_0.ProfilePictureEditorCamera, {});
    end;
    v81.onDone = function() --[[ Line: 231 ]]
        -- upvalues: v81 (copy), l_AvatarScreen_0 (ref)
        v81.props.navigation.navigate(l_AvatarScreen_0.ProfilePictureEditorFinal, {});
    end;
    v81.onRevertBtnClicked = function() --[[ Line: 236 ]]
        -- upvalues: v81 (copy), l_AvatarScreen_0 (ref)
        v81.props.navigation.navigate(l_AvatarScreen_0.ProfilePictureEditorRevertToDefaultPrompt, {
            onBack = v81.onBackFromTopBar
        });
    end;
    v81.renderBottomBar = function() --[[ Line: 242 ]]
        -- upvalues: v9 (ref), v81 (copy), v3 (ref), v62 (ref)
        local v88 = not v9.isEmpty(v81.props.tryOnItems);
        local v89 = {
            textKey = "Feature.Avatar.Action.Revert", 
            onActivated = v81.onRevertBtnClicked, 
            isDisabled = false
        };
        return v3.createElement(v62, {
            button1 = v89, 
            button2 = {
                textKey = "Authentication.CrossDevice.Action.Next", 
                onActivated = v81.onNext, 
                isDisabled = v88
            }, 
            NextSelectionUp = v81.emotesScrollViewRef, 
            onAbsoluteSizeChanged = v81.onAbsoluteSizeChanged, 
            baseRef = v81.bottomBarRef
        });
    end;
    v81.lastInputTypeChangedCallback = function(v90) --[[ Line: 263 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v81 (copy)
        local v91 = l_isGamepadInput_0(v90);
        if v91 ~= v81.state.lastInputIsGamepad then
            v81:setState({
                lastInputIsGamepad = v91
            });
        end;
    end;
    v81.titleDropDown = v36("Feature.Avatar.Action.EditProfilePicture", v81.props.overlayClosedCallback);
end;
v69.getInputBindings = function(v92) --[[ Line: 275 ]] --[[ Name: getInputBindings ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy), v5 (copy), v47 (copy)
    local l_avatarRoute_0 = v92.props.avatarRoute;
    local l_name_0 = l_avatarRoute_0.current.name;
    local v95 = {};
    if l_name_0 == l_AvatarScreen_0.ItemDetails then
        return (v9.Dictionary.join(v95, {
            NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 283 ]]
                -- upvalues: v47 (ref), v92 (copy)
                v47.closeFocusedScreen(v92.props.navigation);
            end), 
            OpenItemPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonX, function() --[[ Line: 286 ]]
                -- upvalues: v92 (copy), l_avatarRoute_0 (copy)
                v92.props.openItemPrompt(v92.props.networking, v92.props.catalogAnalytics, v92.props.overlayClosedCallback, v92.props.navigation, l_avatarRoute_0);
            end, {
                key = "Feature.Catalog.Action.Buy"
            }), 
            OpenCatalogContextMenu = v5.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 297 ]]
                -- upvalues: v92 (copy), l_AvatarScreen_0 (ref), l_avatarRoute_0 (copy)
                v92.props.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                    itemId = l_avatarRoute_0.current.params.itemId, 
                    itemType = l_avatarRoute_0.current.params.itemType, 
                    onOverlayClosed = v92.props.overlayClosedCallback
                });
            end, {
                key = "Feature.Catalog.Action.ItemOptions"
            })
        }));
    else
        return (v9.Dictionary.join(v95, {
            NavUp = v5.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 309 ]]
                -- upvalues: v92 (copy)
                v92.props.focusController.moveFocusTo(v92.topBarRef);
            end)
        }));
    end;
end;
v69.renderTopBar = function(v96) --[[ Line: 318 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_withLocalization_0 (copy), v3 (copy), v18 (copy), l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 (copy), l_FFlagAXOpaqueMarketplaceTopbar_0 (copy)
    local l_isPortrait_0 = v96.props.isPortrait;
    return l_withLocalization_0({
        title = "Feature.Avatar.Action.EditProfilePicture"
    })(function(v98) --[[ Line: 323 ]]
        -- upvalues: v96 (copy), v3 (ref), v18 (ref), l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 (ref), l_FFlagAXOpaqueMarketplaceTopbar_0 (ref), l_isPortrait_0 (copy)
        local v99 = if v96.props.is10ftUI then v96.titleDropDown else nil;
        return v3.createElement(v18.Container, {
            [v3.Ref] = if l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 then v96.props.topBarRef else v96.topBarRef, 
            NextSelectionDown = v96.emotesScrollViewRef, 
            titleText = v98.title, 
            transparentBackground = not l_FFlagAXOpaqueMarketplaceTopbar_0 or l_isPortrait_0 and true or false, 
            hideSiteMessageBanner = l_isPortrait_0, 
            leftItem = v96.backButton, 
            centerItem = v99, 
            useParentSizeForCenterItem = true
        });
    end);
end;
v69.render = function(v100) --[[ Line: 340 ]] --[[ Name: render ]]
    -- upvalues: v42 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagUpdateNoInternetConnectionText_0 (copy), v3 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 (copy), v38 (copy), v39 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v35 (copy), v37 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), l_LoadingStatePage_0 (copy), v63 (copy)
    local l_bottomBarHeight_0 = v100.state.bottomBarHeight;
    local l_fetchingStatus_0 = v100.props.fetchingStatus;
    local v103 = v100.props.fullView == v42.UIFullView;
    local v104 = v100.props.fullView == v42.SceneFullView;
    return l_withStyle_0(function(v105) --[[ Line: 347 ]]
        -- upvalues: l_withLocalization_0 (ref), l_FFlagUpdateNoInternetConnectionText_0 (ref), v3 (ref), l_Focusable_0 (ref), v100 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 (ref), v38 (ref), v39 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), v35 (ref), v104 (copy), v103 (copy), v37 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), l_fetchingStatus_0 (copy), l_LoadingStatePage_0 (ref), v63 (ref), l_bottomBarHeight_0 (copy)
        return l_withLocalization_0({
            failedMessage = l_FFlagUpdateNoInternetConnectionText_0 and "Feature.DisplayName.ErrorMessage.SomethingWentWrong" or "Feature.EmptyStatePage.Message.NoInternet"
        })(function(v106) --[[ Line: 352 ]]
            -- upvalues: v3 (ref), l_Focusable_0 (ref), v100 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 (ref), v38 (ref), v39 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), v35 (ref), v104 (ref), v103 (ref), v37 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), l_fetchingStatus_0 (ref), v105 (copy), l_LoadingStatePage_0 (ref), v63 (ref), l_bottomBarHeight_0 (ref)
            return v3.createElement(l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                defaultChild = v100.emotesScrollViewRef, 
                focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v100.props.focusController, 
                restorePreviousChildFocus = false, 
                [v3.Ref] = if l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 then v100.props.resolvedFocusNavigationRef else v100.ref, 
                inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 then nil else v100:getInputBindings()
            }, {
                BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createElement(v38), 
                NavigationEventsLogger = v3.createElement(v39, {
                    pageName = "ProfilePictureEditorEmotes"
                }), 
                LastInputTypeChangedConnection = v3.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.LastInputTypeChanged, 
                    callback = v100.lastInputTypeChangedCallback
                }), 
                AvatarExperienceView = v3.createElement(v35, {
                    bottomBarEnabled = false, 
                    allowAdaptiveScrolling = true, 
                    changeViewFunction = v100.changeView, 
                    isSceneFullView = v104, 
                    isUIFullView = v103, 
                    topBar = v100:renderTopBar(), 
                    [v3.Ref] = v100.sceneUIContainerRef, 
                    NextSelectionDown = v100.emotesScrollViewRef
                }, {
                    GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createElement(v37, {
                        focusController = v100.props.focusController, 
                        captureFocusOnMount = true
                    }), 
                    LoadingStateContainer = v3.createElement(l_LoadingStateContainer_0, {
                        dataStatus = l_RetrievalStatus_0.fromRawValue(l_fetchingStatus_0), 
                        renderOnLoading = function() --[[ Line: 395 ]] --[[ Name: renderOnLoading ]]
                            -- upvalues: v3 (ref), v105 (ref), l_LoadingStatePage_0 (ref)
                            return v3.createElement("Frame", {
                                Size = UDim2.new(1, 0, 1, 0), 
                                BackgroundTransparency = v105.Theme.BackgroundDefault.Transparency, 
                                BackgroundColor3 = v105.Theme.BackgroundDefault.Color, 
                                BorderSizePixel = 0
                            }, v3.createElement(l_LoadingStatePage_0));
                        end, 
                        renderOnLoaded = function() --[[ Line: 403 ]] --[[ Name: renderOnLoaded ]]
                            -- upvalues: v3 (ref), v63 (ref), v100 (ref), l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 (ref), l_bottomBarHeight_0 (ref)
                            return v3.createFragment({
                                EmotesScrollView = v3.createElement(v63, {
                                    baseRef = v100.emotesScrollViewRef, 
                                    NextSelectionUp = if l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 then v100.props.topBarRef else v100.topBarRef, 
                                    NextSelectionDown = v100.bottomBarRef, 
                                    bottomBarHeight = l_bottomBarHeight_0
                                }), 
                                BottomBar = v100.renderBottomBar()
                            });
                        end, 
                        renderOnFailed = function() --[[ Line: 416 ]] --[[ Name: renderOnFailed ]]
                            -- upvalues: v100 (ref), v106 (copy)
                            return v100:renderOnFailed(v106);
                        end
                    })
                })
            });
        end);
    end);
end;
v69.renderOnFailed = function(v107, v108) --[[ Line: 426 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: v3 (copy), l_EmptyState_0 (copy), l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 (copy)
    return v3.createElement(l_EmptyState_0, {
        NextSelectionUp = if l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 then v107.props.topBarRef else v107.topBarRef, 
        onActivated = v107.fetchPPEConfig, 
        text = v108.failedMessage
    });
end;
v69.didMount = function(v109) --[[ Line: 436 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy)
    if v109.props.fetchingStatus == v20.NotStarted then
        v109.fetchPPEConfig();
    end;
end;
v69 = l_RoactServices_0.connect({
    avatarExperienceAnalytics = v33, 
    profilePictureEditorAnalytics = v60, 
    networking = v14
})(v69);
v69 = v40((v4.connect(function(v110, _) --[[ Line: 448 ]]
    -- upvalues: v64 (copy), v48 (copy), l_AvatarScreen_0 (copy), l_DeviceOrientationMode_0 (copy), l_PerformFetch_0 (copy)
    local l_PPEConfigFetchStatusKey_0 = v64.PPEConfigFetchStatusKey;
    local v113 = v48(v110, l_AvatarScreen_0.ProfilePictureEditorEmotes);
    local v114 = v110.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local l_emoteAssetId_0 = v110.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId;
    return {
        fullView = v113, 
        fetchingStatus = l_PerformFetch_0.GetStatus(v110, l_PPEConfigFetchStatusKey_0), 
        itemDetailsExpanded = v110.AvatarExperience.Common.ItemDetailsExpanded, 
        isPortrait = v114, 
        emoteAssetId = l_emoteAssetId_0, 
        tryOnItems = v110.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v116) --[[ Line: 463 ]]
    -- upvalues: v61 (copy), v41 (copy), v44 (copy), v45 (copy), v46 (copy)
    return {
        fetchPPEConfig = function(v117) --[[ Line: 465 ]] --[[ Name: fetchPPEConfig ]]
            -- upvalues: v116 (copy), v61 (ref)
            v116(v61(v117));
        end, 
        setFullView = function(v118, v119, v120) --[[ Line: 468 ]] --[[ Name: setFullView ]]
            -- upvalues: v116 (copy), v41 (ref)
            v116(v41(v118, v119, v120));
        end, 
        navigateIntoQuickMenu = function(v121, v122) --[[ Line: 471 ]] --[[ Name: navigateIntoQuickMenu ]]
            -- upvalues: v116 (copy), v44 (ref)
            v116(v44(v121, v122));
        end, 
        openItemPrompt = function(v123, v124, v125, v126, v127) --[[ Line: 474 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v116 (copy), v45 (ref)
            v116(v45(v123, v124, v125, v126, v127));
        end, 
        setItemDetailsPeekViewState = function(v128) --[[ Line: 477 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v116 (copy), v46 (ref)
            v116(v46(v128));
        end
    };
end)(v69)));
return function(v129) --[[ Line: 485 ]] --[[ Name: ProfilePictureEditorEmotesPageContainer ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), v5 (copy), v50 (copy), v49 (copy), l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 (copy), l_useDispatch_0 (copy), l_useAvatarRoute_0 (copy), v27 (copy), v14 (copy), v34 (copy), l_useFocusGuiObject_0 (copy), v47 (copy), v45 (copy), l_AvatarScreen_0 (copy), v80 (copy), l_useTableWrappedCallbackRef_0 (copy), v9 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v3 (copy), v69 (ref)
    local v130 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useRef(v5.createFocusController()).current;
    local v131 = v50(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v130);
    local v132 = v49({
        overlayClosedCallback = v131
    });
    local v133 = nil;
    if l_FFlagAXMigrateProfilePictureEditorEmotesPageToFocusNavigation_0 then
        local v134 = v7.useRef(nil);
        local v135 = l_useDispatch_0();
        local v136 = l_useAvatarRoute_0();
        local v137 = v27(v14);
        local v138 = v27(v34);
        local v139 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
        local v140 = v7.useCallback(function() --[[ Line: 505 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v139 (copy), v134 (copy), v130 (copy)
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                if v139 and v134 and v134.current then
                    v139(v134.current);
                    return;
                end;
            else
                v130.moveFocusTo(v134);
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v139 else v130
        });
        local v141 = v7.useCallback(function() --[[ Line: 515 ]]
            -- upvalues: v47 (ref), v129 (copy)
            v47.closeFocusedScreen(v129.navigation);
        end, {
            v129.navigation
        });
        local v142 = v7.useCallback(function() --[[ Line: 520 ]]
            -- upvalues: v135 (copy), v45 (ref), v137 (copy), v138 (copy), v131 (copy), v129 (copy), v136 (copy)
            v135(v45(v137, v138, v131, v129.navigation, v136));
        end, {
            v135, 
            v137, 
            v138, 
            v131, 
            v129.navigation, 
            v136
        });
        local v143 = v7.useCallback(function() --[[ Line: 528 ]]
            -- upvalues: v129 (copy), l_AvatarScreen_0 (ref), v136 (copy), v131 (copy)
            v129.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                itemId = v136.current.params.itemId, 
                itemType = v136.current.params.itemType, 
                onOverlayClosed = v131
            });
        end, {
            v129.navigation, 
            v136, 
            v131
        });
        local v144 = v80(nil, if v136.current.name == l_AvatarScreen_0.ItemDetails then v141 else v140, if v136.current.name == l_AvatarScreen_0.ItemDetails then v142 else nil, if v136.current.name == l_AvatarScreen_0.ItemDetails then v143 else nil);
        local v145 = l_useTableWrappedCallbackRef_0(v144);
        local l_join_0 = v9.Dictionary.join;
        local l_v129_0 = v129;
        local v148 = {
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v130, 
            overlayClosedCallback = v131
        };
        local v149 = false;
        if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
            v149 = not l_FFlagEnableLeftNavOnConsole_0;
        end;
        v148.is10ftUI = v149;
        v148.topBarRef = v134;
        v148.resolvedFocusNavigationRef = v145;
        v133 = l_join_0(l_v129_0, v148);
    else
        local l_join_1 = v9.Dictionary.join;
        local l_v129_1 = v129;
        local v152 = {
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v130, 
            overlayClosedCallback = v131
        };
        local v153 = false;
        if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
            v153 = not l_FFlagEnableLeftNavOnConsole_0;
        end;
        v152.is10ftUI = v153;
        v133 = l_join_1(l_v129_1, v152);
    end;
    return v3.createElement("Frame", {
        [v3.Ref] = v132, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, v7.createElement(v69, v133));
end;