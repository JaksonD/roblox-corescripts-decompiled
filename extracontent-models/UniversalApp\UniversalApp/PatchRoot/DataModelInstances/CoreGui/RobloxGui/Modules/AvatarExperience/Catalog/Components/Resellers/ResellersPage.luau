local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v7 = require(l_Modules_0.AvatarExperience.Common.Enum.RequestStatusEnum);
local v8 = require(l_Modules_0.AvatarExperience.Common.Hooks.useRequest);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v10 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.CenteredModalView);
local l_FitFrameVertical_0 = v6.RoactFitComponents.FitFrameVertical;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v16 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 = v20.FFlagAXMigrateResellersInputBindingsToRoactGamepad;
local v22 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v22.Focusable;
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v27 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseFocusedScreen);
local v28 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Components.Resellers.AssetResellerCard);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Components.Resellers.CollectibleResellerCard);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v35 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v36 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResellers);
local v37 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances);
local v38 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResellerCursor);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v40 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v41 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v42 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v40.FocusNavigationEventNameEnum;
local v44 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v44.Style.withStyle;
local l_DefaultMetricsGridView_0 = v44.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = v44.App.Grid.GridMetrics;
local l_LoadingStateContainer_0 = v44.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = v44.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v44.App.Indicator.EmptyState;
local l_Button_0 = v44.App.Button.Button;
local l_ButtonType_0 = v44.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v44.App.Button.Enum.StandardButtonSize;
local v54 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local l_FFlagUpdateNoInternetConnectionText_0 = v20.FFlagUpdateNoInternetConnectionText;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v57 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v63(v58, v59) --[[ Line: 96 ]] --[[ Name: useResellersPageFocusNavigationBindings ]]
    -- upvalues: v41 (copy), v57 (copy), v3 (copy), l_FocusNavigationEventNameEnum_0 (copy), v42 (copy)
    local v60 = v41.useEventMap(v57, v58);
    local v62 = v3.useMemo(function() --[[ Line: 98 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v59 (copy), v42 (ref)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = if v59 then {
                handler = v42.onRelease(function(v61) --[[ Line: 102 ]]
                    -- upvalues: v59 (ref)
                    v61.cancelled = true;
                    v59();
                end)
            } else nil
        };
    end, {
        v59
    });
    return v41.useEventHandlerMap(v62, v60);
end;
local v64 = v3.PureComponent:extend("ResellersPage");
v64.init = function(v65) --[[ Line: 115 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v22 (copy), l_withStyle_0 (copy), l_FitFrameVertical_0 (copy), v31 (copy), v32 (copy), l_withLocalization_0 (copy), l_Button_0 (copy), l_StandardButtonSize_0 (copy), l_ButtonType_0 (copy), v29 (copy)
    v65.nextPageCursor = nil;
    v65.gridViewRef = v3.createRef();
    v65.topBarRef = v3.createRef();
    v65.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v65.props.focusController or v22.createFocusController();
    v65.renderCard = function(v66, _, v68) --[[ Line: 124 ]]
        -- upvalues: l_withStyle_0 (ref), v3 (ref), l_FitFrameVertical_0 (ref), v31 (ref), v65 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        return l_withStyle_0(function(v69) --[[ Line: 125 ]]
            -- upvalues: v3 (ref), l_FitFrameVertical_0 (ref), v68 (copy), v31 (ref), v65 (ref), v66 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
            local l_Theme_0 = v69.Theme;
            return v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 8), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                BackgroundTransparency = 1, 
                LayoutOrder = v68
            }, {
                AssetResellerCard = v3.createElement(v31, {
                    LayoutOrder = 1, 
                    itemId = v65.props.itemId, 
                    itemType = v65.props.itemType, 
                    productId = v65.props.productId, 
                    userAssetId = v66, 
                    horizontalPadding = 24, 
                    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v65.focusController
                }), 
                Divider = v3.createElement("Frame", {
                    BackgroundColor3 = l_Theme_0.Divider.Color, 
                    BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -24, 0, 1)
                })
            });
        end);
    end;
    v65.renderCollectibleCard = function(v71, _, v73) --[[ Line: 158 ]]
        -- upvalues: v65 (copy), l_withStyle_0 (ref), v3 (ref), v32 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        local l_collectibleItemId_0 = v65.props.collectibleItemId;
        return l_withStyle_0(function(v75) --[[ Line: 160 ]]
            -- upvalues: v3 (ref), v73 (copy), v32 (ref), v65 (ref), l_collectibleItemId_0 (copy), v71 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
            local l_Theme_1 = v75.Theme;
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v73, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0)
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 8)
                }), 
                CollectibleResellerCard = v3.createElement(v32, {
                    LayoutOrder = 1, 
                    itemId = v65.props.itemId, 
                    collectibleItemId = l_collectibleItemId_0, 
                    collectibleInstanceId = v71, 
                    itemType = v65.props.itemType, 
                    horizontalPadding = 24, 
                    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v65.focusController
                }), 
                Divider = v3.createElement("Frame", {
                    BackgroundColor3 = l_Theme_1.Divider.Color, 
                    BackgroundTransparency = l_Theme_1.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 1)
                })
            });
        end);
    end;
    v65.renderLoadMoreButton = function(v77, v78) --[[ Line: 195 ]]
        -- upvalues: l_withLocalization_0 (ref), v3 (ref), l_Button_0 (ref), l_StandardButtonSize_0 (ref), l_ButtonType_0 (ref)
        return l_withLocalization_0({
            loadMore = "Feature.Catalog.Action.LoadMore"
        })(function(v79) --[[ Line: 198 ]]
            -- upvalues: v3 (ref), v77 (copy), l_Button_0 (ref), v78 (copy), l_StandardButtonSize_0 (ref), l_ButtonType_0 (ref)
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v77, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0)
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8), 
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                LoadMoreButton = v3.createElement(l_Button_0, {
                    onActivated = v78, 
                    text = v79.loadMore, 
                    standardSize = l_StandardButtonSize_0.Regular, 
                    buttonType = l_ButtonType_0.Secondary
                })
            });
        end);
    end;
    v65.makeRenderItem = function(v80) --[[ Line: 220 ]]
        -- upvalues: v29 (ref), v65 (copy)
        return function(v81, _, v83) --[[ Line: 221 ]]
            -- upvalues: v29 (ref), v65 (ref), v80 (copy)
            if v81 == v29.FinalRowRenderLoadMoreButton then
                return v65.renderLoadMoreButton(v83, v80);
            elseif v65.props.collectibleResellersInstancesIds then
                return v65.renderCollectibleCard(v81, nil, v83);
            else
                return v65.renderCard(v81, nil, v83);
            end;
        end;
    end;
    v65.goBack = function() --[[ Line: 235 ]]
        -- upvalues: v65 (copy)
        local l_navigation_0 = v65.props.navigation;
        v65.props.closeFocusedScreen(l_navigation_0);
    end;
