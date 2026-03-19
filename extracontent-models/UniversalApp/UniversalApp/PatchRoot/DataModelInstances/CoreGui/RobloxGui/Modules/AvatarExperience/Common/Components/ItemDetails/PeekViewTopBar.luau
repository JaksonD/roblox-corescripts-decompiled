local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.Roact);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_Images_0 = v9.App.ImageSet.Images;
local l_withStyle_0 = v9.Style.withStyle;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v17 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v20 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v23 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseFocusedScreen);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v26 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v29 = require(l_Modules_0.AvatarExperience.Common.Validators.ItemDataValidator);
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
local l_FFlagAXTryOnScreenImprovements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXTryOnScreenImprovements;
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Components.RobuxBalance);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v35 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v35 = l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX;
end;
local v36 = l_Images_0["icons/navigation/close"];
local v37 = l_Images_0["icons/navigation/pushBack"];
local v38 = l_Images_0["icons/actions/truncationExpand"];
local v39 = v35 and 0.5 or 0;
local v40 = v6.PureComponent:extend("PeekViewTopBar");
v40.validateProps = v4.strictInterface({
    forwardRef = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    itemId = v4.optional(v4.string), 
    itemType = v4.optional(v4.string), 
    itemData = v4.optional(v29), 
    dropDownTopBar = v4.optional(v4.boolean), 
    peekViewState = v4.optional(v4.any), 
    closePeekView = v4.optional(v4.callback), 
    showRobuxBalance = v4.optional(v4.boolean), 
    topBarHeight = v4.number, 
    statusBarHeight = v4.number, 
    isPortrait = v4.optional(v4.boolean), 
    closeFocusedScreen = v4.callback, 
    toggleTryOn = v4.optional(v4.callback), 
    navigation = v4.table, 
    networking = v4.callback, 
    catalogAnalytics = v4.table, 
    appAnalytics = v4.table, 
    avatarRoute = v4.table
});
v40.init = function(v41) --[[ Line: 99 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v25 (copy), v22 (copy), v6 (copy)
    v41.navigateBack = function() --[[ Line: 100 ]]
        -- upvalues: v41 (copy)
        local l_navigation_0 = v41.props.navigation;
        v41.props.closeFocusedScreen(l_navigation_0);
    end;
    v41.closeFiltersAndItemDetails = function() --[[ Line: 110 ]]
        -- upvalues: v41 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), v25 (ref), v22 (ref)
        local l_navigation_1 = v41.props.navigation;
        if not l_FFlagAXMISEnableMultiShopping_0 then
            local l_itemData_0 = v41.props.itemData;
            if l_itemData_0 ~= nil then
                local l_itemId_0 = v41.props.itemId;
                local l_itemType_0 = v41.props.itemType;
                local v47 = v25.GetItemSubType(l_itemType_0, l_itemData_0);
                v41.props.toggleTryOn(v41.props.networking, v41.props.catalogAnalytics, l_itemType_0, v47, l_itemId_0, true, v41.props.avatarRoute, l_navigation_1);
            end;
        end;
        v22.closeFiltersAndItemDetails(l_navigation_1);
    end;
    v41.buttonRef = v41.props.forwardRef or v6.createRef();
    v41.secondaryButtonRef = v6.createRef();
end;
v40.renderBothButtons = function(v48, v49, v50) --[[ Line: 151 ]] --[[ Name: renderBothButtons ]]
    -- upvalues: v6 (copy), l_Focusable_0 (copy), v39 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), v37 (copy), v36 (copy)
    return v6.createFragment({
        UIListLayout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 0)
        }), 
        UIPadding = v6.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 0)
        }), 
        BackButton = v6.createElement(l_Focusable_0.TextButton, {
            LayoutOrder = 1, 
            AnchorPoint = Vector2.new(0, v39), 
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v6.Event.Activated] = v48.navigateBack, 
            [v6.Ref] = v48.buttonRef, 
            NextSelectionRight = v48.secondaryButtonRef, 
            SelectionImageObject = v50(l_CursorKind_0.RoundedRectNoInset)
        }, {
            BackButtonIcon = v6.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v37, 
                ImageColor3 = v49
            })
        }), 
        CloseButton = v6.createElement(l_Focusable_0.TextButton, {
            LayoutOrder = 2, 
            AnchorPoint = Vector2.new(0, v39), 
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v6.Event.Activated] = v48.closeFiltersAndItemDetails, 
            [v6.Ref] = v48.secondaryButtonRef, 
            NextSelectionLeft = v48.buttonRef, 
            SelectionImageObject = v50(l_CursorKind_0.RoundedRectNoInset)
        }, {
            CloseButtonIcon = v6.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v36, 
                ImageColor3 = v49
            })
        })
    });
