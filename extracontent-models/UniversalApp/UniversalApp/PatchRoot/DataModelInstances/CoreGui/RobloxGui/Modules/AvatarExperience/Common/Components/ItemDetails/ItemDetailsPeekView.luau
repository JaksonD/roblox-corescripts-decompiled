local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v4.Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.Constants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v13 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.itemdetails");
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v15 = l_FFlagAXMigrateAXToGlobalAutofocus_0 and game:DefineFastFlag("AXMigrateItemDetailsPeekViewToAutoFocus", false);
local v16 = l_Images_0["icons/navigation/close"];
local v17 = v3.PureComponent:extend("ItemDetailsPeekView");
v17.init = function(v18) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_AvatarScreen_0 (copy), v13 (copy), l_PeekViewState_0 (copy)
    local v19, v20 = v3.createBinding(UDim2.new(0, 0, 0, 0));
    v18.closeButtonPosition = v19;
    v18.updateCloseButtonPosition = v20;
    v19, v20 = v3.createBinding(false);
    v18.closeButtonVisible = v19;
    v18.updateCloseButtonVisible = v20;
    v19 = v18.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
    local v21;
    v20, v21 = v3.createBinding(v19);
    v18.topBarNavVisible = v20;
    v18.updateTopBarNavVisible = v21;
    v21 = v18.props.mountAsFullView and 1 or 0;
    local v22, v23 = v3.createBinding(v21);
    v18.briefViewPercentBinding = v22;
    v18.updateBriefViewPercentBinding = v23;
    v18.desktopScrollingEnabledBinding = v18.briefViewPercentBinding:map(function(v24) --[[ Line: 61 ]]
        return v24 == 1;
    end);
    v18.peekViewStateChanged = function(v25, v26) --[[ Line: 65 ]]
        -- upvalues: v13 (ref), v18 (copy), l_PeekViewState_0 (ref), l_AvatarScreen_0 (ref)
        v13:debug("peekViewStateChanged: {} -> {}", v26, v25);
        v18:setState({});
        local l_analytics_0 = v18.props.analytics;
        local l_routeName_0 = v18.props.navigation.state.routeName;
        local l_itemId_0 = v18.props.itemId;
        local l_itemType_0 = v18.props.itemType;
        if v25 == l_PeekViewState_0.Closed or v25 == l_PeekViewState_0.Hidden then
            if l_routeName_0 == l_AvatarScreen_0.TryOnItem then
                v18.props.closeFocusedScreen(v18.props.navigation);
            else
                v18.props.closeAllPeekViews(v18.props.navigation);
            end;
            l_analytics_0.closeItemDetailPage(l_itemId_0, l_itemType_0);
        elseif v25 == l_PeekViewState_0.Full then
            l_analytics_0.expandItemDetailPage(l_itemId_0, l_itemType_0);
        end;
        v18.props.setPeekViewState(v25);
    end;
    v18.briefToFullTransitionPercent = function(v31) --[[ Line: 90 ]]
        -- upvalues: v18 (copy), l_AvatarScreen_0 (ref)
        if v18.props.navigation.state.routeName ~= l_AvatarScreen_0.TryOnItem then
            if v31 > 0.8 then
                v18.updateTopBarNavVisible(true);
            else
                v18.updateTopBarNavVisible(false);
            end;
            if v31 > 0.95 then
                v18.updateCloseButtonVisible(false);
            else
                v18.updateCloseButtonVisible(true);
            end;
        end;
        v18.updateBriefViewPercentBinding(v31);
    end;
    v18.peekHeaderPositionYChange = function(v32) --[[ Line: 107 ]]
        -- upvalues: v18 (copy)
        local v33 = -(math.floor(v32 + 0.5) + 18 + 4);
        v18.updateCloseButtonPosition(UDim2.new(0, 15, 1, v33));
    end;
end;
v17.render = function(v34) --[[ Line: 113 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v35) --[[ Line: 114 ]]
        -- upvalues: v34 (copy)
        return v34:renderWith(v35);
    end);
