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
local v10 = game:DefineFastFlag("FriendingOSAUseHook", false);
local function v11() --[[ Line: 23 ]] --[[ Name: isHiddenOnInit ]]
    -- upvalues: v8 (copy)
    return v8.getValue() ~= 0;
end;
return function(v12) --[[ Line: 28 ]] --[[ Name: FriendingOSAEducationSubtitle ]]
    -- upvalues: v10 (copy), v9 (copy), v2 (copy), l_Text_0 (copy), v11 (copy), v7 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), v6 (copy), v8 (copy)
    local l_layoutOrder_0 = v12.layoutOrder;
    if v10 then
        local v14 = v9();
        if v14 then
            return (v2.createElement(l_Text_0, {
                tag = "auto-y grow size-full-0 text-align-x-left text-wrap", 
                Text = v14, 
                LayoutOrder = l_layoutOrder_0
            }));
        else
            return nil;
        end;
    else
        local v15 = v2.useState(v11);
        local v16 = v7();
        local v18 = l_useAppPolicy_0(function(v17) --[[ Line: 46 ]]
            return v17.getRequiresOSAFriendingEducation();
        end);
        local v19 = l_useLocalization_0({
            educationText = "Feature.Friends.Subtitle.ConnectionsEducation"
        });
        local v20 = v18 and not v15;
        local v21 = v2.useCallback(function() --[[ Line: 56 ]]
            -- upvalues: v16 (copy), v6 (ref), v8 (ref)
            v16(v6.FriendingOSAEducationSubtitleImpression);
            v8.incrementValue();
        end, {
            v16
        });
        v2.useEffect(function() --[[ Line: 62 ]]
            -- upvalues: v20 (copy), v21 (copy)
            if v20 then
                v21();
            end;
        end, {
            v20
        });
        if v20 then
            return (v2.createElement(l_Text_0, {
                tag = "auto-y grow size-full-0 text-align-x-left text-wrap", 
                Text = v19.educationText, 
                LayoutOrder = l_layoutOrder_0
            }));
        else
            return nil;
        end;
    end;
end;