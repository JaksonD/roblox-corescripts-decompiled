local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.CenteredModalView);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellList);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.CurrentlySellingList);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v19 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseFocusedScreen);
local v20 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSellPageData);
local v23 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRemoveSellPageAndChildrenGamepadBindings;
local v26 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v26.Style.withStyle;
local l_VerticalScrollViewWithMargin_0 = v26.App.Container.VerticalScrollViewWithMargin;
local l_LoadingStateContainer_0 = v26.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v26.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v26.App.Indicator.EmptyState;
local l_FFlagUpdateNoInternetConnectionText_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagUpdateNoInternetConnectionText;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v34 = v3.PureComponent:extend("SellPage");
v34.init = function(v35) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), v3 (copy), l_isGamepadInput_0 (copy), v11 (copy)
    v35.state = {
        isWearAfterPurchaseChecked = false, 
        canvasSizeY = 0, 
        lastInputType = l_UserInputService_0:GetLastInputType()
    };
    v35.fetchSellPageData = function() --[[ Line: 71 ]]
        -- upvalues: v35 (copy)
        local l_networking_0 = v35.props.networking;
        local l_itemId_0 = v35.props.itemId;
        local l_localUserId_0 = v35.props.localUserId;
        return v35.props.fetchSellPageData(l_networking_0, l_itemId_0, l_localUserId_0);
    end;
    v35.onContentSizeChanged = function(v39) --[[ Line: 78 ]]
        -- upvalues: v35 (copy)
        v35:setState({
            canvasSizeY = v39.AbsoluteContentSize.Y + 48
        });
    end;
    v35.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v35.props.focusController or v7.createFocusController();
    v35.currentlySellingListRef = v3.createRef();
    v35.availableToSellListRef = v3.createRef();
    v35.topBarRef = v3.createRef();
    v35.emptyStateRef = v3.createRef();
    v35.onOverlayClosed = function() --[[ Line: 93 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v35 (copy), v11 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        local v40 = l_isGamepadInput_0(v35.state.lastInputType);
        v11("SellPage", v40);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v40 then
            v35.focusController.captureFocus();
        end;
    end;
    v35.goBack = function() --[[ Line: 101 ]]
        -- upvalues: v35 (copy)
        local l_navigation_0 = v35.props.navigation;
        v35.props.closeFocusedScreen(l_navigation_0);
    end;
end;
v34.didMount = function(v42) --[[ Line: 108 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_isGamepadInput_0 (copy)
    v42.fetchSellPageData();
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_isGamepadInput_0(v42.state.lastInputType) then
        v42.focusController.captureFocus();
    end;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v34.didUpdate = function(v43, v44) --[[ Line: 119 ]] --[[ Name: didUpdate ]]
        -- upvalues: l_isGamepadInput_0 (copy), v23 (copy)
        local l_fetchingStatus_0 = v43.props.fetchingStatus;
        if l_isGamepadInput_0(v43.state.lastInputType) and v44.currentlySellingListData and v43.props.currentlySellingListData and v44.availableItemsToSell and v43.props.availableItemsToSell and l_fetchingStatus_0 == v23.Done and #v44.currentlySellingListData ~= #v43.props.currentlySellingListData then
            if #v43.props.currentlySellingListData == 0 then
                v43.focusController.moveFocusTo(v43.availableToSellListRef);
                return;
            else
                v43.focusController.moveFocusTo(v43.currentlySellingListRef);
            end;
        end;
    end;
end;
v34.renderOnLoaded = function(v46, _) --[[ Line: 142 ]] --[[ Name: renderOnLoaded ]]
    -- upvalues: v3 (copy), v20 (copy)
    return v3.createElement(v20.PageContent, {
        ZIndex = 2
    }, {
        ScrollingView = v46:renderScrollingView()
    });
end;
v34.renderScrollingView = function(v48) --[[ Line: 150 ]] --[[ Name: renderScrollingView ]]
    -- upvalues: v3 (copy), l_VerticalScrollViewWithMargin_0 (copy), v13 (copy), v12 (copy)
    local l_itemId_1 = v48.props.itemId;
    local l_itemType_0 = v48.props.itemType;
    return v3.createElement(l_VerticalScrollViewWithMargin_0, {
        size = UDim2.fromScale(1, 1), 
        canvasSizeY = UDim.new(0, v48.state.canvasSizeY)
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 24), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v3.Change.AbsoluteContentSize] = v48.onContentSizeChanged
        }), 
        PagePadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 24)
        }), 
        CurrentlySellingList = v3.createElement(v13, {
            itemId = l_itemId_1, 
            LayoutOrder = 2, 
            [v3.Ref] = v48.currentlySellingListRef, 
            NextSelectionUp = v48.topBarRef, 
            NextSelectionDown = if v48.props.availableItemsToSell ~= nil and #v48.props.availableItemsToSell > 0 then v48.availableToSellListRef else nil, 
            onOverlayClosed = v48.onOverlayClosed
        }), 
        AvailableToSellList = v3.createElement(v12, {
            itemId = l_itemId_1, 
            itemType = l_itemType_0, 
            LayoutOrder = 3, 
            [v3.Ref] = v48.availableToSellListRef, 
            NextSelectionUp = if v48.props.currentlySellingListData ~= nil and #v48.props.currentlySellingListData > 0 then v48.currentlySellingListRef else v48.topBarRef, 
            onOverlayClosed = v48.onOverlayClosed
        })
    });
