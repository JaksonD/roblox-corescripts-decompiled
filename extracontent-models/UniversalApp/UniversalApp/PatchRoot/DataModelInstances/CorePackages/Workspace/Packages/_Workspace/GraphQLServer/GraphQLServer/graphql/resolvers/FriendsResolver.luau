local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local _ = require(l_Parent_0.LuauPolyfill);
local v5 = require(l_script_FirstAncestor_0.graphql.connectors.FriendsConnector);
local l_getAllFriendsByUserId_0 = v5.getAllFriendsByUserId;
local l_getOnlineFriendsByUserId_0 = v5.getOnlineFriendsByUserId;
local function _(v8) --[[ Line: 20 ]] --[[ Name: convertToStringWithDefault ]]
    if v8 then
        return (tostring(v8));
    else
        return "";
    end;
end;
return {
    UserPresence = {
        id = function(v10) --[[ Line: 26 ]] --[[ Name: id ]]
            return v10.id;
        end, 
        userPresenceType = function(v11) --[[ Line: 29 ]] --[[ Name: userPresenceType ]]
            return v11.userPresence.UserPresenceType;
        end, 
        gameId = function(v12) --[[ Line: 32 ]] --[[ Name: gameId ]]
            local l_gameInstanceId_0 = v12.userPresence.gameInstanceId;
            if l_gameInstanceId_0 then
                return (tostring(l_gameInstanceId_0));
            else
                return "";
            end;
        end, 
        placeId = function(v14) --[[ Line: 35 ]] --[[ Name: placeId ]]
            local l_placeId_0 = v14.userPresence.placeId;
            if l_placeId_0 then
                return (tostring(l_placeId_0));
            else
                return "";
            end;
        end, 
        rootPlaceId = function(v16) --[[ Line: 38 ]] --[[ Name: rootPlaceId ]]
            local l_rootPlaceId_0 = v16.userPresence.rootPlaceId;
            if l_rootPlaceId_0 then
                return (tostring(l_rootPlaceId_0));
            else
                return "";
            end;
        end, 
        universeId = function(v18) --[[ Line: 41 ]] --[[ Name: universeId ]]
            local l_universeId_0 = v18.userPresence.universeId;
            if l_universeId_0 then
                return (tostring(l_universeId_0));
            else
                return "";
            end;
        end, 
        lastLocation = function(v20) --[[ Line: 44 ]] --[[ Name: lastLocation ]]
            return v20.userPresence.lastLocation;
        end, 
        lastOnline = function(v21) --[[ Line: 47 ]] --[[ Name: lastOnline ]]
            return v21.userPresence.lastOnline;
        end
    }, 
    Friend = {
        targetUserId = function(_, _, _, v25) --[[ Line: 52 ]] --[[ Name: targetUserId ]]
            return v25.variableValues.userId;
        end, 
        displayName = function() --[[ Line: 55 ]] --[[ Name: displayName ]]
            -- upvalues: l_GraphQLError_0 (copy)
            return l_GraphQLError_0.new("The displayName field is being deprecated, please use UserProfile to retrieve names");
        end, 
        presence = function(v26) --[[ Line: 60 ]] --[[ Name: presence ]]
            return v26;
        end, 
        hasVerifiedBadge = function(_) --[[ Line: 63 ]] --[[ Name: hasVerifiedBadge ]]
            return false;
        end, 
        sortScore = function(v28) --[[ Line: 66 ]] --[[ Name: sortScore ]]
            return v28.sortScore or 0;
        end
    }, 
    AllFriendsPage = {
        targetUserId = function(_, _, _, v32) --[[ Line: 71 ]] --[[ Name: targetUserId ]]
            return v32.variableValues.userId;
        end, 
        curCursor = function(_, _, _, v36) --[[ Line: 74 ]] --[[ Name: curCursor ]]
            return v36.variableValues.pageCursor or "";
        end, 
        nextCursor = function(v37) --[[ Line: 77 ]] --[[ Name: nextCursor ]]
            return v37.NextCursor or "";
        end, 
        prevCursor = function(v38) --[[ Line: 80 ]] --[[ Name: prevCursor ]]
            return v38.PreviousCursor or "";
        end, 
        friends = function(v39) --[[ Line: 83 ]] --[[ Name: friends ]]
            return v39.PageItems or {};
        end
    }, 
    Query = {
        allFriendsByUserId = function(_, v41, v42) --[[ Line: 88 ]] --[[ Name: allFriendsByUserId ]]
            -- upvalues: l_getAllFriendsByUserId_0 (copy)
            return l_getAllFriendsByUserId_0(v41, v42.fetchImpl);
        end, 
        onlineFriendsByUserId = function(_, v44, v45) --[[ Line: 91 ]] --[[ Name: onlineFriendsByUserId ]]
            -- upvalues: l_getOnlineFriendsByUserId_0 (copy)
            return l_getOnlineFriendsByUserId_0(v44, v45.fetchImpl);
        end
    }
};