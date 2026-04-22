local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v5 = require(l_Modules_0.Common.Roact);
local v6 = require(l_Modules_0.Common.RoactRodux);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v8 = require(l_Modules_0.LuaApp.FitChildren);
local v9 = require(l_Modules_0.LuaApp.Components.FramePopOut);
local v10 = require(l_Modules_0.LuaApp.Components.FramePopup);
local v11 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v12 = v5.PureComponent:extend("FormBasedContextualMenu");
v12.defaultProps = {
    enablePopUpCancelButton = true
};
v12.render = function(v13) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_FormFactor_0 (copy), v9 (copy), v10 (copy), v8 (copy)
    local l_anchorSpaceSize_0 = v13.props.anchorSpaceSize;
    local l_anchorSpacePosition_0 = v13.props.anchorSpacePosition;
    local l_itemWidth_0 = v13.props.itemWidth;
    local v17 = v13.props[v5.Children];
    local l_screenSize_0 = v13.props.screenSize;
    local l_formFactor_0 = v13.props.formFactor;
    local l_closeContextualMenu_0 = v13.props.closeContextualMenu;
    local l_enablePopUpCancelButton_0 = v13.props.enablePopUpCancelButton;
    local v22 = l_formFactor_0 == l_FormFactor_0.WIDE and v9 or v10;
    return v5.createElement(v22, {
        onCancel = l_closeContextualMenu_0, 
        enableCancelButton = l_enablePopUpCancelButton_0, 
        itemWidth = l_itemWidth_0, 
        parentShape = {
            x = l_anchorSpacePosition_0.X, 
            y = l_anchorSpacePosition_0.Y, 
            width = l_anchorSpaceSize_0.X, 
            height = l_anchorSpaceSize_0.Y, 
            parentWidth = l_screenSize_0.X, 
            parentHeight = l_screenSize_0.Y
        }
    }, v5.createElement(v8.FitFrame, {
        BackgroundTransparency = 1, 
        fitAxis = v8.FitAxis.Height, 
        Size = UDim2.new(0, l_itemWidth_0, 0, 0), 
        Selectable = false
    }, v17));
end;
v12.didUpdate = function(v23, v24, _) --[[ Line: 64 ]] --[[ Name: didUpdate ]]
    local l_closeContextualMenu_1 = v23.props.closeContextualMenu;
    if v24.currentRoute ~= v23.props.currentRoute then
        l_closeContextualMenu_1();
    end;
end;
return (v6.connect(function(v27, _) --[[ Line: 72 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    return {
        formFactor = v27.FormFactor, 
        screenSize = v27.ScreenSize, 
        currentRoute = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v27) else v27.Navigation.history[#v27.Navigation.history]
    };
end, function(v29) --[[ Line: 80 ]]
    -- upvalues: v11 (copy)
    return {
        closeContextualMenu = function() --[[ Line: 82 ]] --[[ Name: closeContextualMenu ]]
            -- upvalues: v29 (copy), v11 (ref)
            v29(v11());
        end
    };
end)(v12));