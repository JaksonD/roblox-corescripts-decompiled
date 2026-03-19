local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_Modules_0.LuaApp.Util.getHasAmazonUserAgent);
local v3 = require(l_Modules_0.LuaApp.Util.getHasQuestUserAgent);
local v4 = require(l_Modules_0.LuaApp.Util.getPaymentFromPlatform);
return function() --[[ Line: 8 ]]
    -- upvalues: l_UserInputService_0 (copy), v2 (copy), v3 (copy), v4 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v6 = v2();
    local v7 = v3();
    return v4(l_l_UserInputService_0_Platform_0, v6, v7);
end;