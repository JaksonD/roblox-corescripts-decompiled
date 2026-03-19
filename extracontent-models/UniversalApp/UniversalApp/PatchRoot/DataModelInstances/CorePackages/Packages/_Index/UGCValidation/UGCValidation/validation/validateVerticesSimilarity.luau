local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFIntUGCLCCageVerticesSimilarityMaximum);
local v5 = require(l_Parent_0.Analytics);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationHyperlinksInCageQuality);
return function(v7, v8, v9, v10) --[[ Line: 15 ]] --[[ Name: validateVerticesSimilarity ]]
    -- upvalues: v3 (copy), l_UGCValidationService_0 (copy), v5 (copy), v4 (copy), v6 (copy)
    local v11 = tick();
    local l_isServer_0 = v8.isServer;
    local v13, v14 = v3(function() --[[ Line: 25 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v7 (copy), v9 (copy)
        return l_UGCValidationService_0:GetEditableMeshVerticesSimilarityRate(v7.editableMesh, v9);
    end, v8);
    if not v13 then
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", v7.fullName));
        end;
        v5.reportFailure(v5.ErrorType.validateVerticesSimilarity_FailedToExecute, nil, v8);
        return false, {
            string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", v7.fullName)
        };
    else
        v14 = math.floor(v14 * 100);
        if v4() < v14 then
            v5.reportFailure(v5.ErrorType.validateVerticesSimilarity_MaxSimilarityExceeded, nil, v8);
            local v15 = string.format("%s has %d%% of vertices too close to each other. Please edit the vertices to have at most %d%% coincident or close to one another.", v10, v14, v4());
            if v6() then
                v15 = v15 .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageDensity)";
            end;
            return false, {
                v15
            };
        else
            v5.recordScriptTime(script.Name, v11, v8);
            return true;
        end;
    end;
end;