local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger);
local v3 = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local _ = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local v5 = require(l_script_FirstAncestor_0.ServiceManager.SquadRccEventManager);
local v6 = require(l_Parent_0.Promise);
local l_CurrentSquadUpdated_0 = require(l_script_FirstAncestor_0.RoduxSquads).Actions.CurrentSquadUpdated;
local v8 = require(l_script_FirstAncestor_0.Http.NetworkingSquads);
return function(v9, v10, v11, v12, v13) --[[ Line: 14 ]]
    -- upvalues: v6 (copy), v3 (copy), v5 (copy), l_CurrentSquadUpdated_0 (copy), v8 (copy), v2 (copy)
    return function(v14) --[[ Line: 21 ]]
        -- upvalues: v6 (ref), v11 (copy), v12 (copy), v3 (ref), v5 (ref), v13 (copy), l_CurrentSquadUpdated_0 (ref), v8 (ref), v2 (ref), v9 (copy), v10 (copy)
        local v15 = v14:getState();
        local v16 = v15.Squad and v15.Squad.Squad and v15.Squad.Squad.currentSquad and v15.Squad.Squad.currentSquad.squadId;
        if not v16 then
            return v6.resolve();
        else
            local function v18() --[[ Line: 33 ]]
                -- upvalues: v11 (ref), v12 (ref), v3 (ref), v5 (ref), v13 (ref), v14 (copy), l_CurrentSquadUpdated_0 (ref), v8 (ref), v16 (copy), v2 (ref)
                if v11 then
                    v11();
                end;
                if v12 == v3.InExperience then
                    v5:setLeaveSquadPendingAndFireEvent(true, v13);
                end;
                v14:dispatch(l_CurrentSquadUpdated_0(nil));
                v14:dispatch(v8.LeaveSquad.API({
                    squadId = v16
                })):andThen(function() --[[ Line: 45 ]]
                    -- upvalues: v12 (ref), v3 (ref), v5 (ref), v13 (ref)
                    if v12 == v3.InExperience then
                        v5:setLeaveSquadPendingAndFireEvent(false, v13);
                    end;
                end):catch(function(v17) --[[ Line: 50 ]]
                    -- upvalues: v2 (ref)
                    v2:error("Error occured with NetworkingSquads.LeaveSquad: {}", (tostring(v17)));
                end);
            end;
            if v9 then
                return v10(v14, {
                    onConfirm = v18, 
                    promptType = v9
                });
            else
                v18();
                return v6.resolve();
            end;
        end;
    end;
end;