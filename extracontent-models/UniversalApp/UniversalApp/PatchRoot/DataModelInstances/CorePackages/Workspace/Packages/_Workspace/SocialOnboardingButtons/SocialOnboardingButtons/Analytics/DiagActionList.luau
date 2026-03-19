local l_Parent_0 = script:FindFirstAncestor("SocialOnboardingButtons").Parent;
local l_DiagEventTypes_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
local v2 = require(script.Parent.EventNames);
return {
    [v2.AddFriendsBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("AddFriendsBtnCounter", "AddFriendsBtnCounter")
    }, 
    [v2.FindContactsBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("FindContactsBtnCounter", "FindContactsBtnCounter")
    }, 
    [v2.MyQRCodeBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("MyQRCodeBtnCounter", "MyQRCodeBtnCounter")
    }, 
    [v2.SearchPeopleBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("SearchPeopleBtnCounter", "SearchPeopleBtnCounter")
    }, 
    [v2.UnlockVoiceBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UnlockVoiceBtnCounter", "UnlockVoiceBtnCounter")
    }, 
    [v2.MyProfileBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("MyProfileBtnCounter", "MyProfileBtnCounter")
    }
};