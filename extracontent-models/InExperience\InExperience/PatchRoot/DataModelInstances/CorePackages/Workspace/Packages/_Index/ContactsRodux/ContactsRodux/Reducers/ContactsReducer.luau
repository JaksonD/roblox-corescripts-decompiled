local l_Parent_0 = script.Parent.Parent;
local l_Types_0 = l_Parent_0.Types;
local v2 = require(l_Parent_0.Reducers.Contacts.byContactId);
local v3 = require(l_Parent_0.Reducers.Contacts.byDeviceContactId);
local v4 = require(l_Parent_0.Reducers.Contacts.hasSentRequest);
local _ = require(l_Types_0.ReducerTypes);
local v6 = require(l_Parent_0.Reducers.Contacts.deviceContactToRobloxContact);
local v7 = {
    byContactId = {}, 
    byDeviceContactId = {}, 
    hasSentRequest = {}, 
    deviceContactToRobloxContact = {}
};
return function(v8) --[[ Line: 16 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v6 (copy), v7 (copy)
    local v9 = v2(v8);
    local v10 = v3(v8);
    local v11 = v4(v8);
    local v12 = v6(v8);
    return function(v13, v14) --[[ Line: 22 ]]
        -- upvalues: v7 (ref), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
        local v15 = v13 or v7;
        return {
            byContactId = v9(v15.byContactId, v14), 
            byDeviceContactId = v10(v15.byDeviceContactId, v14), 
            hasSentRequest = v11(v15.hasSentRequest, v14), 
            deviceContactToRobloxContact = v12(v15.deviceContactToRobloxContact, v14)
        };
    end;
end;