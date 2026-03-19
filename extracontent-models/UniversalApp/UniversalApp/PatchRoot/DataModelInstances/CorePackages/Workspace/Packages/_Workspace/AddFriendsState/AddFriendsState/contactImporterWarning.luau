local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriendsState");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.llama);
local v4 = require(l_Parent_0.Rodux);
local l_Constants_0 = require(l_Parent_0.ContactImporter).Constants;
local v6 = require(l_script_FirstAncestor_0.Networking.FriendsNetworking);
local l_FriendRequestCreated_0 = require(l_script_FirstAncestor_0.RoduxFriends).Actions.FriendRequestCreated;
local v8 = require(l_script_FirstAncestor_0.Actions.ContactImporterWarningSeen);
local v9 = {
    contactImporterFriendRequests = {}, 
    seenContactImporterFriendRequest = false
};
local function v14(v10, v11) --[[ Line: 28 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return {
        seenContactImporterFriendRequest = v10.seenContactImporterFriendRequest, 
        contactImporterFriendRequests = v3.Dictionary.filter(v10.contactImporterFriendRequests, function(_, v13) --[[ Line: 31 ]]
            -- upvalues: v2 (ref), v11 (copy)
            return not v2.includes(v11, v13);
        end)
    };
end;
return v4.createReducer(v9, {
    [v6.AcceptFriendRequestFromUserId.Succeeded.name] = function(v15, v16) --[[ Line: 38 ]]
        -- upvalues: v14 (copy)
        return (v14(v15, v16.ids));
    end, 
    [v6.DeclineFriendRequestFromUserId.Succeeded.name] = function(v17, v18) --[[ Line: 44 ]]
        -- upvalues: v14 (copy)
        return (v14(v17, v18.ids));
    end, 
    [l_FriendRequestCreated_0.name] = function(v19, v20) --[[ Line: 50 ]]
        -- upvalues: l_Constants_0 (copy), v3 (copy)
        local l_id_0 = v20.id;
        if v20.originSourceType == l_Constants_0.PHONE_CONTACT_IMPORTER then
            return v3.Dictionary.join(v19, {
                contactImporterFriendRequests = v3.Dictionary.join(v19.contactImporterFriendRequests, {
                    [tostring(l_id_0)] = true
                })
            });
        else
            return v19;
        end;
    end, 
    [v6.GetFriendRequests.Succeeded.name] = function(v22, v23) --[[ Line: 64 ]]
        -- upvalues: l_Constants_0 (copy), v3 (copy)
        local l_data_0 = v23.responseBody.data;
        local v25 = {};
        for _, v27 in pairs(l_data_0) do
            if v27.friendRequest.originSourceType == l_Constants_0.PHONE_CONTACT_IMPORTER then
                v25[tostring(v27.id)] = true;
            end;
        end;
        return v3.Dictionary.join(v22, {
            contactImporterFriendRequests = v3.Dictionary.join(v22.contactImporterFriendRequests, v25)
        });
    end, 
    [v8.name] = function(v28, _) --[[ Line: 80 ]]
        -- upvalues: v3 (copy)
        if not v3.isEmpty(v28.contactImporterFriendRequests) then
            return v3.Dictionary.join(v28, {
                seenContactImporterFriendRequest = true
            });
        else
            return v28;
        end;
    end
});