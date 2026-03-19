local l_Parent_0 = script:FindFirstAncestor("SocialExperiments").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = require(l_Parent_0.SharedFlags);
local v3 = game:DefineFastString("FStringSquadRegroupExpLayer", "Party.Coordination.UnifyCoplay");
local v4 = game:DefineFastString("SquadEnableRegroupVariant", "enableSquadRegroup");
local l_FFlagForceEnableSquadRegroup_0 = v2.FFlagForceEnableSquadRegroup;
local l_FFlagEnableSquadRegroupExperimentation_0 = v2.FFlagEnableSquadRegroupExperimentation;
local function _(v7) --[[ Line: 14 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v3 (copy)
    local v8 = l_ExperimentCacheManager_0.default:getLayerVariables(v3);
    if v8 and v8[v7] ~= nil then
        return v8[v7];
    else
        return false;
    end;
end;
return {
    getSquadRegroupEnabled = function() --[[ Line: 24 ]] --[[ Name: getSquadRegroupEnabled ]]
        -- upvalues: l_FFlagForceEnableSquadRegroup_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), v4 (copy), l_ExperimentCacheManager_0 (copy), v3 (copy)
        local l_l_FFlagForceEnableSquadRegroup_0_0 = l_FFlagForceEnableSquadRegroup_0;
        if not l_l_FFlagForceEnableSquadRegroup_0_0 then
            l_l_FFlagForceEnableSquadRegroup_0_0 = l_FFlagEnableSquadRegroupExperimentation_0;
            if l_l_FFlagForceEnableSquadRegroup_0_0 then
                local l_v4_0 = v4;
                local v12 = l_ExperimentCacheManager_0.default:getLayerVariables(v3);
                if v12 and v12[l_v4_0] ~= nil then
                    return v12[l_v4_0];
                else
                    l_l_FFlagForceEnableSquadRegroup_0_0 = false;
                end;
            end;
        end;
        return l_l_FFlagForceEnableSquadRegroup_0_0;
    end, 
    logExposure = function() --[[ Line: 29 ]] --[[ Name: logExposure ]]
        -- upvalues: l_FFlagForceEnableSquadRegroup_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_ExperimentCacheManager_0 (copy), v3 (copy)
        if not l_FFlagForceEnableSquadRegroup_0 and l_FFlagEnableSquadRegroupExperimentation_0 and l_ExperimentCacheManager_0.default:getLayerVariables(v3) ~= nil then
            l_ExperimentCacheManager_0.default:logLayerExposure(v3);
        end;
    end
};