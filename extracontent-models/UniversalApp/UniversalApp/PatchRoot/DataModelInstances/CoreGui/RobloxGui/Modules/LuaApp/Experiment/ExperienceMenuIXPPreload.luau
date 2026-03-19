local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v4 = require(l_CorePackages_0.Packages.React);
local function _(v5) --[[ Line: 9 ]] --[[ Name: setMenuVersion ]]
    -- upvalues: l_AppStorageService_0 (copy)
    pcall(function() --[[ Line: 10 ]]
        -- upvalues: l_AppStorageService_0 (ref), v5 (copy)
        if l_AppStorageService_0:GetItem("ExperienceMenuVersion") ~= v5 then
            l_AppStorageService_0:SetItem("ExperienceMenuVersion", v5 or "");
            l_AppStorageService_0:Flush();
        end;
    end);
end;
ExperienceMenuIXPPreload = function(_) --[[ Line: 20 ]] --[[ Name: ExperienceMenuIXPPreload ]]
    -- upvalues: l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v4 (copy), l_AppStorageService_0 (copy)
    local v9 = l_useUserExperiment_0({
        l_AppUserLayers_0.ExperienceMenuLayer, 
        l_AppUserLayers_0.ConsoleExperienceMenuLayer
    }, function(v8) --[[ Line: 24 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        if v8[l_AppUserLayers_0.ExperienceMenuLayer] and v8[l_AppUserLayers_0.ExperienceMenuLayer].menuVersion then
            return v8[l_AppUserLayers_0.ExperienceMenuLayer].menuVersion;
        elseif v8[l_AppUserLayers_0.ConsoleExperienceMenuLayer] and v8[l_AppUserLayers_0.ConsoleExperienceMenuLayer].menuVersion then
            return v8[l_AppUserLayers_0.ConsoleExperienceMenuLayer].menuVersion;
        else
            return "";
        end;
    end);
    v4.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v9 (copy), l_AppStorageService_0 (ref)
        local l_v9_0 = v9;
        pcall(function() --[[ Line: 10 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_v9_0 (copy)
            if l_AppStorageService_0:GetItem("ExperienceMenuVersion") ~= l_v9_0 then
                l_AppStorageService_0:SetItem("ExperienceMenuVersion", l_v9_0 or "");
                l_AppStorageService_0:Flush();
            end;
        end);
    end, {
        v9
    });
    return nil;
end;
return ExperienceMenuIXPPreload;