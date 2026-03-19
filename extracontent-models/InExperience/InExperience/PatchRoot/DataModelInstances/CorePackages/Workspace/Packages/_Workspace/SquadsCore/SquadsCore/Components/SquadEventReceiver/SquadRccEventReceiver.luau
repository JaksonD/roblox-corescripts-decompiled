local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactUtils);
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local v9 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v10 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v11 = require(l_script_FirstAncestor_0.ServiceManager.SquadRccEventManager);
local v12 = require(l_script_FirstAncestor_0.Thunks.actOnPartyNudge);
local v13 = require(l_script_FirstAncestor_0.Thunks.createConversation);
local v14 = require(l_script_FirstAncestor_0.Common.encodeUserIds);
return function(v15) --[[ Line: 25 ]]
    -- upvalues: v4 (copy), v10 (copy), v11 (copy), l_dependencyArray_0 (copy), l_useDispatch_0 (copy), v8 (copy), l_HttpService_0 (copy), v9 (copy), v14 (copy), v13 (copy), v12 (copy), l_RobloxReplicatedStorage_0 (copy)
    local v16 = v4.useContext(v10);
    local v17 = v16.useIsChatEnabled();
    local v18 = v16.useIsLoadingChatSettings();
    v4.useEffect(function() --[[ Line: 30 ]]
        -- upvalues: v11 (ref), v15 (copy), v17 (copy)
        v11:fireSquadChangeEvent(v15.currentSquadId, v17);
    end, l_dependencyArray_0(v15.currentSquadId, v17));
    local v19 = l_useDispatch_0();
    local v20 = v4.useRef({});
    local v27 = v4.useCallback(function() --[[ Line: 38 ]]
        -- upvalues: v20 (copy), v8 (ref), l_HttpService_0 (ref), v16 (copy), v9 (ref), v14 (ref), v19 (copy), v13 (ref), v12 (ref), v15 (copy), v17 (copy)
        for _, v22 in ipairs(v20.current) do
            local l_partySourceType_0 = v22.partySourceType;
            local l_data_0 = v22.data;
            if l_partySourceType_0 == "PartyNudge" and l_data_0.nudgeType == v8.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
                local v25 = l_HttpService_0:GenerateGUID(false);
                v16.fireSquadAnalytics(v9.SquadCreateOrJoinFromRCC, {
                    partySourceType = l_partySourceType_0, 
                    nudgeType = l_data_0.nudgeType, 
                    nudgeId = l_data_0.nudgeId, 
                    partyAttemptId = v25, 
                    inviteeUserIds = v14({
                        l_data_0.inviteeId
                    })
                });
                v19(v13({
                    conversationType = "one_to_one", 
                    userIds = {
                        (tostring(l_data_0.inviteeId))
                    }, 
                    source = "createOrJoinPartyRemoteEvent", 
                    squadContext = v16, 
                    onSuccessCallback = function(v26) --[[ Line: 58 ]] --[[ Name: onSuccessCallback ]]
                        -- upvalues: v19 (ref), v12 (ref), v15 (ref), v8 (ref), l_data_0 (copy), v16 (ref), v17 (ref), v25 (copy)
                        v19(v12(if v15.currentSquadId == "" then v8.ACCEPT_START_PARTY_REQUEST_ACTION else v8.REJECT_START_PARTY_REQUEST_ACTION, l_data_0.nudgeId, false, v16.setSquadPrompt, v16.fireSquadAnalytics, v16.squadLocation, v17, v25, v26));
                    end, 
                    onErrorCallback = function() --[[ Line: 75 ]] --[[ Name: onErrorCallback ]]
                        -- upvalues: v19 (ref), v12 (ref), v8 (ref), l_data_0 (copy), v16 (ref), v17 (ref), v25 (copy)
                        v19(v12(v8.REJECT_START_PARTY_REQUEST_ACTION, l_data_0.nudgeId, false, v16.setSquadPrompt, v16.fireSquadAnalytics, v16.squadLocation, v17, v25));
                    end
                }));
            end;
        end;
        v20.current = {};
    end, l_dependencyArray_0(v17, v16, v16.setSquadPrompt, v16.fireSquadAnalytics, v16.squadLocation));
    v4.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: v18 (copy), v17 (copy), v27 (copy), v20 (copy), l_RobloxReplicatedStorage_0 (ref)
        if not v18 then
            if v17 then
                v27();
            else
                v20.current = {};
            end;
        end;
        local v28 = nil;
        coroutine.wrap(function() --[[ Line: 115 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v28 (ref), v18 (ref), v20 (ref), v17 (ref), v27 (ref)
            v28 = l_RobloxReplicatedStorage_0:WaitForChild("CreateOrJoinParty", 1e999).OnClientEvent:Connect(function(v29, v30) --[[ Line: 119 ]]
                -- upvalues: v18 (ref), v20 (ref), v17 (ref), v27 (ref)
                if v18 then
                    table.insert(v20.current, {
                        partySourceType = v29, 
                        data = v30
                    });
                    return;
                else
                    if v17 then
                        v27();
                    end;
                    return;
                end;
            end);
        end)();
        return function() --[[ Line: 132 ]]
            -- upvalues: v28 (ref)
            if v28 then
                v28:Disconnect();
            end;
        end;
    end, l_dependencyArray_0(v18, v17, v27));
    return nil;
end;