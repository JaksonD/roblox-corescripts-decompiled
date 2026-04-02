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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v16) --[[ Line: 27 ]]
    -- upvalues: v4 (copy), v10 (copy), v11 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useDispatch_0 (copy), v8 (copy), l_HttpService_0 (copy), v9 (copy), v14 (copy), v13 (copy), v12 (copy), l_RobloxReplicatedStorage_0 (copy)
    local v17 = v4.useContext(v10);
    local v18 = v17.useIsChatEnabled();
    local v19 = v17.useIsLoadingChatSettings();
    v4.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v11 (ref), v16 (copy), v18 (copy)
        v11:fireSquadChangeEvent(v16.currentSquadId, v18);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v16.currentSquadId, 
        v18
    } else l_dependencyArray_0(v16.currentSquadId, v18));
    local v20 = l_useDispatch_0();
    local v21 = v4.useRef({});
    local v28 = v4.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v21 (copy), v8 (ref), l_HttpService_0 (ref), v17 (copy), v9 (ref), v14 (ref), v20 (copy), v13 (ref), v12 (ref), v16 (copy), v18 (copy)
        for _, v23 in ipairs(v21.current) do
            local l_partySourceType_0 = v23.partySourceType;
            local l_data_0 = v23.data;
            if l_partySourceType_0 == "PartyNudge" and l_data_0.nudgeType == v8.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
                local v26 = l_HttpService_0:GenerateGUID(false);
                v17.fireSquadAnalytics(v9.SquadCreateOrJoinFromRCC, {
                    partySourceType = l_partySourceType_0, 
                    nudgeType = l_data_0.nudgeType, 
                    nudgeId = l_data_0.nudgeId, 
                    partyAttemptId = v26, 
                    inviteeUserIds = v14({
                        l_data_0.inviteeId
                    })
                });
                v20(v13({
                    conversationType = "one_to_one", 
                    userIds = {
                        (tostring(l_data_0.inviteeId))
                    }, 
                    source = "createOrJoinPartyRemoteEvent", 
                    squadContext = v17, 
                    onSuccessCallback = function(v27) --[[ Line: 65 ]] --[[ Name: onSuccessCallback ]]
                        -- upvalues: v20 (ref), v12 (ref), v16 (ref), v8 (ref), l_data_0 (copy), v17 (ref), v18 (ref), v26 (copy)
                        v20(v12(if v16.currentSquadId == "" then v8.ACCEPT_START_PARTY_REQUEST_ACTION else v8.REJECT_START_PARTY_REQUEST_ACTION, l_data_0.nudgeId, false, v17.setSquadPrompt, v17.fireSquadAnalytics, v17.squadLocation, v18, v26, v27));
                    end, 
                    onErrorCallback = function() --[[ Line: 82 ]] --[[ Name: onErrorCallback ]]
                        -- upvalues: v20 (ref), v12 (ref), v8 (ref), l_data_0 (copy), v17 (ref), v18 (ref), v26 (copy)
                        v20(v12(v8.REJECT_START_PARTY_REQUEST_ACTION, l_data_0.nudgeId, false, v17.setSquadPrompt, v17.fireSquadAnalytics, v17.squadLocation, v18, v26));
                    end
                }));
            end;
        end;
        v21.current = {};
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v18, 
        v17, 
        v17.setSquadPrompt, 
        v17.fireSquadAnalytics, 
        v17.squadLocation
    } else l_dependencyArray_0(v18, v17, v17.setSquadPrompt, v17.fireSquadAnalytics, v17.squadLocation));
    v4.useEffect(function() --[[ Line: 121 ]]
        -- upvalues: v19 (copy), v18 (copy), v28 (copy), v21 (copy), l_RobloxReplicatedStorage_0 (ref)
        if not v19 then
            if v18 then
                v28();
            else
                v21.current = {};
            end;
        end;
        local v29 = nil;
        coroutine.wrap(function() --[[ Line: 131 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v29 (ref), v19 (ref), v21 (ref), v18 (ref), v28 (ref)
            v29 = l_RobloxReplicatedStorage_0:WaitForChild("CreateOrJoinParty", 1e999).OnClientEvent:Connect(function(v30, v31) --[[ Line: 135 ]]
                -- upvalues: v19 (ref), v21 (ref), v18 (ref), v28 (ref)
                if v19 then
                    table.insert(v21.current, {
                        partySourceType = v30, 
                        data = v31
                    });
                    return;
                else
                    if v18 then
                        v28();
                    end;
                    return;
                end;
            end);
        end)();
        return function() --[[ Line: 148 ]]
            -- upvalues: v29 (ref)
            if v29 then
                v29:Disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v19, 
        v18, 
        v28
    } else l_dependencyArray_0(v19, v18, v28));
    return nil;
end;