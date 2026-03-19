local l_NotificationService_0 = game:GetService("NotificationService");
local l_Parent_0 = script:FindFirstAncestor("SocialUpsell").Parent;
local v2 = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.RealtimeDelivery);
local l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 = require(l_Parent_0.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace;
local v5 = v3.RobloxEventReceiver.new(l_NotificationService_0);
local l_Signal_0 = v2.Signal;
local v7 = nil;
return function() --[[ Line: 21 ]]
    -- upvalues: v7 (ref), l_Signal_0 (copy), l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 (copy), v5 (copy)
    if not v7 then
        v7 = l_Signal_0.new();
        if l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 and #l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0 > 0 then
            v5:observeEvent(l_FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace_0, function(v8) --[[ Line: 28 ]]
                -- upvalues: v7 (ref)
                if v7 then
                    v7:fire(v8);
                end;
            end);
        end;
    end;
    return v7;
end;