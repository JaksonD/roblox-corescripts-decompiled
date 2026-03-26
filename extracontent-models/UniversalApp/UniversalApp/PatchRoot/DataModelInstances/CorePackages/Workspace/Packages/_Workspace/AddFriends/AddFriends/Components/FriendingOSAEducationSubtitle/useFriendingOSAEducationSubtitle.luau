local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v6 = require(l_script_FirstAncestor_0.Analytics.useFireAnalyticsEvent);
local v7 = require(script.Parent.FriendingOSAEducationImpressionCache);
local l_FFlagConnectionsToFriendsRenameP1_v1_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRenameP1_v1;
local function v9() --[[ Line: 16 ]] --[[ Name: isHiddenOnInit ]]
    -- upvalues: v7 (copy)
    return v7.getValue() ~= 0;
end;
return function() --[[ Line: 21 ]] --[[ Name: useFriendingOSAEducationSubtitle ]]
    -- upvalues: v2 (copy), v9 (copy), v6 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRenameP1_v1_0 (copy), v5 (copy), v7 (copy)
    local v10 = v2.useState(v9);
    local v11 = v6();
    local v13 = l_useAppPolicy_0(function(v12) --[[ Line: 26 ]]
        return v12.getRequiresOSAFriendingEducation();
    end);
    local v14 = l_useLocalization_0({
        educationText = l_FFlagConnectionsToFriendsRenameP1_v1_0 and "Feature.Friends.Subtitle.FriendsEducation" or "Feature.Friends.Subtitle.ConnectionsEducation"
    });
    local v15 = v13 and not v10;
    local v16 = v2.useCallback(function() --[[ Line: 38 ]]
        -- upvalues: v11 (copy), v5 (ref), v7 (ref)
        v11(v5.FriendingOSAEducationSubtitleImpression);
        v7.incrementValue();
    end, {
        v11
    });
    v2.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v15 (copy), v16 (copy)
        if v15 then
            v16();
        end;
    end, {
        v15
    });
    if v15 then
        return v14.educationText;
    else
        return nil;
    end;
end;