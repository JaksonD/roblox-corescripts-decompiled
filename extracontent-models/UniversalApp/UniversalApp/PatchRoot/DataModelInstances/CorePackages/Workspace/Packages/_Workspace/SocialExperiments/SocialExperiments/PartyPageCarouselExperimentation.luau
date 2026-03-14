local l_Parent_0 = script:FindFirstAncestor("SocialExperiments").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("FStringPartyPageCarouselExpLayer", "Party.Coordination.UI");
local v3 = game:DefineFastString("PartyPageCarouselVariant", "enablePartyCoordinationUi");
local v4 = game:DefineFastFlag("ForceEnableSocialCarouselPartyPage5", false);
local v5 = game:DefineFastFlag("EnablePartyPageCarouselExperimentation4", false);
local function _(v6) --[[ Line: 13 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
    local v7 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
    if v7 and v7[v6] ~= nil then
        return v7[v6];
    else
        return false;
    end;
end;
return {
    getAppChatFormFactorEnabled = function() --[[ Line: 28 ]] --[[ Name: getAppChatFormFactorEnabled ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        local l_v4_0 = v4;
        if not l_v4_0 then
            l_v4_0 = v5;
            if l_v4_0 then
                local l_v3_0 = v3;
                local v11 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
                if v11 and v11[l_v3_0] ~= nil then
                    return v11[l_v3_0];
                else
                    l_v4_0 = false;
                end;
            end;
        end;
        return l_v4_0;
    end, 
    getPartyPageCarouselEnabled = function() --[[ Line: 23 ]] --[[ Name: getPartyPageCarouselEnabled ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        local l_v4_1 = v4;
        if not l_v4_1 then
            l_v4_1 = v5;
            if l_v4_1 then
                local l_v3_1 = v3;
                local v14 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
                if v14 and v14[l_v3_1] ~= nil then
                    return v14[l_v3_1];
                else
                    l_v4_1 = false;
                end;
            end;
        end;
        return l_v4_1;
    end, 
    logExposure = function() --[[ Line: 33 ]] --[[ Name: logExposure ]]
        -- upvalues: v5 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        if v5 and l_ExperimentCacheManager_0.default:getLayerVariables(v2) ~= nil then
            l_ExperimentCacheManager_0.default:logLayerExposure(v2);
        end;
    end
};