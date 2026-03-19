local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local v1 = require(l_script_FirstAncestor_0.Logger);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Rodux);
local l_CurrentExperienceInviteUpdated_0 = require(l_script_FirstAncestor_0.Actions).CurrentExperienceInviteUpdated;
local l_CurrentExperienceInviteDismissed_0 = require(l_script_FirstAncestor_0.Actions).CurrentExperienceInviteDismissed;
local l_CurrentExperienceInviteReceived_0 = require(l_script_FirstAncestor_0.Actions).CurrentExperienceInviteReceived;
local l_ExperienceInviteModel_0 = require(l_script_FirstAncestor_0.Models).ExperienceInviteModel;
local _ = require(script.Parent.Parent.RoduxSquadsTypes);
return function(v10) --[[ Line: 17 ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy), l_ExperienceInviteModel_0 (copy), l_CurrentExperienceInviteUpdated_0 (copy), l_CurrentExperienceInviteReceived_0 (copy), l_CurrentExperienceInviteDismissed_0 (copy)
    local l_NetworkingSquads_0 = v10.NetworkingSquads;
    local function v14(v12, v13) --[[ Line: 20 ]]
        -- upvalues: v3 (ref)
        if v12 and v12.notification.experienceInviteId == v13.experienceInviteId and (v12.model == nil or v12.model.versionId < v13.versionId) then
            return v3.Dictionary.join(v12, {
                model = v13
            });
        else
            return v12;
        end;
    end;
    return v4.createReducer(nil, {
        [l_NetworkingSquads_0.CreateExperienceInvite.Succeeded.name] = function(v15, v16) --[[ Line: 35 ]]
            -- upvalues: v1 (ref)
            local l_responseBody_0 = v16.responseBody;
            v1:debug("Create experience invite success. ExperienceInviteId: {}", l_responseBody_0.experienceInviteId);
            return v15;
        end, 
        [l_NetworkingSquads_0.GetExperienceInvite.Succeeded.name] = function(v18, v19) --[[ Line: 48 ]]
            -- upvalues: v14 (copy), l_ExperienceInviteModel_0 (ref)
            local l_responseBody_1 = v19.responseBody;
            assert(l_responseBody_1, "Experience invite must exist.");
            return v14(v18, l_ExperienceInviteModel_0.format(l_responseBody_1));
        end, 
        [l_NetworkingSquads_0.VoteForExperienceInvite.Succeeded.name] = function(v21, v22) --[[ Line: 58 ]]
            -- upvalues: v1 (ref), v14 (copy), l_ExperienceInviteModel_0 (ref)
            local l_responseBody_2 = v22.responseBody;
            v1:debug("Vote experience invite success. ExperienceInviteId: {}", l_responseBody_2.experienceInviteId);
            return v14(v21, l_ExperienceInviteModel_0.format(l_responseBody_2));
        end, 
        [l_CurrentExperienceInviteUpdated_0.name] = function(v24, v25) --[[ Line: 67 ]]
            -- upvalues: v14 (copy), l_ExperienceInviteModel_0 (ref)
            local l_experienceInvite_0 = v25.payload.experienceInvite;
            assert(l_experienceInvite_0, "Experience invite must exist.");
            return v14(v24, l_ExperienceInviteModel_0.format(l_experienceInvite_0));
        end, 
        [l_CurrentExperienceInviteReceived_0.name] = function(v27, v28) --[[ Line: 76 ]]
            local l_experienceInviteId_0 = v28.payload.experienceInviteId;
            if v27 == nil or v27.notification.experienceInviteId ~= l_experienceInviteId_0 then
                return {
                    notification = {
                        experienceInviteId = l_experienceInviteId_0, 
                        membershipEntityId = v28.payload.membershipEntityId, 
                        notificationId = v28.payload.notificationId, 
                        isInviter = v28.payload.isInviter
                    }
                };
            else
                return v27;
            end;
        end, 
        [l_CurrentExperienceInviteDismissed_0.name] = function(v30, v31) --[[ Line: 100 ]]
            if v30 and v30.notification.notificationId == v31.payload.notificationId then
                return nil;
            else
                return v30;
            end;
        end
    });
end;