local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v4 = require(l_Modules_0.LuaApp.Components.NativePageWrapper);
return function(v5) --[[ Line: 8 ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy), v4 (copy), v3 (copy)
    local l_isVisible_0 = v5.isVisible;
    local l_DisplayOrder_0 = v5.DisplayOrder;
    local v8 = l_HttpService_0:JSONEncode(v5.data);
    return v2.createElement(v4, {
        isVisible = l_isVisible_0, 
        DisplayOrder = l_DisplayOrder_0, 
        notificationData = v8, 
        notificationType = v3.NATIVE_SHARE
    });
end;