end;
v40.isFirstItemDetailVisible = function(v51) --[[ Line: 214 ]] --[[ Name: isFirstItemDetailVisible ]]
    -- upvalues: l_AvatarScreen_0 (copy), v22 (copy)
    local l_previousPages_0 = v51.props.avatarRoute.previousPages;
    local v53 = 0;
    if #l_previousPages_0 == 0 then
        return nil;
    else
        for _, v55 in pairs(l_previousPages_0) do
            if v55.name == l_AvatarScreen_0.ItemDetails then
                v53 = v53 + 1;
            end;
        end;
        local v56 = false;
        if v53 == 0 then
            v56 = v22.isFirstItemDetailsPage(v51.props.navigation);
        end;
        return v56;
    end;
end;
v40.render = function(v57) --[[ Line: 230 ]] --[[ Name: render ]]
    -- upvalues: v22 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy), l_PeekViewState_0 (copy), v6 (copy), v39 (copy), v32 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), v36 (copy), v37 (copy), v38 (copy)
    local l_statusBarHeight_0 = v57.props.statusBarHeight;
    local l_topBarHeight_0 = v57.props.topBarHeight;
    local v60 = v22.isFirstItemDetailsPage(v57.props.navigation);
    if v57.props.dropDownTopBar then
        v60 = true;
    end;
    local v61 = if l_FFlagAXTryOnScreenImprovements_0 then nil else v57.props.navigation.getParam("fromProfile");
    local v62 = nil;
    if not l_FFlagAXTryOnScreenImprovements_0 then
        v62 = v57.props.navigation.getParam("fromHome");
    end;
    local v63 = v57.props.navigation.getParam("showFullWithNoPeekView");
    local v64 = v63 and not v60;
    local v65 = v57:isFirstItemDetailVisible();
    return l_withStyle_0(function(v66) --[[ Line: 248 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), l_FFlagAXTryOnScreenImprovements_0 (ref), v61 (copy), v63 (copy), v62 (ref), v57 (copy), l_PeekViewState_0 (ref), v64 (copy), v6 (ref), v39 (ref), l_statusBarHeight_0 (copy), v32 (ref), l_Focusable_0 (ref), v65 (copy), l_CursorKind_0 (ref), v60 (ref), l_ImageSetLabel_0 (ref), v36 (ref), v37 (ref), v38 (ref), l_topBarHeight_0 (copy)
        return l_withSelectionCursorProvider_0(function(v67) --[[ Line: 249 ]]
            -- upvalues: l_FFlagAXTryOnScreenImprovements_0 (ref), v61 (ref), v63 (ref), v62 (ref), v66 (copy), v57 (ref), l_PeekViewState_0 (ref), v64 (ref), v6 (ref), v39 (ref), l_statusBarHeight_0 (ref), v32 (ref), l_Focusable_0 (ref), v65 (ref), l_CursorKind_0 (ref), v60 (ref), l_ImageSetLabel_0 (ref), v36 (ref), v37 (ref), v38 (ref), l_topBarHeight_0 (ref)
            local v68 = if not not l_FFlagAXTryOnScreenImprovements_0 or v61 or v63 or v62 then v66.Theme.IconEmphasis.Color else Color3.new(1, 1, 1);
            local v69 = 1;
            local v70 = nil;
            if v63 and v57.props.isPortrait then
                v69 = 0;
                v70 = v66.Theme.BackgroundDefault.Color;
            end;
            local v71 = v57.props.dropDownTopBar and v57.props.peekViewState == l_PeekViewState_0.Full;
            local l_Size_600_0 = v66.Tokens.Global.Size_600;
            local l_Size_600_1 = v66.Tokens.Global.Size_600;
            local v74 = nil;
            v74 = if v64 then v57:renderBothButtons(v68, v67) else {
                RobuxBalance = if v57.props.showRobuxBalance then v6.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    AnchorPoint = Vector2.new(1, v39), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(1, -v66.Tokens.Global.Space_150, v39, l_statusBarHeight_0), 
                    ZIndex = 0
                }, {
                    RobuxBalance = v6.createElement(v32, {
                        [v6.Ref] = v57.robuxBalanceRef
                    })
                }) else nil, 
                TouchFriendlyNavigationButton = not v71 and v6.createElement(l_Focusable_0.TextButton, {
                    AnchorPoint = Vector2.new(0, v39), 
                    Position = UDim2.new(0, 15, v39, l_statusBarHeight_0), 
                    Size = UDim2.new(0, 36, 0, 36), 
                    BackgroundTransparency = 1, 
                    Text = "", 
                    [v6.Event.Activated] = v57.navigateBack, 
                    [v6.Ref] = v57.buttonRef, 
                    Visible = v65, 
                    NextSelectionDown = v57.props.NextSelectionDown, 
                    SelectionImageObject = v67(l_CursorKind_0.RoundedRectNoInset)
                }, {
                    CloseButton = v60 and v6.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(0, 36, 0, 36), 
                        Image = v36, 
                        ImageColor3 = v68
                    }), 
                    BackButton = not v60 and v6.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(0, 36, 0, 36), 
                        Image = v37, 
                        ImageColor3 = v68
                    })
                }), 
                TouchFriendlyDownButton = v71 and v6.createElement(l_Focusable_0.TextButton, {
                    AnchorPoint = Vector2.new(0, v39), 
                    Position = UDim2.new(0, v66.Tokens.Global.Space_150, v39, l_statusBarHeight_0), 
                    Size = UDim2.new(0, 36, 0, 36), 
                    BackgroundTransparency = 1, 
                    Text = "", 
                    [v6.Event.Activated] = v57.props.closePeekView, 
                    [v6.Ref] = v57.buttonRef, 
                    Visible = v65, 
                    NextSelectionDown = v57.props.NextSelectionDown, 
                    SelectionImageObject = v67(l_CursorKind_0.RoundedRectNoInset)
                }, {
                    DownButton = v6.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(0, l_Size_600_0, 0, l_Size_600_1), 
                        Image = v38, 
                        ImageColor3 = v68
                    })
                })
            };
            return v6.createElement(l_Focusable_0.Frame, {
                Active = true, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = v69, 
                BackgroundColor3 = v70, 
                NextSelectionLeft = v57.props.NextSelectionLeft, 
                NextSelectionRight = v57.props.NextSelectionRight, 
                NextSelectionUp = v57.props.NextSelectionUp, 
                NextSelectionDown = v57.props.NextSelectionDown
            }, v74);
        end);
    end);
