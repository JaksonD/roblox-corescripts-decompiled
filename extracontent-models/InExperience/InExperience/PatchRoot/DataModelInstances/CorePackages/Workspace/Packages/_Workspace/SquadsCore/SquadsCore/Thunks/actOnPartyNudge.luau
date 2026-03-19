local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.leaveSquad);
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_script_FirstAncestor_0.Analytics.logInExpCoplayTelemetry);
local v5 = require(l_script_FirstAncestor_0.Enums.SquadCoplayJoin);
local _ = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local v7 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local v8 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
local v9 = require(l_Parent_0.Promise);
local v10 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableSquadCoplayAnalytic_0 = v10.FFlagEnableSquadCoplayAnalytic;
local l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 = v10.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled;
local v13 = game:DefineFastFlag("FixPartyNudgeNilThunkWhenLeave", false);
local _ = function(v14, v15, v16, v17, v18, v19, v20) --[[ Line: 24 ]]
    -- upvalues: v8 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), v3 (copy), v5 (copy), v4 (copy), v7 (copy)
    return function(v21) --[[ Line: 33 ]]
        -- upvalues: v8 (ref), v14 (copy), v15 (copy), v19 (copy), v18 (copy), v20 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v3 (ref), v5 (ref), v4 (ref), v17 (copy), v16 (copy), v7 (ref)
        local v22 = v21:dispatch(v8.ActOnPartyNudge.API({
            action = v14, 
            nudgeId = v15, 
            leaveExisting = true, 
            partyAttemptId = v19, 
            squadLocation = v18, 
            parentChannelId = v20
        }));
        if l_FFlagEnableSquadCoplayAnalytic_0 then
            v22 = v22:andThen(function(v23) --[[ Line: 44 ]]
                -- upvalues: v14 (ref), v3 (ref), v5 (ref), v4 (ref), v18 (ref), v17 (ref)
                local v24 = true;
                if v14 ~= v3.ACCEPT_START_PARTY_REQUEST_ACTION then
                    v24 = v14 == v3.ACCEPT_PARTY_INVITE_ACTION;
                end;
                if v24 then
                    local l_groupUpId_0 = v23.responseBody.groupUp.groupUpId;
                    local l_members_0 = v23.responseBody.groupUp.members;
                    if l_groupUpId_0 and l_members_0 then
                        local v27 = if v14 == v3.ACCEPT_START_PARTY_REQUEST_ACTION then v5.SquadNudgeCreation else v5.SquadNudgeJoin;
                        v4(l_groupUpId_0, l_members_0, v18, v27, v17);
                    end;
                end;
            end);
        end;
        return v22:catch(function(_) --[[ Line: 65 ]]
            -- upvalues: v14 (ref), v3 (ref), v16 (ref), v21 (copy), v7 (ref)
            if v14 == v3.ACCEPT_START_PARTY_REQUEST_ACTION or v14 == v3.ACCEPT_PARTY_INVITE_ACTION then
                v16(v21, {
                    hideCancelButton = true, 
                    promptType = v7.Error
                });
            end;
        end);
    end;
