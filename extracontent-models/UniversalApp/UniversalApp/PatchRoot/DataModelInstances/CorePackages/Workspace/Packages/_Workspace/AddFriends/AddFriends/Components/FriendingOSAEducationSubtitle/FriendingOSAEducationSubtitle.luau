local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Text_0 = require(l_Parent_0.Foundation).Text;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v7 = require(l_script_FirstAncestor_0.Analytics.useFireAnalyticsEvent);
local v8 = require(script.Parent.FriendingOSAEducationImpressionCache);
local v9 = require(script.Parent.useFriendingOSAEducationSubtitle);
local l_FFlagConnectionsToFriendsRenameP1_v1_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRenameP1_v1;
local v11 = game:DefineFastFlag("FriendingOSAUseHook", false);
local function v12() --[[ Line: 25 ]] --[[ Name: isHiddenOnInit ]]
    -- upvalues: v8 (copy)
    return v8.getValue() ~= 0;
end;
return function(v13) --[[ Line: 30 ]] --[[ Name: FriendingOSAEducationSubtitle ]]
    -- upvalues: v11 (copy), v9 (copy), v2 (copy), l_Text_0 (copy), v12 (copy), v7 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRenameP1_v1_0 (copy), v6 (copy), v8 (copy)
    local l_layoutOrder_0 = v13.layoutOrder;
    if v11 then
        local v15 = v9();
        if v15 then
            return (v2.createElement(l_Text_0, {
                tag = "auto-y grow size-full-0 text-align-x-left text-wrap", 
                Text = v15, 
                LayoutOrder = l_layoutOrder_0
            }));
        else
            return nil;
        end;
    else
        local v16 = v2.useState(v12);
        local v17 = v7();
        local v19 = l_useAppPolicy_0(function(v18) --[[ Line: 48 ]]
            return v18.getRequiresOSAFriendingEducation();
        end);
        local v20 = l_useLocalization_0({
            educationText = l_FFlagConnectionsToFriendsRenameP1_v1_0 and "Feature.Friends.Subtitle.FriendsEducation" or "Feature.Friends.Subtitle.ConnectionsEducation"
        });
        local v21 = v19 and not v16;
        local v22 = v2.useCallback(function() --[[ Line: 60 ]]
            -- upvalues: v17 (copy), v6 (ref), v8 (ref)
            v17(v6.FriendingOSAEducationSubtitleImpression);
            v8.incrementValue();
        end, {
            v17
        });
        v2.useEffect(function() --[[ Line: 66 ]]
            -- upvalues: v21 (copy), v22 (copy)
            if v21 then
                v22();
            end;
        end, {
            v21
        });
        if v21 then
            return (v2.createElement(l_Text_0, {
                tag = "auto-y grow size-full-0 text-align-x-left text-wrap", 
                Text = v20.educationText, 
                LayoutOrder = l_layoutOrder_0
            }));
        else
            return nil;
        end;
    end;
end;