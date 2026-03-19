local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local v7 = require(l_Modules_0.LuaApp.Enum.JavascriptHybrid);
local v8 = require(l_Modules_0.LuaApp.Util.ExecuteJavaScriptInWebView);
local v9 = require(l_Modules_0.LuaApp.Components.BrowserServiceWrapper);
local v10 = require(l_Modules_0.LuaApp.withLocalization);
local l_GetFFlagLuaAppEnableCredentialsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFFlagLuaAppEnableCredentialsProtocol;
local v12 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppRenderSettingsAsModal);
local l_GetFIntLuaAppCredentialsProtocolTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolTimeout;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v15 = game:DefineFastFlag("RequireDeviceBoundOnlyForFIDO2", false);
local v16 = v4.PureComponent:extend("SettingsNativeWrapper");
v16.defaultProps = {
    BrowserWrapperComponent = v9, 
    url = nil, 
    titleKey = nil, 
    isVisible = false, 
    windowClosedCallback = nil, 
    displayOrder = nil
};
local function _(v17) --[[ Line: 34 ]] --[[ Name: getFeatureStringFromHybridEvent ]]
    -- upvalues: v7 (copy)
    if v17.moduleID == v7.Module.Navigation and v17.functionName == v7.Function.navigateToFeature and v17.params and v17.params.params then
        return v17.params.params.feature;
    else
        return nil;
    end;
end;
v16.render = function(v19) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v4 (copy), v12 (copy), l_HttpService_0 (copy), l_GetFFlagLuaAppEnableCredentialsProtocol_0 (copy), v7 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), v15 (copy), v8 (copy), l_GetFIntLuaAppCredentialsProtocolTimeout_0 (copy), l_Logging_0 (copy)
    return v10({
        title = v19.props.titleKey
    })(function(v20) --[[ Line: 47 ]]
        -- upvalues: v4 (ref), v19 (copy), v12 (ref), l_HttpService_0 (ref), l_GetFFlagLuaAppEnableCredentialsProtocol_0 (ref), v7 (ref), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), v15 (ref), v8 (ref), l_GetFIntLuaAppCredentialsProtocolTimeout_0 (ref), l_Logging_0 (ref)
        return v4.createElement(v19.props.BrowserWrapperComponent, {
            isVisible = v19.props.isVisible, 
            modal = not v12(), 
            title = v20.title, 
            webViewVisible = true, 
            displayOrder = v19.props.displayOrder, 
            url = v19.props.url, 
            isGenericWebview = true, 
            windowClosedCallback = v19.props.windowClosedCallback, 
            javaScriptCallback = function(v21) --[[ Line: 57 ]] --[[ Name: javaScriptCallback ]]
                -- upvalues: l_HttpService_0 (ref), l_GetFFlagLuaAppEnableCredentialsProtocol_0 (ref), v7 (ref), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), v15 (ref), v8 (ref), l_GetFIntLuaAppCredentialsProtocolTimeout_0 (ref), l_Logging_0 (ref)
                local v22 = l_HttpService_0:JSONDecode(v21);
                if l_GetFFlagLuaAppEnableCredentialsProtocol_0() and (if v22.moduleID == v7.Module.Navigation and v22.functionName == v7.Function.navigateToFeature and v22.params and v22.params.params then v22.params.params.feature else nil) == v7.Feature.CredentialsProtocolAvailable then
                    l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v23) --[[ Line: 70 ]]
                        -- upvalues: v15 (ref), v8 (ref), v22 (copy)
                        local v24 = v23.isAvailable or false;
                        if v15 then
                            v24 = v24 and v23.supportsDeviceBoundOnly or false;
                        end;
                        v8.Execute(v22.params.params.data.callId, (tostring(v24)));
                    end):catch(function() --[[ Line: 78 ]]
                        -- upvalues: v8 (ref), v22 (copy)
                        v8.Execute(v22.params.params.data.callId, "false");
                    end);
                    return;
                elseif l_GetFFlagLuaAppEnableCredentialsProtocol_0() and (if v22.moduleID == v7.Module.Navigation and v22.functionName == v7.Function.navigateToFeature and v22.params and v22.params.params then v22.params.params.feature else nil) == v7.Feature.RegisterCredentials then
                    l_default_0:registerCredentials(l_default_0.CredentialsTypes.FIDO2, v22.params.params.data.creationOptionsJSON, l_GetFIntLuaAppCredentialsProtocolTimeout_0()):andThen(function(v25) --[[ Line: 94 ]]
                        -- upvalues: l_Logging_0 (ref), l_HttpService_0 (ref), v8 (ref), v22 (copy)
                        if v25 ~= nil then
                            l_Logging_0.warn("Executing javascript on webview to return RegisterCredentialsResponse");
                            local v26 = l_HttpService_0:JSONEncode(v25);
                            v8.Execute(v22.params.params.data.callId, v26);
                        end;
                    end):catch(function() --[[ Line: 101 ]]
                        -- upvalues: v8 (ref), v22 (copy)
                        v8.Execute(v22.params.params.data.callId, "");
                    end);
                    return;
                elseif l_GetFFlagLuaAppEnableCredentialsProtocol_0() and (if v22.moduleID == v7.Module.Navigation and v22.functionName == v7.Function.navigateToFeature and v22.params and v22.params.params then v22.params.params.feature else nil) == v7.Feature.GetCredentials then
                    l_default_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, v22.params.params.data.authenticationOptionsJSON, l_GetFIntLuaAppCredentialsProtocolTimeout_0()):andThen(function(v27) --[[ Line: 117 ]]
                        -- upvalues: l_Logging_0 (ref), l_HttpService_0 (ref), v8 (ref), v22 (copy)
                        if v27 ~= nil then
                            l_Logging_0.warn("Executing javascript on webview to return GetCredentialsResponse");
                            local v28 = l_HttpService_0:JSONEncode(v27);
                            v8.Execute(v22.params.params.data.callId, v28);
                        end;
                    end):catch(function() --[[ Line: 124 ]]
                        -- upvalues: v8 (ref), v22 (copy)
                        v8.Execute(v22.params.params.data.callId, "");
                    end);
                    return;
                else
                    return;
                end;
            end
        });
    end);
end;
return (v5.withNavigation(v16));