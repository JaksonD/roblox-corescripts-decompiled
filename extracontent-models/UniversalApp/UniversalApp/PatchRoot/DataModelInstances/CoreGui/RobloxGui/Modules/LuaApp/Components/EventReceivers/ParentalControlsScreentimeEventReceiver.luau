local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.ReactRoblox);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v11 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceRegistry_0 = v11.FocusNavigableSurfaceRegistry;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v11.FocusNavigableSurfaceIdentifierEnum;
local v16 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = v11.FocusNavigationEventNameEnum;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v19 = require(l_Modules_0.LuaApp.Components.Screentime.ScreentimeRestrictionModal);
local v20 = require(l_Modules_0.LuaApp.Models.UserModerationApi.RestrictionSource);
local v21 = v7.PureComponent:extend("ParentalControlsScreentimeEventReceiver");
v21.render = function(v22) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v20 (copy), v4 (copy), v3 (copy), v19 (copy), l_CoreGui_0 (copy)
    local v23 = v6.Dictionary.union(v22.props.globalGuiInset, {
        top = v22.props.statusBarHeight
    });
    if not v22.props.restrictionDetail or v22.props.restrictionDetail.source ~= v20.Screentime then
        return nil;
    else
        return v4.createPortal({
            ModerationOverlayWrapper = v3.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ref = v22.props.forwardRef, 
                Selectable = false
            }, {
                ModerationOverlay = v3.createElement(v19, {
                    screenSize = v22.props.screenSize, 
                    globalGuiInset = v23
                })
            })
        }, l_CoreGui_0);
    end;
end;
v21 = v5.connect(function(v24, _) --[[ Line: 51 ]]
    return {
        screenSize = v24.ScreenSize, 
        restrictionDetail = v24.UserAccess and v24.UserAccess.restrictionDetail or nil, 
        globalGuiInset = v24.GlobalGuiInset, 
        statusBarHeight = v24.TopBar.statusBarHeight
    };
end)(v21);
v21 = l_RoactServices_0.connect({
    networking = v9, 
    guiService = l_AppGuiService_0
})(v21);
local v26 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v28(v27) --[[ Line: 70 ]] --[[ Name: selectIsFocusable ]]
    -- upvalues: v20 (copy)
    return v27.UserAccess and v27.UserAccess.restrictionDetail and v27.UserAccess.restrictionDetail.source == v20.Screentime;
end;
return function(v29) --[[ Line: 76 ]]
    -- upvalues: l_useSelector_0 (copy), v28 (copy), v3 (copy), l_useRegisterFocusNavigableSurface_0 (copy), l_useDeRegisterFocusNavigableSurface_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v16 (copy), v26 (copy), l_FocusNavigationEventNameEnum_0 (copy), v21 (ref), v6 (copy)
    local v30 = l_useSelector_0(v28);
    local v31, v32 = v3.useState(nil);
    local v33 = l_useRegisterFocusNavigableSurface_0();
    local v34 = l_useDeRegisterFocusNavigableSurface_0();
    local v35 = v31 and v30;
    v3.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: v35 (copy), v33 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v31 (copy), v34 (copy)
        if v35 then
            v33(l_FocusNavigableSurfaceIdentifierEnum_0.ModerationOverlay, v31);
        end;
        return function() --[[ Line: 88 ]]
            -- upvalues: v34 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v31 (ref)
            v34(l_FocusNavigableSurfaceIdentifierEnum_0.ModerationOverlay, v31);
        end;
    end, {
        v35, 
        v31, 
        v33, 
        v34
    });
    local v37 = v3.useCallback(function(v36) --[[ Line: 93 ]]
        v36:cancel();
    end, {});
    local v38 = v16.useEventMap(v26, v32);
    local v39 = v16.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v37, nil, v38);
    return v3.createElement(v21, v6.Dictionary.join(v29, {
        forwardRef = v39
    }));
end;