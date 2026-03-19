local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v8 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.CategoryContent);
local v16 = if require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXMigrateAENavigationToFunctionalReact)() then require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Navigation) else require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Navigation_DEPRECATED);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectHasOwnedOrRecommendedAssetsData);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.GetDataStatusForCategory);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v20 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v23 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v24 = require(l_CorePackages_0.Packages.RoactNavigation);
local v25 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v26 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v27 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.Slots.SlotsContainer);
local v28 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v29 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v30 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP);
local l_FFlagAXItemsViewContentSizeBinding_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXItemsViewContentSizeBinding;
local l_FFlagAXSlotsScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsScrollAway;
local l_FFlagAXSlotsPeekViewScrollFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXSlotsDesktopRedesign_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local v37 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.SubNavigationBar.SubNavigationBar);
local v38 = v3.PureComponent:extend("NavigationItemsView");
local v39 = {
    [l_AvatarScreen_0.Catalog] = true, 
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = true
};
v38.defaultProps = {
    swipeNavigationEnabled = false
};
v38.init = function(v40) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_FFlagAXItemsViewContentSizeBinding_0 (copy), l_Signal_0 (copy), l_FFlagAXSlotsScrollAway_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), v14 (copy), l_FFlagAXSlotsPeekViewScrollFix_0 (copy)
    v40.navBarRef = v3.createRef();
    v40.contentRef = v3.createRef();
    if l_FFlagAXItemsViewContentSizeBinding_0 then
        local v41, v42 = v3.createBinding(UDim2.fromScale(1, 1));
        v40.contentSize = v41;
        v40.updateContentSize = v42;
    end;
    v40.backToTopSignal = l_Signal_0.new();
    v40.lastScrollStartPosition = l_FFlagAXSlotsScrollAway_0 and 0 or nil;
    v40.pivotPosition = l_FFlagAXSlotsScrollAway_0 and 0 or nil;
    v40.scrollingDown = l_FFlagAXSlotsScrollAway_0 and true or nil;
    v40.changedPage = not l_FFlagAXRootSlotBasedEditorFlag_0 and nil;
    v40:setState({
        restorePreviousChildFocus = true, 
        scrollAwayValue = l_FFlagAXRootSlotBasedEditorFlag_0 and 1 or nil, 
        lastScrollStartPosition = l_FFlagAXSlotsScrollAway_0 and 0 or nil, 
        scrollingDown = l_FFlagAXSlotsScrollAway_0 and true or nil, 
        pivotPosition = l_FFlagAXSlotsScrollAway_0 and 0 or nil
    });
    v40.setCategory = function(v43) --[[ Line: 98 ]]
        -- upvalues: v40 (copy)
        local l_analytics_0 = v40.props.analytics;
        v40.props.setCategoryAndSubcategory(v43, nil, l_analytics_0);
        local l_axAnalytics_0 = v40.props.axAnalytics;
        local l_navigation_0 = v40.props.navigation;
        v40.props.exit3DFullView(l_axAnalytics_0, l_navigation_0.state.routeName);
    end;
    v40.setSubcategory = function(v47) --[[ Line: 105 ]]
        -- upvalues: v40 (copy)
        local l_analytics_1 = v40.props.analytics;
        v40.props.setCategoryAndSubcategory(nil, v47, l_analytics_1);
        local l_axAnalytics_1 = v40.props.axAnalytics;
        local l_navigation_1 = v40.props.navigation;
        v40.props.exit3DFullView(l_axAnalytics_1, l_navigation_1.state.routeName);
    end;
    v40.navigate = function(v51) --[[ Line: 113 ]]
        -- upvalues: v40 (copy), v14 (ref)
        if not v40.props.swipeNavigationEnabled then
            return;
        else
            local v52 = v14();
            local l_categoryIndex_0 = v40.props.categoryIndex;
            local l_subcategoryIndex_0 = v40.props.subcategoryIndex;
            local l_Subcategories_0 = v52[l_categoryIndex_0].Subcategories;
            if l_Subcategories_0 and l_subcategoryIndex_0 ~= 0 then
                local v56 = l_subcategoryIndex_0 + v51;
                if v56 > 0 and v56 <= #l_Subcategories_0 then
                    v40.setSubcategory(v56);
                    return;
                end;
            end;
            local v57 = l_categoryIndex_0 + v51;
            if v57 > 0 and v57 <= #v52 then
                v40.setCategory(v57);
            end;
            return;
        end;
    end;
    v40.onNavBarSizeChanged = function(v58) --[[ Line: 139 ]]
        -- upvalues: l_FFlagAXItemsViewContentSizeBinding_0 (ref), v40 (copy)
        if l_FFlagAXItemsViewContentSizeBinding_0 then
            v40.updateContentSize(UDim2.new(1, 0, 1, -v58.Y));
            return;
        else
            if v40.contentRef.current then
                v40.contentRef.current.Size = UDim2.new(1, 0, 1, -v58.Y);
            end;
            return;
        end;
    end;
    v40.navigateLeft = function() --[[ Line: 147 ]]
        -- upvalues: v40 (copy)
        v40.navigate(-1);
    end;
    v40.navigateRight = function() --[[ Line: 151 ]]
        -- upvalues: v40 (copy)
        v40.navigate(1);
    end;
    v40.onInputBegan = l_FFlagAXSlotsPeekViewScrollFix_0 and function(_, v60) --[[ Line: 156 ]]
        -- upvalues: v40 (copy)
        if v60.UserInputState == Enum.UserInputState.Begin then
            v40.props.updateDisableScrollView(true);
        end;
    end or nil;
    v40.onInputEnded = l_FFlagAXSlotsPeekViewScrollFix_0 and function(_, v62) --[[ Line: 166 ]]
        -- upvalues: v40 (copy)
        if v62.UserInputState == Enum.UserInputState.End then
            v40.props.updateDisableScrollView(false);
        end;
    end or nil;
    v40.onContentScroll = l_FFlagAXSlotsScrollAway_0 and function(v63) --[[ Line: 184 ]]
        -- upvalues: v40 (copy)
        if v40.changedPage then
            v40.lastScrollStartPosition = 0;
            v40.pivotPosition = 0;
            v40.scrollingDown = true;
            v40.changedPage = false;
            v40:setState({
                scrollAwayValue = 1
            });
            return;
        else
            local l_lastScrollStartPosition_0 = v40.lastScrollStartPosition;
            local l_scrollingDown_0 = v40.scrollingDown;
            local l_pivotPosition_0 = v40.pivotPosition;
            local v67 = 0;
            if v63.CanvasPosition.Y < 0 then
                v67 = 1;
            elseif v63.CanvasPosition.Y + v63.AbsoluteWindowSize.Y > v63.AbsoluteCanvasSize.Y then
                v67 = 0;
            elseif l_lastScrollStartPosition_0 - v63.CanvasPosition.Y > 0 then
                if not l_scrollingDown_0 then
                    l_scrollingDown_0 = true;
                    l_pivotPosition_0 = v63.CanvasPosition.Y;
                end;
                v67 = math.min(math.max(0, 280 * v40.state.scrollAwayValue + math.abs(l_pivotPosition_0 - v63.CanvasPosition.Y)) / 280, 1);
            else
                if l_scrollingDown_0 then
                    l_scrollingDown_0 = false;
                    l_pivotPosition_0 = v63.CanvasPosition.Y;
                end;
                v67 = math.min(math.max(0, 280 * v40.state.scrollAwayValue - math.abs(l_pivotPosition_0 - v63.CanvasPosition.Y)) / 280, 1);
            end;
            v40.lastScrollStartPosition = v63.CanvasPosition.Y;
            v40.pivotPosition = l_pivotPosition_0;
            v40.scrollingDown = l_scrollingDown_0;
            v40:setState({
                scrollAwayValue = v67
            });
            return;
        end;
    end or function(v68) --[[ Line: 241 ]]
        -- upvalues: v40 (copy)
        local v69 = math.min(math.max(0, 180 - v68.CanvasPosition.Y) / 180, 1);
        v40:setState({
            scrollAwayValue = math.lerp(0, 1, v69 * v69 * v69)
        });
    end;
