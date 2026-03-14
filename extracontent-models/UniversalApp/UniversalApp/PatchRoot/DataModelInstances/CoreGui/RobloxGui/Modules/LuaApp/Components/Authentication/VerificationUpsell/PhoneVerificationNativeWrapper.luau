local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Modules_0.LuaApp.Http.Url);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactNavigation);
local v6 = require(l_Modules_0.LuaApp.Enum.JavascriptHybrid);
local v7 = require(l_Modules_0.LuaApp.Components.BrowserServiceWrapper);
local l_GetFFlagPhoneVerificationWebviewShouldBeFullscreen_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPhoneVerificationWebviewShouldBeFullscreen;
local v9 = v4.PureComponent:extend("PhoneVerificationNativeWrapper");
v9.defaultProps = {
    BrowserWrapperComponent = v7, 
    closeCallback = nil
};
local function _(v10) --[[ Line: 23 ]] --[[ Name: getFeatureStringFromHybridEvent ]]
    -- upvalues: v6 (copy)
    if v10.moduleID == v6.Module.Navigation and v10.functionName == v6.Function.navigateToFeature and v10.params and v10.params.params then
        return v10.params.params.feature;
    else
        return nil;
    end;
end;
local function _(v12) --[[ Line: 48 ]] --[[ Name: isCloseContactMethodUpsellWebviewEvent ]]
    -- upvalues: v6 (copy)
    return (if v12.moduleID == v6.Module.Navigation and v12.functionName == v6.Function.navigateToFeature and v12.params and v12.params.params then v12.params.params.feature else nil) == v6.Feature.CloseContactMethodUpsellWebview;
end;
local function _(v14) --[[ Line: 53 ]] --[[ Name: isCompletedContactMethodUpsellWebviewEvent ]]
    -- upvalues: v6 (copy)
    return (if v14.moduleID == v6.Module.Navigation and v14.functionName == v6.Function.navigateToFeature and v14.params and v14.params.params then v14.params.params.feature else nil) == v6.Feature.CompletedContactMethodUpsellWebview;
end;
v9.init = function(v16) --[[ Line: 59 ]] --[[ Name: init ]]
    v16.isPhoneVerificationSuccessful = false;
end;
v9.render = function(v17) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_GetFFlagPhoneVerificationWebviewShouldBeFullscreen_0 (copy), v3 (copy), l_HttpService_0 (copy), v6 (copy)
    return v4.createElement(v17.props.BrowserWrapperComponent, {
        isVisible = true, 
        modal = not l_GetFFlagPhoneVerificationWebviewShouldBeFullscreen_0(), 
        webViewVisible = true, 
        displayOrder = v17.props.displayOrder, 
        url = v3.BASE_URL .. "phone-verification", 
        isGenericWebview = true, 
        javaScriptCallback = function(v18) --[[ Line: 71 ]] --[[ Name: javaScriptCallback ]]
            -- upvalues: l_HttpService_0 (ref), v6 (ref), v17 (copy)
            local v19 = l_HttpService_0:JSONDecode(v18);
            if (if v19.moduleID == v6.Module.Navigation and v19.functionName == v6.Function.navigateToFeature and v19.params and v19.params.params then v19.params.params.feature else nil) == v6.Feature.CompletedContactMethodUpsellWebview then
                v17.isPhoneVerificationSuccessful = true;
                if v17.props.onSuccessCallback then
                    v17.props.onSuccessCallback();
                    return;
                end;
            elseif (if v19.moduleID == v6.Module.Navigation and v19.functionName == v6.Function.navigateToFeature and v19.params and v19.params.params then v19.params.params.feature else nil) == v6.Feature.CloseContactMethodUpsellWebview then
                v17.props.navigation.goBack();
            end;
        end
    });
end;
v9.willUnmount = function(v20) --[[ Line: 85 ]] --[[ Name: willUnmount ]]
    if v20.props.closeCallback then
        v20.props.closeCallback(v20.isPhoneVerificationSuccessful);
    end;
end;
return (v5.withNavigation(v9));