end;
v64.didMount = function(v85) --[[ Line: 242 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_isGamepadInput_0 (copy)
    v85.props.fetchInitialItems();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    if l_l_UserInputService_0_LastInputType_0 then
        v85:setState({
            lastInputType = l_l_UserInputService_0_LastInputType_0
        });
    end;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0) then
        v85.focusController.captureFocus();
    end;
end;
v64.willUpdate = function(v87, v88, _) --[[ Line: 257 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    local v90 = v87.props.purchaseFetchingState == l_RetrievalStatus_0.Fetching;
    local v91 = true;
    if v88.purchaseFetchingState ~= l_RetrievalStatus_0.Done then
        v91 = v88.purchaseFetchingState == l_RetrievalStatus_0.Failed;
    end;
    if v90 and v91 then
        v87.props.fetchInitialItems();
    end;
end;
v64.didUpdate = function(v92, v93) --[[ Line: 268 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_isGamepadInput_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_RetrievalStatus_0 (copy)
    local l_fetchingStatus_0 = v92.props.fetchingStatus;
    local v95 = l_isGamepadInput_0(v92.state.lastInputType);
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v95 and l_fetchingStatus_0 == l_RetrievalStatus_0.Done and v93.fetchingStatus ~= l_RetrievalStatus_0.Done then
        v92.focusController.captureFocus();
    end;
end;
v64.willUnmount = function(v96) --[[ Line: 282 ]] --[[ Name: willUnmount ]]
    v96.props.clearResellerCursor();
end;
v64.renderOnLoaded = function(v97) --[[ Line: 286 ]] --[[ Name: renderOnLoaded ]]
    -- upvalues: v3 (copy), v16 (copy)
    return v3.createElement(v16.PageContent, {}, {
        Content = v97:renderContent()
    });
end;
v64.renderContent = function(v98) --[[ Line: 292 ]] --[[ Name: renderContent ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v5 (copy), v29 (copy), l_withStyle_0 (copy), v3 (copy), v33 (copy), l_Focusable_0 (copy), l_DefaultMetricsGridView_0 (copy), l_GridMetrics_0 (copy), l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 (copy), v22 (copy), v54 (copy)
    local l_screenSize_0 = v98.props.screenSize;
    local l_globalGuiInset_0 = v98.props.globalGuiInset;
    local l_resellerUserAssetIds_0 = v98.props.resellerUserAssetIds;
    local l_hasMoreRows_0 = v98.props.hasMoreRows;
    local l_enableContinuousLoad_0 = v98.props.enableContinuousLoad;
    local l_collectibleResellersInstancesIds_0 = v98.props.collectibleResellersInstancesIds;
    if not l_resellerUserAssetIds_0 and not l_collectibleResellersInstancesIds_0 then
        return;
    else
        local v105 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
        local v106 = {
            minimumItemsPerRow = 1, 
            minimumItemWidth = v105.X.Offset
        };
        local v107 = l_collectibleResellersInstancesIds_0 or l_resellerUserAssetIds_0;
        local v108 = l_hasMoreRows_0 and #v107 == 0;
        local v109 = v98.props.isFetchingMore or v108;
        local v110 = not v109 and l_hasMoreRows_0;
        local v111 = if v110 and l_enableContinuousLoad_0 then v98.props.loadMoreItems else nil;
        if v110 and not l_enableContinuousLoad_0 then
            v107 = v5.List.join(v107, {
                v29.FinalRowRenderLoadMoreButton
            });
        end;
        return l_withStyle_0(function(v112) --[[ Line: 323 ]]
            -- upvalues: v3 (ref), v33 (ref), v98 (copy), l_hasMoreRows_0 (copy), v111 (copy), l_Focusable_0 (ref), l_DefaultMetricsGridView_0 (ref), v105 (copy), l_GridMetrics_0 (ref), v106 (copy), v107 (ref), l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 (ref), v22 (ref), v109 (copy), v54 (ref)
            return v3.createElement(v33, {
                Position = UDim2.fromScale(0, 0), 
                Size = UDim2.fromScale(1, 1), 
                refresh = v98.props.fetchInitialItems, 
                createEndOfScrollElement = not l_hasMoreRows_0, 
                onThresholdReached = v111
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 24)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ResellerGridView = v3.createElement(l_Focusable_0[l_DefaultMetricsGridView_0], {
                    renderItem = v98.makeRenderItem(v98.props.loadMoreItems), 
                    windowHeight = v105.Y.Offset, 
                    getItemHeight = function(_) --[[ Line: 347 ]] --[[ Name: getItemHeight ]]
                        return 100;
                    end, 
                    getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter(v106), 
                    itemPadding = Vector2.new(0, 12), 
                    items = v107, 
                    maxHeight = 1e999, 
                    LayoutOrder = 1, 
                    defaultChildIndex = 1, 
                    inputBindings = if l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 then nil else {
                        NavigateBack = v22.Input.onBegin(Enum.KeyCode.ButtonB, v98.goBack)
                    }, 
                    ref = v98.gridViewRef, 
                    NextSelectionUp = v98.topBarRef
                }), 
                LoadingBar = if v109 then v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v112.Tokens.Global.Size_700), 
                    LayoutOrder = 2
                }, {
                    LoadingBar = v3.createElement(v54)
                }) else nil
            });
        end);
    end;
end;
v64.renderOnFailed = function(v114, v115) --[[ Line: 379 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: v3 (copy), l_EmptyState_0 (copy)
    return v3.createElement(l_EmptyState_0, {
        onActivated = v114.props.fetchInitialItems, 
        text = v115.failedMessage
    });
end;
v64.render = function(v116) --[[ Line: 386 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v12 (copy), l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 (copy)
    return v3.createElement(v12, {
        forwardRef = if l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 then v116.props.focusNavigationRef else nil
    }, {
        Content = v116:renderContents()
    });
end;
v64.renderContents = function(v117) --[[ Line: 394 ]] --[[ Name: renderContents ]]
    -- upvalues: v5 (copy), l_RetrievalStatus_0 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagUpdateNoInternetConnectionText_0 (copy), v3 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v16 (copy), v24 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_1 (copy)
    local l_globalGuiInset_1 = v117.props.globalGuiInset;
    local l_fetchingStatus_1 = v117.props.fetchingStatus;
    local v120 = v117.props.resellerUserAssetIds and not v5.isEmpty(v117.props.resellerUserAssetIds) or v117.props.collectibleResellersInstancesIds and not v5.isEmpty(v117.props.collectibleResellersInstancesIds);
    if l_fetchingStatus_1 == l_RetrievalStatus_0.Fetching and v120 then
        l_fetchingStatus_1 = l_RetrievalStatus_0.Done;
    end;
    return l_withStyle_0(function(v121) --[[ Line: 408 ]]
        -- upvalues: l_withLocalization_0 (ref), l_FFlagUpdateNoInternetConnectionText_0 (ref), v3 (ref), l_Focusable_0 (ref), l_globalGuiInset_1 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v117 (copy), v16 (ref), l_fetchingStatus_1 (ref), l_RetrievalStatus_0 (ref), v24 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_1 (ref)
        return l_withLocalization_0({
            title = "Feature.Catalog.Heading.Sellers", 
            failedMessage = l_FFlagUpdateNoInternetConnectionText_0 and "Feature.DisplayName.ErrorMessage.SomethingWentWrong" or "Feature.EmptyStatePage.Message.NoInternet"
        })(function(v122) --[[ Line: 414 ]]
            -- upvalues: v121 (copy), v3 (ref), l_Focusable_0 (ref), l_globalGuiInset_1 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v117 (ref), v16 (ref), l_fetchingStatus_1 (ref), l_RetrievalStatus_0 (ref), v24 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_1 (ref)
            local l_Theme_2 = v121.Theme;
            return v3.createElement(l_Focusable_0.Frame, {
                BackgroundColor3 = l_Theme_2.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_2.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.new(0, 0, 0, l_globalGuiInset_1.top), 
                Active = true, 
                focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v117.focusController
            }, {
                TopBar = v3.createElement(v16.Container, {
                    ZIndex = 2, 
                    titleText = v122.title, 
                    ref = v117.topBarRef, 
                    NextSelectionDown = l_fetchingStatus_1 == l_RetrievalStatus_0.Done and v117.gridViewRef or nil, 
                    leftItem = v16.BackButton
                }), 
                GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createElement(v24, {
                    focusController = v117.focusController
                }), 
                LastInputTypeChangedConnection = v3.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.LastInputTypeChanged, 
                    callback = function(v124) --[[ Line: 441 ]] --[[ Name: callback ]]
                        -- upvalues: v117 (ref)
                        if v124 then
                            v117:setState({
                                lastInputType = v124
                            });
                        end;
                    end
                }), 
                LoadingStateContainer = v3.createElement(l_LoadingStateContainer_0, {
                    dataStatus = l_RetrievalStatus_1.fromRawValue(l_fetchingStatus_1), 
                    renderOnLoaded = function() --[[ Line: 452 ]] --[[ Name: renderOnLoaded ]]
                        -- upvalues: v117 (ref)
                        return v117:renderOnLoaded();
                    end, 
                    renderOnFailed = function() --[[ Line: 455 ]] --[[ Name: renderOnFailed ]]
                        -- upvalues: v117 (ref), v122 (copy)
                        return v117:renderOnFailed(v122);
                    end
                })
            });
        end);
    end);
end;
v64 = v4.connect(function(v125, v126) --[[ Line: 464 ]]
    -- upvalues: v28 (copy), l_PerformFetch_0 (copy), v29 (copy)
    local l_itemId_0 = v126.itemId;
    local l_itemType_0 = v126.itemType;
    local v129 = nil;
    local v130 = nil;
    local v131 = v28(v125.AvatarExperience.Common, l_itemId_0, l_itemType_0);
    v129 = v131 and v131.product and v131.product.id;
    v130 = v131 and v131.resellerUserAssetIds;
    local l_collectibleItemId_1 = v126.collectibleItemId;
    local v133 = l_collectibleItemId_1 ~= nil;
    local v134 = nil;
    if v133 then
        local l_CollectiblesResellersInstances_0 = v125.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances;
        v134 = l_CollectiblesResellersInstances_0 and l_CollectiblesResellersInstances_0[l_collectibleItemId_1] and l_CollectiblesResellersInstances_0[l_collectibleItemId_1].InstanceIdsList;
    end;
    return {
        globalGuiInset = v125.GlobalGuiInset, 
        hasMoreRows = v125.AvatarExperience.Catalog.ResellerCursor.hasMoreRows, 
        fetchingStatus = l_PerformFetch_0.GetStatus(v125, v29.GetResellersKey .. tostring(l_collectibleItemId_1 or l_itemId_0)), 
        productId = v129, 
        purchaseFetchingState = l_PerformFetch_0.GetStatus(v125, v29.PurchaseProductKey .. tostring(v129)), 
        resellerCursor = v125.AvatarExperience.Catalog.ResellerCursor.nextPageCursor, 
        resellerUserAssetIds = v130, 
        screenSize = v125.ScreenSize, 
        collectibleResellersInstancesIds = v134
    };
end, function(v136) --[[ Line: 502 ]]
    -- upvalues: v38 (copy), v27 (copy)
    return {
        clearResellerCursor = function() --[[ Line: 504 ]] --[[ Name: clearResellerCursor ]]
            -- upvalues: v136 (copy), v38 (ref)
            return v136(v38(nil));
        end, 
        closeFocusedScreen = function(v137) --[[ Line: 507 ]] --[[ Name: closeFocusedScreen ]]
            -- upvalues: v136 (copy), v27 (ref)
            v136(v27(v137));
        end
    };
end)(v64);
v64 = l_RoactServices_0.connect({
    networking = v15
})(v64);
v64 = v26((v35((l_RoactAppPolicy_0.connect(function(v138, _) --[[ Line: 517 ]]
    return {
        enableContinuousLoad = v138.getEnableContinuousLoad()
    };
end)(v64)))));
return function(v140) --[[ Line: 526 ]]
    -- upvalues: l_useDispatch_0 (copy), v10 (copy), v15 (copy), l_useSelector_0 (copy), v3 (copy), v37 (copy), v29 (copy), v36 (copy), v8 (copy), v7 (copy), l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 (copy), v27 (copy), v63 (copy), v64 (ref), v5 (copy)
    local v141 = l_useDispatch_0();
    local v142 = v10(v15);
    local v144 = l_useSelector_0(function(v143) --[[ Line: 529 ]]
        return v143.AvatarExperience.Catalog.ResellerCursor.nextPageCursor;
    end);
    local l_collectibleItemId_2 = v140.navigation.state.params.collectibleItemId;
    local l_itemId_1 = v140.navigation.state.params.itemId;
    local v147 = v3.useCallback(function() --[[ Line: 536 ]]
        -- upvalues: l_collectibleItemId_2 (copy), v141 (copy), v37 (ref), v142 (copy), v144 (copy), v29 (ref), v36 (ref), l_itemId_1 (copy)
        if l_collectibleItemId_2 then
            return v141(v37(v142, l_collectibleItemId_2, v144, v29.MaxResellersPerPage));
        else
            return v141(v36(v142, l_itemId_1, v144, v29.MaxResellersPerPage, false));
        end;
    end, {
        l_collectibleItemId_2, 
        v144, 
        l_itemId_1
    });
    local v148 = v3.useCallback(function() --[[ Line: 557 ]]
        -- upvalues: l_collectibleItemId_2 (copy), v141 (copy), v37 (ref), v142 (copy), v29 (ref), v36 (ref), l_itemId_1 (copy)
        if l_collectibleItemId_2 then
            return v141(v37(v142, l_collectibleItemId_2, nil, v29.MaxResellersPerPage));
        else
            return v141(v36(v142, l_itemId_1, nil, v29.MaxResellersPerPage, true));
        end;
    end, {
        l_collectibleItemId_2, 
        l_itemId_1
    });
    local v149, v150 = v8(v147);
    local v151, v152 = v8(v148);
    local v153 = true;
    if v149.status ~= v7.Pending then
        v153 = v151.status == v7.Pending;
    end;
    local v154 = if l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 then v3.useCallback(function() --[[ Line: 581 ]]
        -- upvalues: v141 (copy), v27 (ref), v140 (copy)
        v141(v27(v140.navigation));
    end, {
        v140.navigation, 
        v141
    }) else nil;
    local v155 = if l_FFlagAXMigrateResellersInputBindingsToRoactGamepad_0 then v63(nil, v154) else nil;
    return v3.createElement(v64, v5.Dictionary.join(v140, {
        loadMoreItems = v150, 
        fetchInitialItems = v152, 
        isFetchingMore = v153, 
        focusNavigationRef = v155
    }));
end;