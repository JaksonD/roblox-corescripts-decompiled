local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v5 = require(l_Modules_0.LuaApp.Components.NativePageWrapper);
local v6 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v7 = require(l_Modules_0.LuaApp.mapTransitionAnimationToNativeString);
local v8 = require(l_Modules_0.LuaApp.Enum.WebViewWindow);
local v9 = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
local function v20(v11) --[[ Line: 24 ]] --[[ Name: YouTubePageWrapper ]]
    -- upvalues: v7 (copy), v6 (copy), l_HttpService_0 (copy), v1 (copy), v5 (copy), v4 (copy)
    local l_isVisible_0 = v11.isVisible;
    local l_DisplayOrder_0 = v11.DisplayOrder;
    local l_url_0 = v11.url;
    local l_title_0 = v11.title;
    local l_transitionAnimation_0 = v11.transitionAnimation;
    local v17 = v7(l_transitionAnimation_0);
    local v18 = true;
    if l_transitionAnimation_0 ~= nil then
        v18 = true;
        if l_transitionAnimation_0 ~= v6.None then
            v18 = v17 ~= nil;
        end;
    end;
    assert(v18, string.format("Unhandled transition animation: %q", (tostring(l_transitionAnimation_0))));
    local v19 = l_transitionAnimation_0 ~= v6.None;
    v18 = l_HttpService_0:JSONEncode({
        url = l_url_0, 
        title = l_title_0, 
        animated = v19, 
        transitionAnimation = v17
    });
    return v1.createElement(v5, {
        isVisible = l_isVisible_0, 
        DisplayOrder = l_DisplayOrder_0, 
        notificationData = v18, 
        notificationType = v4.OPEN_YOUTUBE_VIDEO
    });
end;
if v10() then
    return function(v21) --[[ Line: 56 ]]
        -- upvalues: v1 (copy), v9 (copy), v8 (copy)
        return v1.createElement(v9, {
            url = v21.url, 
            title = v21.title, 
            transitionAnimation = v21.transitionAnimation, 
            windowType = v8.Dialog, 
            overlayProps = {
                isVisible = v21.isVisible, 
                DisplayOrder = v21.DisplayOrder
            }
        });
    end;
else
    return v20;
end;