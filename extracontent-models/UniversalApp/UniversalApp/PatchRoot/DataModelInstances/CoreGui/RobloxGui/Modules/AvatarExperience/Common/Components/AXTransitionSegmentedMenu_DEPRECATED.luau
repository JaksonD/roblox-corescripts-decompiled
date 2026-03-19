local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactNavigation);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Dash);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_SegmentedControl_0 = v8.App.Control.SegmentedControl;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v14.Enums.AvatarScreen;
local l_AvatarRoute_0 = v14.AvatarRoute.AvatarRoute;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v18 = v2.PureComponent:extend("AXTransitionSegmentedMenu");
v18.validateProps = v6.strictInterface({
    formFactor = v6.string, 
    isCompactView = v6.boolean, 
    isSearching = v6.boolean, 
    setVisible = v7.isCallable, 
    cancelSearch = v7.isCallable, 
    activateSearch = v7.isCallable, 
    buttonRef = v6.optional(v6.table), 
    navigation = v6.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    topBarHeight = v6.number, 
    avatarAnalytics = v6.table, 
    catalogAnalytics = v6.table, 
    [v2.Ref] = v6.optional(v6.table)
});
v18.getOpaquePage = function(v19) --[[ Line: 61 ]] --[[ Name: getOpaquePage ]]
    return v19.props.avatarRoute.opaque.name;
end;
v18.init = function(v20) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    v20:setState({
        segmentedControlWidth = 234
    });
    v20.goToAvatarEditorPage = function() --[[ Line: 70 ]]
        -- upvalues: v20 (copy), l_AvatarScreen_0 (ref)
        if v20:getOpaquePage() ~= l_AvatarScreen_0.AvatarEditor then
            v20.props.navigation.navigate(l_AvatarScreen_0.AvatarEditor);
            v20.props.avatarAnalytics.catalogToAvatarButton();
        end;
    end;
    v20.goToCatalogPage = function() --[[ Line: 78 ]]
        -- upvalues: v20 (copy), l_AvatarScreen_0 (ref)
        if v20:getOpaquePage() ~= l_AvatarScreen_0.Catalog then
            v20.props.navigation.navigate(l_AvatarScreen_0.Catalog);
            v20.props.catalogAnalytics.avatarToCatalogButton();
        end;
    end;
    v20.onTabActivated = function(v21) --[[ Line: 86 ]]
        -- upvalues: v20 (copy)
        if v21 == 1 then
            v20.goToCatalogPage();
            return;
        else
            if v21 == 2 then
                v20.goToAvatarEditorPage();
            end;
            return;
        end;
    end;
end;
v18.render = function(v22) --[[ Line: 95 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        customizeText = "Feature.Catalog.Action.Customize", 
        shopText = "Feature.Avatar.Action.Marketplace"
    })(function(v23) --[[ Line: 99 ]]
        -- upvalues: v22 (copy)
        return v22:renderWithProviders(v23);
    end);
end;
v18.renderWithProviders = function(v24, v25) --[[ Line: 104 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), v5 (copy), l_SegmentedControl_0 (copy), l_AvatarScreen_0 (copy)
    local v27 = {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = function(v26) --[[ Line: 108 ]]
            -- upvalues: v24 (copy)
            v24:absoluteSizeChanged(v26);
        end
    };
    local v28 = v24.props.formFactor == "WIDE";
    return v2.createElement(v5.Focusable.Frame, v27, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        SegmentedControl = v2.createElement(l_SegmentedControl_0, {
            width = UDim.new(0, v24.state.segmentedControlWidth), 
            maxWidth = not v28 and 234 or nil, 
            selectedTabIndex = v24:getOpaquePage() == l_AvatarScreen_0.Catalog and 1 or 2, 
            onTabActivated = v24.onTabActivated, 
            tabs = {
                {
                    tabName = v25.shopText
                }, 
                {
                    tabName = v25.customizeText
                }
            }
        })
    });
end;
v18.absoluteSizeChanged = function(v29, v30) --[[ Line: 141 ]] --[[ Name: absoluteSizeChanged ]]
    v29:setState({
        segmentedControlWidth = v30.AbsoluteSize.X >= 234 and 234 or 224
    });
end;
v18 = v3.connect(function(v31, _) --[[ Line: 147 ]]
    return {
        topBarHeight = v31.TopBar.topBarHeight
    };
end, nil)(v18);
v18 = l_RoactServices_0.connect({
    avatarAnalytics = v12, 
    catalogAnalytics = v13
})(v18);
return (v17((v4.withNavigation(v18))));