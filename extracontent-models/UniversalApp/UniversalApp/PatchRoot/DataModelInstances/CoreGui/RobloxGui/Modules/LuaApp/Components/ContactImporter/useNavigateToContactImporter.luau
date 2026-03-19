local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v6 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v7 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v8 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v9 = require(l_Modules_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local v10 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local l_EnumScreens_0 = require(l_CorePackages_0.Workspace.Packages.SocialModalsCommon).EnumScreens;
local l_getContactImporterParams_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.getContactImporterParams;
local l_OpenAmpWizardContainer_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer;
return function() --[[ Line: 20 ]]
    -- upvalues: l_useSelector_0 (copy), l_getContactImporterParams_0 (copy), l_useDispatch_0 (copy), v8 (copy), v9 (copy), v10 (copy), l_OpenAmpWizardContainer_0 (copy), l_useNavigation_0 (copy), v5 (copy), v6 (copy), v7 (copy), l_EnumScreens_0 (copy)
    local v14 = l_useSelector_0(l_getContactImporterParams_0);
    local l_isDiscoverabilityUnset_0 = v14.isDiscoverabilityUnset;
    local l_isPhoneVerified_0 = v14.isPhoneVerified;
    local v17 = l_useDispatch_0();
    local function v19(v18) --[[ Line: 26 ]]
        -- upvalues: v17 (copy), v8 (ref)
        v17(v8({
            toastMessage = v18
        }));
    end;
    local function v20() --[[ Line: 31 ]]
        -- upvalues: v17 (copy), v9 (ref)
        v17(v9());
    end;
    local function v23(v21, v22) --[[ Line: 34 ]]
        -- upvalues: v17 (copy), v10 (ref)
        v17(v10(v21, v22));
    end;
    local function v26(v24, v25) --[[ Line: 38 ]]
        -- upvalues: v17 (copy), l_OpenAmpWizardContainer_0 (ref)
        v17(l_OpenAmpWizardContainer_0(v24, v25));
    end;
    local v27 = l_useNavigation_0();
    local v28 = v5(v6);
    local v29 = v5(v7);
    return function() --[[ Line: 46 ]]
        -- upvalues: v27 (copy), l_EnumScreens_0 (ref), v19 (copy), v20 (copy), v29 (copy), v28 (copy), l_isDiscoverabilityUnset_0 (copy), l_isPhoneVerified_0 (copy), v23 (copy), v26 (copy)
        v27.navigate(l_EnumScreens_0.ContactImporter, {
            showToast = v19, 
            openLearnMoreLink = v20, 
            isFromAddFriendsPage = false, 
            diagService = if v29 then v29.Diag else nil, 
            eventIngestService = v28, 
            closeModal = v27.pop, 
            isDiscoverabilityUnset = l_isDiscoverabilityUnset_0, 
            isPhoneVerified = l_isPhoneVerified_0, 
            openProfilePeekView = v23, 
            openAmpUpsell = v26
        });
    end;
end;