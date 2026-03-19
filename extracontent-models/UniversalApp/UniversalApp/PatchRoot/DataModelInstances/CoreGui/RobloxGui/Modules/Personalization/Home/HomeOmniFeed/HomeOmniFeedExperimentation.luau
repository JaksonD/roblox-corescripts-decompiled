local l_CorePackages_0 = game:GetService("CorePackages");
local l_ExperimentCacheManager_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("LuaAppRelativeGuiIxpLayer", "PlayerApp.HomePage.UX");
return {
    getRelativeGuiOnHomeEnabled = function() --[[ Line: 10 ]] --[[ Name: getIsUserInTreatmentAndSendExposureLog ]]
        -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v2_0 = v2;
        local v4 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_0, true);
        if v4 and v4.EnableRelativeGui ~= nil then
            l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v2_0);
            return v4.EnableRelativeGui;
        else
            return false;
        end;
    end
};