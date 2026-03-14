local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_NetworkingFriends_0 = v1.NetworkingFriends;
local _ = require(l_Parent_0.Common.LocalTypes);
local l_NetworkingContacts_0 = v1.NetworkingContacts;
local l_RoduxContacts_0 = v1.RoduxContacts;
local l_Promise_0 = v1.Promise;
local l_llama_0 = v1.llama;
return function(v8) --[[ Line: 11 ]]
    -- upvalues: l_NetworkingFriends_0 (copy), l_NetworkingContacts_0 (copy), l_llama_0 (copy), l_Promise_0 (copy), l_RoduxContacts_0 (copy)
    return {
        requestFriendship = function(v9) --[[ Line: 13 ]] --[[ Name: requestFriendship ]]
            -- upvalues: v8 (copy), l_NetworkingFriends_0 (ref)
            return v8(l_NetworkingFriends_0.RequestFriendshipFromContactId.API(v9));
        end, 
        findContacts = function() --[[ Line: 16 ]] --[[ Name: findContacts ]]
            -- upvalues: v8 (copy), l_NetworkingContacts_0 (ref)
            return v8(l_NetworkingContacts_0.FindContactFriends.API()):andThen(function(v10) --[[ Line: 17 ]]
                return v10.responseBody.userContactIds;
            end);
        end, 
        getContactEntities = function(v11) --[[ Line: 21 ]] --[[ Name: getContactEntities ]]
            -- upvalues: l_llama_0 (ref), l_Promise_0 (ref), v8 (copy), l_NetworkingContacts_0 (ref)
            if l_llama_0.isEmpty(v11) or not v11 then
                return l_Promise_0.resolve();
            else
                return v8(l_NetworkingContacts_0.GetContactEntitiesByContactId.API(v11));
            end;
        end, 
        uploadContacts = function(v12) --[[ Line: 28 ]] --[[ Name: uploadContacts ]]
            -- upvalues: v8 (copy), l_NetworkingContacts_0 (ref)
            return v8(l_NetworkingContacts_0.UploadContactsByUser.API(v12));
        end, 
        deviceContactsReceived = function(v13) --[[ Line: 31 ]] --[[ Name: deviceContactsReceived ]]
            -- upvalues: v8 (copy), l_RoduxContacts_0 (ref)
            return v8(l_RoduxContacts_0.Actions.DeviceContactsReceived(v13));
        end, 
        requestSent = function(v14) --[[ Line: 34 ]] --[[ Name: requestSent ]]
            -- upvalues: v8 (copy), l_RoduxContacts_0 (ref)
            return v8(l_RoduxContacts_0.Actions.RequestSent({
                id = v14
            }));
        end
    };
end;