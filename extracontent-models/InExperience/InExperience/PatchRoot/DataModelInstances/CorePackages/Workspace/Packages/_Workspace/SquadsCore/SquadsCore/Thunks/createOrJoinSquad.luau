local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Analytics.logInExpCoplayTelemetry);
local v3 = require(l_script_FirstAncestor_0.Enums.SquadCoplayJoin);
local _ = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local v5 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local v6 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
local v7 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableSquadCoplayAnalytic_0 = v7.FFlagEnableSquadCoplayAnalytic;
local l_FFlagEnableScheduledSquads_0 = v7.FFlagEnableScheduledSquads;
return function(v10, v11, v12, v13, v14, v15, v16) --[[ Line: 18 ]]
    -- upvalues: v6 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_FFlagEnableScheduledSquads_0 (copy), v2 (copy), v3 (copy), v5 (copy)
    return function(v17) --[[ Line: 27 ]]
        -- upvalues: v6 (ref), v10 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v13 (copy), v14 (copy), l_FFlagEnableScheduledSquads_0 (ref), v16 (copy), v2 (ref), v3 (ref), v12 (copy), v11 (copy), v5 (ref), v15 (copy)
        local v18 = v17:dispatch(v6.CreateOrJoinSquad.API({
            parentChannelId = v10, 
            leaveExisting = true, 
            squadLocation = if l_FFlagEnableSquadCoplayAnalytic_0 then v13 else nil, 
            partyAttemptId = v14, 
            scheduledSquadId = if l_FFlagEnableScheduledSquads_0 then v16 else nil
        }));
        if l_FFlagEnableSquadCoplayAnalytic_0 then
            v18 = v18:andThen(function(v19) --[[ Line: 37 ]]
                -- upvalues: v2 (ref), v13 (ref), v3 (ref), v12 (ref)
                local l_groupUpId_0 = v19.responseBody.groupUp.groupUpId;
                local l_members_0 = v19.responseBody.groupUp.members;
                if l_groupUpId_0 and l_members_0 then
                    v2(l_groupUpId_0, l_members_0, v13, v3.PartyJoin, v12);
                end;
            end);
        end;
        return v18:catch(function(_) --[[ Line: 53 ]]
            -- upvalues: v11 (ref), v17 (copy), v5 (ref), v15 (ref)
            v11(v17, {
                hideCancelButton = true, 
                promptType = v5.Error, 
                onConfirm = v15
            });
        end);
    end;
end;