end;
v17.renderWith = function(v36, v37) --[[ Line: 119 ]] --[[ Name: renderWith ]]
    -- upvalues: v8 (copy), l_PeekViewState_0 (copy), v3 (copy), l_ImageSetButton_0 (copy), v16 (copy), l_PeekView_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v12 (copy)
    local l_Theme_0 = v37.Theme;
    local v39 = v36.props.lastInputGroup == v8.InputType.MouseAndKeyboard;
    local l_isTryOnPage_0 = v36.props.isTryOnPage;
    local l_viewPosition_0 = v36.props.viewPosition;
    local l_viewSize_0 = v36.props.viewSize;
    local l_briefViewHeight_0 = v36.props.briefViewHeight;
    local l_showDropShadow_0 = v36.props.showDropShadow;
    local l_mountAnimation_0 = v36.props.mountAnimation;
    local l_mountAsFullView_0 = v36.props.mountAsFullView;
    local l_topBarHeight_0 = v36.props.topBarHeight;
    local l_fromProfile_0 = v36.props.fromProfile;
    local l_peekViewFullViewEnabled_0 = v36.props.peekViewFullViewEnabled;
    local l_peekViewState_0 = v36.props.peekViewState;
    local v51 = l_fromProfile_0 and 6 or 0;
    local v52 = UDim2.fromOffset(0, l_topBarHeight_0 - v51);
    local l_renderContent_0 = v36.props.renderContent;
    local l_renderTopBar_0 = v36.props.renderTopBar;
    local l_renderBottomBar_0 = v36.props.renderBottomBar;
    local v56 = true;
    if l_peekViewState_0 ~= l_PeekViewState_0.Full then
        v56 = true;
        if l_peekViewState_0 ~= l_PeekViewState_0.Extended then
            v56 = v39 or l_isTryOnPage_0;
        end;
    end;
    local l_desktopScrollingEnabledBinding_0 = v36.desktopScrollingEnabledBinding;
    local v58 = nil;
    if not l_peekViewFullViewEnabled_0 then
        v58 = Enum.ElasticBehavior.Never;
    end;
    local v60 = v36.briefViewPercentBinding:map(function(v59) --[[ Line: 157 ]]
        -- upvalues: l_Theme_0 (copy)
        return 1 - (1 - l_Theme_0.Overlay.Transparency) * v59;
    end);
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = l_viewSize_0, 
        Position = l_viewPosition_0
    }, {
        Overlay = v3.createElement("Frame", {
            BackgroundTransparency = l_isTryOnPage_0 and 1 or v60, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 1
        }), 
        TopBar = if v56 then l_renderTopBar_0() else nil, 
        CloseButton = v39 and not l_isTryOnPage_0 and v3.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            Position = v36.closeButtonPosition, 
            Size = UDim2.new(0, 36, 0, 36), 
            Image = v16, 
            ImageColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            Visible = v36.closeButtonVisible, 
            [v3.Event.Activated] = v36.props.closeBriefView
        }), 
        PeekViewContainer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Position = v52, 
            Size = UDim2.new(1, 0, 1, -v52.Y.Offset), 
            ZIndex = 2
        }, {
            PeekView = v3.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0, l_briefViewHeight_0), 
                viewStateChanged = v36.peekViewStateChanged, 
                mountAnimation = l_mountAnimation_0, 
                mountAsFullView = l_mountAsFullView_0, 
                canDragFullViewToBrief = not l_fromProfile_0, 
                showDraggerInClosedState = false, 
                returnToFullView = true, 
                thumbstickScrollEnabled = true, 
                shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                bottomDockedContainerHeight = l_briefViewHeight_0, 
                bottomDockedContainerContent = {
                    ActionBarContainer = l_renderBottomBar_0()
                }, 
                showDropShadow = l_showDropShadow_0, 
                elasticBehavior = v58, 
                backgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                backgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                briefToFullTransitionPercent = v36.briefToFullTransitionPercent, 
                peekHeaderClose = l_fromProfile_0 or false, 
                peekHeaderPositionYChange = v36.peekHeaderPositionYChange, 
                isScrollingEnabled = if v12() then v36.props.scrollingEnabled and (not v39 or l_desktopScrollingEnabledBinding_0) else not v39 or l_desktopScrollingEnabledBinding_0, 
                contentFrameRef = v36.props.contentFrameRef, 
                peekViewState = l_peekViewState_0, 
                customBackground = l_Theme_0.BackgroundDefault.Color
            }, {
                ItemDetails = l_renderContent_0()
            })
        })
    });
