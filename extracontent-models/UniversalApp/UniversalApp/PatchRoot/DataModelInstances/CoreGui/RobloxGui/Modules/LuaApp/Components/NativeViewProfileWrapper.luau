local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.NativePageWrapper);
local v4 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local v6 = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
local v8 = v2.PureComponent:extend("NativeViewProfileWrapper");
v8.render = function(v9) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    local l_isVisible_0 = v9.props.isVisible;
    local l_DisplayOrder_0 = v9.props.DisplayOrder;
    local l_url_0 = v9.props.url;
    local l_onClose_0 = v9.props.onClose;
    local function v15(v14) --[[ Line: 29 ]]
        -- upvalues: v2 (ref), v3 (ref), l_isVisible_0 (copy), l_DisplayOrder_0 (copy), l_url_0 (copy), v4 (ref), l_onClose_0 (copy)
        if game:GetEngineFeature("SetWebViewTitle") then
            return v2.createElement(v3, {
                titleText = v14.titleText, 
                isVisible = l_isVisible_0, 
                DisplayOrder = l_DisplayOrder_0, 
                url = l_url_0, 
                notificationType = v4.VIEW_PROFILE, 
                onClose = l_onClose_0
            });
        else
            return v2.createElement(v3, {
                titleText = v14.titleText, 
                isVisible = l_isVisible_0, 
                DisplayOrder = l_DisplayOrder_0, 
                notificationData = l_url_0, 
                notificationType = v4.VIEW_PROFILE, 
                onClose = l_onClose_0
            });
        end;
    end;
    return v5({
        titleText = "CommonUI.Features.Label.Profile"
    })(function(v16) --[[ Line: 53 ]]
        -- upvalues: v15 (copy)
        return v15(v16);
    end);
end;
if v7() then
    return function(v17) --[[ Line: 59 ]]
        -- upvalues: v2 (copy), v6 (copy)
        return v2.createElement(v6, {
            url = v17.url, 
            titleKey = "CommonUI.Features.Label.Profile", 
            windowCloseCallback = v17.onClose, 
            overlayProps = {
                isVisible = v17.isVisible, 
                DisplayOrder = v17.DisplayOrder
            }
        });
    end;
else
    return v8;
end;