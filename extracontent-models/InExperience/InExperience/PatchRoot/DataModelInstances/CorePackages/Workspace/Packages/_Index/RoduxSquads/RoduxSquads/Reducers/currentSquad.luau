local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local l_CurrentSquadUpdated_0 = require(l_script_FirstAncestor_0.Actions).CurrentSquadUpdated;
local l_SelfPermissionUpdated_0 = require(l_script_FirstAncestor_0.Actions).SelfPermissionUpdated;
local l_SquadModel_0 = require(l_script_FirstAncestor_0.Models).SquadModel;
local v7 = require(l_script_FirstAncestor_0.Persists.PersistStorage);
local l_createPersistReducer_0 = require(l_script_FirstAncestor_0.Persists.PersistReducer).createPersistReducer;
local _ = require(script.Parent.Parent.RoduxSquadsTypes);
local l_FFlagEnableSquadRegroupExperimentation_0 = require(l_Parent_0.SharedFlags).FFlagEnableSquadRegroupExperimentation;
return function(v11) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_createPersistReducer_0 (copy), v7 (copy), v3 (copy), l_SquadModel_0 (copy), l_CurrentSquadUpdated_0 (copy), l_SelfPermissionUpdated_0 (copy)
    local l_NetworkingSquads_0 = v11.NetworkingSquads;
    local function v25(v13, v14) --[[ Line: 21 ]]
        -- upvalues: v2 (ref), l_FFlagEnableSquadRegroupExperimentation_0 (ref)
        if v13 == nil or v13.squadId ~= v14.squadId then
            if v14.deletedAtTime and v14.deletedAtTime ~= "" then
                return v13;
            elseif v13 and v13.parentChannelId == v14.parentChannelId then
                if v13.createdAtTime < v14.createdAtTime then
                    return v14;
                end;
            else
                return v14;
            end;
        elseif v14.deletedAtTime and v14.deletedAtTime ~= "" then
            return nil;
        elseif v13.updatedAtTime < v14.updatedAtTime then
            return v14;
        elseif v13.updatedAtTime == v14.updatedAtTime then
            if v13.parentChannelId ~= v14.parentChannelId then
                return v14;
            else
                local v16 = v2.List.sort(v2.List.map(v13.members, function(v15) --[[ Line: 50 ]]
                    return v15.userId;
                end));
                local v18 = v2.List.sort(v2.List.map(v14.members, function(v17) --[[ Line: 53 ]]
                    return v17.userId;
                end));
                local v20 = v2.List.sort(v2.List.map(v13.invitees, function(v19) --[[ Line: 58 ]]
                    return tostring(v19.userId) .. tostring(v19.invitedAtTimestampMs);
                end));
                local v22 = v2.List.sort(v2.List.map(v14.invitees, function(v21) --[[ Line: 62 ]]
                    return tostring(v21.userId) .. tostring(v21.invitedAtTimestampMs);
                end));
                if not v2.List.equals(v16, v18) or not v2.List.equals(v20, v22) then
                    return v14;
                elseif l_FFlagEnableSquadRegroupExperimentation_0 then
                    local l_selfPermissions_0 = v13.selfPermissions;
                    local l_selfPermissions_1 = v14.selfPermissions;
                    if l_selfPermissions_0 == nil ~= (l_selfPermissions_1 == nil) then
                        return v14;
                    elseif l_selfPermissions_0 and l_selfPermissions_1 and not v2.Dictionary.equals(l_selfPermissions_0, l_selfPermissions_1) then
                        return v14;
                    end;
                end;
            end;
        end;
        return v13;
    end;
    return l_createPersistReducer_0(v2.Dictionary.join({
        storage = v7.new("currentSquadStore")
    }, v11.currentSquad or {}), v3.createReducer(nil, {
        [l_NetworkingSquads_0.CreateOrJoinSquad.Succeeded.name] = function(v26, v27) --[[ Line: 99 ]]
            -- upvalues: v25 (copy), l_SquadModel_0 (ref)
            local l_groupUp_0 = v27.responseBody.groupUp;
            return (v25(v26, l_SquadModel_0.format(l_groupUp_0)));
        end, 
        [l_NetworkingSquads_0.GetSquadActive.Succeeded.name] = function(v29, v30) --[[ Line: 107 ]]
            -- upvalues: v25 (copy), l_SquadModel_0 (ref)
            local l_groupUp_1 = v30.responseBody.groupUp;
            if l_groupUp_1 then
                return (v25(v29, l_SquadModel_0.format(l_groupUp_1)));
            else
                return nil;
            end;
        end, 
        [l_NetworkingSquads_0.GetSquadFromSquadId.Succeeded.name] = function(v32, v33) --[[ Line: 120 ]]
            -- upvalues: v25 (copy), l_SquadModel_0 (ref)
            local l_groupUp_2 = v33.responseBody.groupUp;
            local v35 = v32 and v32.squadId;
            if l_groupUp_2 and l_groupUp_2.groupUpId == v35 then
                return (v25(v32, l_SquadModel_0.format(l_groupUp_2)));
            else
                return v32;
            end;
        end, 
        [l_NetworkingSquads_0.JoinSquad.Succeeded.name] = function(v36, v37) --[[ Line: 135 ]]
            -- upvalues: v25 (copy), l_SquadModel_0 (ref)
            local l_groupUp_3 = v37.responseBody.groupUp;
            return (v25(v36, l_SquadModel_0.format(l_groupUp_3)));
        end, 
        [l_NetworkingSquads_0.LeaveSquad.Succeeded.name] = function(v39, v40) --[[ Line: 143 ]]
            local l_groupUpId_0 = v40.postBody.groupUpId;
            if v39 and v39.squadId == l_groupUpId_0 then
                return nil;
            else
                return v39;
            end;
        end, 
        [l_NetworkingSquads_0.ActOnPartyNudge.Succeeded.name] = function(v42, v43) --[[ Line: 151 ]]
            -- upvalues: v25 (copy), l_SquadModel_0 (ref)
            local l_groupUp_4 = v43.responseBody.groupUp;
            if l_groupUp_4 then
                return (v25(v42, l_SquadModel_0.format(l_groupUp_4)));
            else
                return v42;
            end;
        end, 
        [l_CurrentSquadUpdated_0.name] = function(v45, v46) --[[ Line: 163 ]]
            -- upvalues: v25 (copy), l_SquadModel_0 (ref)
            local l_squad_0 = v46.payload.squad;
            if not l_squad_0 then
                return nil;
            else
                return (v25(v45, l_SquadModel_0.format(l_squad_0)));
            end;
        end, 
        [l_SelfPermissionUpdated_0.name] = function(v48, v49) --[[ Line: 175 ]]
            -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), v2 (ref)
            if not l_FFlagEnableSquadRegroupExperimentation_0 then
                return v48;
            elseif v48 == nil then
                return v48;
            else
                local v50 = v49.payload and v49.payload.selfPermissions;
                if v50 == nil then
                    return v48;
                else
                    local v51 = v48.selfPermissions or {};
                    local v52 = v2.Dictionary.join(v51, v50);
                    return (v2.Dictionary.join(v48, {
                        selfPermissions = v52
                    }));
                end;
            end;
        end
    }));
end;