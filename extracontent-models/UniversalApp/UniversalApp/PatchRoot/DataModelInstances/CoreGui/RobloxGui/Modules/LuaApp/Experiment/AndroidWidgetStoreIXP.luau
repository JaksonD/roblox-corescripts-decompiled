local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_useBrowserTrackerExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useBrowserTrackerExperiment;
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v4 = require(l_CorePackages_0.Packages.React);
local function _(v5) --[[ Line: 9 ]] --[[ Name: setLocalStorageKey ]]
    -- upvalues: l_AppStorageService_0 (copy)
    pcall(function() --[[ Line: 10 ]]
        -- upvalues: v5 (copy), l_AppStorageService_0 (ref)
        if v5 ~= nil then
            l_AppStorageService_0:SetItem("AndroidRecentlyPlayedWidgetVariant", v5);
        else
            l_AppStorageService_0:SetItem("AndroidRecentlyPlayedWidgetVariant", "no_widget");
        end;
        l_AppStorageService_0:Flush();
    end);
end;
AndroidWidgetStoreIXP = function(_) --[[ Line: 20 ]] --[[ Name: AndroidWidgetStoreIXP ]]
    -- upvalues: l_useBrowserTrackerExperiment_0 (copy), l_AppBtidLayers_0 (copy), v4 (copy), l_AppStorageService_0 (copy)
    local l_recentlyPlayedWidgetVariant_0 = l_useBrowserTrackerExperiment_0({
        l_AppBtidLayers_0.AndroidWidgetLayer
    }, function(v8) --[[ Line: 23 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            recentlyPlayedWidgetVariant = (v8[l_AppBtidLayers_0.AndroidWidgetLayer] or {}).recentlyPlayedWidgetVariant
        };
    end).recentlyPlayedWidgetVariant;
    v4.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: l_recentlyPlayedWidgetVariant_0 (copy), l_AppStorageService_0 (ref)
        local l_l_recentlyPlayedWidgetVariant_0_0 = l_recentlyPlayedWidgetVariant_0;
        pcall(function() --[[ Line: 10 ]]
            -- upvalues: l_l_recentlyPlayedWidgetVariant_0_0 (copy), l_AppStorageService_0 (ref)
            if l_l_recentlyPlayedWidgetVariant_0_0 ~= nil then
                l_AppStorageService_0:SetItem("AndroidRecentlyPlayedWidgetVariant", l_l_recentlyPlayedWidgetVariant_0_0);
            else
                l_AppStorageService_0:SetItem("AndroidRecentlyPlayedWidgetVariant", "no_widget");
            end;
            l_AppStorageService_0:Flush();
        end);
    end, {
        l_recentlyPlayedWidgetVariant_0
    });
    return nil;
end;
return AndroidWidgetStoreIXP;