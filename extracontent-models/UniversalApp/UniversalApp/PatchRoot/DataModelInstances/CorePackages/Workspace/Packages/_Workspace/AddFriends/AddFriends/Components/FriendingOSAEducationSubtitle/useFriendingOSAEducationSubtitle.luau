local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v6 = require(l_script_FirstAncestor_0.Analytics.useFireAnalyticsEvent);
local v7 = require(script.Parent.FriendingOSAEducationImpressionCache);
local function v8() --[[ Line: 14 ]] --[[ Name: isHiddenOnInit ]]
    -- upvalues: v7 (copy)
    return v7.getValue() ~= 0;
end;
return function() --[[ Line: 19 ]] --[[ Name: useFriendingOSAEducationSubtitle ]]
    -- upvalues: v2 (copy), v8 (copy), v6 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), v5 (copy), v7 (copy)
    local v9 = v2.useState(v8);
    local v10 = v6();
    local v12 = l_useAppPolicy_0(function(v11) --[[ Line: 24 ]]
        return v11.getRequiresOSAFriendingEducation();
    end);
    local v13 = l_useLocalization_0({
        educationText = "Feature.Friends.Subtitle.ConnectionsEducation"
    });
    local v14 = v12 and not v9;
    local v15 = v2.useCallback(function() --[[ Line: 34 ]]
        -- upvalues: v10 (copy), v5 (ref), v7 (ref)
        v10(v5.FriendingOSAEducationSubtitleImpression);
        v7.incrementValue();
    end, {
        v10
    });
    v2.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v14 (copy), v15 (copy)
        if v14 then
            v15();
        end;
    end, {
        v14
    });
    if v14 then
        return v13.educationText;
    else
        return nil;
    end;
end;