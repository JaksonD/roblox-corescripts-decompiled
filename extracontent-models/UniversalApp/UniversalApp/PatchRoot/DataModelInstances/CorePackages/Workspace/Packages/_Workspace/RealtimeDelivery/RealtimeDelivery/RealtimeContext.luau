local l_Parent_0 = script:FindFirstAncestor("RealtimeDelivery").Parent;
local v1 = require(l_Parent_0.React);
local l_NotificationService_0 = game:GetService("NotificationService");
local v3 = require(script.Parent.RobloxEventReceiver).new(l_NotificationService_0);
return v1.createContext(v3);