end;
v38.render = function(v70) --[[ Line: 249 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), l_FFlagAXSlotsDesktopRedesign_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_withStyle_0 (copy), l_FFlagAXSlotsPeekViewScrollFix_0 (copy), v3 (copy), v5 (copy), l_FFlagAXSlotsScrollAway_0 (copy), v2 (copy), v27 (copy), v16 (copy), v12 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v37 (copy), v15 (copy), l_FFlagAXItemsViewContentSizeBinding_0 (copy), v8 (copy)
    local l_analytics_2 = v70.props.analytics;
    local l_axAnalytics_2 = v70.props.axAnalytics;
    local v73 = v70.props.hasOwnedOrRecommendedAssets or v70.props.dataStatus == v20.Failed;
    local v74 = if l_FFlagAXSlotsDesktopRedesign_0 then nil else if l_FFlagAXRootSlotBasedEditorFlag_0 then v70.props.isPortrait else nil;
    return l_withStyle_0(function(v75) --[[ Line: 259 ]]
        -- upvalues: v70 (copy), l_FFlagAXSlotsPeekViewScrollFix_0 (ref), v3 (ref), v5 (ref), l_FFlagAXSlotsScrollAway_0 (ref), v2 (ref), l_FFlagAXRootSlotBasedEditorFlag_0 (ref), l_FFlagAXSlotsDesktopRedesign_0 (ref), v74 (copy), v27 (ref), v16 (ref), l_analytics_2 (copy), l_axAnalytics_2 (copy), v12 (ref), v73 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v37 (ref), v15 (ref), l_FFlagAXItemsViewContentSizeBinding_0 (ref), v8 (ref)
        local l_Theme_0 = v75.Theme;
        local l_defaultChildRef_0 = v70.props.defaultChildRef;
        local l_navBarRef_0 = v70.navBarRef;
        local v79 = if l_FFlagAXSlotsPeekViewScrollFix_0 then v75.Tokens.Global.Space_500 else 0;
        return v3.createElement(v5.Focusable.Frame, {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = if l_FFlagAXSlotsScrollAway_0 then Enum.AutomaticSize.Y else nil, 
            [v3.Ref] = l_defaultChildRef_0, 
            restorePreviousChildFocus = v70.state.restorePreviousChildFocus, 
            defaultChild = v70.navBarRef, 
            NextSelectionRight = v70.props.NextSelectionRight
        }, if l_FFlagAXSlotsPeekViewScrollFix_0 then {
            ContainerFrame = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                ListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                SlotsContainer = if l_FFlagAXRootSlotBasedEditorFlag_0 and (l_FFlagAXSlotsDesktopRedesign_0 and true or v74) then v2.createElement(v27, {
                    slotSubNavigationFill = v70.state.scrollAwayValue, 
                    absoluteSizeChanged = v70.onNavBarSizeChanged
                }) else nil, 
                NavBar = if (l_FFlagAXSlotsDesktopRedesign_0 and true or v74) and l_FFlagAXRootSlotBasedEditorFlag_0 then nil else v3.createElement(v16, {
                    analytics = l_analytics_2, 
                    axAnalytics = l_axAnalytics_2, 
                    layoutOrderMain = 1, 
                    layoutOrderSub = 2, 
                    navHeightMain = v12.MainNavHeight, 
                    navHeightSub = v12.SubNavHeight, 
                    absoluteSizeChanged = v70.onNavBarSizeChanged, 
                    backToTopSignal = v70.backToTopSignal, 
                    navBarRef = v70.navBarRef, 
                    NextSelectionDown = v73 and v70.contentRef or nil, 
                    NextSelectionUp = v70.props.NextSelectionUp
                }), 
                SubNavBar = if l_FFlagAXCustomizeMakeupSupport_0 then v2.createElement(v37, {
                    LayoutOrder = 3
                }) else nil, 
                CategoryContent = v3.createElement(v15, {
                    LayoutOrder = if l_FFlagAXRootSlotBasedEditorFlag_0 then l_FFlagAXCustomizeMakeupSupport_0 and 4 or 3 else 2, 
                    Size = if l_FFlagAXItemsViewContentSizeBinding_0 then v70.contentSize else UDim2.new(1, 0, 1, 0), 
                    frameRef = v70.contentRef, 
                    backToTopSignal = v70.backToTopSignal, 
                    onContentScroll = if l_FFlagAXRootSlotBasedEditorFlag_0 then v70.onContentScroll else nil, 
                    navigateLeft = v70.navigateLeft, 
                    navigateRight = v70.navigateRight, 
                    NextSelectionUp = l_navBarRef_0, 
                    restorePreviousChildFocus = v70.state.restorePreviousChildFocus
                })
            }), 
            CoverFrame = if v70.props.peekViewState ~= v8.SceneFullView then v2.createElement("Frame", {
                Position = UDim2.fromOffset(v75.Tokens.Global.Size_50, v79), 
                Size = UDim2.new(1, v75.Tokens.Global.Size_50 / 2, 1, -v79 * 2), 
                BackgroundTransparency = 1, 
                [v3.Event.InputBegan] = v70.onInputBegan, 
                [v3.Event.InputEnded] = v70.onInputEnded
            }) else nil
        } else {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            SlotsContainer = if l_FFlagAXRootSlotBasedEditorFlag_0 and (l_FFlagAXSlotsDesktopRedesign_0 and true or v74) then v2.createElement(v27, {
                slotSubNavigationFill = v70.state.scrollAwayValue, 
                absoluteSizeChanged = v70.onNavBarSizeChanged
            }) else nil, 
            NavBar = if (l_FFlagAXSlotsDesktopRedesign_0 and true or v74) and l_FFlagAXRootSlotBasedEditorFlag_0 then nil else v3.createElement(v16, {
                analytics = l_analytics_2, 
                axAnalytics = l_axAnalytics_2, 
                layoutOrderMain = 1, 
                layoutOrderSub = 2, 
                navHeightMain = v12.MainNavHeight, 
                navHeightSub = v12.SubNavHeight, 
                absoluteSizeChanged = v70.onNavBarSizeChanged, 
                backToTopSignal = v70.backToTopSignal, 
                navBarRef = v70.navBarRef, 
                NextSelectionDown = v73 and v70.contentRef or nil, 
                NextSelectionUp = v70.props.NextSelectionUp
            }), 
            CategoryContent = v3.createElement(v15, {
                LayoutOrder = l_FFlagAXRootSlotBasedEditorFlag_0 and 3 or 2, 
                Size = if l_FFlagAXItemsViewContentSizeBinding_0 then v70.contentSize else UDim2.new(1, 0, 1, 0), 
                frameRef = v70.contentRef, 
                backToTopSignal = v70.backToTopSignal, 
                onContentScroll = if l_FFlagAXRootSlotBasedEditorFlag_0 then v70.onContentScroll else nil, 
                navigateLeft = v70.navigateLeft, 
                navigateRight = v70.navigateRight, 
                NextSelectionUp = l_navBarRef_0, 
                restorePreviousChildFocus = v70.state.restorePreviousChildFocus
            })
        });
    end);
