local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_EnumScreens_0 = v1.SocialModalsCommon.EnumScreens;
local v4 = require(l_Parent_0.Common.TextKeys);
local v5 = require(l_Parent_0.Common.Constants);
local l_Analytics_0 = l_Parent_0.Analytics;
local v7 = require(l_Analytics_0.useAnalytics);
local v8 = require(l_Analytics_0.Enums.EventNames);
local l_updateOptedInUsers_0 = v1.SocialModalsCommon.Utils.updateOptedInUsers;
local l_UpdateContactImporterModalLogic_0 = v1.SocialModalsCommon.Actions.UpdateContactImporterModalLogic;
local l_UpdateIsDiscoverabilityUnset_0 = v1.SocialModalsCommon.Actions.UpdateIsDiscoverabilityUnset;
local l_NetworkingUserSettings_0 = v1.NetworkingUserSettings;
local l_PermissionsProtocol_0 = v1.PermissionsProtocol;
local l_Promise_0 = v1.Promise;
local l_Dash_0 = v1.Dash;
local l_AppStorageService_0 = v1.AppStorageService;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_React_0 = v1.React;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_useDispatch_0 = v1.Hooks.useDispatch;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local v22 = require(script.Parent.DiscoverabilityOverlay);
local l_AppPage_0 = require(l_Parent_1.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_1.NavigationRodux).Thunks.NavigateDown;
local v25 = require(l_Parent_1.ToastRodux);
local v27 = {
    checkOrRequestPermissions = function(v26) --[[ Line: 62 ]] --[[ Name: checkOrRequestPermissions ]]
        -- upvalues: l_PermissionsProtocol_0 (copy)
        return l_PermissionsProtocol_0.default:checkOrRequestPermissions(v26);
    end
};
return function(v28) --[[ Line: 68 ]]
    -- upvalues: l_Dash_0 (copy), v27 (copy), l_getDeepValue_0 (copy), v5 (copy), l_useDispatch_0 (copy), v7 (copy), l_useSelector_0 (copy), l_React_0 (copy), v8 (copy), v25 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v4 (copy), l_UpdateContactImporterModalLogic_0 (copy), l_UpdateIsDiscoverabilityUnset_0 (copy), l_NetworkingUserSettings_0 (copy), l_PermissionsProtocol_0 (copy), l_updateOptedInUsers_0 (copy), l_AppStorageService_0 (copy), l_EnumScreens_0 (copy), l_Promise_0 (copy), v22 (copy)
    local v29 = l_Dash_0.join(v27, v28 or {});
    local function _(v30) --[[ Line: 70 ]]
        -- upvalues: v29 (copy), l_getDeepValue_0 (ref)
        if v29.navigation then
            return v29.navigation.getParam(v30);
        else
            return l_getDeepValue_0(v29, v30);
        end;
    end;
    local l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 = v5.IS_STANDALONE_DISCOVERABILITY_MODAL;
    local v33 = if v29.navigation then v29.navigation.getParam(l_IS_STANDALONE_DISCOVERABILITY_MODAL_0) else l_getDeepValue_0(v29, l_IS_STANDALONE_DISCOVERABILITY_MODAL_0);
    l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 = l_useDispatch_0();
    local v34 = v7();
    local v36 = l_useSelector_0(function(v35) --[[ Line: 80 ]]
        return v35.ScreenSize;
    end);
    local v38 = l_useSelector_0(function(v37) --[[ Line: 83 ]]
        return v37.LocalUserId;
    end);
    local v39 = l_React_0.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: v29 (copy)
        if v29.navigation then
            v29.navigation.pop();
            return;
        else
            if v29.onClose then
                v29.onClose();
            end;
            return;
        end;
    end, {
        v29
    });
    local v41 = l_useSelector_0(function(v40) --[[ Line: 95 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        return l_getDeepValue_0(v40, "DiscoverabilityModal.UserPermissions.userSettingsMetadata");
    end);
    l_React_0.useEffect(function() --[[ Line: 99 ]]
        -- upvalues: v41 (copy), v5 (ref), v34 (copy), v8 (ref)
        local v42 = nil;
        v42 = if v41.prefillDiscoverabilitySetting then v5.NON_GDPR_VERSION_CHECKBOX else v5.GDPR_VERSION;
        v34.fireAnalyticsEvent(v8.DiscoverabilityModalLoad, {
            version = v42, 
            wordingVersion = v5.WORDING_VERSION_1
        });
    end, {});
    local v44 = l_React_0.useCallback(function(v43) --[[ Line: 113 ]]
        -- upvalues: l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 (copy), v25 (ref)
        l_IS_STANDALONE_DISCOVERABILITY_MODAL_0(v25.Actions.SetCurrentToastMessage({
            toastMessage = v43
        }));
    end, {
        l_IS_STANDALONE_DISCOVERABILITY_MODAL_0
    });
    local function v46(v45) --[[ Line: 119 ]]
        -- upvalues: v34 (copy), v8 (ref), v39 (copy)
        v34.fireAnalyticsEvent(v8.DiscoverabilityModalClose, {
            selected = v45
        });
        v39();
    end;
    local function v47() --[[ Line: 126 ]]
        -- upvalues: l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        l_IS_STANDALONE_DISCOVERABILITY_MODAL_0(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/articles/7416652004884", 
            extraProps = {
                title = ""
            }
        }, nil));
    end;
    local function v49(_) --[[ Line: 136 ]]
        -- upvalues: v44 (copy), v4 (ref)
        v44(v4.CI_FAILED);
    end;
    local function _() --[[ Line: 140 ]]
        -- upvalues: l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 (copy), l_UpdateContactImporterModalLogic_0 (ref)
        return l_IS_STANDALONE_DISCOVERABILITY_MODAL_0(l_UpdateContactImporterModalLogic_0({
            hasOSPermissions = true, 
            shouldShowContactImporterUpsellModal = false
        }));
    end;
    local function _() --[[ Line: 147 ]]
        -- upvalues: l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 (copy), l_UpdateIsDiscoverabilityUnset_0 (ref)
        return l_IS_STANDALONE_DISCOVERABILITY_MODAL_0(l_UpdateIsDiscoverabilityUnset_0({
            isDiscoverabilityUnset = false
        }));
    end;
    local function _(v52) --[[ Line: 153 ]]
        -- upvalues: l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 (copy), l_NetworkingUserSettings_0 (ref)
        return l_IS_STANDALONE_DISCOVERABILITY_MODAL_0(l_NetworkingUserSettings_0.UpdateUserSettings.API({
            phoneNumberDiscoverability = v52
        }));
    end;
    local function v62(v54) --[[ Line: 159 ]]
        -- upvalues: v34 (copy), v8 (ref), v33 (copy), l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 (copy), l_NetworkingUserSettings_0 (ref), l_UpdateIsDiscoverabilityUnset_0 (ref), v5 (ref), v29 (copy), l_getDeepValue_0 (ref), v39 (copy), v44 (copy), v4 (ref), l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), v38 (copy), l_UpdateContactImporterModalLogic_0 (ref), l_EnumScreens_0 (ref), v36 (copy), l_Promise_0 (ref), v49 (copy)
        v34.fireAnalyticsEvent(v8.DiscoverabilityModalContinue, {
            selected = v54
        });
        if v33 then
            l_IS_STANDALONE_DISCOVERABILITY_MODAL_0(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                phoneNumberDiscoverability = v54
            })):andThen(function() --[[ Line: 165 ]]
                -- upvalues: l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 (ref), l_UpdateIsDiscoverabilityUnset_0 (ref), v5 (ref), v29 (ref), l_getDeepValue_0 (ref), v39 (ref), v44 (ref), v4 (ref)
                local v55 = l_IS_STANDALONE_DISCOVERABILITY_MODAL_0(l_UpdateIsDiscoverabilityUnset_0({
                    isDiscoverabilityUnset = false
                }));
                local l_NAVIGATE_ON_ACTIVATED_0 = v5.NAVIGATE_ON_ACTIVATED;
                v55 = if v29.navigation then v29.navigation.getParam(l_NAVIGATE_ON_ACTIVATED_0) else l_getDeepValue_0(v29, l_NAVIGATE_ON_ACTIVATED_0);
                v39();
                v55();
                v44(v4.SETTING_SAVED);
            end);
            return;
        else
            v29.checkOrRequestPermissions({
                l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
            }):andThen(function(v57) --[[ Line: 177 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), v38 (ref), l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 (ref), l_UpdateContactImporterModalLogic_0 (ref), v54 (copy), l_NetworkingUserSettings_0 (ref), l_UpdateIsDiscoverabilityUnset_0 (ref), v29 (ref), l_EnumScreens_0 (ref), v5 (ref), v36 (ref), l_Promise_0 (ref)
                if v57 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    l_updateOptedInUsers_0:addUserToLocalStorage(l_AppStorageService_0, v38);
                    local _ = l_IS_STANDALONE_DISCOVERABILITY_MODAL_0(l_UpdateContactImporterModalLogic_0({
                        hasOSPermissions = true, 
                        shouldShowContactImporterUpsellModal = false
                    }));
                    local l_v54_0 = v54;
                    l_IS_STANDALONE_DISCOVERABILITY_MODAL_0(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                        phoneNumberDiscoverability = l_v54_0
                    })):andThen(function() --[[ Line: 181 ]]
                        -- upvalues: l_IS_STANDALONE_DISCOVERABILITY_MODAL_0 (ref), l_UpdateIsDiscoverabilityUnset_0 (ref), v29 (ref), l_EnumScreens_0 (ref), v5 (ref)
                        local _ = l_IS_STANDALONE_DISCOVERABILITY_MODAL_0(l_UpdateIsDiscoverabilityUnset_0({
                            isDiscoverabilityUnset = false
                        }));
                        v29.navigation.replace(l_EnumScreens_0.ContactsList, {
                            [v5.IS_PHONE_VERIFIED] = true, 
                            entryPoint = v29.navigation.getParam("entryPoint")
                        });
                    end);
                    return;
                elseif v57 == l_PermissionsProtocol_0.Status.DENIED then
                    local l_v54_1 = v54;
                    l_IS_STANDALONE_DISCOVERABILITY_MODAL_0(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                        phoneNumberDiscoverability = l_v54_1
                    })):andThen(function() --[[ Line: 190 ]]
                        -- upvalues: v29 (ref), l_EnumScreens_0 (ref), v36 (ref)
                        v29.navigation.replace(l_EnumScreens_0.ContactsRevokedAccessDialog, {
                            screenSize = v36, 
                            closeModal = function() --[[ Line: 193 ]] --[[ Name: closeModal ]]
                                -- upvalues: v29 (ref)
                                v29.navigation.pop();
                            end
                        });
                    end);
                    return;
                else
                    return l_Promise_0.reject();
                end;
            end):catch(v49);
            return;
        end;
    end;
    return l_React_0.createElement(v22, {
        screenSize = v36, 
        onCloseClicked = v46, 
        onLearnMoreClick = v47, 
        onActivated = v62, 
        prefillDiscoverabilitySetting = v41.prefillDiscoverabilitySetting, 
        analytics = v34
    });
end;