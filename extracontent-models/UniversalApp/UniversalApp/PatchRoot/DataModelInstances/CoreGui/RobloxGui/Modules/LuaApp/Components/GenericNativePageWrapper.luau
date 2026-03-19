local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.NativePageWrapper);
local v4 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v5 = require(l_Modules_0.LuaApp.mapTransitionAnimationToNativeString);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
return function(v7) --[[ Line: 10 ]]
    -- upvalues: v5 (copy), v4 (copy), v6 (copy), v2 (copy), v3 (copy), l_HttpService_0 (copy)
    local l_isVisible_0 = v7.isVisible;
    local l_DisplayOrder_0 = v7.DisplayOrder;
    local l_transitionAnimation_0 = v7.transitionAnimation;
    local l_titleTextLocalizationKey_0 = v7.titleTextLocalizationKey;
    local v12 = v5(l_transitionAnimation_0 or "");
    local v13 = true;
    if l_transitionAnimation_0 ~= nil then
        v13 = true;
        if l_transitionAnimation_0 ~= v4.None then
            v13 = v12 ~= nil;
        end;
    end;
    assert(v13, string.format("Unhandled transition animation: %q", (tostring(l_transitionAnimation_0))));
    local v14 = l_transitionAnimation_0 ~= v4.None;
    if game:GetEngineFeature("SetWebViewTitle") then
        return v6({
            titleText = l_titleTextLocalizationKey_0
        })(function(v15) --[[ Line: 28 ]]
            -- upvalues: v2 (ref), v3 (ref), v14 (copy), v12 (copy), l_isVisible_0 (copy), l_DisplayOrder_0 (copy), v7 (copy)
            return v2.createElement(v3, {
                titleText = v15.titleText, 
                animated = v14, 
                transitionAnimation = v12, 
                isVisible = l_isVisible_0, 
                DisplayOrder = l_DisplayOrder_0, 
                notificationType = v7.notificationType, 
                onClose = v7.onClose
            });
        end);
    else
        v13 = l_HttpService_0:JSONEncode({
            animated = v14, 
            transitionAnimation = v12
        });
        return v2.createElement(v3, {
            isVisible = l_isVisible_0, 
            DisplayOrder = l_DisplayOrder_0, 
            notificationData = v13, 
            notificationType = v7.notificationType, 
            onClose = v7.onClose
        });
    end;
end;