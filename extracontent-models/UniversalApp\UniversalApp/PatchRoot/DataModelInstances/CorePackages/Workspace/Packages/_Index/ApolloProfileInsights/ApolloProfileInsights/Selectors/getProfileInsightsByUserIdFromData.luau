local l_Parent_0 = script:FindFirstAncestor("ApolloProfileInsights").Parent;
local v1 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.GraphQLServer);
return function(v3, v4) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    if not v3 or not v3.profilesInsightsByUserIds then
        return nil;
    else
        local l_profilesInsightsByUserIds_0 = v3.profilesInsightsByUserIds;
        return l_profilesInsightsByUserIds_0[v1.List.findWhere(l_profilesInsightsByUserIds_0, function(v6, _) --[[ Line: 20 ]]
            -- upvalues: v4 (copy)
            return v6.targetUserId == tostring(v4);
        end)];
    end;
end;