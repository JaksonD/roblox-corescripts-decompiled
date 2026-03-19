local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local v3 = require(script.Parent.RoduxNetworking);
local v4 = require(l_script_FirstAncestor_0.Constants);
local l_GetFFlagEnableSocialCards_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSocialCards;
return v3.GET(script.Name, function(v6, v7, v8) --[[ Line: 17 ]]
    -- upvalues: v2 (copy), v4 (copy), l_GetFFlagEnableSocialCards_0 (copy)
    return v6(v2):path("v1"):path("get-conversation-messages"):queryArgs({
        conversation_id = v7, 
        cursor = v8, 
        v4.PageSize.GET_NEW_MESSAGES, 
        include_cards = l_GetFFlagEnableSocialCards_0() and true or false
    }):setStatusIds({
        v7
    });
end);