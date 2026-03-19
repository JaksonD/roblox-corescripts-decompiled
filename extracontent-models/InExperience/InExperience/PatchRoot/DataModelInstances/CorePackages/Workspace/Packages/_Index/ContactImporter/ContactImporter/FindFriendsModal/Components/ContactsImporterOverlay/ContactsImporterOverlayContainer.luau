local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local _ = l_Parent_0.Parent;
local v3 = require(l_Parent_0.Common.TextKeys);
local v4 = require(l_Parent_0.Utils.contactImporterModalInfoUpdater);
local l_updateOptedInUsers_0 = v1.SocialModalsCommon.Utils.updateOptedInUsers;
local l_EnumScreens_0 = v1.SocialModalsCommon.EnumScreens;
local v7 = require(l_Parent_0.Common.Constants);
local v8 = require(l_Parent_0.Analytics);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_PermissionsProtocol_0 = v1.PermissionsProtocol;
local l_Promise_0 = v1.Promise;
local v13 = require(script.Parent.ContactsImporterOverlay);
local v14 = require(script.Parent.mapDispatchToProps);
local l_Selectors_0 = v1.RoduxContacts.Selectors;
local l_AppStorageService_0 = v1.AppStorageService;
local l_DiscoverabilityAnalytics_0 = v1.DiscoverabilityAnalytics;
local v18 = l_Roact_0.PureComponent:extend("ContactsImporterOverlayContainer");
v18.defaultProps = {
    checkOrRequestPermissions = function(v19) --[[ Line: 44 ]] --[[ Name: checkOrRequestPermissions ]]
        -- upvalues: l_PermissionsProtocol_0 (copy)
        return l_PermissionsProtocol_0.default:checkOrRequestPermissions(v19);
    end, 
    localUserId = "", 
    handleShowToastForTests = nil
};
v18.init = function(v20) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), l_DiscoverabilityAnalytics_0 (copy), v8 (copy), l_PermissionsProtocol_0 (copy), v3 (copy), l_updateOptedInUsers_0 (copy), l_AppStorageService_0 (copy), l_EnumScreens_0 (copy), l_Promise_0 (copy)
    v20.isFromAddFriendsPage = v20.props.navigation.getParam(v7.IS_FROM_ADD_FRIENDS_PAGE, false);
    v20.entryPoint = if v20.isFromAddFriendsPage then l_DiscoverabilityAnalytics_0.EntryPoints.AddFriends else l_DiscoverabilityAnalytics_0.EntryPoints.HomePage;
    v20.fireAnalyticsEvent = v8.setupFireAnalyticsEvents({
        analytics = v8.AnalyticsService, 
        defaultAnalyticsInfo = {
            entry = v20.entryPoint
        }
    });
    local v21 = v20.props.navigation.getParam(v7.OPEN_AMP_UPSELL);
    v20.checkOrRequestContactsPermissions = function() --[[ Line: 67 ]]
        -- upvalues: v20 (copy), l_PermissionsProtocol_0 (ref)
        return v20.props.checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
        });
    end;
    v20.failedToUpload = function(_) --[[ Line: 74 ]]
        -- upvalues: v20 (copy), v3 (ref)
        v20.props.showToast(v3.CI_FAILED);
    end;
    v20.closeModal = function() --[[ Line: 81 ]]
        -- upvalues: v20 (copy)
        v20.props.navigation.pop();
    end;
    v20.permissionsFlowToContactImporter = function() --[[ Line: 85 ]]
        -- upvalues: v20 (copy), v7 (ref), l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), l_EnumScreens_0 (ref), v21 (copy), l_Promise_0 (ref)
        local l_props_0 = v20.props;
        local l_navigation_0 = l_props_0.navigation;
        local v25 = l_navigation_0.getParam(v7.IS_FROM_SIGNUP);
        v20.checkOrRequestContactsPermissions():andThen(function(v26) --[[ Line: 91 ]]
            -- upvalues: l_PermissionsProtocol_0 (ref), l_updateOptedInUsers_0 (ref), l_AppStorageService_0 (ref), l_props_0 (copy), v25 (copy), l_navigation_0 (copy), l_EnumScreens_0 (ref), v7 (ref), v21 (ref), v20 (ref), l_Promise_0 (ref)
            if v26 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                l_updateOptedInUsers_0:addUserToLocalStorage(l_AppStorageService_0, l_props_0.localUserId);
                if v25 then
                    l_props_0.updateUserSettings();
                    l_props_0.navigation.pop();
                else
                    l_props_0.hideContactImporterModal();
                    l_navigation_0.replace(l_EnumScreens_0.ContactsList, {
                        [v7.SHOULD_UPDATE_USER_SETTINGS] = true, 
                        [v7.IS_PHONE_VERIFIED] = l_navigation_0.getParam(v7.IS_PHONE_VERIFIED), 
                        [v7.OPEN_LEARN_MORE_LINK] = l_navigation_0.getParam(v7.OPEN_LEARN_MORE_LINK), 
                        openAmpUpsell = v21, 
                        entryPoint = v20.entryPoint
                    });
                end;
                return l_Promise_0.resolve();
            elseif v26 == l_PermissionsProtocol_0.Status.DENIED then
                l_navigation_0.replace(l_EnumScreens_0.ContactsRevokedAccessDialog, {
                    screenSize = l_props_0.screenSize, 
                    closeModal = v20.closeModal
                });
                return l_Promise_0.resolve();
            else
                return l_Promise_0.reject();
            end;
        end):catch(v20.failedToUpload);
    end;
    v20.checkDiscoverability = function(v27) --[[ Line: 122 ]]
        -- upvalues: v20 (copy), v7 (ref)
        local v28 = v20.props.navigation.getParam(v7.IS_PHONE_VERIFIED);
        return v27 and v28;
    end;
    v20.onConnectContacts = function() --[[ Line: 128 ]]
        -- upvalues: v20 (copy), v8 (ref)
        local v29 = v20.props.navigation.getParam("isDiscoverabilityUnset");
        v20.fireAnalyticsEvent(v8.EventNames.ContactImportModalContinue);
        if v20.checkDiscoverability(v29) then
            v20.navigateToDiscoverabilityModal();
            return;
        else
            v20.permissionsFlowToContactImporter();
            return;
        end;
    end;
    v20.navigateToDiscoverabilityModal = function() --[[ Line: 140 ]]
        -- upvalues: v20 (copy), l_EnumScreens_0 (ref)
        local l_props_1 = v20.props;
        local l_navigation_1 = l_props_1.navigation;
        l_props_1.getUserSettingsMetadata():andThen(function() --[[ Line: 144 ]]
            -- upvalues: l_navigation_1 (copy), l_EnumScreens_0 (ref), v20 (ref)
            l_navigation_1.replace(l_EnumScreens_0.DiscoverabilityOverlay, {
                entryPoint = v20.entryPoint
            });
        end);
    end;
    v20.onAddFriendsActivated = function() --[[ Line: 151 ]]
        -- upvalues: v20 (copy), v8 (ref), l_EnumScreens_0 (ref)
        local l_props_2 = v20.props;
        v20.fireAnalyticsEvent(v8.EventNames.ContactImportModalAddFriends);
        l_props_2.navigation.replace(l_EnumScreens_0.AddFriendsPage);
    end;
    v20.onCloseClicked = function() --[[ Line: 158 ]]
        -- upvalues: v20 (copy), v8 (ref)
        local l_props_3 = v20.props;
        v20.fireAnalyticsEvent(v8.EventNames.ContactImportModalClose);
        l_props_3.navigation.pop();
    end;
    v20.onLearnMoreClick = function() --[[ Line: 164 ]]
        -- upvalues: v20 (copy)
        v20.props.openLearnMoreLink();
    end;
