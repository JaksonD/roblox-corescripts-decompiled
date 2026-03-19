local l_HttpService_0 = game:GetService("HttpService");
return function(v1) --[[ Line: 3 ]] --[[ Name: parseCreateConversationErrors ]]
    -- upvalues: l_HttpService_0 (copy)
    if v1.StatusCode == 403 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
            -- upvalues: l_HttpService_0 (ref), v1 (copy)
            return l_HttpService_0:JSONDecode(v1.Body);
        end);
        if l_status_0 and l_result_0 and l_result_0.reason_code == "participant_chat_disabled" then
            return "participant_chat_disabled";
        end;
    end;
    return "unknown";
end;