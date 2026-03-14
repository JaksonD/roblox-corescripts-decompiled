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
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("Realtime", "appResume");
return function(v22) --[[ Line: 39 ]] --[[ Name: useBeginContactImporter ]]
    -- upvalues: l_useNavigation_0 (copy), v3 (copy), v20 (copy), l_useAppPolicy_0 (copy), l_getDeepValue_0 (copy), l_EnumScreens_0 (copy), l_FFlagCIDeeplinkEnabledForAll_0 (copy), v10 (copy), l_AppUserLayers_0 (copy), l_PermissionsProtocol_0 (copy), l_default_0 (copy), v14 (copy), v7 (copy), l_dependencyArray_0 (copy), l_FFlagCiDeprecateFindFriendsModal_0 (copy), l_SettingsRoute_0 (copy), l_IXPService_0 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy)
    local v23 = l_useNavigation_0();
    local v24, v25 = v3.useState(false);
    local v26 = nil;
    local v27 = nil;
    if not v20 then
        local v28, v29 = v3.useState(false);
        v26 = v28;
        v27 = v29;
    end;
    local v31 = l_useAppPolicy_0(function(v30) --[[ Line: 47 ]]
        return v30.getContactImporterEnabled();
    end);
    local v32 = v22 and v22.entryPoint or nil;
    local v33 = (l_getDeepValue_0(v23, "state.routeName") or {}) == l_EnumScreens_0.ContactImporter;
    local v35 = l_useAppPolicy_0(function(v34) --[[ Line: 55 ]]
        return v34.getContactImporterEncouraged();
    end);
    local v36 = nil;
    if not l_FFlagCIDeeplinkEnabledForAll_0 then
        v36 = v10.useUserExperiment({
            l_AppUserLayers_0.ContactImporterDevicePermissionNeededModalExposure
        }, function(v37) --[[ Line: 65 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            return (v37[l_AppUserLayers_0.ContactImporterDevicePermissionNeededModalExposure] or {}).systemSettingsDeeplinkEnabled;
        end, false);
    end;
    local v38 = not v35;
    local v41 = v3.useCallback(function(v39) --[[ Line: 74 ]]
        -- upvalues: l_PermissionsProtocol_0 (ref), v25 (copy), v20 (ref), v27 (ref), v23 (copy), l_EnumScreens_0 (ref), v32 (copy)
        local v40 = v39.status == l_PermissionsProtocol_0.Status.AUTHORIZED;
        v25(v40);
        if not v20 then
            v27(v40);
        end;
        if v40 then
            v23.navigate(l_EnumScreens_0.ContactsList, {
                shouldUpdateUserSettings = true, 
                entrypoint = v32
            });
        end;
    end, {
        v23, 
        v32
    });
    local v44 = v3.useCallback(function(v42) --[[ Line: 91 ]]
        -- upvalues: l_PermissionsProtocol_0 (ref), v25 (copy), v35 (copy), l_default_0 (ref), v14 (ref), v41 (copy), v7 (ref)
        local l_status_0 = v42.status;
        if l_status_0 == l_PermissionsProtocol_0.Status.AUTHORIZED then
            v25(true);
        elseif l_status_0 == l_PermissionsProtocol_0.Status.DENIED and v35 then
            l_default_0:requestPermissions(v14):andThen(v41);
        end;
        return v7.resolve(v42.status);
    end, l_dependencyArray_0(v41, v35));
    local v47 = v3.useCallback(function() --[[ Line: 107 ]]
        -- upvalues: l_FFlagCiDeprecateFindFriendsModal_0 (ref), v33 (copy), l_default_0 (ref), v14 (ref), l_PermissionsProtocol_0 (ref), v25 (copy), v23 (copy), l_EnumScreens_0 (ref), v32 (copy), l_SettingsRoute_0 (ref), v35 (copy), v24 (copy), l_FFlagCIDeeplinkEnabledForAll_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v36 (ref), v38 (copy)
        if l_FFlagCiDeprecateFindFriendsModal_0 and v33 then
            l_default_0:requestPermissions(v14):andThen(function(v45) --[[ Line: 109 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), v25 (ref), v23 (ref), l_EnumScreens_0 (ref), v32 (ref), l_SettingsRoute_0 (ref)
                if v45.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v25(true);
                    v23.replace(l_EnumScreens_0.ContactsList, {
                        entrypoint = v32
                    });
                    return;
                else
                    v23.replace(l_EnumScreens_0.SettingsPermissionInteractiveAlert, {
                        settingsRoute = l_SettingsRoute_0.Contacts
                    });
                    return;
                end;
            end);
            return;
        elseif v35 then
            if v24 then
                v23.navigate(l_EnumScreens_0.ContactsList, {
                    entrypoint = v32
                });
                return;
            else
                if not l_FFlagCIDeeplinkEnabledForAll_0 then
                    l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.ContactImporterDevicePermissionNeededModalExposure);
                end;
                if v36 or l_FFlagCIDeeplinkEnabledForAll_0 then
                    v23.navigate(l_EnumScreens_0.SettingsPermissionInteractiveAlert, {
                        settingsRoute = l_SettingsRoute_0.Contacts
                    });
                    return;
                else
                    v23.navigate(l_EnumScreens_0.ContactsRevokedAccessDialog);
                    return;
                end;
            end;
        elseif v38 then
            l_default_0:requestPermissions(v14):andThen(function(v46) --[[ Line: 140 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), v23 (ref), l_EnumScreens_0 (ref), v32 (ref), l_FFlagCIDeeplinkEnabledForAll_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v36 (ref), l_SettingsRoute_0 (ref)
                if v46.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v23.navigate(l_EnumScreens_0.ContactsList, {
                        entrypoint = v32
                    });
                    return;
                else
                    if not l_FFlagCIDeeplinkEnabledForAll_0 then
                        l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.ContactImporterDevicePermissionNeededModalExposure);
                    end;
                    if v36 or l_FFlagCIDeeplinkEnabledForAll_0 then
                        v23.navigate(l_EnumScreens_0.SettingsPermissionInteractiveAlert, {
                            settingsRoute = l_SettingsRoute_0.Contacts
                        });
                        return;
                    else
                        v23.navigate(l_EnumScreens_0.ContactsRevokedAccessDialog);
                        return;
                    end;
                end;
            end);
            return;
        else
            return;
        end;
    end, l_dependencyArray_0(v24, if v20 then nil else v26, v31, v35, v38, v32, v36));
    v3.useEffect(function() --[[ Line: 176 ]]
        -- upvalues: l_default_0 (ref), v14 (ref), v31 (copy), v35 (copy), v38 (copy), v44 (copy)
        local v48 = l_default_0:hasPermissions(v14);
        if v31 and (v35 or v38) then
            v48:andThen(v44);
            return;
        else
            return;
        end;
    end, {
        v31, 
        v35, 
        v38
    });
    v3.useEffect(function() --[[ Line: 186 ]]
        -- upvalues: v36 (ref), l_FFlagCIDeeplinkEnabledForAll_0 (ref), l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), l_default_0 (ref), v14 (ref), l_PermissionsProtocol_0 (ref), v25 (copy), v20 (ref), v27 (ref)
        if v36 or l_FFlagCIDeeplinkEnabledForAll_0 then
            local v50 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function() --[[ Line: 188 ]]
                -- upvalues: l_default_0 (ref), v14 (ref), l_PermissionsProtocol_0 (ref), v25 (ref), v20 (ref), v27 (ref)
                l_default_0:hasPermissions(v14):andThen(function(v49) --[[ Line: 189 ]]
                    -- upvalues: l_PermissionsProtocol_0 (ref), v25 (ref), v20 (ref), v27 (ref)
                    if v49 and v49.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                        v25(true);
                        if v20 then
                            return;
                        else
                            v27(true);
                        end;
                    end;
                end);
            end, false, true);
            return function() --[[ Line: 201 ]]
                -- upvalues: v50 (copy)
                v50:Disconnect();
            end;
        else
            return nil;
        end;
    end, {
        v36
    });
    if v31 then
        if v35 or v38 then
            return v24, v47;
        else
            return nil, nil;
        end;
    else
        return nil, nil;
    end;
end;