local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local l_useBrowserTrackerExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useBrowserTrackerExperiment;
local function _() --[[ Line: 9 ]] --[[ Name: useIosAuthServiceExperiment ]]
    -- upvalues: l_useBrowserTrackerExperiment_0 (copy), l_AppBtidLayers_0 (copy)
    return (l_useBrowserTrackerExperiment_0({
        l_AppBtidLayers_0.IosPasswordSavingLayer
    }, function(v3) --[[ Line: 12 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            enableNewIosPasswordSaving = (v3[l_AppBtidLayers_0.IosPasswordSavingLayer] or {}).enableNewIosPasswordSaving or false
        };
    end));
end;
return {
    useIsIosAuthServiceEnabled = function() --[[ Line: 23 ]] --[[ Name: useIsIosAuthServiceEnabled ]]
        -- upvalues: l_useBrowserTrackerExperiment_0 (copy), l_AppBtidLayers_0 (copy)
        return l_useBrowserTrackerExperiment_0({
            l_AppBtidLayers_0.IosPasswordSavingLayer
        }, function(v5) --[[ Line: 12 ]]
            -- upvalues: l_AppBtidLayers_0 (ref)
            return {
                enableNewIosPasswordSaving = (v5[l_AppBtidLayers_0.IosPasswordSavingLayer] or {}).enableNewIosPasswordSaving or false
            };
        end).enableNewIosPasswordSaving;
    end
};