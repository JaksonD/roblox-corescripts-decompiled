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
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
local function v25(v11) --[[ Line: 30 ]] --[[ Name: GenericWebPageWrapper ]]
    -- upvalues: v6 (copy), v5 (copy), l_HttpService_0 (copy), v1 (copy), v8 (copy), v4 (copy), v7 (copy)
    local l_isVisible_0 = v11.isVisible;
    local l_DisplayOrder_0 = v11.DisplayOrder;
    local l_url_0 = v11.url;
    local l_titleKey_0 = v11.titleKey;
    local l_title_0 = v11.title;
    local l_searchParams_0 = v11.searchParams;
    local l_transitionAnimation_0 = v11.transitionAnimation;
    local v19 = v6(l_transitionAnimation_0);
    local v20 = true;
    if l_transitionAnimation_0 ~= nil then
        v20 = true;
        if l_transitionAnimation_0 ~= v5.None then
            v20 = v19 ~= nil;
        end;
    end;
    assert(v20, string.format("Unhandled transition animation: %q", (tostring(l_transitionAnimation_0))));
    local v21 = l_transitionAnimation_0 ~= v5.None;
    v20 = function(v22) --[[ Line: 48 ]]
        -- upvalues: l_HttpService_0 (ref), l_url_0 (copy), l_searchParams_0 (copy), v21 (copy), v19 (copy), v1 (ref), v8 (ref), l_isVisible_0 (copy), l_DisplayOrder_0 (copy), v4 (ref), v11 (copy)
        local v23 = l_HttpService_0:JSONEncode({
            url = l_url_0, 
            title = v22, 
            searchParams = l_searchParams_0, 
            animated = v21, 
            transitionAnimation = v19
        });
        return v1.createElement(v8, {
            isVisible = l_isVisible_0, 
            DisplayOrder = l_DisplayOrder_0, 
            notificationData = v23, 
            notificationType = v4.OPEN_CUSTOM_WEBVIEW, 
            onClose = v11.onClose
        });
    end;
    if l_titleKey_0 ~= nil and l_title_0 == nil then
        return v7({
            title = l_titleKey_0
        })(function(v24) --[[ Line: 69 ]]
            -- upvalues: v20 (copy)
            return v20(v24.title);
        end);
    else
        return v20(l_title_0);
    end;
end;
if v10() then
    return function(v26) --[[ Line: 78 ]]
        -- upvalues: v1 (copy), v9 (copy)
        return v1.createElement(v9, {
            url = v26.url, 
            title = v26.title, 
            titleKey = v26.titleKey, 
            searchParams = v26.searchParams, 
            transitionAnimation = v26.transitionAnimation, 
            windowCloseCallback = v26.onClose, 
            overlayProps = {
                isVisible = v26.isVisible, 
                DisplayOrder = v26.DisplayOrder
            }
        });
    end;
else
    return v25;
end;