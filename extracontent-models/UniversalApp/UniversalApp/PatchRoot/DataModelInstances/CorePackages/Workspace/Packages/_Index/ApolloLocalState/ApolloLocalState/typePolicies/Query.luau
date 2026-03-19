local l_Parent_0 = script:FindFirstAncestor("ApolloLocalState").Parent;
local _ = require(l_Parent_0.ApolloClient);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.utils.mergeListsWithoutDuplicates);
return {
    fields = {
        omniFeedItem = {}, 
        profilesInsightsByUserIds = {
            read = function(_, _, v6) --[[ Line: 12 ]] --[[ Name: read ]]
                local v7 = {};
                for _, v9 in pairs(v6.args.userIds) do
                    local v10 = v6:toReference({
                        __typename = "ProfileInsights", 
                        targetUserId = v9
                    });
                    table.insert(v7, v10);
                    if not v6:canRead(v10) then
                        return nil;
                    end;
                end;
                return v7;
            end
        }, 
        userProfiles = {
            read = function(_, _, v13) --[[ Line: 34 ]] --[[ Name: read ]]
                local v14 = {};
                for _, v16 in v13.args.userIds do
                    local v17 = v13:toReference({
                        __typename = "UserProfile", 
                        id = v16
                    });
                    table.insert(v14, v17);
                    if not v13:canRead(v17) then
                        return nil;
                    end;
                end;
                return v14;
            end
        }, 
        allFriendsByUserId = {
            keyArgs = {
                "userId", 
                "sort"
            }, 
            merge = function(_, v19, v20) --[[ Line: 57 ]] --[[ Name: merge ]]
                -- upvalues: v3 (copy), v2 (copy)
                if not v19 then
                    return v20;
                elseif v19.nextCursor == v20.curCursor then
                    local v21 = v3(v19 and v19.friends, v20 and v20.friends, "__ref");
                    return v2.Dictionary.join(v20, {
                        friends = v21
                    });
                else
                    return v19;
                end;
            end
        }, 
        onlineFriendsByUserId = {
            keyArgs = {
                "userId", 
                "sort"
            }, 
            read = function(_, v23, v24) --[[ Line: 80 ]] --[[ Name: read ]]
                -- upvalues: v2 (copy)
                if not v23 then
                    return v23;
                else
                    return (v2.List.filter(v23, function(v25) --[[ Line: 85 ]]
                        -- upvalues: v24 (copy)
                        local v26 = v24:readField("presence", v25);
                        local v27 = v24:readField("userPresenceType", v26);
                        return v27 and v27 ~= "Offline";
                    end));
                end;
            end
        }
    }
};