end;
v34.renderOnFailed = function(v51, v52) --[[ Line: 197 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: v3 (copy), l_EmptyState_0 (copy)
    return v3.createElement(l_EmptyState_0, {
        onActivated = v51.fetchSellPageData, 
        text = v52.failedMessage, 
        [v3.Ref] = v51.emptyStateRef, 
        NextSelectionUp = v51.topBarRef
    });
end;
v34.render = function(v53) --[[ Line: 206 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v9 (copy)
    return v3.createElement(v9, {}, {
        Content = v53:renderContents()
    });
end;
v34.renderContents = function(v54) --[[ Line: 212 ]] --[[ Name: renderContents ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagUpdateNoInternetConnectionText_0 (copy), v23 (copy), v3 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 (copy), v7 (copy), v20 (copy), v10 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local l_globalGuiInset_0 = v54.props.globalGuiInset;
    local l_fetchingStatus_1 = v54.props.fetchingStatus;
    return l_withStyle_0(function(v57) --[[ Line: 216 ]]
        -- upvalues: l_withLocalization_0 (ref), l_FFlagUpdateNoInternetConnectionText_0 (ref), l_fetchingStatus_1 (copy), v23 (ref), v54 (copy), v3 (ref), l_Focusable_0 (ref), l_globalGuiInset_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 (ref), v7 (ref), v20 (ref), v10 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref)
        return l_withLocalization_0({
            title = "Feature.Catalog.Heading.SellItem", 
            failedMessage = l_FFlagUpdateNoInternetConnectionText_0 and "Feature.DisplayName.ErrorMessage.SomethingWentWrong" or "Feature.EmptyStatePage.Message.NoInternet"
        })(function(v58) --[[ Line: 222 ]]
            -- upvalues: v57 (copy), l_fetchingStatus_1 (ref), v23 (ref), v54 (ref), v3 (ref), l_Focusable_0 (ref), l_globalGuiInset_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 (ref), v7 (ref), v20 (ref), v10 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref)
            local l_Theme_0 = v57.Theme;
            local v60 = nil;
            if l_fetchingStatus_1 == v23.Done then
                if v54.props.currentlySellingListData ~= nil and #v54.props.currentlySellingListData > 0 then
                    v60 = v54.currentlySellingListRef;
                elseif v54.props.availableItemsToSell ~= nil and #v54.props.availableItemsToSell > 0 then
                    v60 = v54.availableToSellListRef;
                elseif l_fetchingStatus_1 == v23.Failed then
                    v60 = v54.emptyStateRef;
                end;
            end;
            return v3.createElement(l_Focusable_0.Frame, {
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0, l_globalGuiInset_0.left, 0, l_globalGuiInset_0.top), 
                Size = UDim2.fromScale(1, 1), 
                defaultChild = v60, 
                restorePreviousChildFocus = true, 
                focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v54.focusController, 
                inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 then nil else {
                    NavigateBack = v7.Input.onBegin(Enum.KeyCode.ButtonB, v54.goBack)
                }
            }, {
                TopBar = v3.createElement(v20.Container, {
                    ZIndex = 2, 
                    titleText = v58.title, 
                    [v3.Ref] = v54.topBarRef, 
                    NextSelectionDown = v60, 
                    leftItem = v20.BackButton
                }), 
                GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createElement(v10, {
                    focusController = v54.focusController
                }), 
                LoadingStateContainer = v3.createElement(l_LoadingStateContainer_0, {
                    dataStatus = l_RetrievalStatus_0.fromRawValue(l_fetchingStatus_1), 
                    renderOnLoaded = function() --[[ Line: 266 ]] --[[ Name: renderOnLoaded ]]
                        -- upvalues: v54 (ref), v57 (ref)
                        return v54:renderOnLoaded(v57);
                    end, 
                    renderOnFailed = function() --[[ Line: 269 ]] --[[ Name: renderOnFailed ]]
                        -- upvalues: v54 (ref), v58 (copy)
                        return v54:renderOnFailed(v58);
                    end
                }), 
                LastInputChangedListener = v3.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.LastInputTypeChanged, 
                    callback = function(v61) --[[ Line: 275 ]] --[[ Name: callback ]]
                        -- upvalues: v54 (ref)
                        v54:setState({
                            lastInputType = v61
                        });
                    end
                })
            });
        end);
    end);
end;
v34 = v4.connect(function(v62, v63) --[[ Line: 286 ]]
    -- upvalues: l_PerformFetch_0 (copy), v14 (copy)
    local l_LocalUserId_0 = v62.LocalUserId;
    local l_itemId_2 = v63.itemId;
    return {
        fetchingStatus = l_PerformFetch_0.GetStatus(v62, v14.GetSellPageDataKey .. tostring(l_itemId_2)), 
        globalGuiInset = v62.GlobalGuiInset, 
        localUserId = l_LocalUserId_0, 
        currentlySellingListData = v62.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[l_itemId_2], 
        availableItemsToSell = v62.AvatarExperience.Catalog.Sell.AvailableToSellAssets[l_itemId_2]
    };
end, function(v66) --[[ Line: 296 ]]
    -- upvalues: v22 (copy), v19 (copy)
    return {
        fetchSellPageData = function(v67, v68, v69) --[[ Line: 298 ]] --[[ Name: fetchSellPageData ]]
            -- upvalues: v66 (copy), v22 (ref)
            v66(v22(v67, v68, v69));
        end, 
        closeFocusedScreen = function(v70) --[[ Line: 301 ]] --[[ Name: closeFocusedScreen ]]
            -- upvalues: v66 (copy), v19 (ref)
            v66(v19(v70));
        end
    };
end)(v34);
return (v18((v17((l_RoactServices_0.connect({
    networking = v6
})(v34))))));