end;
local function _(v61) --[[ Line: 232 ]] --[[ Name: isPeekViewExpanded ]]
    -- upvalues: l_PeekViewState_0 (copy)
    local l_peekViewState_1 = v61.peekViewState;
    local v63 = true;
    if l_peekViewState_1 ~= l_PeekViewState_0.Full then
        v63 = l_peekViewState_1 == l_PeekViewState_0.Extended;
    end;
    return v63;
end;
v17.didUpdate = function(v65, v66, _) --[[ Line: 237 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_PeekViewState_0 (copy), l_AvatarScreen_0 (copy), v15 (copy), v8 (copy)
    local l_current_0 = v65.props.avatarRoute.current;
    local l_name_0 = l_current_0.name;
    local l_key_0 = l_current_0.key;
    local l_key_1 = v65.props.navigation.state.key;
    if v65.props.peekViewShowing then
        local l_peekViewState_2 = v65.props.peekViewState;
        local v73 = true;
        if l_peekViewState_2 ~= l_PeekViewState_0.Full then
            v73 = l_peekViewState_2 == l_PeekViewState_0.Extended;
        end;
        if v65.props.itemDetailsExpanded ~= v73 then
            v65.props.setItemDetailsExpanded(v73);
        end;
    elseif v66.peekViewShowing and l_name_0 ~= l_AvatarScreen_0.ItemDetails and v65.props.itemDetailsExpanded then
        v65.props.setItemDetailsExpanded(false);
    end;
    if not v15 and v65.props.lastInputGroup == v8.InputType.Gamepad then
        local l_peekViewState_3 = v65.props.peekViewState;
        local v75 = true;
        if l_peekViewState_3 ~= l_PeekViewState_0.Full then
            v75 = l_peekViewState_3 == l_PeekViewState_0.Extended;
        end;
        l_peekViewState_3 = v66.peekViewState;
        local v76 = true;
        if l_peekViewState_3 ~= l_PeekViewState_0.Full then
            v76 = l_peekViewState_3 == l_PeekViewState_0.Extended;
        end;
        if l_key_0 == l_key_1 then
            if v75 and not v76 then
                v65.props.focusController.moveFocusTo(v65.props.contentFrameRef);
                return;
            elseif not v75 and v76 then
                v65.props.focusController.moveFocusTo(v65.props.actionBarContainerRef);
            end;
        end;
    end;
end;
v17.didMount = function(v77) --[[ Line: 274 ]] --[[ Name: didMount ]]
    -- upvalues: l_PeekViewState_0 (copy)
    if not v77.props.mountAnimation then
        v77.peekHeaderPositionYChange(v77.props.briefViewHeight + 25);
    end;
    if v77.props.peekViewShowing then
        local l_peekViewState_4 = v77.props.peekViewState;
        local v79 = true;
        if l_peekViewState_4 ~= l_PeekViewState_0.Full then
            v79 = l_peekViewState_4 == l_PeekViewState_0.Extended;
        end;
        if v77.props.itemDetailsExpanded ~= v79 then
            v77.props.setItemDetailsExpanded(v79);
        end;
    end;
end;
v17.willUnmount = function(v80) --[[ Line: 287 ]] --[[ Name: willUnmount ]]
    if v80.props.peekViewShowing and v80.props.itemDetailsExpanded then
        v80.props.setItemDetailsExpanded(false);
    end;
end;
return v17;