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
local v17 = nil;
return function(v18, v19, v20) --[[ Line: 25 ]]
    -- upvalues: l_FFlagEncodeSquadMembersUpdated_0 (copy), l_encodeSquadMembers_0 (ref), l_Cryo_0 (copy), l_HttpService_0 (copy), v4 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_RoduxSquads_0 (copy), v17 (ref), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_SquadExperienceInviteSource_0 (copy), l_NetworkingSquads_0 (copy), l_EventNames_0 (copy), v2 (copy), l_SquadPromptType_0 (copy)
    return function(v21) --[[ Line: 26 ]]
        -- upvalues: l_FFlagEncodeSquadMembersUpdated_0 (ref), l_encodeSquadMembers_0 (ref), l_Cryo_0 (ref), l_HttpService_0 (ref), v4 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_RoduxSquads_0 (ref), v17 (ref), v18 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (ref), v20 (copy), l_SquadExperienceInviteSource_0 (ref), l_NetworkingSquads_0 (ref), v19 (copy), l_EventNames_0 (ref), v2 (ref), l_SquadPromptType_0 (ref)
        local v22 = v21:getState();
        local v23 = v22.Squad and v22.Squad.Squad and v22.Squad.Squad.currentSquad;
        local v24 = v23 and v23.squadId;
        local v25 = v23 and v23.parentChannelId;
        local v26 = if v23 and v23.members then v23.members else {};
        if not l_FFlagEncodeSquadMembersUpdated_0 then
            l_encodeSquadMembers_0 = function(v27) --[[ Line: 36 ]]
                -- upvalues: l_Cryo_0 (ref), v26 (copy), l_HttpService_0 (ref)
                v27 = l_Cryo_0.List.map(v26, function(v28) --[[ Line: 37 ]]
                    return v28.userId;
                end);
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
                    -- upvalues: l_HttpService_0 (ref), v27 (ref)
                    return l_HttpService_0:JSONEncode(v27);
                end);
                if l_status_0 then
                    return l_result_0;
                else
                    return "[]";
                end;
            end;
        end;
        local v31 = l_encodeSquadMembers_0(v26);
        if not v24 then
            return v4.resolve();
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 59 ]]
                -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
                return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId);
            end);
            local v34 = if l_status_1 then l_result_1 else "";
            local function _(v35) --[[ Line: 64 ]] --[[ Name: updateCurrentExperienceInviteStatus ]]
                -- upvalues: v21 (copy), l_RoduxSquads_0 (ref)
                v21:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                    isExperienceInvitePending = v35
                }));
            end;
            local function v47(v37) --[[ Line: 70 ]] --[[ Name: CreateExperienceInvite ]]
                -- upvalues: v17 (ref), v21 (copy), l_RoduxSquads_0 (ref), v24 (copy), v18 (ref), v34 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (ref), v20 (ref), l_SquadExperienceInviteSource_0 (ref), l_NetworkingSquads_0 (ref), v19 (ref), l_EventNames_0 (ref), v25 (copy), v31 (copy), v26 (copy), l_HttpService_0 (ref), v2 (ref), l_SquadPromptType_0 (ref)
                if v17 then
                    task.cancel(v17);
                    v17 = nil;
                end;
                v21:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                    isExperienceInvitePending = true
                }));
                local v38 = {
                    membershipEntityId = v24, 
                    placeId = v18, 
                    voteIdentifier = v34
                };
                local v39 = if l_FFlagEnableSquadRegroupExperimentation_0 then v20 or l_SquadExperienceInviteSource_0.Default else nil;
                if v39 then
                    v38.source = v39;
                end;
                return v21:dispatch(l_NetworkingSquads_0.CreateExperienceInvite.API(v38)):andThen(function(v40) --[[ Line: 94 ]]
                    -- upvalues: v19 (ref), l_EventNames_0 (ref), v25 (ref), v18 (ref), v31 (ref), v26 (ref), v17 (ref), v21 (ref), l_RoduxSquads_0 (ref)
                    local l_experienceInviteId_0 = v40.responseBody.experienceInviteId;
                    v19.fireSquadAnalytics(l_EventNames_0.SquadExperienceInviteApiCall, {
                        parentChannelId = v25, 
                        experienceInviteId = l_experienceInviteId_0, 
                        isSuccess = true, 
                        invitationPlaceId = tonumber(v18), 
                        squadMembers = v31, 
                        squadMembersCount = #v26
                    });
                    v17 = task.delay(2, function() --[[ Line: 105 ]]
                        -- upvalues: v21 (ref), l_RoduxSquads_0 (ref), v17 (ref)
                        v21:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                            isExperienceInvitePending = false
                        }));
                        v17 = nil;
                    end);
                    return l_experienceInviteId_0;
                end):catch(function(v42) --[[ Line: 111 ]]
                    -- upvalues: v21 (ref), l_RoduxSquads_0 (ref), l_HttpService_0 (ref), v19 (ref), l_EventNames_0 (ref), v25 (ref), v18 (ref), v31 (ref), v26 (ref), v2 (ref), v37 (copy), l_SquadPromptType_0 (ref)
                    v21:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                        isExperienceInvitePending = false
                    }));
                    local l_Body_0 = v42.Body;
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 115 ]]
                        -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                        return l_HttpService_0:JSONDecode(l_Body_0);
                    end);
                    local v46 = if l_status_2 then l_result_2.errorType else nil;
                    v19.fireSquadAnalytics(l_EventNames_0.SquadExperienceInviteApiCall, {
                        parentChannelId = v25, 
                        isSuccess = false, 
                        errorMessage = v46, 
                        errorType = if v42.StatusCode then tostring(v42.StatusCode) else nil, 
                        invitationPlaceId = tonumber(v18), 
                        squadMembers = v31, 
                        squadMembersCount = #v26
                    });
                    if v42.StatusCode == v2.StatusCodes.CONFLICT then
                        v19.setSquadPrompt(v21, {
                            onConfirm = function() --[[ Line: 133 ]] --[[ Name: onConfirm ]]
                                -- upvalues: v37 (ref)
                                v37(v37);
                            end, 
                            promptType = l_SquadPromptType_0.InvitedToExperience
                        });
                        return;
                    else
                        v19.setSquadPrompt(v21, {
                            promptType = l_SquadPromptType_0.Error
                        });
                        return;
                    end;
                end);
            end;
            return v47(v47);
        end;
    end;
end;