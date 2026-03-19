local l_Parent_0 = script:FindFirstAncestor("DiscoveryUtils").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("LuaAppVerticalEfficiencyExpLayer", "PlayerApp.HomePage.UX");
local function _(v3) --[[ Line: 12 ]] --[[ Name: getIsUserInTreatmentAndSendExposureLog ]]
    -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
    local l_v2_0 = v2;
    local v5 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_0, true);
    if v5 and v5[v3] ~= nil then
        l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v2_0);
        return v5[v3];
    else
        return false;
    end;
end;
return {
    getIsProfileMovedToTopBar = function() --[[ Line: 24 ]] --[[ Name: getIsProfileMovedToTopBar ]]
        -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v2_1 = v2;
        local v8 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_1, true);
        if v8 and v8.IsProfileMovedToTopBar ~= nil then
            l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v2_1);
            return v8.IsProfileMovedToTopBar;
        else
            return false;
        end;
    end, 
    getIsRobloxLogoHeaderEnabled = function() --[[ Line: 28 ]] --[[ Name: getIsRobloxLogoHeaderEnabled ]]
        -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v2_2 = v2;
        local v10 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_2, true);
        if v10 and v10.IsRobloxLogoHeaderEnabled ~= nil then
            l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v2_2);
            return v10.IsRobloxLogoHeaderEnabled;
        else
            return false;
        end;
    end
};