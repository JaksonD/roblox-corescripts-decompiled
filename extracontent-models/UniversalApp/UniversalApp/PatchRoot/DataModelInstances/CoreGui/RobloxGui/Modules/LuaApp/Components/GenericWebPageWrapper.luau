local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v5 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v6 = require(l_Modules_0.LuaApp.mapTransitionAnimationToNativeString);
local v7 = require(l_Modules_0.LuaApp.withLocalization);
local v8 = require(l_Modules_0.LuaApp.Components.NativePageWrapper);
local v9 = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local l_WebViewStateTracker_0 = require(l_CorePackages_0.Workspace.Packages.WebViewUtils).WebViewStateTracker;
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
local l_FFlagEnableWebViewStateTracker_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableWebViewStateTracker;
local v13 = game:DefineFastFlag("EnableWebViewStateTrackerInGenericWebPageWrapper", false);
local function v29(v14) --[[ Line: 35 ]] --[[ Name: GenericWebPageWrapper ]]
    -- upvalues: v6 (copy), v5 (copy), l_FFlagEnableWebViewStateTracker_0 (copy), v13 (copy), v1 (copy), l_WebViewStateTracker_0 (copy), l_HttpService_0 (copy), v8 (copy), v4 (copy), v7 (copy)
    local l_isVisible_0 = v14.isVisible;
    local l_DisplayOrder_0 = v14.DisplayOrder;
    local l_url_0 = v14.url;
    local l_titleKey_0 = v14.titleKey;
    local l_title_0 = v14.title;
    local l_searchParams_0 = v14.searchParams;
    local l_transitionAnimation_0 = v14.transitionAnimation;
    local v22 = v6(l_transitionAnimation_0);
    local v23 = true;
    if l_transitionAnimation_0 ~= nil then
        v23 = true;
        if l_transitionAnimation_0 ~= v5.None then
            v23 = v22 ~= nil;
        end;
    end;
    assert(v23, string.format("Unhandled transition animation: %q", (tostring(l_transitionAnimation_0))));
    local v24 = l_transitionAnimation_0 ~= v5.None;
    if l_FFlagEnableWebViewStateTracker_0 and v13 then
        v1.useEffect(function() --[[ Line: 54 ]]
            -- upvalues: l_WebViewStateTracker_0 (ref), l_url_0 (copy), l_title_0 (copy), l_isVisible_0 (copy)
            l_WebViewStateTracker_0.markOpen(l_url_0, l_title_0, l_isVisible_0);
        end, {});
        v1.useEffect(function() --[[ Line: 57 ]]
            -- upvalues: l_WebViewStateTracker_0 (ref), l_url_0 (copy), l_title_0 (copy), l_isVisible_0 (copy)
            l_WebViewStateTracker_0.updateMetadata(l_url_0, l_title_0, l_isVisible_0);
        end, {
            l_url_0, 
            l_title_0, 
            l_isVisible_0
        });
    end;
    v23 = function() --[[ Line: 62 ]]
        -- upvalues: l_WebViewStateTracker_0 (ref), v14 (copy)
        l_WebViewStateTracker_0.markClosed();
        if v14.onClose then
            v14.onClose();
        end;
    end;
    local function v27(v25) --[[ Line: 69 ]]
        -- upvalues: l_HttpService_0 (ref), l_url_0 (copy), l_searchParams_0 (copy), v24 (copy), v22 (copy), v1 (ref), v8 (ref), l_isVisible_0 (copy), l_DisplayOrder_0 (copy), v4 (ref), l_FFlagEnableWebViewStateTracker_0 (ref), v13 (ref), v23 (copy), v14 (copy)
        local v26 = l_HttpService_0:JSONEncode({
            url = l_url_0, 
            title = v25, 
            searchParams = l_searchParams_0, 
            animated = v24, 
            transitionAnimation = v22
        });
        return v1.createElement(v8, {
            isVisible = l_isVisible_0, 
            DisplayOrder = l_DisplayOrder_0, 
            notificationData = v26, 
            notificationType = v4.OPEN_CUSTOM_WEBVIEW, 
            onClose = if l_FFlagEnableWebViewStateTracker_0 and v13 then v23 else v14.onClose
        });
    end;
    if l_titleKey_0 ~= nil and l_title_0 == nil then
        return v7({
            title = l_titleKey_0
        })(function(v28) --[[ Line: 92 ]]
            -- upvalues: v27 (copy)
            return v27(v28.title);
        end);
    else
        return v27(l_title_0);
    end;
end;
if v11() then
    return function(v30) --[[ Line: 101 ]]
        -- upvalues: v1 (copy), v9 (copy)
        return v1.createElement(v9, {
            url = v30.url, 
            title = v30.title, 
            titleKey = v30.titleKey, 
            searchParams = v30.searchParams, 
            transitionAnimation = v30.transitionAnimation, 
            windowCloseCallback = v30.onClose, 
            overlayProps = {
                isVisible = v30.isVisible, 
                DisplayOrder = v30.DisplayOrder
            }
        });
    end;
else
    return v29;
end;