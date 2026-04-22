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
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v14 = v4.PureComponent:extend("BrowserServiceWrapper");
v14.didMount = function(v15) --[[ Line: 34 ]] --[[ Name: didMount ]]
    -- upvalues: l_BrowserService_0 (copy), l_FFlagEnableWebViewStateTracker_0 (copy), l_WebViewStateTracker_0 (copy), l_HttpService_0 (copy)
    v15.connections = {
        l_BrowserService_0.BrowserWindowClosed:Connect(function() --[[ Line: 36 ]]
            -- upvalues: l_FFlagEnableWebViewStateTracker_0 (ref), l_WebViewStateTracker_0 (ref), v15 (copy)
            if l_FFlagEnableWebViewStateTracker_0 then
                l_WebViewStateTracker_0.markClosed();
            end;
            if v15.props.windowClosedCallback then
                v15.props.windowClosedCallback();
            end;
        end), 
        l_BrowserService_0.JavaScriptCallback:Connect(function(v16) --[[ Line: 44 ]]
            -- upvalues: v15 (copy)
            if v15.props.javaScriptCallback then
                v15.props.javaScriptCallback(v16);
            end;
        end)
    };
    local v17 = l_HttpService_0:JSONEncode({
        command = "open", 
        url = v15.props.url, 
        title = v15.props.title, 
        visible = v15.props.webViewVisible, 
        modal = v15.props.modal, 
        isGenericWebview = v15.props.isGenericWebview, 
        enableOverlayReplacement = v15.props.enableOverlayReplacement
    });
    if l_FFlagEnableWebViewStateTracker_0 then
        l_WebViewStateTracker_0.markOpen(v15.props.url, v15.props.title, v15.props.webViewVisible);
    end;
    l_BrowserService_0:SendCommand(v17);
end;
v14.didUpdate = function(v18, v19, _) --[[ Line: 66 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnableWebViewStateTracker_0 (copy), l_WebViewStateTracker_0 (copy), l_BrowserService_0 (copy), l_HttpService_0 (copy)
    if v19.webViewVisible ~= v18.props.webViewVisible then
        local v21 = {
            command = "config", 
            visible = v18.props.webViewVisible == true
        };
        if v18.props.ignoreBackNavigationDisabled ~= true then
            v21.backNavigationDisabled = v18.props.backNavigationDisableCounter > 0;
        end;
        if l_FFlagEnableWebViewStateTracker_0 then
            l_WebViewStateTracker_0.updateMetadata(v18.props.url, v18.props.title, v18.props.webViewVisible);
        end;
        l_BrowserService_0:SendCommand(l_HttpService_0:JSONEncode(v21));
    end;
end;
v14.willUnmount = function(v22) --[[ Line: 84 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_BrowserService_0 (copy)
    for _, v24 in ipairs(v22.connections) do
        v24:Disconnect();
    end;
    l_BrowserService_0:CloseBrowserWindow();
end;
v14.render = function(v25) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v6 (copy)
    return v4.createElement(v6, {
        isVisible = v25.props.isVisible, 
        displayOrder = v25.props.displayOrder, 
        backNavigationHandledByParent = v25.props.backNavigationHandledByParent
    });
end;
v14 = v5.connect(function(v26, _) --[[ Line: 99 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    return {
        backNavigationDisableCounter = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectBackNavigationDisableCounter(v26) else v26.Navigation.backNavigationDisableCounter
    };
end)(v14);
if v9() then
    return function(v28) --[[ Line: 108 ]]
        -- upvalues: v4 (copy), v7 (copy), v8 (copy)
        return v4.createElement(v7, {
            url = v28.url, 
            title = v28.title, 
            isVisible = v28.webViewVisible, 
            windowType = if v28.modal then v8.Dialog else v8.Default, 
            windowCloseCallback = v28.windowClosedCallback, 
            javaScriptCallback = v28.javaScriptCallback, 
            overlayProps = {
                isVisible = v28.isVisible, 
                DisplayOrder = v28.displayOrder
            }
        });
    end;
else
    return v14;
end;