end;
v40 = l_withNavigation_0(v40);
local function v78(v75, _) --[[ Line: 371 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v17 (copy), l_DeviceOrientationMode_0 (copy)
    local l_DeviceOrientation_0 = v75.DeviceOrientation;
    return {
        topBarHeight = v17.getTopBarHeightAvatarScene(v75), 
        statusBarHeight = v75.TopBar.statusBarHeight, 
        isPortrait = l_DeviceOrientation_0 == l_DeviceOrientationMode_0.Portrait
    };
end;
local function v89(v79) --[[ Line: 381 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v23 (copy), v26 (copy)
    return {
        closeFocusedScreen = function(v80) --[[ Line: 383 ]] --[[ Name: closeFocusedScreen ]]
            -- upvalues: v79 (copy), v23 (ref)
            v79(v23(v80));
        end, 
        toggleTryOn = function(v81, v82, v83, v84, v85, v86, v87, v88) --[[ Line: 387 ]] --[[ Name: toggleTryOn ]]
            -- upvalues: v79 (copy), v26 (ref)
            v79(v26(v81, v82, v83, v84, v85, v86, v87, v88));
        end
    };
end;
v40 = l_RoactServices_0.connect({
    catalogAnalytics = v28, 
    appAnalytics = v20, 
    networking = v19
})(v40);
v40 = v27((v8.connect(v78, v89)(v40)));
return v6.forwardRef(function(v90, v91) --[[ Line: 422 ]]
    -- upvalues: v6 (copy), v40 (ref), v5 (copy)
    return v6.createElement(v40, v5.Dictionary.join(v90, {
        forwardRef = v91
    }));
end);