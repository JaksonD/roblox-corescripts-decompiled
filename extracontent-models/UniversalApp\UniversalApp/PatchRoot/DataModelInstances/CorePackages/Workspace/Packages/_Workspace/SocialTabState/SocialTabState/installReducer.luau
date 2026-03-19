local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabState");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_ShowContactImporterParams_0 = v1.ShowContactImporterParams;
return function() --[[ Line: 8 ]]
    -- upvalues: l_Rodux_0 (copy), l_ShowContactImporterParams_0 (copy), l_RoduxNetworking_0 (copy)
    return l_Rodux_0.combineReducers({
        Users = require(script.Users), 
        Friends = require(script.Friends), 
        Presence = require(script.Presence), 
        PremiumByUserId = require(script.PremiumByUserId), 
        ShowContactImporterParams = l_ShowContactImporterParams_0, 
        NetworkStatus = l_RoduxNetworking_0.installReducer(), 
        UnreadConversationCount = require(script.UnreadConversationCount)
    });
end;