local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy)
    return function(v4) --[[ Line: 15 ]]
        -- upvalues: v3 (copy), l_HttpService_0 (ref), v2 (ref)
        v4:dispatch(v3.squadContext.createConversation(v3.conversationType, v3.userIds, nil, v3.source)):andThen(function(v5) --[[ Line: 20 ]]
            -- upvalues: v3 (ref)
            if v3.onSuccessCallback then
                v3.onSuccessCallback(v5.id);
            end;
        end):catch(function(v6) --[[ Line: 25 ]]
            -- upvalues: l_HttpService_0 (ref), v3 (ref), v4 (copy), v2 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
                -- upvalues: l_HttpService_0 (ref), v6 (copy)
                return l_HttpService_0:JSONDecode(v6.Body);
            end);
            v3.squadContext.setSquadPrompt(v4, {
                hideCancelButton = true, 
                promptType = if l_status_0 and l_result_0 and l_result_0.reason_code == "participant_chat_disabled" then v2.ParticipantChatDisabled else v2.Error
            });
            if v3.onErrorCallback then
                v3.onErrorCallback();
            end;
        end);
    end;
end;