end;
v18.didMount = function(v34) --[[ Line: 171 ]] --[[ Name: didMount ]]
    -- upvalues: v8 (copy), v4 (copy), l_AppStorageService_0 (copy)
    v34.fireAnalyticsEvent(v8.EventNames.ContactImportModalPageLoad);
    v4:addSeenCount(l_AppStorageService_0, v34.props.localUserId);
    v4:updateTimestamp(l_AppStorageService_0, v34.props.localUserId, DateTime.now().UnixTimestampMillis);
end;
v18.render = function(v35) --[[ Line: 183 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), l_Roact_0 (copy), v13 (copy)
    local l_props_4 = v35.props;
    local l_navigation_2 = l_props_4.navigation;
    local v38 = l_navigation_2.getParam(v7.IS_FROM_ADD_FRIENDS_PAGE, false);
    local v39 = v35.props.navigation.getParam(v7.IS_FROM_SIGNUP);
    local v40 = l_navigation_2.getParam(v7.IS_FROM_SOCIAL_ONBOARDING_BUTTONS);
    return l_Roact_0.createElement(v13, {
        screenSize = l_props_4.screenSize, 
        onCloseClicked = v35.onCloseClicked, 
        onAddFriendsActivated = v35.onAddFriendsActivated, 
        onConnectContacts = v35.onConnectContacts, 
        onLearnMoreClick = v35.onLearnMoreClick, 
        isFromAddFriendsPage = v38, 
        isFromSignup = v40 and true or v39
    });
end;
return l_RoactRodux_0.connect(function(v41) --[[ Line: 201 ]]
    -- upvalues: l_Selectors_0 (copy)
    return {
        contacts = l_Selectors_0.sortContacts(v41), 
        localUserId = v41.LocalUserId, 
        screenSize = v41.ScreenSize
    };
end, v14)(v18);