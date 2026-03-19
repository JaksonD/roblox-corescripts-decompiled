local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
game:DefineFastFlag("EnablePerfRegressionTest", false);
return function() --[[ Line: 8 ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), l_AppUserLayers_0 (copy)
    local l_EnablePerfRegressionTest_0 = game:GetFastFlag("EnablePerfRegressionTest");
    if l_EnablePerfRegressionTest_0 then
        local v4 = l_ExperimentCacheManager_0.default:getLayerVariables(l_AppUserLayers_0.PerfRegressionTestLayer);
        if v4 and v4.homePageSleepTimeSeconds and typeof(v4.homePageSleepTimeSeconds) == "number" then
            return l_EnablePerfRegressionTest_0, v4.homePageSleepTimeSeconds;
        end;
    end;
    return l_EnablePerfRegressionTest_0, 0;
end;