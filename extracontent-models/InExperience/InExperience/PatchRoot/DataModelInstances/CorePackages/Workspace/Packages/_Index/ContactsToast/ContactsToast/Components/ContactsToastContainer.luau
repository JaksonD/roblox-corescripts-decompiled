local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactsToast");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.ExperienceService);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.Cryo);
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v9 = require(l_Parent_0.RobloxAppHooks);
local l_useLocalUserId_0 = v9.useLocalUserId;
local l_useScreenSize_0 = v9.useScreenSize;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_PermissionsProtocol_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol;
local v14 = require(l_Parent_0.SocialModalsCommon);
local l_EnumScreens_0 = v14.EnumScreens;
local l_updateOptedInUsers_0 = v14.Utils.updateOptedInUsers;
local l_UpdateContactImporterModalLogic_0 = v14.Actions.UpdateContactImporterModalLogic;
local l_setTimeout_0 = require(l_Parent_0.LuauPolyfill).setTimeout;
local v19 = require(l_Parent_0.UIBlox);
local l_Toast_0 = v19.App.Dialog.Toast;
local l_Images_0 = v19.App.ImageSet.Images;
local l_IconSize_0 = v19.App.Constant.IconSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_GetFFlagContactsToastEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagContactsToastEnabled;
local l_ExperienceService_0 = v4.ExperienceService;
local v28 = require(l_script_FirstAncestor_0.Common.Constants);
local v29 = require(l_script_FirstAncestor_0.Utils.localStorageContactsToast);
local v30 = require(l_script_FirstAncestor_0.Networking.configureRoduxUsers);
local v31 = require(l_script_FirstAncestor_0.Experiments.ContactsToastIXP);
local l_Analytics_0 = require(l_script_FirstAncestor_0.Analytics).Analytics;
local v33 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v35 = game:DefineFastInt("ContactsToastAccountAgeThresholdInDays", 7);
local v36 = l_Images_0["icons/graphic/connectcontacts_large"];
local v37 = Vector2.new(l_IconSize_0.Large, l_IconSize_0.Large);
return function(v38) --[[ Line: 63 ]]
    -- upvalues: v6 (copy), l_useDispatch_0 (copy), l_Analytics_0 (copy), l_useLocalization_0 (copy), v28 (copy), v31 (copy), l_useSelector_0 (copy), l_useScreenSize_0 (copy), l_useLocalUserId_0 (copy), l_GetFFlagContactsToastEnabled_0 (copy), l_getDeepValue_0 (copy), l_PermissionsProtocol_0 (copy), l_SetCurrentToastMessage_0 (copy), v7 (copy), v33 (copy), l_UpdateContactImporterModalLogic_0 (copy), l_l_UserInputService_0_Platform_0 (copy), l_updateOptedInUsers_0 (copy), l_AppStorageService_0 (copy), l_EnumScreens_0 (copy), v5 (copy), l_Toast_0 (copy), v36 (copy), v37 (copy), v30 (copy), v35 (copy), v29 (copy), l_ExperienceService_0 (copy), l_setTimeout_0 (copy)
    local v39, v40 = v6.useState(false);
    local v41 = l_useDispatch_0();
    local v42 = l_Analytics_0();
    local v43 = l_useLocalization_0({
        title = v28.Translations.title, 
        subtitle = v28.Translations.subtitle, 
        button = v28.Translations.button, 
        buttonV2 = v28.Translations.buttonV2
    });
    local v44 = v31.useContactsToastVariant();
    local v45 = l_useSelector_0(v38.getContactImporterParams);
    local l_isDiscoverabilityUnset_0 = v45.isDiscoverabilityUnset;
    local l_isPhoneVerified_0 = v45.isPhoneVerified;
    local v48 = l_useScreenSize_0();
    local v49 = l_useLocalUserId_0();
    local v51 = l_useSelector_0(function(v50) --[[ Line: 80 ]]
        return v50.IsLocalUserUnder13;
    end);
    local v53 = l_useSelector_0(function(v52) --[[ Line: 84 ]]
        -- upvalues: l_GetFFlagContactsToastEnabled_0 (ref), v44 (copy), l_getDeepValue_0 (ref), v28 (ref), v49 (copy)
        if l_GetFFlagContactsToastEnabled_0() or v44 then
            return (l_getDeepValue_0(v52, (("%*.Users.byUserId.%*"):format(v28.RODUX_KEY, v49))));
        else
            return {};
        end;
    end);
    local l_default_0 = l_PermissionsProtocol_0.default;
    local function v56(v55) --[[ Line: 92 ]]
        -- upvalues: v41 (copy), l_SetCurrentToastMessage_0 (ref)
        v41(l_SetCurrentToastMessage_0({
            toastMessage = v55
        }));
    end;
    local function v57() --[[ Line: 97 ]]
        -- upvalues: v41 (copy), v38 (copy)
        v41(v38.openContactImporterLearnMoreLink());
    end;
    local function v60(v58, v59) --[[ Line: 100 ]]
        -- upvalues: v41 (copy), v38 (copy)
        v41(v38.openProfilePeekView(v58, v59));
    end;
    local function v63(v61, v62) --[[ Line: 104 ]]
        -- upvalues: v41 (copy), v38 (copy)
        v41(v38.openAmpWizardContainer(v61, v62));
    end;
    local function v66(v64, v65) --[[ Line: 108 ]]
        -- upvalues: v41 (copy), v38 (copy), v7 (ref)
        v41(v38.navigateToRoute({
            v7.Dictionary.join({
                name = v64
            }, v65)
        }));
    end;
    local function _() --[[ Line: 112 ]]
        -- upvalues: l_default_0 (copy), l_PermissionsProtocol_0 (ref)
        return l_default_0:checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
        });
    end;
    local function _() --[[ Line: 118 ]]
        -- upvalues: v38 (copy), l_default_0 (copy), l_PermissionsProtocol_0 (ref)
        if v38.hasPermissions then
            return (v38.hasPermissions());
        else
            return (l_default_0:hasPermissions({
                l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
            }));
        end;
    end;
    local function v69() --[[ Line: 124 ]]
        -- upvalues: v40 (copy), v42 (copy), v33 (ref), v44 (copy)
        v40(false);
        v42.fireAnalyticsEvent(v33.ContactsToastDismissed, {
            variant = v44
        });
    end;
    local function _() --[[ Line: 131 ]]
        -- upvalues: v41 (copy), l_UpdateContactImporterModalLogic_0 (ref)
        v41(l_UpdateContactImporterModalLogic_0({
            hasOSPermissions = true, 
            shouldShowContactImporterUpsellModal = false
        }));
    end;
    local function v72() --[[ Line: 138 ]]
        -- upvalues: l_l_UserInputService_0_Platform_0 (ref), l_default_0 (copy), l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), v49 (copy), v41 (copy), l_UpdateContactImporterModalLogic_0 (ref), v66 (copy), l_EnumScreens_0 (ref), v56 (copy), l_isPhoneVerified_0 (copy), v57 (copy), v63 (copy), v5 (ref), v48 (copy), l_isDiscoverabilityUnset_0 (copy), v60 (copy), v40 (copy), v42 (copy), v33 (ref), v44 (copy)
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            l_default_0:checkOrRequestPermissions({
                l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
            }):andThen(function(v71) --[[ Line: 140 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), v49 (ref), v41 (ref), l_UpdateContactImporterModalLogic_0 (ref), v66 (ref), l_EnumScreens_0 (ref), v56 (ref), l_isPhoneVerified_0 (ref), v57 (ref), v63 (ref), v5 (ref), v48 (ref)
                if v71 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    l_updateOptedInUsers_0:addUserToLocalStorage(l_AppStorageService_0, v49);
                    v41(l_UpdateContactImporterModalLogic_0({
                        hasOSPermissions = true, 
                        shouldShowContactImporterUpsellModal = false
                    }));
                    v66(l_EnumScreens_0.ContactsList, {
                        showToast = v56, 
                        shouldUpdateUserSettings = true, 
                        isPhoneVerified = l_isPhoneVerified_0, 
                        openLearnMoreLink = v57, 
                        openAmpUpsell = v63
                    });
                    return v5.resolve();
                elseif v71 == l_PermissionsProtocol_0.Status.DENIED then
                    v66(l_EnumScreens_0.ContactsRevokedAccessDialog, {
                        screenSize = v48
                    });
                    return v5.resolve();
                else
                    return v5.reject();
                end;
            end);
        else
            v66(l_EnumScreens_0.ContactImporter, {
                showToast = v56, 
                openLearnMoreLink = v57, 
                isFromAddFriendsPage = false, 
                isDiscoverabilityUnset = l_isDiscoverabilityUnset_0, 
                isPhoneVerified = l_isPhoneVerified_0, 
                openProfilePeekView = v60, 
                openAmpUpsell = v63
            });
        end;
        v40(false);
        v42.fireAnalyticsEvent(v33.ContactsToastButtonPressed, {
            variant = v44
        });
    end;
    local v73 = v6.createElement(l_Toast_0, {
        duration = 4, 
        toastContent = {
            iconImage = v36, 
            toastTitle = v43.title, 
            toastSubtitle = v43.subtitle, 
            iconSize = v37, 
            onActivated = v72, 
            onDismissed = v69, 
            buttonText = if v44 == v28.Experiment.FIND_FRIENDS then v43.button else v43.buttonV2, 
            swipeUpDismiss = true
        }
    });
    local function _() --[[ Line: 194 ]]
        -- upvalues: v49 (copy), v41 (copy), v30 (ref)
        if v49 and string.len(v49) > 0 and v49 ~= "0" then
            v41(v30.GetUserV2FromUserId.API(v49));
        end;
    end;
    v6.useEffect(function() --[[ Line: 200 ]]
        -- upvalues: v49 (copy), v41 (copy), v30 (ref)
        if v49 and string.len(v49) > 0 and v49 ~= "0" then
            v41(v30.GetUserV2FromUserId.API(v49));
        end;
    end, {
        v49
    });
    v6.useEffect(function() --[[ Line: 204 ]]
        -- upvalues: v49 (copy), v53 (copy), v35 (ref), v38 (copy), v51 (copy), v29 (ref), l_default_0 (copy), l_PermissionsProtocol_0 (ref), l_ExperienceService_0 (ref), l_setTimeout_0 (ref), v40 (copy), v42 (copy), v33 (ref), v44 (copy)
        if v49 and string.len(v49) > 0 and v53 and v53.created then
            local v75, v76, v77 = v53.created:match("(%d+)-(%d+)-(%d+)");
            if math.floor((os.time() - os.time({
                year = v75, 
                month = v76, 
                day = v77
            })) / 86400) <= v35 and v38.isContactsToastPolicyEnabled and not v51 and v29:CheckUserHasNotSeen(v49) then
                (if v38.hasPermissions then v38.hasPermissions() else l_default_0:hasPermissions({
                    l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
                })):andThen(function(v78) --[[ Line: 215 ]]
                    -- upvalues: l_PermissionsProtocol_0 (ref), v29 (ref), v49 (ref), l_ExperienceService_0 (ref), l_setTimeout_0 (ref), v40 (ref), v42 (ref), v33 (ref), v44 (ref)
                    if v78.status == l_PermissionsProtocol_0.Status.DENIED and v78.missingPermissions[1] == l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS or v78.status ~= l_PermissionsProtocol_0.Status.DENIED and v29:CheckUserHasNotOptedIn(v49) then
                        l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 224 ]]
                            -- upvalues: v29 (ref), v49 (ref), l_setTimeout_0 (ref), v40 (ref), v42 (ref), v33 (ref), v44 (ref)
                            if v29:CheckUserHasNotSeen(v49) then
                                l_setTimeout_0(function() --[[ Line: 227 ]]
                                    -- upvalues: v40 (ref), v29 (ref), v49 (ref), v42 (ref), v33 (ref), v44 (ref)
                                    v40(true);
                                    v29:AddUser(v49);
                                    v42.fireAnalyticsEvent(v33.ContactsToastSeen, {
                                        variant = v44
                                    });
                                end, 1000);
                            end;
                        end);
                    end;
                end);
            end;
        end;
    end, {
        v49, 
        v38.isContactsToastPolicyEnabled, 
        v51, 
        v53
    });
    if v38.isContactsToastPolicyEnabled and not v51 and v39 or v38.testOverride then
        return (v6.createElement("ScreenGui", {
            DisplayOrder = 13
        }, {
            v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -20), 
                Position = UDim2.new(0, 0, 0, 20)
            }, v73)
        }));
    else
        return nil;
    end;
end;