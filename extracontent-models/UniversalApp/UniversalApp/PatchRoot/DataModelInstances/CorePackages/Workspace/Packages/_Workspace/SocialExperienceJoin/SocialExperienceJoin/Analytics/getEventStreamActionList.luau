local l_Parent_0 = script:FindFirstAncestor("SocialExperienceJoin").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_Contexts_0 = v1.Analytics.Enums.Contexts;
local l_EventTypes_0 = v1.Analytics.Enums.EventTypes;
local l_SubPages_0 = v1.Analytics.Enums.SubPages;
local v5 = require(script.Parent.EventNames);
local v6 = require(script.Parent.BtnValues);
local function v8(v7) --[[ Line: 10 ]]
    return v7;
end;
local l_PlayerProfile_0 = l_Contexts_0.PlayerProfile;
local l_PeekView_0 = l_SubPages_0.PeekView;
return function(v11) --[[ Line: 17 ]]
    -- upvalues: l_PlayerProfile_0 (copy), l_PeekView_0 (copy), v5 (copy), l_EventTypes_0 (copy), v6 (copy), v8 (copy)
    local v12 = v11 and v11.context or l_PlayerProfile_0;
    local v13 = v11 and v11.subpage or l_PeekView_0;
    return {
        [v5.JoinExperience] = {
            context = v12, 
            eventType = l_EventTypes_0.JoinGameInPeopleList, 
            additionalInfo = {
                btn = v6.JoinExperience, 
                subpage = v13
            }, 
            formatRulesForAdditionalInfo = {
                placeId = v8, 
                rootPlaceId = v8, 
                gameInstanceId = v8, 
                profileUserId = v8, 
                uid = v8, 
                isHomePageCarousel = v8, 
                absolutePosition = v8, 
                joinAttemptId = v8, 
                status = v8
            }
        }, 
        [v5.PurchaseExperience] = {
            context = v12, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v6.PurchaseExperience, 
                subpage = v13
            }, 
            formatRulesForAdditionalInfo = {
                profileUserId = v8, 
                uid = v8
            }
        }, 
        [v5.PurchaseExperienceAttempt] = {
            context = v12, 
            eventType = l_EventTypes_0.PurchaseExperienceAttempt, 
            additionalInfo = {
                subpage = v13
            }, 
            formatRulesForAdditionalInfo = {
                universeId = v8, 
                profileUserId = v8, 
                status = v8
            }
        }, 
        [v5.CancelPurchaseExperience] = {
            context = v12, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v6.CancelPurchaseExperience, 
                subpage = v13
            }, 
            formatRulesForAdditionalInfo = {
                universeId = v8, 
                profileUserId = v8
            }
        }, 
        [v5.UnableToJoinViewDetails] = {
            context = v12, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v6.UnableToJoinViewDetails, 
                subpage = v13
            }, 
            formatRulesForAdditionalInfo = {
                universeId = v8, 
                profileUserId = v8
            }
        }, 
        [v5.UnableToJoinCancel] = {
            context = v12, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v6.UnableToJoinCancel, 
                subpage = v13
            }, 
            formatRulesForAdditionalInfo = {
                universeId = v8, 
                profileUserId = v8
            }
        }
    };
end;