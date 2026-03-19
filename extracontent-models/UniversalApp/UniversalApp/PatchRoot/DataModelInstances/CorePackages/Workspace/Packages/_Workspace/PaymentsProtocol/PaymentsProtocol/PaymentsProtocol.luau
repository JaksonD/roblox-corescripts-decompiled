local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Promise);
local v3 = require(l_Parent_0.PaymentsProtocolConstants);
local _ = require(l_Parent_0.PaymentsProtocolTypes);
local _ = require(l_Parent_0.Enums.IAPEventType);
local l_MessageBusService_0 = game:GetService("MessageBusService");
local v7 = {};
v7.__index = v7;
v7.new = function() --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({}, v7));
end;
v7.isAvailable = function(_) --[[ Line: 29 ]] --[[ Name: isAvailable ]]
    -- upvalues: v2 (copy), l_MessageBusService_0 (copy), v3 (copy)
    return (v2.new(function(v9, _) --[[ Line: 30 ]]
        -- upvalues: l_MessageBusService_0 (ref), v3 (ref)
        l_MessageBusService_0:MakeRequest(v3.NAME, v3.METHOD_IS_AVAILABLE, {}, function(v11) --[[ Line: 35 ]]
            -- upvalues: v9 (copy)
            v9(v11.available);
        end, {});
    end));
end;
v7.listNativeProducts = function(_) --[[ Line: 47 ]] --[[ Name: listNativeProducts ]]
    -- upvalues: v2 (copy), l_MessageBusService_0 (copy), v3 (copy)
    return (v2.new(function(v13, _) --[[ Line: 48 ]]
        -- upvalues: l_MessageBusService_0 (ref), v3 (ref)
        l_MessageBusService_0:MakeRequest(v3.NAME, v3.METHOD_LIST_NATIVE_PRODUCTS, {}, function(v15) --[[ Line: 53 ]]
            -- upvalues: v13 (copy)
            v13(v15);
        end, {});
    end));
end;
v7.processPendingPurchase = function(_) --[[ Line: 65 ]] --[[ Name: processPendingPurchase ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    l_MessageBusService_0:Publish(v3.MESSAGE_PROCESS_PENDING_PURCHASE, {});
end;
v7.sendIAPEvent = function(_, v18) --[[ Line: 72 ]] --[[ Name: sendIAPEvent ]]
    -- upvalues: l_MessageBusService_0 (copy), v3 (copy)
    l_MessageBusService_0:Publish(v3.MESSAGE_SEND_IAP_EVENT, {
        eventType = v18
    });
end;
v7.default = v7.new();
return v7;