end;
v38.didUpdate = function(v80, v81) --[[ Line: 410 ]] --[[ Name: didUpdate ]]
    -- upvalues: v30 (copy), v29 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_AvatarScreen_0 (copy), v39 (copy)
    if v30.isEnabled() and v80.props.categoryInfo and (v80.props.categoryInfo.Name == "Style" or v80.props.categoryInfo.Name == "HeadAndBody") and v29.logExperimentExposure then
        v29.logExperimentExposure(v30);
    end;
    if l_FFlagAXRootSlotBasedEditorFlag_0 and v80.state.scrollAwayValue and (v81.categoryInfo.Name ~= v80.props.categoryInfo.Name or v81.bodyColorViewSetting ~= v80.props.bodyColorViewSetting) then
        v80.changedPage = true;
        v80:setState({
            scrollAwayValue = 1
        });
    end;
    local l_name_0 = v80.props.avatarRoute.current.name;
    local l_name_1 = v81.avatarRoute.current.name;
    if l_name_0 == l_AvatarScreen_0.AvatarEditor then
        if not v80.state.restorePreviousChildFocus then
            v80:setState({
                restorePreviousChildFocus = true
            });
            return;
        end;
    elseif v39[l_name_0] and l_name_1 == l_AvatarScreen_0.AvatarEditor and v80.state.restorePreviousChildFocus then
        v80:setState({
            restorePreviousChildFocus = false
        });
    end;
