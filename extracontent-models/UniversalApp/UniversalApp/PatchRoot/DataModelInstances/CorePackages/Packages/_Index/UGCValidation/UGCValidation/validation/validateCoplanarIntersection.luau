local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getFIntMaxCoplanarIntersectionsPercentage);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.Analytics);
local function v12(v6, v7, v8) --[[ Line: 16 ]] --[[ Name: getTriangleCount ]]
    -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), v5 (copy)
    local v9, v10 = v4(function() --[[ Line: 21 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v6 (copy)
        return l_UGCValidationService_0:GetEditableMeshTriCount(v6.editableMesh);
    end, v7);
    if not v9 then
        local v11 = string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", v6.fullName);
        v5.reportFailure(v5.ErrorType.validateCoplanarIntersection_FailedToExecute, nil, v7);
        if v8 ~= nil and v8 then
            error(v11);
        end;
        return false, {
            v11
        };
    else
        return true, nil, v10;
    end;
end;
return function(v13, v14, v15) --[[ Line: 44 ]] --[[ Name: validateCoplanarIntersection ]]
    -- upvalues: v12 (copy), v2 (copy), v4 (copy), l_UGCValidationService_0 (copy), v5 (copy)
    local v16 = tick();
    local l_isServer_0 = v15.isServer;
    local v18, v19, v20 = v12(v13, v15, l_isServer_0);
    if not v18 then
        return false, v19;
    else
        local v21 = math.floor(v2() / 100 * v20);
        local v22, v23 = v4(function() --[[ Line: 62 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v13 (copy), v21 (copy), v14 (copy)
            return l_UGCValidationService_0:IsEditableMeshNumCoplanarIntersectionsOverLimit(v13.editableMesh, v21, v14, true);
        end, v15);
        if not v22 then
            local v24 = string.format("Failed to execute coplanar triangle intersection check for '%s'. Make sure mesh exists and try again.", v13.fullName);
            if l_isServer_0 ~= nil and l_isServer_0 then
                error(v24);
            end;
            v5.reportFailure(v5.ErrorType.validateCoplanarIntersection_FailedToExecute, nil, v15);
            return false, {
                v24
            };
        elseif v23 then
            v5.reportFailure(v5.ErrorType.validateCoplanarIntersection_CoplanarIntersection, nil, v15);
            return false, {
                string.format("Detected too many coplanar triangles intersecting in model mesh '%s'. The maximum is %d intersections in a %d triangle mesh. Edit your mesh to reduce the number of coplanar triangle intersections.", v13.fullName, v21, v20)
            };
        else
            v5.recordScriptTime(script.Name, v16, v15);
            return true;
        end;
    end;
end;