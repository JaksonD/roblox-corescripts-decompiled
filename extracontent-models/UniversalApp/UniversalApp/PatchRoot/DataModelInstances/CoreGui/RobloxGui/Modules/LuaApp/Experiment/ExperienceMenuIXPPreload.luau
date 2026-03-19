local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v4 = require(l_CorePackages_0.Packages.React);
local l_GetFFlagEnableInGameMenuChromeABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInGameMenuChromeABTest;
local function _() --[[ Line: 12 ]] --[[ Name: enabled ]]
    -- upvalues: l_GetFFlagEnableInGameMenuChromeABTest_0 (copy)
    return game:GetEngineFeature("ExperienceMenuABTest") and l_GetFFlagEnableInGameMenuChromeABTest_0();
end;
local function _(v7) --[[ Line: 16 ]] --[[ Name: setMenuVersion ]]
    -- upvalues: l_AppStorageService_0 (copy)
    pcall(function() --[[ Line: 17 ]]
        -- upvalues: l_AppStorageService_0 (ref), v7 (copy)
        if l_AppStorageService_0:GetItem("ExperienceMenuVersion") ~= v7 then
            l_AppStorageService_0:SetItem("ExperienceMenuVersion", v7 or "");
            l_AppStorageService_0:Flush();
        end;
    end);
end;
ExperienceMenuIXPPreload = function(_) --[[ Line: 27 ]] --[[ Name: ExperienceMenuIXPPreload ]]
    -- upvalues: l_GetFFlagEnableInGameMenuChromeABTest_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v4 (copy), l_AppStorageService_0 (copy)
    if game:GetEngineFeature("ExperienceMenuABTest") and l_GetFFlagEnableInGameMenuChromeABTest_0() then
        local v11 = l_useUserExperiment_0({
            l_AppUserLayers_0.ExperienceMenuLayer, 
            l_AppUserLayers_0.ConsoleExperienceMenuLayer
        }, function(v10) --[[ Line: 32 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            if v10[l_AppUserLayers_0.ExperienceMenuLayer] and v10[l_AppUserLayers_0.ExperienceMenuLayer].menuVersion then
                return v10[l_AppUserLayers_0.ExperienceMenuLayer].menuVersion;
            elseif v10[l_AppUserLayers_0.ConsoleExperienceMenuLayer] and v10[l_AppUserLayers_0.ConsoleExperienceMenuLayer].menuVersion then
                return v10[l_AppUserLayers_0.ConsoleExperienceMenuLayer].menuVersion;
            else
                return "";
            end;
        end);
        v4.useEffect(function() --[[ Line: 48 ]]
            -- upvalues: v11 (copy), l_AppStorageService_0 (ref)
            local l_v11_0 = v11;
            pcall(function() --[[ Line: 17 ]]
                -- upvalues: l_AppStorageService_0 (ref), l_v11_0 (copy)
                if l_AppStorageService_0:GetItem("ExperienceMenuVersion") ~= l_v11_0 then
                    l_AppStorageService_0:SetItem("ExperienceMenuVersion", l_v11_0 or "");
                    l_AppStorageService_0:Flush();
                end;
            end);
        end, {
            v11
        });
    end;
    return nil;
end;
return ExperienceMenuIXPPreload;