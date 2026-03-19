local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.ReactRoblox);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.Cryo);
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
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v20 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v21 = require(l_Modules_0.LuaApp.Components.LocaleRestriction.LocaleRestrictionModal);
local v22 = require(l_Modules_0.LuaApp.Models.UserModerationApi.RestrictionSource);
local v23 = v5.PureComponent:extend("LocaleRestrictionEventReceiver");
v23.render = function(v24) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v22 (copy), v4 (copy), v3 (copy), v5 (copy), v21 (copy), l_CoreGui_0 (copy)
    local v25 = v7.Dictionary.union(v24.props.globalGuiInset, {
        top = v24.props.statusBarHeight
    });
    if not v24.props.restrictionDetail or v24.props.restrictionDetail.source ~= v22.LocaleUnavailable then
        return nil;
    else
        return v4.createPortal({
            ModerationOverlayWrapper = v3.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ref = v24.props.forwardRef, 
                Selectable = false
            }, {
                ModerationOverlay = v5.createElement(v21, {
                    screenSize = v24.props.screenSize, 
                    globalGuiInset = v25
                })
            })
        }, l_CoreGui_0);
    end;
end;
v23 = v6.connect(function(v26, _) --[[ Line: 60 ]]
    return {
        screenSize = v26.ScreenSize, 
        restrictionDetail = v26.UserAccess and v26.UserAccess.restrictionDetail or nil, 
        globalGuiInset = v26.GlobalGuiInset, 
        statusBarHeight = v26.TopBar.statusBarHeight
    };
end)(v23);
v23 = l_RoactServices_0.connect({
    networking = v9, 
    guiService = l_AppGuiService_0, 
    eventIngestService = v20
})(v23);
local v28 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v30(v29) --[[ Line: 80 ]] --[[ Name: selectIsFocusable ]]
    -- upvalues: v22 (copy)
    return v29.UserAccess and v29.UserAccess.restrictionDetail and v29.UserAccess.restrictionDetail.source == v22.LocaleUnavailable;
end;
return function(v31) --[[ Line: 86 ]]
    -- upvalues: l_useSelector_0 (copy), v30 (copy), v3 (copy), l_useRegisterFocusNavigableSurface_0 (copy), l_useDeRegisterFocusNavigableSurface_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v16 (copy), v28 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_useUiModeInfo_0 (copy), v23 (ref), v7 (copy)
    local v32 = l_useSelector_0(v30);
    local v33, v34 = v3.useState(nil);
    local v35 = l_useRegisterFocusNavigableSurface_0();
    local v36 = l_useDeRegisterFocusNavigableSurface_0();
    local v37 = v33 and v32;
    v3.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v37 (copy), v35 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v33 (copy), v36 (copy)
        if v37 then
            v35(l_FocusNavigableSurfaceIdentifierEnum_0.ModerationOverlay, v33);
        end;
        return function() --[[ Line: 98 ]]
            -- upvalues: v36 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v33 (ref)
            v36(l_FocusNavigableSurfaceIdentifierEnum_0.ModerationOverlay, v33);
        end;
    end, {
        v37, 
        v33, 
        v35, 
        v36
    });
    local v39 = v3.useCallback(function(v38) --[[ Line: 103 ]]
        v38:cancel();
    end, {});
    local v40 = v16.useEventMap(v28, v34);
    local v41 = v16.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v39, nil, v40);
    local v42 = l_useUiModeInfo_0();
    return v3.createElement(v23, v7.Dictionary.join(v31, {
        forwardRef = v41, 
        uiMode = v42.uiMode
    }));
end;