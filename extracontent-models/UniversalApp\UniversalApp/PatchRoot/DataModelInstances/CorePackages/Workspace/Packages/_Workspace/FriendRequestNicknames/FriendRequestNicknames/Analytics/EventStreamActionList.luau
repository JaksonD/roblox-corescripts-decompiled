local l_Parent_0 = script:FindFirstAncestor("FriendRequestNicknames").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local v2 = require(script.Parent.EventNames);
local l_Enums_0 = v1.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local function v7(v6) --[[ Line: 10 ]]
    return v6;
end;
return {
    [v2.SetNicknameModalOpened] = {
        context = l_Contexts_0.SetNicknameModal, 
        eventType = l_EventTypes_0.PageLoad, 
        formatRulesForAdditionalInfo = {
            friendshipOriginSourceType = v7, 
            previousNicknames = v7
        }
    }, 
    [v2.SetNicknameSkipClicked] = {
        context = l_Contexts_0.SetNicknameModal, 
        additionalInfo = {
            btn = v2.SetNicknameSkipClicked
        }, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            friendshipOriginSourceType = v7, 
            previousNicknames = v7
        }
    }, 
    [v2.SetNicknameAddNameClicked] = {
        context = l_Contexts_0.SetNicknameModal, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v2.SetNicknameAddNameClicked
        }, 
        formatRulesForAdditionalInfo = {
            friendshipOriginSourceType = v7, 
            previousNicknames = v7, 
            submittedNickname = v7
        }
    }
};