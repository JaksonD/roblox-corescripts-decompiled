local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFIntUGCLCCageVerticesSimilarityMaximum);
local v5 = require(l_Parent_0.Analytics);
return function(v6, v7, v8, v9) --[[ Line: 14 ]] --[[ Name: validateVerticesSimilarity ]]
    -- upvalues: v3 (copy), l_UGCValidationService_0 (copy), v5 (copy), v4 (copy)
    local v10 = tick();
    local l_isServer_0 = v7.isServer;
    local v12, v13 = v3(function() --[[ Line: 24 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v6 (copy), v8 (copy)
        return l_UGCValidationService_0:GetEditableMeshVerticesSimilarityRate(v6.editableMesh, v8);
    end, v7);
    if not v12 then
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", v6.fullName));
        end;
        v5.reportFailure(v5.ErrorType.validateVerticesSimilarity_FailedToExecute, nil, v7);
        return false, {
            string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", v6.fullName)
        };
    else
        v13 = math.floor(v13 * 100);
        if v4() < v13 then
            v5.reportFailure(v5.ErrorType.validateVerticesSimilarity_MaxSimilarityExceeded, nil, v7);
            return false, {
                string.format("%s has %d%% of vertices too close to each other. Please edit the vertices to have at most %d%% coincident or close to one another.", v9, v13, v4()) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageDensity)"
            };
        else
            v5.recordScriptTime(script.Name, v10, v7);
            return true;
        end;
    end;
end;