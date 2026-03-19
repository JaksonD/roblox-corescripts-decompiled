local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabState");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_AppChatNetworking_0 = v1.AppChatNetworking;
local v4 = require(l_script_FirstAncestor_0.Requests.GetUnreadConversationCount);
return l_Rodux_0.createReducer(0, {
    [v4.Succeeded.name] = function(v5, v6) --[[ Line: 11 ]]
        if v6.responseBody and v6.responseBody.count then
            return v6.responseBody.count;
        else
            return v5;
        end;
    end, 
    [l_AppChatNetworking_0.rodux.GetConversationMetadata.Succeeded.name] = function(v7, v8) --[[ Line: 18 ]]
        if v8.responseBody and v8.responseBody.global_unread_count then
            return v8.responseBody.global_unread_count;
        else
            return v7;
        end;
    end, 
    [l_AppChatNetworking_0.rodux.ClearGlobalUnreadCount.Succeeded.name] = function(v9, v10) --[[ Line: 26 ]]
        if v10.responseBody and v10.responseBody.status == "success" then
            return 0;
        else
            return v9;
        end;
    end
});