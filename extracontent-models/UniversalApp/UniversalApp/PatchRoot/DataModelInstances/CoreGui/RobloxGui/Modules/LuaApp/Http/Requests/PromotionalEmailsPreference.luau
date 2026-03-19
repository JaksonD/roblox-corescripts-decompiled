local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return function(v3, v4) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    local v5 = v2.NOTIFICATION_URL .. "v2/notifications/notification-preferences";
    local v6 = "None";
    if v4 then
        v6 = "Personalized";
    end;
    local v7 = {
        notificationType = "PromotionalEmails", 
        notificationChannel = "Email", 
        preferenceStatus = v6
    };
    return v3(v5, "POST", {
        postBody = l_HttpService_0:JSONEncode({
            updatedPreferences = {
                v7
            }
        })
    }):catch(function() --[[ Line: 34 ]]

    end);
end;