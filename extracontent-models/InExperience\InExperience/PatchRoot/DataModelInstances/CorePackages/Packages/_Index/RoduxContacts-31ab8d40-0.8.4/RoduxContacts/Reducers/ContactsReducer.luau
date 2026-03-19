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
    -- upvalues: v7 (copy), v2 (copy), v3 (copy), v4 (copy), v6 (copy)
    return function(v9, v10) --[[ Line: 17 ]]
        -- upvalues: v7 (ref), v2 (ref), v8 (copy), v3 (ref), v4 (ref), v6 (ref)
        local v11 = v9 or v7;
        local v12 = v2(v8);
        local v13 = v3(v8);
        local v14 = v4(v8);
        local v15 = v6(v8);
        return {
            byContactId = v12(v11.byContactId, v10), 
            byDeviceContactId = v13(v11.byDeviceContactId, v10), 
            hasSentRequest = v14(v11.hasSentRequest, v10), 
            deviceContactToRobloxContact = v15(v11.deviceContactToRobloxContact, v10)
        };
    end;
end;