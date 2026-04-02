local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v4 = require(l_CorePackages_0.Packages.React);
local l_requestInternalWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v8.FocusNavigableSurfaceIdentifierEnum;
local l_FocusRoot_0 = v8.FocusRoot;
local l_DynamicReportInExpContainer_0 = require(l_CorePackages_0.Workspace.Packages.GenericAbuseReporting).UXFlows.DynamicReportInExpContainer;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local function v17(v14) --[[ Line: 41 ]] --[[ Name: AbuseReportMenuContent ]]
    -- upvalues: v4 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_DynamicReportInExpContainer_0 (copy)
    local v15, v16 = v4.useState(false);
    v4.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v14 (copy), v16 (copy)
        v14.registerOnReportTabHidden(function() --[[ Line: 45 ]]
            -- upvalues: v16 (ref)
            v16(false);
        end);
        v14.registerOnReportTabDisplayed(function() --[[ Line: 49 ]]
            -- upvalues: v16 (ref)
            v16(true);
        end);
    end, {
        v14.registerOnReportTabHidden, 
        v14.registerOnReportTabDisplayed
    });
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        FocusNavigationCoreScriptsWrapper = v4.createElement(l_FocusRoot_0, {
            frameProps = {
                Size = UDim2.new(1, 0, 1, 0)
            }, 
            isAutoFocusRoot = true, 
            isIsolated = true, 
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView
        }, {
            DynamicReportInExpContainer = v4.createElement(l_DynamicReportInExpContainer_0, {
                onClose = v14.hideReportTab, 
                isReportTabVisible = v15
            })
        })
    });
end;
return function(v18) --[[ Line: 75 ]] --[[ Name: AbuseReportMenu ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), v4 (copy), l_CoreScriptsRootProvider_0 (copy), l_LocalizationProvider_0 (copy), l_RoactServices_0 (copy), l_RoactNetworking_0 (copy), l_requestInternalWrapper_0 (copy), l_HttpService_0 (copy), v17 (copy)
    local v19 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    return v4.createElement(l_CoreScriptsRootProvider_0, nil, v4.createElement(l_LocalizationProvider_0, {
        localization = v19
    }, {
        ServicesProvider = v4.createElement(l_RoactServices_0.ServiceProvider, {
            services = {
                [l_RoactNetworking_0] = l_requestInternalWrapper_0(l_HttpService_0)
            }
        }, {
            AbuseReportMenuContent = v4.createElement(v17, v18)
        })
    }));
end;