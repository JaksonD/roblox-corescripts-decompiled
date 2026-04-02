local l_Parent_0 = script:FindFirstAncestor("ContactImporter").Parent;
local l_IXPService_0 = game:GetService("IXPService");
local l_MessageBusService_0 = game:GetService("MessageBusService");
local v3 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v6 = require(l_Parent_0.SocialModalsCommon);
local v7 = require(l_Parent_0.Promise);
local l_PermissionsProtocol_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v10 = require(l_Parent_0.RoactAppExperiment);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_default_0 = l_PermissionsProtocol_0.default;
local v14 = {
    l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
};
local l_EnumScreens_0 = v6.EnumScreens;
local l_SettingsRoute_0 = require(l_Parent_0.LinkingProtocol).Enums.SettingsRoute;
local v17 = require(l_Parent_0.SharedFlags);
local l_FFlagCIDeeplinkEnabledForAll_0 = v17.FFlagCIDeeplinkEnabledForAll;
local l_FFlagCiDeprecateFindFriendsModal_0 = v17.FFlagCiDeprecateFindFriendsModal;
local v20 = game:DefineFastFlag("RemoveHasJustSetPermissions", false);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v17.FFlagRemoveDependencyArrayAntipattern;
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("Realtime", "appResume");
return function(v23) --[[ Line: 41 ]] --[[ Name: useBeginContactImporter ]]
    -- upvalues: l_useNavigation_0 (copy), v3 (copy), v20 (copy), l_useAppPolicy_0 (copy), l_getDeepValue_0 (copy), l_EnumScreens_0 (copy), l_FFlagCIDeeplinkEnabledForAll_0 (copy), v10 (copy), l_AppUserLayers_0 (copy), l_PermissionsProtocol_0 (copy), l_default_0 (copy), v14 (copy), v7 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_FFlagCiDeprecateFindFriendsModal_0 (copy), l_SettingsRoute_0 (copy), l_IXPService_0 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy)
    local v24 = l_useNavigation_0();
    local v25, v26 = v3.useState(false);
    local v27 = nil;
    local v28 = nil;
    if not v20 then
        local v29, v30 = v3.useState(false);
        v27 = v29;
        v28 = v30;
    end;
    local v32 = l_useAppPolicy_0(function(v31) --[[ Line: 49 ]]
        return v31.getContactImporterEnabled();
    end);
    local v33 = v23 and v23.entryPoint or nil;
    local v34 = (l_getDeepValue_0(v24, "state.routeName") or {}) == l_EnumScreens_0.ContactImporter;
    local v36 = l_useAppPolicy_0(function(v35) --[[ Line: 57 ]]
        return v35.getContactImporterEncouraged();
    end);
    local v37 = nil;
    if not l_FFlagCIDeeplinkEnabledForAll_0 then
        v37 = v10.useUserExperiment({
            l_AppUserLayers_0.ContactImporterDevicePermissionNeededModalExposure
        }, function(v38) --[[ Line: 67 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            return (v38[l_AppUserLayers_0.ContactImporterDevicePermissionNeededModalExposure] or {}).systemSettingsDeeplinkEnabled;
        end, false);
    end;
    local v39 = not v36;
    local v42 = v3.useCallback(function(v40) --[[ Line: 76 ]]
        -- upvalues: l_PermissionsProtocol_0 (ref), v26 (copy), v20 (ref), v28 (ref), v24 (copy), l_EnumScreens_0 (ref), v33 (copy)
        local v41 = v40.status == l_PermissionsProtocol_0.Status.AUTHORIZED;
        v26(v41);
        if not v20 then
            v28(v41);
        end;
        if v41 then
            v24.navigate(l_EnumScreens_0.ContactsList, {
                shouldUpdateUserSettings = true, 
                entrypoint = v33
            });
        end;
    end, {
        v24, 
        v33
    });
    local v45 = v3.useCallback(function(v43) --[[ Line: 94 ]]
        -- upvalues: l_PermissionsProtocol_0 (ref), v26 (copy), v36 (copy), l_default_0 (ref), v14 (ref), v42 (copy), v7 (ref)
        local l_status_0 = v43.status;
        if l_status_0 == l_PermissionsProtocol_0.Status.AUTHORIZED then
            v26(true);
        elseif l_status_0 == l_PermissionsProtocol_0.Status.DENIED and v36 then
            l_default_0:requestPermissions(v14):andThen(v42);
        end;
        return v7.resolve(v43.status);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v42, 
        v36
    } else l_dependencyArray_0(v42, v36));
    local v48 = v3.useCallback(function() --[[ Line: 114 ]]
        -- upvalues: l_FFlagCiDeprecateFindFriendsModal_0 (ref), v34 (copy), l_default_0 (ref), v14 (ref), l_PermissionsProtocol_0 (ref), v26 (copy), v24 (copy), l_EnumScreens_0 (ref), v33 (copy), l_SettingsRoute_0 (ref), v36 (copy), v25 (copy), l_FFlagCIDeeplinkEnabledForAll_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v37 (ref), v39 (copy)
        if l_FFlagCiDeprecateFindFriendsModal_0 and v34 then
            l_default_0:requestPermissions(v14):andThen(function(v46) --[[ Line: 116 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), v26 (ref), v24 (ref), l_EnumScreens_0 (ref), v33 (ref), l_SettingsRoute_0 (ref)
                if v46.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v26(true);
                    v24.replace(l_EnumScreens_0.ContactsList, {
                        entrypoint = v33
                    });
                    return;
                else
                    v24.replace(l_EnumScreens_0.SettingsPermissionInteractiveAlert, {
                        settingsRoute = l_SettingsRoute_0.Contacts
                    });
                    return;
                end;
            end);
            return;
        elseif v36 then
            if v25 then
                v24.navigate(l_EnumScreens_0.ContactsList, {
                    entrypoint = v33
                });
                return;
            else
                if not l_FFlagCIDeeplinkEnabledForAll_0 then
                    l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.ContactImporterDevicePermissionNeededModalExposure);
                end;
                if v37 or l_FFlagCIDeeplinkEnabledForAll_0 then
                    v24.navigate(l_EnumScreens_0.SettingsPermissionInteractiveAlert, {
                        settingsRoute = l_SettingsRoute_0.Contacts
                    });
                    return;
                else
                    v24.navigate(l_EnumScreens_0.ContactsRevokedAccessDialog);
                    return;
                end;
            end;
        elseif v39 then
            l_default_0:requestPermissions(v14):andThen(function(v47) --[[ Line: 147 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), v24 (ref), l_EnumScreens_0 (ref), v33 (ref), l_FFlagCIDeeplinkEnabledForAll_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v37 (ref), l_SettingsRoute_0 (ref)
                if v47.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v24.navigate(l_EnumScreens_0.ContactsList, {
                        entrypoint = v33
                    });
                    return;
                else
                    if not l_FFlagCIDeeplinkEnabledForAll_0 then
                        l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.ContactImporterDevicePermissionNeededModalExposure);
                    end;
                    if v37 or l_FFlagCIDeeplinkEnabledForAll_0 then
                        v24.navigate(l_EnumScreens_0.SettingsPermissionInteractiveAlert, {
                            settingsRoute = l_SettingsRoute_0.Contacts
                        });
                        return;
                    else
                        v24.navigate(l_EnumScreens_0.ContactsRevokedAccessDialog);
                        return;
                    end;
                end;
            end);
            return;
        else
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v25, 
        if v20 then nil else v27, 
        v32, 
        v36, 
        v39, 
        v33, 
        v37
    } else l_dependencyArray_0(v25, if v20 then nil else v27, v32, v36, v39, v33, v37));
    v3.useEffect(function() --[[ Line: 193 ]]
        -- upvalues: l_default_0 (ref), v14 (ref), v32 (copy), v36 (copy), v39 (copy), v45 (copy)
        local v49 = l_default_0:hasPermissions(v14);
        if v32 and (v36 or v39) then
            v49:andThen(v45);
            return;
        else
            return;
        end;
    end, {
        v32, 
        v36, 
        v39
    });
    v3.useEffect(function() --[[ Line: 203 ]]
        -- upvalues: v37 (ref), l_FFlagCIDeeplinkEnabledForAll_0 (ref), l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), l_default_0 (ref), v14 (ref), l_PermissionsProtocol_0 (ref), v26 (copy), v20 (ref), v28 (ref)
        if v37 or l_FFlagCIDeeplinkEnabledForAll_0 then
            local v51 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function() --[[ Line: 205 ]]
                -- upvalues: l_default_0 (ref), v14 (ref), l_PermissionsProtocol_0 (ref), v26 (ref), v20 (ref), v28 (ref)
                l_default_0:hasPermissions(v14):andThen(function(v50) --[[ Line: 206 ]]
                    -- upvalues: l_PermissionsProtocol_0 (ref), v26 (ref), v20 (ref), v28 (ref)
                    if v50 and v50.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                        v26(true);
                        if v20 then
                            return;
                        else
                            v28(true);
                        end;
                    end;
                end);
            end, false, true);
            return function() --[[ Line: 218 ]]
                -- upvalues: v51 (copy)
                v51:Disconnect();
            end;
        else
            return nil;
        end;
    end, {
        v37
    });
    if v32 then
        if v36 or v39 then
            return v25, v48;
        else
            return nil, nil;
        end;
    else
        return nil, nil;
    end;
end;