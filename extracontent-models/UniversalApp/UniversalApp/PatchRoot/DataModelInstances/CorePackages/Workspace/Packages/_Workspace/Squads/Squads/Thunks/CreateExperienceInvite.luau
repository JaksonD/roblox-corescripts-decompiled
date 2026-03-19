local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Http);
local l_LocalStorageKey_0 = require(l_Parent_0.LocalStorage).Enums.LocalStorageKey;
local v4 = require(l_Parent_0.Promise);
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v7 = require(l_script_FirstAncestor_0.dependencies);
local l_Cryo_0 = v7.Cryo;
local l_NetworkingSquads_0 = v7.NetworkingSquads;
local l_RoduxSquads_0 = v7.RoduxSquads;
local l_SquadExperienceInviteSource_0 = v7.SquadsCore.Enums.SquadExperienceInviteSource;
local l_EventNames_0 = v7.SquadsCore.Analytics.EventNames;
local l_SquadPromptType_0 = v7.SquadsCore.Enums.SquadPromptType;
local l_encodeSquadMembers_0 = v7.SquadsCore.Common.encodeSquadMembers;
local l_FFlagEncodeSquadMembersUpdated_0 = v7.SquadsCore.Flags.FFlagEncodeSquadMembersUpdated;
local l_FFlagEnableSquadRegroupExperimentation_0 = v7.SharedFlags.FFlagEnableSquadRegroupExperimentation;
local l_FFlagEnablePrivatePartyStartJoin_0 = v7.SharedFlags.FFlagEnablePrivatePartyStartJoin;
local l_SquadExperienceInviteType_0 = v7.SquadsCore.Enums.SquadExperienceInviteType;
local v19 = nil;
return function(v20, v21, v22, v23) --[[ Line: 30 ]]
    -- upvalues: l_FFlagEncodeSquadMembersUpdated_0 (copy), l_encodeSquadMembers_0 (ref), l_Cryo_0 (copy), l_HttpService_0 (copy), v4 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_RoduxSquads_0 (copy), v19 (ref), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_SquadExperienceInviteSource_0 (copy), l_FFlagEnablePrivatePartyStartJoin_0 (copy), l_SquadExperienceInviteType_0 (copy), l_NetworkingSquads_0 (copy), l_EventNames_0 (copy), v2 (copy), l_SquadPromptType_0 (copy)
    return function(v24) --[[ Line: 31 ]]
        -- upvalues: l_FFlagEncodeSquadMembersUpdated_0 (ref), l_encodeSquadMembers_0 (ref), l_Cryo_0 (ref), l_HttpService_0 (ref), v4 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_RoduxSquads_0 (ref), v19 (ref), v20 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (ref), v22 (copy), l_SquadExperienceInviteSource_0 (ref), l_FFlagEnablePrivatePartyStartJoin_0 (ref), v23 (copy), l_SquadExperienceInviteType_0 (ref), l_NetworkingSquads_0 (ref), v21 (copy), l_EventNames_0 (ref), v2 (ref), l_SquadPromptType_0 (ref)
        local v25 = v24:getState();
        local v26 = v25.Squad and v25.Squad.Squad and v25.Squad.Squad.currentSquad;
        local v27 = v26 and v26.squadId;
        local v28 = v26 and v26.parentChannelId;
        local v29 = if v26 and v26.members then v26.members else {};
        if not l_FFlagEncodeSquadMembersUpdated_0 then
            l_encodeSquadMembers_0 = function(v30) --[[ Line: 41 ]]
                -- upvalues: l_Cryo_0 (ref), v29 (copy), l_HttpService_0 (ref)
                v30 = l_Cryo_0.List.map(v29, function(v31) --[[ Line: 42 ]]
                    return v31.userId;
                end);
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 46 ]]
                    -- upvalues: l_HttpService_0 (ref), v30 (ref)
                    return l_HttpService_0:JSONEncode(v30);
                end);
                if l_status_0 then
                    return l_result_0;
                else
                    return "[]";
                end;
            end;
        end;
        local v34 = l_encodeSquadMembers_0(v29);
        if not v27 then
            return v4.resolve();
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 64 ]]
                -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
                return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId);
            end);
            local v37 = if l_status_1 then l_result_1 else "";
            local function _(v38) --[[ Line: 69 ]] --[[ Name: updateCurrentExperienceInviteStatus ]]
                -- upvalues: v24 (copy), l_RoduxSquads_0 (ref)
                v24:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                    isExperienceInvitePending = v38
                }));
            end;
            local function v50(v40) --[[ Line: 75 ]] --[[ Name: CreateExperienceInvite ]]
                -- upvalues: v19 (ref), v24 (copy), l_RoduxSquads_0 (ref), v27 (copy), v20 (ref), v37 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (ref), v22 (ref), l_SquadExperienceInviteSource_0 (ref), l_FFlagEnablePrivatePartyStartJoin_0 (ref), v23 (ref), l_SquadExperienceInviteType_0 (ref), l_NetworkingSquads_0 (ref), v21 (ref), l_EventNames_0 (ref), v28 (copy), v34 (copy), v29 (copy), l_HttpService_0 (ref), v2 (ref), l_SquadPromptType_0 (ref)
                if v19 then
                    task.cancel(v19);
                    v19 = nil;
                end;
                v24:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                    isExperienceInvitePending = true
                }));
                local v41 = {
                    membershipEntityId = v27, 
                    placeId = v20, 
                    voteIdentifier = v37
                };
                local v42 = if l_FFlagEnableSquadRegroupExperimentation_0 then v22 or l_SquadExperienceInviteSource_0.Default else nil;
                if v42 then
                    v41.source = v42;
                end;
                if l_FFlagEnablePrivatePartyStartJoin_0 then
                    v41.inviteType = v23 or l_SquadExperienceInviteType_0.PlayWithPartyInPublicServer;
                end;
                return v24:dispatch(l_NetworkingSquads_0.CreateExperienceInvite.API(v41)):andThen(function(v43) --[[ Line: 103 ]]
                    -- upvalues: v21 (ref), l_EventNames_0 (ref), v28 (ref), v20 (ref), v34 (ref), v29 (ref), v19 (ref), v24 (ref), l_RoduxSquads_0 (ref)
                    local l_experienceInviteId_0 = v43.responseBody.experienceInviteId;
                    v21.fireSquadAnalytics(l_EventNames_0.SquadExperienceInviteApiCall, {
                        parentChannelId = v28, 
                        experienceInviteId = l_experienceInviteId_0, 
                        isSuccess = true, 
                        invitationPlaceId = tonumber(v20), 
                        squadMembers = v34, 
                        squadMembersCount = #v29
                    });
                    v19 = task.delay(2, function() --[[ Line: 114 ]]
                        -- upvalues: v24 (ref), l_RoduxSquads_0 (ref), v19 (ref)
                        v24:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                            isExperienceInvitePending = false
                        }));
                        v19 = nil;
                    end);
                    return l_experienceInviteId_0;
                end):catch(function(v45) --[[ Line: 120 ]]
                    -- upvalues: v24 (ref), l_RoduxSquads_0 (ref), l_HttpService_0 (ref), v21 (ref), l_EventNames_0 (ref), v28 (ref), v20 (ref), v34 (ref), v29 (ref), v2 (ref), v40 (copy), l_SquadPromptType_0 (ref)
                    v24:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                        isExperienceInvitePending = false
                    }));
                    local l_Body_0 = v45.Body;
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 124 ]]
                        -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                        return l_HttpService_0:JSONDecode(l_Body_0);
                    end);
                    local v49 = if l_status_2 then l_result_2.errorType else nil;
                    v21.fireSquadAnalytics(l_EventNames_0.SquadExperienceInviteApiCall, {
                        parentChannelId = v28, 
                        isSuccess = false, 
                        errorMessage = v49, 
                        errorType = if v45.StatusCode then tostring(v45.StatusCode) else nil, 
                        invitationPlaceId = tonumber(v20), 
                        squadMembers = v34, 
                        squadMembersCount = #v29
                    });
                    if v45.StatusCode == v2.StatusCodes.CONFLICT then
                        v21.setSquadPrompt(v24, {
                            onConfirm = function() --[[ Line: 142 ]] --[[ Name: onConfirm ]]
                                -- upvalues: v40 (ref)
                                v40(v40);
                            end, 
                            promptType = l_SquadPromptType_0.InvitedToExperience
                        });
                        return;
                    else
                        v21.setSquadPrompt(v24, {
                            promptType = l_SquadPromptType_0.Error
                        });
                        return;
                    end;
                end);
            end;
            return v50(v50);
        end;
    end;
end;