local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_useBrowserTrackerExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useBrowserTrackerExperiment;
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v4 = require(l_CorePackages_0.Packages.React);
local l_IosAuthServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey.IosAuthServiceEnabled;
local function _(v6, v7) --[[ Line: 10 ]] --[[ Name: setLocalStorageKey ]]
    -- upvalues: l_AppStorageService_0 (copy)
    pcall(function() --[[ Line: 11 ]]
        -- upvalues: v6 (copy), l_AppStorageService_0 (ref), v7 (copy)
        if v6 then
            l_AppStorageService_0:SetItem(v7, "true");
        else
            l_AppStorageService_0:SetItem(v7, "false");
        end;
        l_AppStorageService_0:Flush();
    end);
end;
return function(_) --[[ Line: 21 ]] --[[ Name: IosAuthServiceIxpStore ]]
    -- upvalues: l_useBrowserTrackerExperiment_0 (copy), l_AppBtidLayers_0 (copy), v4 (copy), l_IosAuthServiceEnabled_0 (copy), l_AppStorageService_0 (copy)
    local l_enableNewIosPasswordSaving_0 = l_useBrowserTrackerExperiment_0({
        l_AppBtidLayers_0.IosPasswordSavingLayer
    }, function(v10) --[[ Line: 24 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            enableNewIosPasswordSaving = (v10[l_AppBtidLayers_0.IosPasswordSavingLayer] or {}).enableNewIosPasswordSaving or false
        };
    end).enableNewIosPasswordSaving;
    v4.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: l_enableNewIosPasswordSaving_0 (copy), l_IosAuthServiceEnabled_0 (ref), l_AppStorageService_0 (ref)
        local l_l_enableNewIosPasswordSaving_0_0 = l_enableNewIosPasswordSaving_0;
        local l_l_IosAuthServiceEnabled_0_0 = l_IosAuthServiceEnabled_0;
        pcall(function() --[[ Line: 11 ]]
            -- upvalues: l_l_enableNewIosPasswordSaving_0_0 (copy), l_AppStorageService_0 (ref), l_l_IosAuthServiceEnabled_0_0 (copy)
            if l_l_enableNewIosPasswordSaving_0_0 then
                l_AppStorageService_0:SetItem(l_l_IosAuthServiceEnabled_0_0, "true");
            else
                l_AppStorageService_0:SetItem(l_l_IosAuthServiceEnabled_0_0, "false");
            end;
            l_AppStorageService_0:Flush();
        end);
    end, {
        l_enableNewIosPasswordSaving_0
    });
    return nil;
end;