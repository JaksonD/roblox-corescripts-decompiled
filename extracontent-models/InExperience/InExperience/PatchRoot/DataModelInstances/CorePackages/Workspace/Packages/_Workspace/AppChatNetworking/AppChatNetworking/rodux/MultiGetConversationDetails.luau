local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local v3 = require(script.Parent.RoduxNetworking);
local l_GetFFlagEnableSocialCards_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSocialCards;
return v3.POST(script.Name, function(v5, v6) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), l_GetFFlagEnableSocialCards_0 (copy)
    return v5(v2):path("v1"):path("get-conversations"):body({
        ids = v6, 
        include_cards = l_GetFFlagEnableSocialCards_0() and true or false, 
        include_participants = true, 
        include_user_data = true, 
        include_messages = true, 
        check_for_group_up = true
    }):setStatusIds(v6);
end);