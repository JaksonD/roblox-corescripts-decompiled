local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.ScreenshotFlowStepHandler);
local v3 = v1.PureComponent:extend("ScreenshotFlowStepHandlerContainer");
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v5 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusRoot_0 = v5.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v5.FocusNavigableSurfaceIdentifierEnum;
v3.render = function(v8) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_CoreScriptsRootProvider_0 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v2 (copy)
    return v1.createElement(l_CoreScriptsRootProvider_0, {}, {
        FocusNavigationCoreScriptsWrapper = v1.createElement(l_FocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
            isIsolated = true, 
            isAutoFocusRoot = true
        }, {
            ScreenshotFlowStepHandlerContainer = v1.createElement(v2, v8.props)
        })
    });
end;
return v3;