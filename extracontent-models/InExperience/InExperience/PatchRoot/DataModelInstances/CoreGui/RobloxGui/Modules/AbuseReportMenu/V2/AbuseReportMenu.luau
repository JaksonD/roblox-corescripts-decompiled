local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v6 = require(l_CorePackages_0.Packages.React);
local l_requestInternalWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v10.FocusNavigableSurfaceIdentifierEnum;
local l_FocusRoot_0 = v10.FocusRoot;
local l_DynamicReportInExpContainer_0 = require(l_CorePackages_0.Workspace.Packages.GenericAbuseReporting).UXFlows.DynamicReportInExpContainer;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v17 = require(script.Parent.inExpChatMessagesLoader);
local v18 = require(script.Parent.inExpVoiceUsersLoader);
local function v22(v19) --[[ Line: 53 ]] --[[ Name: AbuseReportMenuContent ]]
    -- upvalues: v6 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_DynamicReportInExpContainer_0 (copy), v17 (copy), v18 (copy), l_default_0 (copy)
    local v20, v21 = v6.useState(false);
    v6.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v19 (copy), v21 (copy)
        v19.registerOnReportTabHidden(function() --[[ Line: 57 ]]
            -- upvalues: v21 (ref)
            v21(false);
        end);
        v19.registerOnReportTabDisplayed(function() --[[ Line: 61 ]]
            -- upvalues: v21 (ref)
            v21(true);
        end);
    end, {
        v19.registerOnReportTabHidden, 
        v19.registerOnReportTabDisplayed
    });
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        FocusNavigationCoreScriptsWrapper = v6.createElement(l_FocusRoot_0, {
            frameProps = {
                Size = UDim2.new(1, 0, 1, 0)
            }, 
            isAutoFocusRoot = true, 
            isIsolated = true, 
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView
        }, {
            DynamicReportInExpContainer = v6.createElement(l_DynamicReportInExpContainer_0, {
                onClose = v19.hideReportTab, 
                registerOnInGameMenuClosed = v19.registerOnSettingsHidden, 
                isReportTabVisible = v20, 
                inExpChatMessagesLoader = v17, 
                inExpVoiceUsersLoader = v18, 
                voiceChatServiceManager = l_default_0
            })
        })
    });
end;
return function(v23) --[[ Line: 91 ]] --[[ Name: AbuseReportMenu ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), v6 (copy), l_CoreScriptsRootProvider_0 (copy), l_LocalizationProvider_0 (copy), l_RoactServices_0 (copy), l_RoactNetworking_0 (copy), l_requestInternalWrapper_0 (copy), l_HttpService_0 (copy), v22 (copy)
    local v24 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    return v6.createElement(l_CoreScriptsRootProvider_0, nil, v6.createElement(l_LocalizationProvider_0, {
        localization = v24
    }, {
        ServicesProvider = v6.createElement(l_RoactServices_0.ServiceProvider, {
            services = {
                [l_RoactNetworking_0] = l_requestInternalWrapper_0(l_HttpService_0)
            }
        }, {
            AbuseReportMenuContent = v6.createElement(v22, v23)
        })
    }));
end;