local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_HttpService_0 = game:GetService("HttpService");
local l_SquadPromptType_0 = require(l_script_FirstAncestor_0.dependencies).SquadsCore.Enums.SquadPromptType;
return function(v3) --[[ Line: 8 ]]
    -- upvalues: l_HttpService_0 (copy), l_SquadPromptType_0 (copy)
    return function(v4) --[[ Line: 16 ]]
        -- upvalues: v3 (copy), l_HttpService_0 (ref), l_SquadPromptType_0 (ref)
        return v3.squadExternalContext.inviteToParentChannel(v3.dispatch, v3.parentChannel, v3.userIds):andThen(function(v5) --[[ Line: 19 ]]
            -- upvalues: v3 (ref)
            if v3.onSuccessCallback then
                v3.onSuccessCallback(v5);
            end;
        end):catch(function(v6) --[[ Line: 24 ]]
            -- upvalues: l_HttpService_0 (ref), v3 (ref), v4 (copy), l_SquadPromptType_0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 25 ]]
                -- upvalues: l_HttpService_0 (ref), v6 (copy)
                return l_HttpService_0:JSONDecode(v6.Body);
            end);
            v3.squadExternalContext.setSquadPrompt(v4, {
                hideCancelButton = true, 
                promptType = if l_status_0 and l_result_0 and l_result_0.reason_code == "participant_chat_disabled" then l_SquadPromptType_0.ParticipantChatDisabled else l_SquadPromptType_0.Error
            });
            if v3.onErrorCallback then
                v3.onErrorCallback();
            end;
        end);
    end;
end;