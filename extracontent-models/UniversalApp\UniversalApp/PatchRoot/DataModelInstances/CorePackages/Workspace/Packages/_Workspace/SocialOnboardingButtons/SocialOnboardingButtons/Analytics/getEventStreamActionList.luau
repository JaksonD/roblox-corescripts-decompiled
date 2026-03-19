local l_Parent_0 = script:FindFirstAncestor("SocialOnboardingButtons").Parent;
local l_EventTypes_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.EventTypes;
local v2 = require(script.Parent.EventNames);
local v3 = require(script.Parent.BtnValues);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_EventTypes_0 (copy), v3 (copy)
    return {
        [v2.AddFriendsBtn] = {
            context = v4, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v3.AddFriends
            }
        }, 
        [v2.FindContactsBtn] = {
            context = v4, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v3.FindContacts
            }
        }, 
        [v2.MyQRCodeBtn] = {
            context = v4, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v3.MyQRCode
            }
        }, 
        [v2.SearchPeopleBtn] = {
            context = v4, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v3.SearchPeople
            }
        }, 
        [v2.UnlockVoiceBtn] = {
            context = v4, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v3.UnlockVoice
            }
        }, 
        [v2.MyProfileBtn] = {
            context = v4, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v3.MyProfile
            }
        }
    };
end;