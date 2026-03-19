local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.flags.getFIntUGCValidationPartMaxMass);
return function(v5, v6) --[[ Line: 14 ]] --[[ Name: resetPhysicsData ]]
    -- upvalues: l_UGCValidationService_0 (copy), v3 (copy), v4 (copy)
    local v7 = tick();
    if not game:GetEngineFeature("EngineResetCollisionFidelity") then
        return false, "EngineResetCollisionFidelity is not enabled";
    else
        local v8 = if v6.bypassFlags then v6.bypassFlags.skipPhysicsDataReset else false;
        for _, v10 in v5 do
            local l_v10_Descendants_0 = v10:GetDescendants();
            table.insert(l_v10_Descendants_0, 1, v10);
            for _, v13 in l_v10_Descendants_0 do
                if v13:IsA("MeshPart") and not v8 then
                    if not pcall(function() --[[ Line: 31 ]]
                        -- upvalues: l_UGCValidationService_0 (ref), v13 (copy)
                        l_UGCValidationService_0:ResetCollisionFidelity(v13, v13.CollisionFidelity);
                    end) then
                        if v6.isServer then
                            error("Failed to load mesh data");
                        end;
                        v3.reportFailure(v3.ErrorType.resetPhysicsData_FailedToLoadMesh, nil, v6);
                        return false, "Failed to load mesh data";
                    elseif v13:GetMass() > v4() then
                        v3.reportFailure(v3.ErrorType.resetPhysicsData_LargeMass, nil, v6);
                        return false, string.format("%s has a mass of %d while the limit is %d.", v13.Name, v13:GetMass(), v4());
                    end;
                end;
            end;
        end;
        v3.recordScriptTime(script.Name, v7, v6);
        return true;
    end;
end;