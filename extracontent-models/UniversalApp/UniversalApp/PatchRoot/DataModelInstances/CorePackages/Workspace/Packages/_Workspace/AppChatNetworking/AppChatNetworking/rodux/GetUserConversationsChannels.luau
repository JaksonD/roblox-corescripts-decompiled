local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local v2 = require(script.Parent.RoduxNetworking);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_GetFFlagEnableSocialCards_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSocialCards;
return v2.GET(script.Name, function(v6, v7) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), l_GetFFlagEnableSocialCards_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
    return v6(v1):path("v1"):path("get-user-conversations"):queryArgs({
        cursor = v7, 
        include_cards = l_GetFFlagEnableSocialCards_0() and true or false, 
        include_user_data = true, 
        include_messages = true, 
        check_for_group_up = l_GetFFlagIsSquadEnabled_0() and true or false
    });
end);