end;
local function v90(v84) --[[ Line: 459 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_FFlagAXSlotsDesktopRedesign_0 (copy), v28 (copy), v30 (copy), v26 (copy), l_FFlagAXSlotsPeekViewScrollFix_0 (copy), v7 (copy), l_AvatarScreen_0 (copy), v17 (copy), v18 (copy)
    local l_category_0 = v84.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v84.AvatarExperience.AvatarEditor.Categories.subcategory;
    local v87 = if l_FFlagAXRootSlotBasedEditorFlag_0 then v84.AvatarExperience.AvatarEditor.BodyColorPickerSettings.viewSetting else nil;
    local v88 = if l_FFlagAXSlotsDesktopRedesign_0 then nil else if l_FFlagAXRootSlotBasedEditorFlag_0 then v28(v84) else nil;
    local v89 = if v30.isEnabled() then v26.getAvatarEditorCategoryInfoFromState(v84) else nil;
    return {
        categoryInfo = if v30.isEnabled() then v89 else nil, 
        categoryIndex = l_category_0, 
        subcategoryIndex = l_subcategory_0, 
        bodyColorViewSetting = if l_FFlagAXRootSlotBasedEditorFlag_0 then v87 else nil, 
        peekViewState = if l_FFlagAXSlotsPeekViewScrollFix_0 then v7(v84, l_AvatarScreen_0.AvatarEditor) else nil, 
        hasOwnedOrRecommendedAssets = v17(v84), 
        dataStatus = v18(v84), 
        isPortrait = v88
    };
end;
local function v97(v91) --[[ Line: 487 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy), v23 (copy)
    return {
        setCategoryAndSubcategory = function(v92, v93, v94) --[[ Line: 489 ]] --[[ Name: setCategoryAndSubcategory ]]
            -- upvalues: v91 (copy), v19 (ref)
            v91(v19(v92, v93, v94));
        end, 
        exit3DFullView = function(v95, v96) --[[ Line: 493 ]] --[[ Name: exit3DFullView ]]
            -- upvalues: v91 (copy), v23 (ref)
            v91(v23(v95, v96));
        end
    };
end;
v38 = v13((l_RoactServices_0.connect({
    analytics = v11, 
    axAnalytics = v25
})(v38)));
v38 = v24.withNavigation(v38);
return v4.connect(v90, v97)(v38);