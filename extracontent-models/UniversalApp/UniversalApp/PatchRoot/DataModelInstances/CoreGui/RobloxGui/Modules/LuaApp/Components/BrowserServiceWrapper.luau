local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.Common.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.Components.NativePageWrapper);
local v7 = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v8 = require(l_Modules_0.LuaApp.Enum.WebViewWindow);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagReplaceBrowserServiceWrapper);
local l_WebViewStateTracker_0 = require(l_CorePackages_0.Workspace.Packages.WebViewUtils).WebViewStateTracker;
local l_FFlagEnableWebViewStateTracker_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableWebViewStateTracker;
local v12 = v4.PureComponent:extend("BrowserServiceWrapper");
v12.didMount = function(v13) --[[ Line: 32 ]] --[[ Name: didMount ]]
    -- upvalues: l_BrowserService_0 (copy), l_FFlagEnableWebViewStateTracker_0 (copy), l_WebViewStateTracker_0 (copy), l_HttpService_0 (copy)
    v13.connections = {
        l_BrowserService_0.BrowserWindowClosed:Connect(function() --[[ Line: 34 ]]
            -- upvalues: l_FFlagEnableWebViewStateTracker_0 (ref), l_WebViewStateTracker_0 (ref), v13 (copy)
            if l_FFlagEnableWebViewStateTracker_0 then
                l_WebViewStateTracker_0.markClosed();
            end;
            if v13.props.windowClosedCallback then
                v13.props.windowClosedCallback();
            end;
        end), 
        l_BrowserService_0.JavaScriptCallback:Connect(function(v14) --[[ Line: 42 ]]
            -- upvalues: v13 (copy)
            if v13.props.javaScriptCallback then
                v13.props.javaScriptCallback(v14);
            end;
        end)
    };
    local v15 = l_HttpService_0:JSONEncode({
        command = "open", 
        url = v13.props.url, 
        title = v13.props.title, 
        visible = v13.props.webViewVisible, 
        modal = v13.props.modal, 
        isGenericWebview = v13.props.isGenericWebview, 
        enableOverlayReplacement = v13.props.enableOverlayReplacement
    });
    if l_FFlagEnableWebViewStateTracker_0 then
        l_WebViewStateTracker_0.markOpen(v13.props.url, v13.props.title, v13.props.webViewVisible);
    end;
    l_BrowserService_0:SendCommand(v15);
end;
v12.didUpdate = function(v16, v17, _) --[[ Line: 64 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnableWebViewStateTracker_0 (copy), l_WebViewStateTracker_0 (copy), l_BrowserService_0 (copy), l_HttpService_0 (copy)
    if v17.webViewVisible ~= v16.props.webViewVisible then
        local v19 = {
            command = "config", 
            visible = v16.props.webViewVisible == true
        };
        if v16.props.ignoreBackNavigationDisabled ~= true then
            v19.backNavigationDisabled = v16.props.backNavigationDisableCounter > 0;
        end;
        if l_FFlagEnableWebViewStateTracker_0 then
            l_WebViewStateTracker_0.updateMetadata(v16.props.url, v16.props.title, v16.props.webViewVisible);
        end;
        l_BrowserService_0:SendCommand(l_HttpService_0:JSONEncode(v19));
    end;
end;
v12.willUnmount = function(v20) --[[ Line: 82 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_BrowserService_0 (copy)
    for _, v22 in ipairs(v20.connections) do
        v22:Disconnect();
    end;
    l_BrowserService_0:CloseBrowserWindow();
end;
v12.render = function(v23) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v6 (copy)
    return v4.createElement(v6, {
        isVisible = v23.props.isVisible, 
        displayOrder = v23.props.displayOrder, 
        backNavigationHandledByParent = v23.props.backNavigationHandledByParent
    });
end;
v12 = v5.connect(function(v24, _) --[[ Line: 97 ]]
    return {
        backNavigationDisableCounter = v24.Navigation.backNavigationDisableCounter
    };
end)(v12);
if v9() then
    return function(v26) --[[ Line: 104 ]]
        -- upvalues: v4 (copy), v7 (copy), v8 (copy)
        return v4.createElement(v7, {
            url = v26.url, 
            title = v26.title, 
            isVisible = v26.webViewVisible, 
            windowType = if v26.modal then v8.Dialog else v8.Default, 
            windowCloseCallback = v26.windowClosedCallback, 
            javaScriptCallback = v26.javaScriptCallback, 
            overlayProps = {
                isVisible = v26.isVisible, 
                DisplayOrder = v26.displayOrder
            }
        });
    end;
else
    return v12;
end;