local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.mockId);
local _ = require(script.Parent.Parent.roduxFriendsTypes);
local v4 = require(l_Parent_0.llama);
local v5 = require(l_script_FirstAncestor_0.Enums.RecommendationContextType);
local v6 = {};
v6.new = function(v7) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    assert(v6.isValid(v7));
    v6.__index = v6;
    local v8 = {
        id = v7.id, 
        entityId = v7.entityId, 
        rank = v7.rank, 
        contextType = v7.contextType, 
        mutualFriendsList = v7.mutualFriendsList, 
        mutualFriendsCount = v7.mutualFriendsCount, 
        thumbnailEntities = v7.thumbnailEntities, 
        entityDisplayName = v7.entityDisplayName
    };
    setmetatable(v8, v6);
    return v8;
end;
v6.mock = function(v9) --[[ Line: 31 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy), v6 (copy)
    local v10 = {
        id = v2(), 
        contextType = v5.MutualFriends
    };
    local v11 = v4.Dictionary.join(v10, v9);
    return (v6.new({
        id = v11.id, 
        mutualFriendsList = v11.mutualFriendsList, 
        rank = v11.rank or tonumber(v11.id), 
        contextType = v11.contextType, 
        mutualFriendsCount = if v11.mutualFriendsCount then v11.mutualFriendsCount else v11.mutualFriendsList and #v11.mutualFriendsList or 0
    }));
end;
v6.isValid = function(v12) --[[ Line: 48 ]] --[[ Name: isValid ]]
    -- upvalues: v5 (copy)
    if not v12 then
        return false, "Expected recommendation information to be given";
    elseif not v12.id then
        return false, "Expected user's id to be given";
    elseif not v12.rank then
        return false, "Expected user's rank to be given";
    elseif not v12.contextType or not v5.isEnumValue(v12.contextType) then
        return false, "Expected contextType to be given";
    elseif v12.mutualFriendsList and type(v12.mutualFriendsList) ~= "table" then
        return false, "mutualFriendList must be a table of strings";
    elseif v12.mutualFriendsCount and type(v12.mutualFriendsCount) ~= "number" then
        return false, "mutualFriendsCount must be a number";
    elseif v12.contextType == v5.Contacts and not v12.entityId then
        return false, "entity Id must be given for Contacts recommendation type";
    else
        return true, "Valid Recommendation";
    end;
end;
v6.isEqual = function(v13, v14) --[[ Line: 74 ]] --[[ Name: isEqual ]]
    -- upvalues: v4 (copy)
    local v15 = false;
    if v13.id == v14.id then
        v15 = v4.List.equals(v13.mutualFriendsList, v14.mutualFriendsList) and v13.rank == v14.rank and v13.contextType == v14.contextType and v13.mutualFriendsCount == v14.mutualFriendsCount;
    end;
    return v15;
end;
v6.format = function(v16) --[[ Line: 85 ]] --[[ Name: format ]]
    -- upvalues: v5 (copy), v6 (copy), v4 (copy)
    local v17 = if v16.contextType then v5.fromRawValue(v16.contextType) or v5.None else v5.None;
    local v18 = if v16.mutualFriendsCount then v16.mutualFriendsCount else if v16.mutualFriendsList then #v16.mutualFriendsList else 0;
    local v19 = if v16.contactId ~= "" then v16.contactId else nil;
    local v20 = if v17 == v5.Contacts then v16.displayName else nil;
    return v6.new(v4.Dictionary.join(v16, {
        id = v16.id, 
        entityId = v19, 
        contextType = v17, 
        mutualFriendsCount = v18, 
        contactId = contactId, 
        thumbnailEntities = v16.thumbnailEntities, 
        entityDisplayName = v20
    }));
end;
return v6;