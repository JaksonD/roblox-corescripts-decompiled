local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Types_0 = l_Parent_0.Types;
local v3 = require(l_Parent_1.Rodux);
local v4 = require(script.Parent.utils.setContactsInStore);
local v5 = require(script.Parent.utils.updateContactsInStore);
local _ = require(l_Types_0.ActionTypes);
local _ = require(l_Types_0.ReducerTypes);
local v8 = {};
return function(v9) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), v8 (copy), v4 (copy), v5 (copy)
    local l_networkingContacts_0 = v9.networkingContacts;
    return v3.createReducer(v8, {
        [l_networkingContacts_0.FindContactFriends.Succeeded.name] = function(_, v12) --[[ Line: 17 ]]
            -- upvalues: v4 (ref)
            return v4(v12);
        end, 
        [l_networkingContacts_0.GetContactEntitiesByContactId.Succeeded.name] = function(v13, v14) --[[ Line: 27 ]]
            -- upvalues: v5 (ref)
            return v5(v13, v14);
        end
    });
end;