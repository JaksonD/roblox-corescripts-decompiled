local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_useBrowserTrackerExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useBrowserTrackerExperiment;
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v4 = require(l_CorePackages_0.Packages.React);
local function _(v5, v6) --[[ Line: 10 ]] --[[ Name: setLocalStorageKey ]]
    -- upvalues: l_AppStorageService_0 (copy)
    pcall(function() --[[ Line: 11 ]]
        -- upvalues: v5 (copy), l_AppStorageService_0 (ref), v6 (copy)
        if v5 then
            l_AppStorageService_0:SetItem(v6, "true");
        else
            l_AppStorageService_0:SetItem(v6, "false");
        end;
        l_AppStorageService_0:Flush();
    end);
end;
WidgetStoreIXP = function(_) --[[ Line: 21 ]] --[[ Name: WidgetStoreIXP ]]
    -- upvalues: l_useBrowserTrackerExperiment_0 (copy), l_AppBtidLayers_0 (copy), v4 (copy), l_AppStorageService_0 (copy)
    local v12 = l_useBrowserTrackerExperiment_0({
        l_AppBtidLayers_0.WidgetLayer, 
        l_AppBtidLayers_0.LockScreenWidgetLayer
    }, function(v9) --[[ Line: 25 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        local v10 = v9[l_AppBtidLayers_0.WidgetLayer] or {};
        local v11 = v9[l_AppBtidLayers_0.LockScreenWidgetLayer] or {};
        return {
            showRecentsWidget = v10.showRecentsWidget, 
            showLockScreenWidget = v11.showLockScreenWidget
        };
    end);
    local l_showRecentsWidget_0 = v12.showRecentsWidget;
    local l_showLockScreenWidget_0 = v12.showLockScreenWidget;
    v4.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: l_showRecentsWidget_0 (copy), l_AppStorageService_0 (ref), l_showLockScreenWidget_0 (copy)
        local l_l_showRecentsWidget_0_0 = l_showRecentsWidget_0;
        local l_pcall_0 = pcall;
        local v17 = "EnableWidgetExtension";
        local l_l_l_showRecentsWidget_0_0_0 = l_l_showRecentsWidget_0_0 --[[ copy: 0 -> 4 ]];
        local l_v17_0 = v17 --[[ copy: 3 -> 5 ]];
        l_pcall_0(function() --[[ Line: 11 ]]
            -- upvalues: l_l_l_showRecentsWidget_0_0_0 (copy), l_AppStorageService_0 (ref), l_v17_0 (copy)
            if l_l_l_showRecentsWidget_0_0_0 then
                l_AppStorageService_0:SetItem(l_v17_0, "true");
            else
                l_AppStorageService_0:SetItem(l_v17_0, "false");
            end;
            l_AppStorageService_0:Flush();
        end);
        l_l_showRecentsWidget_0_0 = l_showLockScreenWidget_0;
        l_pcall_0 = pcall;
        v17 = "EnableLockScreenWidgetExperiment";
        l_pcall_0(function() --[[ Line: 11 ]]
            -- upvalues: l_l_showRecentsWidget_0_0 (copy), l_AppStorageService_0 (ref), v17 (copy)
            if l_l_showRecentsWidget_0_0 then
                l_AppStorageService_0:SetItem(v17, "true");
            else
                l_AppStorageService_0:SetItem(v17, "false");
            end;
            l_AppStorageService_0:Flush();
        end);
    end, {
        l_showRecentsWidget_0, 
        l_showLockScreenWidget_0
    });
    return nil;
end;
return WidgetStoreIXP;