local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v4 = require(script.Parent.User);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugResetSurveyStorage);
local l_ExperimentCacheManager_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager;
local v8 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v9 = require(l_Modules_0.LuaApp.Thunks.Authentication.ClearApp);
local v10 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v11 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v12 = require(l_Modules_0.LuaApp.Components.OnPlatformSurveys.CsatSurveyConstants);
local v13 = require(l_Modules_0.LuaApp.Constants);
return function() --[[ Line: 18 ]] --[[ Name: resetAppState ]]
    -- upvalues: v9 (copy), v4 (copy), l_ExperimentCacheManager_0 (copy), v6 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy), v8 (copy), l_MemStorageService_0 (copy), v10 (copy), v11 (copy)
    return function(v14) --[[ Line: 19 ]]
        -- upvalues: v9 (ref), v4 (ref), l_ExperimentCacheManager_0 (ref), v6 (ref), l_AppStorageService_0 (ref), v12 (ref), v13 (ref), v8 (ref), l_MemStorageService_0 (ref), v10 (ref), v11 (ref)
        v14:dispatch(v9());
        v4.clearLocalStorage();
        l_ExperimentCacheManager_0.default:clearCache();
        if v6() then
            l_AppStorageService_0:SetItem(v12.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, v13.Auth.DefaultUnauthenticatedCsatCompletedSurveyIds);
        end;
        v8.setRobloxLocaleId(v13.Auth.DefaultUnauthenticatedRobloxLocaleId);
        v8.setDiscoveryClientFallbackCache("");
        l_MemStorageService_0:Fire(v10.ThemeUpdate, v13.Auth.DefaultUnauthenticatedAppTheme);
        l_MemStorageService_0:SetItem(v10.RobuxBalance, v13.Auth.DefaultUnauthenticatedRobuxBalance);
        l_MemStorageService_0:SetItem(v10.RobuxBalanceLocalized, v13.Auth.DefaultUnauthenticatedRobuxBalanceLocalized);
        v11.clearUserLayers();
    end;
end;