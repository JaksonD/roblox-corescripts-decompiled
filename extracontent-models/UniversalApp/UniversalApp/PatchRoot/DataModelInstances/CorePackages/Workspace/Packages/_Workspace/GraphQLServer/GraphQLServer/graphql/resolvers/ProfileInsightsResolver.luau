local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.Cryo);
local _ = require(script.Parent.Parent.generatedTypes);
local _ = require(l_Parent_0.LuauPolyfill);
local v5 = require(script.Parent.Parent.connectors.ProfileInsightsConnector);
local l_findProfileInsightsByUserIds_0 = v5.findProfileInsightsByUserIds;
local l_findProfileInsightsByUserIdsFeed_0 = v5.findProfileInsightsByUserIdsFeed;
local l_FFlagPlayerSearchEnableOnlineFrequents_0 = require(l_Parent_0.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents;
local _ = function(v9, v10) --[[ Line: 25 ]]
    for _, v12 in v9.profileInsights do
        if v12[v10] then
            return v12[v10];
        end;
    end;
    return {};
end;
return {
    ProfileInsights = {
        targetUserId = function(v14) --[[ Line: 39 ]] --[[ Name: targetUserId ]]
            return v14.targetUser;
        end, 
        mutualFriends = function(v15) --[[ Line: 42 ]] --[[ Name: mutualFriends ]]
            -- upvalues: v2 (copy)
            local v16 = false;
            local v17 = nil;
            local v18;
            for _, v20 in v15.profileInsights do
                if v20.mutualFriendInsight then
                    v18 = v20.mutualFriendInsight;
                    v16 = true;
                end;
                if v16 then
                    break;
                end;
            end;
            if not v16 then
                v18 = {};
            end;
            v16 = false;
            v17 = if v18 then v18.mutualFriends else {};
            if not v17 then
                return {};
            else
                local l_v17_0 = v17;
                return v2.List.foldLeft(v2.Dictionary.keys(l_v17_0), function(v22, v23) --[[ Line: 53 ]]
                    -- upvalues: l_v17_0 (copy)
                    local v24 = l_v17_0[v23];
                    table.insert(v22, {
                        id = v23, 
                        username = v24.username, 
                        displayName = v24.displayName
                    });
                    return v22;
                end, {});
            end;
        end, 
        isOfflineFrequents = function(v25) --[[ Line: 64 ]] --[[ Name: isOfflineFrequents ]]
            -- upvalues: l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy)
            local v26 = false;
            local v27 = false;
            local v28 = nil;
            local v29 = nil;
            for _, v31 in v25.profileInsights do
                if v31.offlineFrequentsInsight then
                    v28 = v31.offlineFrequentsInsight;
                    v26 = true;
                end;
                if v26 then
                    break;
                end;
            end;
            if not v26 then
                v28 = {};
            end;
            v26 = false;
            if l_FFlagPlayerSearchEnableOnlineFrequents_0 then
                for _, v33 in v25.profileInsights do
                    if v33.playedTogetherInsight then
                        v29 = v33.playedTogetherInsight;
                        v27 = true;
                    end;
                    if v27 then
                        break;
                    end;
                end;
                if not v27 then
                    v29 = {};
                end;
            else
                v29 = nil;
            end;
            v27 = false;
            if l_FFlagPlayerSearchEnableOnlineFrequents_0 then
                if v28 and v28.havePlayedTogether or v29 and v29.havePlayedTogether then
                    return true;
                else
                    return false;
                end;
            elseif v28 and v28.havePlayedTogether then
                return true;
            else
                return false;
            end;
        end, 
        friendshipAgeUnixSeconds = function(v34) --[[ Line: 80 ]] --[[ Name: friendshipAgeUnixSeconds ]]
            local v35 = false;
            local v36;
            for _, v38 in v34.profileInsights do
                if v38.friendshipAgeInsight then
                    v36 = v38.friendshipAgeInsight;
                    v35 = true;
                end;
                if v35 then
                    break;
                end;
            end;
            if not v35 then
                v36 = {};
            end;
            v35 = false;
            return v36.friendsSinceDateTime and v36.friendsSinceDateTime.seconds or -1;
        end, 
        friendRequestOriginSource = function(v39) --[[ Line: 85 ]] --[[ Name: friendRequestOriginSource ]]
            local v40 = false;
            local v41;
            for _, v43 in v39.profileInsights do
                if v43.friendRequestOriginInsight then
                    v41 = v43.friendRequestOriginInsight;
                    v40 = true;
                end;
                if v40 then
                    break;
                end;
            end;
            if not v40 then
                v41 = {};
            end;
            v40 = false;
            return v41.friendRequestOriginSource or -1;
        end, 
        accountCreationDateUnixSeconds = function(v44) --[[ Line: 90 ]] --[[ Name: accountCreationDateUnixSeconds ]]
            local v45 = false;
            local v46;
            for _, v48 in v44.profileInsights do
                if v48.accountCreationDateInsight then
                    v46 = v48.accountCreationDateInsight;
                    v45 = true;
                end;
                if v45 then
                    break;
                end;
            end;
            if not v45 then
                v46 = {};
            end;
            v45 = false;
            return v46.accountCreatedDateTime and v46.accountCreatedDateTime.seconds or -1;
        end, 
        localizedCountryName = function(v49) --[[ Line: 98 ]] --[[ Name: localizedCountryName ]]
            local v50 = false;
            local v51;
            for _, v53 in v49.profileInsights do
                if v53.accountLocationInsight then
                    v51 = v53.accountLocationInsight;
                    v50 = true;
                end;
                if v50 then
                    break;
                end;
            end;
            if not v50 then
                v51 = {};
            end;
            v50 = false;
            return v51 and v51.localizedCountryName or "";
        end, 
        userAgeVerifiedBracket = function(v54) --[[ Line: 102 ]] --[[ Name: userAgeVerifiedBracket ]]
            local v55 = false;
            local v56;
            for _, v58 in v54.profileInsights do
                if v58.userAgeVerifiedInsight then
                    v56 = v58.userAgeVerifiedInsight;
                    v55 = true;
                end;
                if v55 then
                    break;
                end;
            end;
            if not v55 then
                v56 = {};
            end;
            v55 = false;
            if v56 and v56.namespace and v56.verifiedAgeBandLabel then
                return (("%*.%*"):format(v56.namespace, v56.verifiedAgeBandLabel));
            else
                return "";
            end;
        end
    }, 
    ProfileInsightsPages = {
        id = function(v59) --[[ Line: 118 ]] --[[ Name: id ]]
            -- upvalues: l_HttpService_0 (copy)
            if v59.pageId then
                return v59.pageId;
            else
                return (l_HttpService_0:GenerateGUID(false));
            end;
        end, 
        profileInsights = function(v60) --[[ Line: 121 ]] --[[ Name: profileInsights ]]
            return v60.profileInsights;
        end
    }, 
    Query = {
        profilesInsights = function(_, v62, v63) --[[ Line: 127 ]] --[[ Name: profilesInsights ]]
            -- upvalues: l_findProfileInsightsByUserIdsFeed_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy)
            return l_findProfileInsightsByUserIdsFeed_0(v62.userIds, v62.count, v62.pageId, if l_FFlagPlayerSearchEnableOnlineFrequents_0 then v62.rankingStrategy else nil, v63.fetchImpl);
        end, 
        profilesInsightsByUserIds = function(_, v65, v66) --[[ Line: 136 ]] --[[ Name: profilesInsightsByUserIds ]]
            -- upvalues: l_findProfileInsightsByUserIds_0 (copy)
            return l_findProfileInsightsByUserIds_0(v65.userIds, v65.count, v65.rankingStrategy, v66.fetchImpl);
        end
    }
};