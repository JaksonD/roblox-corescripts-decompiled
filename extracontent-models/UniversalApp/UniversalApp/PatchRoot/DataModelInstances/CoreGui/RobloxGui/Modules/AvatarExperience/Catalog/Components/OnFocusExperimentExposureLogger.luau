local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_NavigationEvents_0 = require(l_CorePackages_0.Packages.RoactNavigation).NavigationEvents;
local v4 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXBackendDrivenCatalogLayers_0 = v5.FFlagAXBackendDrivenCatalogLayers;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = game:DefineFastFlag("AXCatalogBELayerExposureCounter", false);
local l_FFlagBasedExposureLoggingCatalogPage_0 = v5.FFlagBasedExposureLoggingCatalogPage;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
return function(v12) --[[ Line: 31 ]] --[[ Name: OnFocusExperimentExposureLogger ]]
    -- upvalues: v2 (copy), l_NavigationEvents_0 (copy), v4 (copy), l_FFlagAXBackendDrivenCatalogLayers_0 (copy), v9 (copy), l_sendAXCounterV2_0 (copy), v8 (copy), l_FFlagBasedExposureLoggingCatalogPage_0 (copy), l_IXPServiceWrapper_0 (copy)
    return v2.createElement(l_NavigationEvents_0, {
        onDidFocus = function() --[[ Line: 33 ]] --[[ Name: onDidFocus ]]
            -- upvalues: v12 (copy), v4 (ref), l_FFlagAXBackendDrivenCatalogLayers_0 (ref), v9 (ref), l_sendAXCounterV2_0 (ref), v8 (ref), l_FFlagBasedExposureLoggingCatalogPage_0 (ref), l_IXPServiceWrapper_0 (ref)
            for _, v14 in v12.ixpTests do
                if v14 ~= nil and v14.isEnabled() then
                    v4.logExperimentExposure(v14);
                end;
            end;
            if l_FFlagAXBackendDrivenCatalogLayers_0 and v12.layers and #v12.layers > 0 then
                if v9 then
                    l_sendAXCounterV2_0(v8.Counter.LayerExposure.CatalogView);
                end;
                for _, v16 in v12.layers do
                    v4.logLayerExposure(v16);
                end;
            end;
            if l_FFlagBasedExposureLoggingCatalogPage_0 and v12.flagIXPTestLayers then
                for _, v18 in v12.flagIXPTestLayers do
                    if v18 then
                        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v18);
                    end;
                end;
            end;
        end
    });
end;