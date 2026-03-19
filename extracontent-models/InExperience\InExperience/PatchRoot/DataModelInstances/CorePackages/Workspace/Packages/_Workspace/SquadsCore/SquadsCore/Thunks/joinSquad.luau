local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.leaveSquad);
local v3 = require(l_script_FirstAncestor_0.Analytics.logInExpCoplayTelemetry);
local v4 = require(l_script_FirstAncestor_0.Enums.SquadCoplayJoin);
local _ = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local v6 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local v7 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
local v8 = require(l_Parent_0.Promise);
local v9 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableSquadCoplayAnalytic_0 = v9.FFlagEnableSquadCoplayAnalytic;
local l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 = v9.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled;
local _ = function(v12, v13, v14, v15) --[[ Line: 22 ]]
    -- upvalues: v7 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), v3 (copy), v4 (copy), v6 (copy)
    return function(v16) --[[ Line: 28 ]]
        -- upvalues: v7 (ref), v12 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v15 (copy), v3 (ref), v4 (ref), v14 (copy), v13 (copy), v6 (ref)
        local v17 = v16:dispatch(v7.JoinSquad.API({
            squadId = v12, 
            leaveExisting = true, 
            squadLocation = if l_FFlagEnableSquadCoplayAnalytic_0 then v15 else nil
        }));
        if l_FFlagEnableSquadCoplayAnalytic_0 then
            v17 = v17:andThen(function(v18) --[[ Line: 36 ]]
                -- upvalues: v3 (ref), v15 (ref), v4 (ref), v14 (ref)
                local l_groupUpId_0 = v18.responseBody.groupUp.groupUpId;
                local l_members_0 = v18.responseBody.groupUp.members;
                if l_groupUpId_0 and l_members_0 then
                    v3(l_groupUpId_0, l_members_0, v15, v4.PartyJoin, v14);
                end;
            end);
        end;
        return v17:catch(function(_) --[[ Line: 52 ]]
            -- upvalues: v13 (ref), v16 (copy), v6 (ref)
            v13(v16, {
                hideCancelButton = true, 
                promptType = v6.Error
            });
        end);
    end;
end;
return function(v23, v24, v25, v26, v27) --[[ Line: 62 ]]
    -- upvalues: v6 (copy), v8 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), v7 (copy), v3 (copy), v4 (copy), v2 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy)
    return function(v28) --[[ Line: 69 ]]
        -- upvalues: v23 (copy), v24 (copy), v6 (ref), v8 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v25 (copy), v26 (copy), v7 (ref), v3 (ref), v4 (ref), v2 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v27 (copy)
        local v29 = v28:getState();
        local v30 = v29.Squad and v29.Squad.Squad and v29.Squad.Squad.currentSquad and v29.Squad.Squad.currentSquad.squadId;
        if v30 == v23 then
            v24(v28, {
                hideCancelButton = true, 
                promptType = v6.AlreadyJoined
            });
            return v8.resolve({});
        elseif not v30 then
            local l_v23_0 = v23;
            local l_v24_0 = v24;
            local v33 = if l_FFlagEnableSquadCoplayAnalytic_0 then v25 else nil;
            local v34 = if l_FFlagEnableSquadCoplayAnalytic_0 then v26 else nil;
            return v28:dispatch(function(v35) --[[ Line: 28 ]]
                -- upvalues: v7 (ref), l_v23_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v34 (copy), v3 (ref), v4 (ref), v33 (copy), l_v24_0 (copy), v6 (ref)
                local v36 = v35:dispatch(v7.JoinSquad.API({
                    squadId = l_v23_0, 
                    leaveExisting = true, 
                    squadLocation = if l_FFlagEnableSquadCoplayAnalytic_0 then v34 else nil
                }));
                if l_FFlagEnableSquadCoplayAnalytic_0 then
                    v36 = v36:andThen(function(v37) --[[ Line: 36 ]]
                        -- upvalues: v3 (ref), v34 (ref), v4 (ref), v33 (ref)
                        local l_groupUpId_1 = v37.responseBody.groupUp.groupUpId;
                        local l_members_1 = v37.responseBody.groupUp.members;
                        if l_groupUpId_1 and l_members_1 then
                            v3(l_groupUpId_1, l_members_1, v34, v4.PartyJoin, v33);
                        end;
                    end);
                end;
                return v36:catch(function(_) --[[ Line: 52 ]]
                    -- upvalues: l_v24_0 (ref), v35 (copy), v6 (ref)
                    l_v24_0(v35, {
                        hideCancelButton = true, 
                        promptType = v6.Error
                    });
                end);
            end);
        else
            return v28:dispatch(v2(v6.JoinAnotherSquad, v24, function() --[[ Line: 97 ]]
                -- upvalues: v28 (copy), v23 (ref), v24 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v25 (ref), v26 (ref), v7 (ref), v3 (ref), v4 (ref), v6 (ref)
                local l_v28_0 = v28;
                local l_v23_1 = v23;
                local l_v24_1 = v24;
                local v44 = if l_FFlagEnableSquadCoplayAnalytic_0 then v25 else nil;
                local v45 = if l_FFlagEnableSquadCoplayAnalytic_0 then v26 else nil;
                l_v28_0:dispatch(function(v46) --[[ Line: 28 ]]
                    -- upvalues: v7 (ref), l_v23_1 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (ref), v45 (copy), v3 (ref), v4 (ref), v44 (copy), l_v24_1 (copy), v6 (ref)
                    local v47 = v46:dispatch(v7.JoinSquad.API({
                        squadId = l_v23_1, 
                        leaveExisting = true, 
                        squadLocation = if l_FFlagEnableSquadCoplayAnalytic_0 then v45 else nil
                    }));
                    if l_FFlagEnableSquadCoplayAnalytic_0 then
                        v47 = v47:andThen(function(v48) --[[ Line: 36 ]]
                            -- upvalues: v3 (ref), v45 (ref), v4 (ref), v44 (ref)
                            local l_groupUpId_2 = v48.responseBody.groupUp.groupUpId;
                            local l_members_2 = v48.responseBody.groupUp.members;
                            if l_groupUpId_2 and l_members_2 then
                                v3(l_groupUpId_2, l_members_2, v45, v4.PartyJoin, v44);
                            end;
                        end);
                    end;
                    return v47:catch(function(_) --[[ Line: 52 ]]
                        -- upvalues: l_v24_1 (ref), v46 (copy), v6 (ref)
                        l_v24_1(v46, {
                            hideCancelButton = true, 
                            promptType = v6.Error
                        });
                    end);
                end);
            end, v26, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v27));
        end;
    end;
end;