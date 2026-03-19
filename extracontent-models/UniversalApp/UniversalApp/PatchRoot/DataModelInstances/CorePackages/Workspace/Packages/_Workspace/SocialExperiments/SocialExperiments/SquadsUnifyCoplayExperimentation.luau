local l_Parent_0 = script:FindFirstAncestor("SocialExperiments").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("SquadsUnifyCoplayExpLayer", "Party.Formation.Create.PartyNudge");
local v3 = game:DefineFastString("SquadsUnifyCoplayOneOnOnePartyCreationVariant", "enableOneOnOnePartyCreation");
local v4 = game:DefineFastString("SquadsUnifyCoplayMultiInvitePartyCreationVariant", "enableMultiInvitePartyCreation");
local v5 = game:DefineFastFlag("EnableSquadsUnifyCoplayOneOnOnePartyCreation_dev", false);
local v6 = game:DefineFastFlag("EnableSquadsUnifyCoplayMultiInvitePartyCreation_dev", false);
local v7 = game:DefineFastFlag("EnableSquadsUnifyCoplayExperimentation_dev", false);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local function _(v9) --[[ Line: 20 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
    local v10 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
    if v10 and v10[v9] ~= nil then
        return v10[v9];
    else
        return false;
    end;
end;
return {
    getOneOnOnePartyCreationEnabled = function() --[[ Line: 30 ]] --[[ Name: getOneOnOnePartyCreationEnabled ]]
        -- upvalues: v5 (copy), v7 (copy), v3 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
        local l_v5_0 = v5;
        if not l_v5_0 then
            l_v5_0 = v7;
            if l_v5_0 then
                local l_v3_0 = v3;
                local v14 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
                l_v5_0 = (if v14 then v14[l_v3_0] ~= nil and v14[l_v3_0] else false) and l_GetFFlagIsSquadEnabled_0();
            end;
        end;
        return l_v5_0;
    end, 
    getMultiInvitePartyCreationEnabled = function() --[[ Line: 39 ]] --[[ Name: getMultiInvitePartyCreationEnabled ]]
        -- upvalues: v6 (copy), v7 (copy), v4 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
        local l_v6_0 = v6;
        if not l_v6_0 then
            l_v6_0 = v7;
            if l_v6_0 then
                local l_v4_0 = v4;
                local v17 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
                l_v6_0 = (if v17 then v17[l_v4_0] ~= nil and v17[l_v4_0] else false) and l_GetFFlagIsSquadEnabled_0();
            end;
        end;
        return l_v6_0;
    end, 
    logExposure = function() --[[ Line: 48 ]] --[[ Name: logExposure ]]
        -- upvalues: v7 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        if v7 and l_ExperimentCacheManager_0.default:getLayerVariables(v2) ~= nil then
            l_ExperimentCacheManager_0.default:logLayerExposure(v2);
        end;
    end
};