local l_Parent_0 = script:FindFirstAncestor("SocialTabsPage").Parent;
local v1 = require(l_Parent_0.React);
local l_useSignalProfileInsightsByUserId_0 = require(l_Parent_0.ProfileInsights).useSignalProfileInsightsByUserId;
return function(v3) --[[ Line: 24 ]] --[[ Name: useMutualsList ]]
    -- upvalues: l_useSignalProfileInsightsByUserId_0 (copy), v1 (copy)
    local v4, v5 = l_useSignalProfileInsightsByUserId_0({
        userId = v3, 
        rankingStrategy = "tc_info_boost"
    });
    local v6 = if v4 and v4.mutualFriends then v4.mutualFriends else {};
    local v7, v8 = v1.useState(25);
    v1.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v8 (copy)
        v8(25);
    end, {
        v3
    });
    local v11 = v1.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v7 (copy), v6 (copy)
        local v9 = {};
        for v10 = 1, math.min(v7, #v6) do
            table.insert(v9, v6[v10]);
        end;
        return v9;
    end, {
        v6, 
        v7
    });
    local v12 = v7 < #v6;
    local v14 = v1.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v8 (copy), v6 (copy)
        v8(function(v13) --[[ Line: 51 ]]
            -- upvalues: v6 (ref)
            return (math.min(v13 + 25, #v6));
        end);
    end, {
        v6
    });
    return {
        mutualFriends = v11, 
        isLoading = v5, 
        hasMore = v12, 
        loadMore = v14, 
        totalCount = #v6
    };
end;