end;
return function(v30, v31, v32, v33, v34, v35, v36, v37, v38) --[[ Line: 80 ]]
    -- upvalues: v8 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), v3 (copy), v5 (copy), v4 (copy), v7 (copy), v13 (copy), v9 (copy), v2 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy)
    return function(v39) --[[ Line: 91 ]]
        -- upvalues: v32 (copy), v30 (copy), v31 (copy), v33 (copy), v34 (copy), v35 (copy), v37 (copy), v38 (copy), v8 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v3 (ref), v5 (ref), v4 (ref), v7 (ref), v13 (ref), v9 (ref), v2 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v36 (copy)
        local v40 = v39:getState();
        local v41 = v40.Squad and v40.Squad.Squad and v40.Squad.Squad.currentSquad and v40.Squad.Squad.currentSquad.squadId;
        if not v41 or v41 == "" or not v32 then
            local l_v30_0 = v30;
            local l_v31_0 = v31;
            local l_v33_0 = v33;
            local l_v34_0 = v34;
            local l_v35_0 = v35;
            local l_v37_0 = v37;
            local l_v38_0 = v38;
            return v39:dispatch(function(v49) --[[ Line: 33 ]]
                -- upvalues: v8 (ref), l_v30_0 (copy), l_v31_0 (copy), l_v37_0 (copy), l_v35_0 (copy), l_v38_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v3 (ref), v5 (ref), v4 (ref), l_v34_0 (copy), l_v33_0 (copy), v7 (ref)
                local v50 = v49:dispatch(v8.ActOnPartyNudge.API({
                    action = l_v30_0, 
                    nudgeId = l_v31_0, 
                    leaveExisting = true, 
                    partyAttemptId = l_v37_0, 
                    squadLocation = l_v35_0, 
                    parentChannelId = l_v38_0
                }));
                if l_FFlagEnableSquadCoplayAnalytic_0 then
                    v50 = v50:andThen(function(v51) --[[ Line: 44 ]]
                        -- upvalues: l_v30_0 (ref), v3 (ref), v5 (ref), v4 (ref), l_v35_0 (ref), l_v34_0 (ref)
                        local v52 = true;
                        if l_v30_0 ~= v3.ACCEPT_START_PARTY_REQUEST_ACTION then
                            v52 = l_v30_0 == v3.ACCEPT_PARTY_INVITE_ACTION;
                        end;
                        if v52 then
                            local l_groupUpId_1 = v51.responseBody.groupUp.groupUpId;
                            local l_members_1 = v51.responseBody.groupUp.members;
                            if l_groupUpId_1 and l_members_1 then
                                local v55 = if l_v30_0 == v3.ACCEPT_START_PARTY_REQUEST_ACTION then v5.SquadNudgeCreation else v5.SquadNudgeJoin;
                                v4(l_groupUpId_1, l_members_1, l_v35_0, v55, l_v34_0);
                            end;
                        end;
                    end);
                end;
                return v50:catch(function(_) --[[ Line: 65 ]]
                    -- upvalues: l_v30_0 (ref), v3 (ref), l_v33_0 (ref), v49 (copy), v7 (ref)
                    if l_v30_0 == v3.ACCEPT_START_PARTY_REQUEST_ACTION or l_v30_0 == v3.ACCEPT_PARTY_INVITE_ACTION then
                        l_v33_0(v49, {
                            hideCancelButton = true, 
                            promptType = v7.Error
                        });
                    end;
                end);
            end);
        elseif v13 then
            return v9.new(function(v57, v58) --[[ Line: 113 ]]
                -- upvalues: v39 (copy), v2 (ref), v7 (ref), v33 (ref), v30 (ref), v31 (ref), v34 (ref), v35 (ref), v37 (ref), v38 (ref), v8 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v3 (ref), v5 (ref), v4 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v36 (ref)
                v39:dispatch(v2(v7.JoinAnotherSquad, v33, function() --[[ Line: 118 ]]
                    -- upvalues: v39 (ref), v30 (ref), v31 (ref), v33 (ref), v34 (ref), v35 (ref), v37 (ref), v38 (ref), v8 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v3 (ref), v5 (ref), v4 (ref), v7 (ref), v57 (copy), v58 (copy)
                    local l_v39_0 = v39;
                    local l_v30_1 = v30;
                    local l_v31_1 = v31;
                    local l_v33_1 = v33;
                    local l_v34_1 = v34;
                    local l_v35_1 = v35;
                    local l_v37_1 = v37;
                    local l_v38_1 = v38;
                    l_v39_0:dispatch(function(v67) --[[ Line: 33 ]]
                        -- upvalues: v8 (ref), l_v30_1 (copy), l_v31_1 (copy), l_v37_1 (copy), l_v35_1 (copy), l_v38_1 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v3 (ref), v5 (ref), v4 (ref), l_v34_1 (copy), l_v33_1 (copy), v7 (ref)
                        local v68 = v67:dispatch(v8.ActOnPartyNudge.API({
                            action = l_v30_1, 
                            nudgeId = l_v31_1, 
                            leaveExisting = true, 
                            partyAttemptId = l_v37_1, 
                            squadLocation = l_v35_1, 
                            parentChannelId = l_v38_1
                        }));
                        if l_FFlagEnableSquadCoplayAnalytic_0 then
                            v68 = v68:andThen(function(v69) --[[ Line: 44 ]]
                                -- upvalues: l_v30_1 (ref), v3 (ref), v5 (ref), v4 (ref), l_v35_1 (ref), l_v34_1 (ref)
                                local v70 = true;
                                if l_v30_1 ~= v3.ACCEPT_START_PARTY_REQUEST_ACTION then
                                    v70 = l_v30_1 == v3.ACCEPT_PARTY_INVITE_ACTION;
                                end;
                                if v70 then
                                    local l_groupUpId_2 = v69.responseBody.groupUp.groupUpId;
                                    local l_members_2 = v69.responseBody.groupUp.members;
                                    if l_groupUpId_2 and l_members_2 then
                                        local v73 = if l_v30_1 == v3.ACCEPT_START_PARTY_REQUEST_ACTION then v5.SquadNudgeCreation else v5.SquadNudgeJoin;
                                        v4(l_groupUpId_2, l_members_2, l_v35_1, v73, l_v34_1);
                                    end;
                                end;
                            end);
                        end;
                        return v68:catch(function(_) --[[ Line: 65 ]]
                            -- upvalues: l_v30_1 (ref), v3 (ref), l_v33_1 (ref), v67 (copy), v7 (ref)
                            if l_v30_1 == v3.ACCEPT_START_PARTY_REQUEST_ACTION or l_v30_1 == v3.ACCEPT_PARTY_INVITE_ACTION then
                                l_v33_1(v67, {
                                    hideCancelButton = true, 
                                    promptType = v7.Error
                                });
                            end;
                        end);
                    end):andThen(v57):catch(v58);
                end, v35, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v36));
            end);
        else
            return v39:dispatch(v2(v7.JoinAnotherSquad, v33, function() --[[ Line: 140 ]]
                -- upvalues: v39 (copy), v30 (ref), v31 (ref), v33 (ref), v34 (ref), v35 (ref), v37 (ref), v38 (ref), v8 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v3 (ref), v5 (ref), v4 (ref), v7 (ref)
                local l_v39_1 = v39;
                local l_v30_2 = v30;
                local l_v31_2 = v31;
                local l_v33_2 = v33;
                local l_v34_2 = v34;
                local l_v35_2 = v35;
                local l_v37_2 = v37;
                local l_v38_2 = v38;
                l_v39_1:dispatch(function(v83) --[[ Line: 33 ]]
                    -- upvalues: v8 (ref), l_v30_2 (copy), l_v31_2 (copy), l_v37_2 (copy), l_v35_2 (copy), l_v38_2 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v3 (ref), v5 (ref), v4 (ref), l_v34_2 (copy), l_v33_2 (copy), v7 (ref)
                    local v84 = v83:dispatch(v8.ActOnPartyNudge.API({
                        action = l_v30_2, 
                        nudgeId = l_v31_2, 
                        leaveExisting = true, 
                        partyAttemptId = l_v37_2, 
                        squadLocation = l_v35_2, 
                        parentChannelId = l_v38_2
                    }));
                    if l_FFlagEnableSquadCoplayAnalytic_0 then
                        v84 = v84:andThen(function(v85) --[[ Line: 44 ]]
                            -- upvalues: l_v30_2 (ref), v3 (ref), v5 (ref), v4 (ref), l_v35_2 (ref), l_v34_2 (ref)
                            local v86 = true;
                            if l_v30_2 ~= v3.ACCEPT_START_PARTY_REQUEST_ACTION then
                                v86 = l_v30_2 == v3.ACCEPT_PARTY_INVITE_ACTION;
                            end;
                            if v86 then
                                local l_groupUpId_3 = v85.responseBody.groupUp.groupUpId;
                                local l_members_3 = v85.responseBody.groupUp.members;
                                if l_groupUpId_3 and l_members_3 then
                                    local v89 = if l_v30_2 == v3.ACCEPT_START_PARTY_REQUEST_ACTION then v5.SquadNudgeCreation else v5.SquadNudgeJoin;
                                    v4(l_groupUpId_3, l_members_3, l_v35_2, v89, l_v34_2);
                                end;
                            end;
                        end);
                    end;
                    return v84:catch(function(_) --[[ Line: 65 ]]
                        -- upvalues: l_v30_2 (ref), v3 (ref), l_v33_2 (ref), v83 (copy), v7 (ref)
                        if l_v30_2 == v3.ACCEPT_START_PARTY_REQUEST_ACTION or l_v30_2 == v3.ACCEPT_PARTY_INVITE_ACTION then
                            l_v33_2(v83, {
                                hideCancelButton = true, 
                                promptType = v7.Error
                            });
                        end;
                    end);
                end);
            end, v35, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v36));
        end;
    end;
end;