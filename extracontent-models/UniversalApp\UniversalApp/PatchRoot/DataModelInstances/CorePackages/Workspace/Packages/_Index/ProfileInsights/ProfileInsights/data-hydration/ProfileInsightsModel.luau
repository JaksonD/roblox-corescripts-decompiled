local l_Parent_0 = script:FindFirstAncestor("ProfileInsights").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
local l_FFlagPlayerSearchEnableOnlineFrequents_0 = require(l_Parent_0.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents;
local function v19(v4, v5) --[[ Line: 39 ]] --[[ Name: createProfileInsight ]]
    -- upvalues: v1 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy)
    local v6 = {
        userId = v4, 
        mutualFriends = {}, 
        targetUserId = "", 
        isOfflineFrequents = false
    };
    if not v5 or type(v5) ~= "table" then
        return v6;
    else
        if v5.targetUser then
            v6.targetUserId = tostring(v5.targetUser);
        end;
        for _, v8 in v5.profileInsights do
            if v8.mutualFriendInsight and v8.mutualFriendInsight.mutualFriends then
                local l_mutualFriends_0 = v8.mutualFriendInsight.mutualFriends;
                local l_l_mutualFriends_0_0 = l_mutualFriends_0 --[[ copy: 8 -> 9 ]];
                v6.mutualFriends = v1.List.foldLeft(v1.Dictionary.keys(l_mutualFriends_0), function(v11, v12) --[[ Line: 58 ]]
                    -- upvalues: l_l_mutualFriends_0_0 (copy)
                    local v13 = l_l_mutualFriends_0_0[v12];
                    table.insert(v11, {
                        id = v12, 
                        username = v13.username, 
                        displayName = v13.displayName
                    });
                    return v11;
                end, {});
            end;
            if v8.offlineFrequentsInsight then
                v6.isOfflineFrequents = v8.offlineFrequentsInsight.havePlayedTogether;
            end;
            if l_FFlagPlayerSearchEnableOnlineFrequents_0 and v8.playedTogetherInsight then
                local l_playedTogetherInsight_0 = v8.playedTogetherInsight;
                v6.isOfflineFrequents = v6.isOfflineFrequents or l_playedTogetherInsight_0.havePlayedTogether;
            end;
            if v8.friendshipAgeInsight then
                local l_friendshipAgeInsight_0 = v8.friendshipAgeInsight;
                v6.friendshipAgeUnixSeconds = l_friendshipAgeInsight_0.friendsSinceDateTime and l_friendshipAgeInsight_0.friendsSinceDateTime.seconds or -1;
            end;
            if v8.friendRequestOriginInsight then
                v6.friendRequestOriginSource = v8.friendRequestOriginInsight.friendRequestOriginSource or -1;
            end;
            if v8.accountCreationDateInsight then
                local l_accountCreationDateInsight_0 = v8.accountCreationDateInsight;
                v6.accountCreationDateUnixSeconds = l_accountCreationDateInsight_0.accountCreatedDateTime and l_accountCreationDateInsight_0.accountCreatedDateTime.seconds or -1;
            end;
            if v8.accountLocationInsight then
                local l_accountLocationInsight_0 = v8.accountLocationInsight;
                v6.localizedCountryName = l_accountLocationInsight_0 and l_accountLocationInsight_0.localizedCountryName or "";
            end;
            if v8.accountCreationDateInsight then
                local l_accountCreationDateInsight_1 = v8.accountCreationDateInsight;
                if l_accountCreationDateInsight_1 and l_accountCreationDateInsight_1.namespace and l_accountCreationDateInsight_1.verifiedAgeBandLabel then
                    v6.userAgeVerifiedBracket = ("%*.%*"):format(l_accountCreationDateInsight_1.namespace, l_accountCreationDateInsight_1.verifiedAgeBandLabel);
                end;
            end;
        end;
        return v6;
    end;
end;
return {
    createProfileInsightsSignalList = function() --[[ Line: 135 ]] --[[ Name: createProfileInsightsSignalList ]]
        -- upvalues: l_createSignal_0 (copy)
        local v20, v21 = l_createSignal_0({});
        return {
            getProfileInsights = v20, 
            setProfileInsights = v21
        };
    end, 
    createProfileInsightsList = function(v22) --[[ Line: 120 ]] --[[ Name: createProfileInsightsList ]]
        -- upvalues: v19 (copy)
        local v23 = {};
        if not v22 or type(v22) ~= "table" then
            return v23;
        else
            for _, v25 in v22 do
                table.insert(v23, (v19(v25.targetUser, v25)));
            end;
            return v23;
        end;
    end, 
    createProfileInsight = v19
};