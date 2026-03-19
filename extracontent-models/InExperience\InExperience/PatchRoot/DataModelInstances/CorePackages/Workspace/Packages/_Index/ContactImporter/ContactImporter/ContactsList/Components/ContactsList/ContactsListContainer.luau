local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local _ = require(l_Parent_0.Common.LocalTypes);
local v6 = require(l_Parent_0.Common.Constants);
local l_Promise_0 = v1.Promise;
local v8 = require(l_Parent_0.Analytics);
local l_FieldNames_0 = v8.FieldNames;
local l_EventNames_0 = v8.EventNames;
local v11 = require(l_Parent_0.Analytics.setupFireAnalyticsEvents);
local v12 = require(l_Parent_0.Utils.formatContacts);
local l_ContactsProtocol_0 = v1.ContactsProtocol;
local l_Dash_0 = v1.Dash;
local l_EnumScreens_0 = v1.SocialModalsCommon.EnumScreens;
local l_AmpApiProvider_0 = v1.AmpUpsell.AmpApiProvider;
local l_AccessResponseEnum_0 = v1.AmpUpsell.AmpEnums.AccessResponseEnum;
local v18 = require(l_Parent_0.Flags.getFFlagFindFriendsClickedEventEnabled);
local v19 = require(script.Parent.ContactsList);
local v20 = require(script.Parent.ContactsListMapDispatchToProps);
local v21 = require(script.Parent.ContactsListMapStateToProps);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local v23 = require(l_Parent_0.Analytics.Enums.UploadContactsSources);
local v24 = require(l_Parent_0.Flags.getFIntContactImporterUploadContactsMin);
local v25 = require(l_Parent_0.Common.IXPVariants);
local l_FFlagContactImporterIXPCleanup_0 = require(l_Parent_1.SharedFlags).FFlagContactImporterIXPCleanup;
local l_DiscoverabilityAnalytics_0 = v1.DiscoverabilityAnalytics;
local v28 = l_Roact_0.PureComponent:extend("ContactsListContainer");
v28.defaultProps = {
    contactsProtocol = l_ContactsProtocol_0.default
};
v28.init = function(v29) --[[ Line: 74 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v8 (copy), l_getDeepValue_0 (copy), l_AmpApiProvider_0 (copy), l_Promise_0 (copy), l_EventNames_0 (copy), l_FieldNames_0 (copy), v12 (copy), v23 (copy), l_FFlagContactImporterIXPCleanup_0 (copy), v25 (copy), v24 (copy), v6 (copy), l_AccessResponseEnum_0 (copy), l_EnumScreens_0 (copy), l_DiscoverabilityAnalytics_0 (copy), v18 (copy), l_Dash_0 (copy)
    v29.entryPoint = v29.props.navigation.getParam("entryPoint");
    v29.fireAnalyticsEvent = v11({
        analytics = v8.AnalyticsService, 
        defaultAnalyticsInfo = {
            entry = v29.entryPoint
        }
    });
    v29.state = {
        hasUploadError = false, 
        isFetching = true, 
        showMatchedContacts = false
    };
    v29.getPropOrParam = function(v30) --[[ Line: 91 ]]
        -- upvalues: v29 (copy), l_getDeepValue_0 (ref)
        if v29.props.navigation and v29.props.navigation.getParam(v30) or v29.props.navigation then
            return v29.props.navigation.getParam(v30);
        else
            return l_getDeepValue_0(v29.props, v30);
        end;
    end;
    v29.contactsCount = nil;
    v29.numTotalNumbersOnDevice = nil;
    v29.numTotalContactsOnDevice = nil;
    v29.numContactsWithMultipleNumbers = nil;
    v29.startTime = os.clock();
    v29.ampApiProvider = if v29.props.ampApiProvider ~= nil then v29.props.ampApiProvider else l_AmpApiProvider_0;
    local function _(v31) --[[ Line: 107 ]] --[[ Name: makeErrorFunction ]]
        -- upvalues: l_Promise_0 (ref), v29 (copy)
        return function(v32) --[[ Line: 108 ]]
            -- upvalues: l_Promise_0 (ref), v29 (ref), v31 (copy)
            if type(v32) == "table" and v32.hasAlreadyErrored then
                return l_Promise_0.reject({
                    hasAlreadyErrored = true
                });
            else
                v29:setState({
                    hasUploadError = true, 
                    isFetching = false
                });
                v29.fireAnalyticsEvent(v31, {
                    failedStep = v31
                });
                v29.fireContactImportingTimeEvent({
                    isSuccessfulUpload = false, 
                    failedStep = v31
                });
                return l_Promise_0.reject({
                    hasAlreadyErrored = true
                });
            end;
        end;
    end;
    local function _(v34) --[[ Line: 131 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        local v35 = l_getDeepValue_0(v34 or {}, "responseBody.userContactsEntities");
        if v35 then
            return #v35;
        else
            return 0;
        end;
    end;
    local function _() --[[ Line: 137 ]]
        -- upvalues: v29 (copy)
        if v29.props.navigation then
            v29.props.navigation.pop();
            return;
        else
            if v29.props.onClose then
                v29.props.onClose();
            end;
            return;
        end;
    end;
    v29.requestFriendship = function(v38) --[[ Line: 145 ]]
        -- upvalues: v29 (copy), l_EventNames_0 (ref)
        local l_props_0 = v29.props;
        v29.fireAnalyticsEvent(l_EventNames_0.RequestFriendship, {
            requestedId = v38
        });
        l_props_0.requestFriendship({
            currentUserId = l_props_0.localUserId, 
            contactId = v38
        }):andThen(function() --[[ Line: 157 ]]
            -- upvalues: l_props_0 (copy), v38 (copy)
            l_props_0.requestSent(v38);
        end);
    end;
    v29.fireContactImportingTimeEvent = function(v40) --[[ Line: 162 ]]
        -- upvalues: v29 (copy), l_EventNames_0 (ref), l_FieldNames_0 (ref)
        v29.fireAnalyticsEvent(l_EventNames_0.ContactImportingTime, {
            [l_FieldNames_0.NumTotalContactsImported] = v29.contactsCount, 
            [l_FieldNames_0.NumMatchedContacts] = v40.numMatchedContacts, 
            [l_FieldNames_0.NumTotalContactsOnDevice] = v29.numTotalContactsOnDevice, 
            [l_FieldNames_0.NumMaxContacts] = true, 
            [l_FieldNames_0.NumMinContacts] = true, 
            [l_FieldNames_0.NumTotalNumbersOnDevice] = v29.numTotalNumbersOnDevice, 
            [l_FieldNames_0.NumContactsWithMultipleNumbers] = v29.numContactsWithMultipleNumbers, 
            loadingTime = os.clock() - v29.startTime, 
            isSuccessfulUpload = v40.isSuccessfulUpload
        });
    end;
    v29.getContactsFromDevice = function() --[[ Line: 180 ]]
        -- upvalues: v29 (copy), l_Promise_0 (ref)
        local l_props_1 = v29.props;
        return l_props_1.contactsProtocol:supportsContacts():andThen(function(v42) --[[ Line: 185 ]]
            -- upvalues: l_Promise_0 (ref), l_props_1 (copy)
            if not v42 then
                return l_Promise_0.reject();
            else
                return l_props_1.contactsProtocol:getContacts();
            end;
        end):catch(function() --[[ Line: 192 ]]
            -- upvalues: l_Promise_0 (ref)
            return l_Promise_0.reject();
        end);
    end;
    v29.formatContactsFromDevice = function(v43) --[[ Line: 197 ]]
        -- upvalues: v29 (copy), v12 (ref)
        local l_props_2 = v29.props;
        if #(v43.contacts or {}) == 0 then
            return {
                contacts = {}, 
                contactsCount = 0, 
                countryCode = nil
            };
        else
            l_props_2.deviceContactsReceived(v43.contacts);
            local v45 = v12(v43);
            v29.contactsCount = #v45.contacts;
            v29.numTotalContactsOnDevice = v45.contactsCount;
            local v46 = 0;
            local v47 = 0;
            for _, v49 in ipairs(v43.contacts) do
                local v50 = #v49.phonenumber;
                if v50 > 1 then
                    v47 = v47 + 1;
                end;
                v46 = v46 + v50;
            end;
            v29.numTotalNumbersOnDevice = v46;
            v29.numContactsWithMultipleNumbers = v47;
            return v45;
        end;
    end;
    v29.uploadDeviceContacts = function(v51) --[[ Line: 230 ]]
        -- upvalues: v23 (ref), v29 (copy), l_FFlagContactImporterIXPCleanup_0 (ref), v25 (ref), v24 (ref), l_Promise_0 (ref), l_EventNames_0 (ref)
        v51.source = v23.CI;
        local l_props_3 = v29.props;
        if #v51.contacts == 0 or not l_FFlagContactImporterIXPCleanup_0 and l_props_3.variant == v25.INVITES_ONLY or #v51.contacts < v24() then
            return l_Promise_0.resolve({
                shouldFindContacts = false
            });
        else
            return l_props_3.uploadContacts(v51):andThen(function() --[[ Line: 246 ]]
                -- upvalues: l_Promise_0 (ref)
                return l_Promise_0.resolve({
                    shouldFindContacts = true
                });
            end, function() --[[ Line: 248 ]]
                -- upvalues: v29 (ref), l_EventNames_0 (ref), l_Promise_0 (ref)
                v29.fireAnalyticsEvent(l_EventNames_0.FailedUploadContactsFromDevice, {
                    failedStep = l_EventNames_0.FailedUploadContactsFromDevice
                });
                v29.fireContactImportingTimeEvent({
                    isSuccessfulUpload = false, 
                    failedStep = l_EventNames_0.FailedUploadContactsFromDevice
                });
                return l_Promise_0.resolve({
                    shouldFindContacts = true
                });
            end);
        end;
    end;
    v29.findContacts = function(v53) --[[ Line: 262 ]]
        -- upvalues: v29 (copy), l_Promise_0 (ref)
        local l_props_4 = v29.props;
        if v53.shouldFindContacts then
            return l_props_4.findContacts();
        else
            return l_Promise_0.resolve();
        end;
    end;
    v29.getContactEntities = function(v55) --[[ Line: 271 ]]
        -- upvalues: v29 (copy), l_Promise_0 (ref)
        local l_props_5 = v29.props;
        if v55 then
            return l_props_5.getContactEntities(v55);
        else
            return l_Promise_0.resolve();
        end;
    end;
    v29.fireHasLoaded = function(v57) --[[ Line: 281 ]]
        -- upvalues: l_getDeepValue_0 (ref), v29 (copy), l_EventNames_0 (ref), l_FieldNames_0 (ref), l_Promise_0 (ref)
        local v58 = l_getDeepValue_0(v57 or {}, "responseBody.userContactsEntities");
        local v59 = if v58 then #v58 else 0;
        v29.fireAnalyticsEvent(l_EventNames_0.ContactsListLoaded, {
            [l_FieldNames_0.NumTotalContactsImported] = v29.contactsCount, 
            [l_FieldNames_0.NumMatchedContacts] = v59, 
            [l_FieldNames_0.NumMaxContacts] = true, 
            [l_FieldNames_0.NumMinContacts] = true, 
            [l_FieldNames_0.NumTotalContactsOnDevice] = v29.numTotalContactsOnDevice
        });
        v29:setState({
            isFetching = false
        });
        v29.fireContactImportingTimeEvent({
            isSuccessfulUpload = true, 
            nummatchedContacts = v59
        });
        return l_Promise_0.resolve();
    end;
    v29.failedToUpload = function(_) --[[ Line: 303 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            hasUploadError = true, 
            isFetching = false
        });
        v29.fireContactImportingTimeEvent({
            isSuccessfulUpload = false
        });
    end;
    v29.getContacts = function() --[[ Line: 312 ]]
        -- upvalues: v29 (copy), v6 (ref), l_AccessResponseEnum_0 (ref), l_FFlagContactImporterIXPCleanup_0 (ref), l_EventNames_0 (ref), l_Promise_0 (ref)
        local v61 = nil;
        v29:setState({
            isFetching = true
        });
        local v62 = v29.ampApiProvider.getFeatureAccess({
            v6.SHOW_MATCHED_CONTACTS
        });
        v61 = (if #v62.featureAccessList > 0 then v62.featureAccessList[1].access else l_AccessResponseEnum_0.Actionable) == l_AccessResponseEnum_0.Granted;
        v29:setState({
            showMatchedContacts = v61
        });
        if not l_FFlagContactImporterIXPCleanup_0 and v29.props.isPVRequired and not v61 then
            local v63 = v29.getContactsFromDevice();
            local l_formatContactsFromDevice_0 = v29.formatContactsFromDevice;
            local l_FailedGetContactsFromDevice_0 = l_EventNames_0.FailedGetContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_0_0 = l_FailedGetContactsFromDevice_0 --[[ copy: 7 -> 12 ]];
            v63 = v63:andThen(l_formatContactsFromDevice_0, function(v67) --[[ Line: 108 ]]
                -- upvalues: l_Promise_0 (ref), v29 (ref), l_l_FailedGetContactsFromDevice_0_0 (copy)
                if type(v67) == "table" and v67.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v29:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v29.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_0_0, {
                        failedStep = l_l_FailedGetContactsFromDevice_0_0
                    });
                    v29.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_0_0
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_0 = v29.fireHasLoaded;
            l_FailedGetContactsFromDevice_0 = l_EventNames_0.FailedFormatContactsFromDevice;
            v63:andThen(l_formatContactsFromDevice_0, function(v68) --[[ Line: 108 ]]
                -- upvalues: l_Promise_0 (ref), v29 (ref), l_FailedGetContactsFromDevice_0 (copy)
                if type(v68) == "table" and v68.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v29:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v29.fireAnalyticsEvent(l_FailedGetContactsFromDevice_0, {
                        failedStep = l_FailedGetContactsFromDevice_0
                    });
                    v29.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_FailedGetContactsFromDevice_0
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end):catch(v29.failedToUpload);
            return;
        else
            local v69 = v29.getContactsFromDevice();
            local l_formatContactsFromDevice_1 = v29.formatContactsFromDevice;
            local l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedGetContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_1_0 = l_FailedGetContactsFromDevice_1 --[[ copy: 7 -> 8 ]];
            v69 = v69:andThen(l_formatContactsFromDevice_1, function(v73) --[[ Line: 108 ]]
                -- upvalues: l_Promise_0 (ref), v29 (ref), l_l_FailedGetContactsFromDevice_1_0 (copy)
                if type(v73) == "table" and v73.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v29:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v29.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_1_0, {
                        failedStep = l_l_FailedGetContactsFromDevice_1_0
                    });
                    v29.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_1_0
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_1 = v29.uploadDeviceContacts;
            l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedFormatContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_1_1 = l_FailedGetContactsFromDevice_1 --[[ copy: 7 -> 9 ]];
            v69 = v69:andThen(l_formatContactsFromDevice_1, function(v75) --[[ Line: 108 ]]
                -- upvalues: l_Promise_0 (ref), v29 (ref), l_l_FailedGetContactsFromDevice_1_1 (copy)
                if type(v75) == "table" and v75.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v29:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v29.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_1_1, {
                        failedStep = l_l_FailedGetContactsFromDevice_1_1
                    });
                    v29.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_1_1
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_1 = v29.findContacts;
            l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedUploadContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_1_2 = l_FailedGetContactsFromDevice_1 --[[ copy: 7 -> 10 ]];
            v69 = v69:andThen(l_formatContactsFromDevice_1, function(v77) --[[ Line: 108 ]]
                -- upvalues: l_Promise_0 (ref), v29 (ref), l_l_FailedGetContactsFromDevice_1_2 (copy)
                if type(v77) == "table" and v77.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v29:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v29.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_1_2, {
                        failedStep = l_l_FailedGetContactsFromDevice_1_2
                    });
                    v29.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_1_2
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_1 = v29.getContactEntities;
            l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedFindContacts;
            local l_l_FailedGetContactsFromDevice_1_3 = l_FailedGetContactsFromDevice_1 --[[ copy: 7 -> 11 ]];
            v69 = v69:andThen(l_formatContactsFromDevice_1, function(v79) --[[ Line: 108 ]]
                -- upvalues: l_Promise_0 (ref), v29 (ref), l_l_FailedGetContactsFromDevice_1_3 (copy)
                if type(v79) == "table" and v79.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v29:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v29.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_1_3, {
                        failedStep = l_l_FailedGetContactsFromDevice_1_3
                    });
                    v29.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_1_3
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_1 = v29.fireHasLoaded;
            l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedGetContactEntities;
            v69:andThen(l_formatContactsFromDevice_1, function(v80) --[[ Line: 108 ]]
                -- upvalues: l_Promise_0 (ref), v29 (ref), l_FailedGetContactsFromDevice_1 (copy)
                if type(v80) == "table" and v80.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v29:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v29.fireAnalyticsEvent(l_FailedGetContactsFromDevice_1, {
                        failedStep = l_FailedGetContactsFromDevice_1
                    });
                    v29.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_FailedGetContactsFromDevice_1
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end):catch(v29.failedToUpload);
            return;
        end;
    end;
    v29.closeModal = function(v81) --[[ Line: 342 ]]
        -- upvalues: v29 (copy), l_FFlagContactImporterIXPCleanup_0 (ref), v25 (ref)
        local l_props_6 = v29.props;
        local l_state_0 = v29.state;
        v29.fireAnalyticsEvent(v81, {
            isLoading = if l_FFlagContactImporterIXPCleanup_0 then v29.state.isFetching else v29.isFetching(l_props_6.variant, v25), 
            loadingTime = if l_state_0.isFetching then os.clock() - v29.startTime else nil
        });
        if v29.props.navigation then
            v29.props.navigation.pop();
            return;
        else
            if v29.props.onClose then
                v29.props.onClose();
            end;
            return;
        end;
    end;
    v29.onAddFriendsActivated = function() --[[ Line: 356 ]]
        -- upvalues: v29 (copy), l_EnumScreens_0 (ref)
        v29.props.navigation.replace(l_EnumScreens_0.AddFriendsPage);
    end;
    v29.isFetching = if l_FFlagContactImporterIXPCleanup_0 then nil else function(v84, v85) --[[ Line: 365 ]]
        -- upvalues: v29 (copy)
        local l_state_1 = v29.state;
        if v84 == v85.BLENDED then
            return l_state_1.isFetching;
        else
            return false;
        end;
    end;
    v29.openDiscoverabilityModal = function() --[[ Line: 370 ]]
        -- upvalues: v29 (copy), l_EnumScreens_0 (ref), l_DiscoverabilityAnalytics_0 (ref), v6 (ref), l_AccessResponseEnum_0 (ref), v18 (ref), l_EventNames_0 (ref), l_Dash_0 (ref)
        local l_navigation_0 = v29.props.navigation;
        l_navigation_0.replace(l_EnumScreens_0.DiscoverabilityOverlay, {
            isStandaloneDiscoverabilityModal = true, 
            entryPoint = l_DiscoverabilityAnalytics_0.EntryPoints.ContactsList, 
            navigateOnActivated = function() --[[ Line: 377 ]] --[[ Name: navigateOnActivated ]]
                -- upvalues: l_navigation_0 (copy), l_EnumScreens_0 (ref), v6 (ref), v29 (ref)
                l_navigation_0.replace(l_EnumScreens_0.ContactsList, {
                    [v6.SHOULD_UPDATE_USER_SETTINGS] = true, 
                    [v6.IS_PHONE_VERIFIED] = v29.getPropOrParam(v6.IS_PHONE_VERIFIED), 
                    openAmpUpsell = v29.getPropOrParam(v6.OPEN_AMP_UPSELL), 
                    entryPoint = v29.entryPoint
                });
            end
        });
        local v88 = v29.getPropOrParam(v6.OPEN_AMP_UPSELL);
        v29.openAmpUpsell = v88 and function() --[[ Line: 390 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref), v29 (ref), v18 (ref), l_EventNames_0 (ref), v88 (copy), v6 (ref)
            local function v91(v89, _) --[[ Line: 391 ]]
                -- upvalues: l_AccessResponseEnum_0 (ref), v29 (ref)
                if v89 == l_AccessResponseEnum_0.Granted then
                    v29.getContacts();
                    v29.openDiscoverabilityModal();
                end;
            end;
            if v18() then
                v29.fireAnalyticsEvent(l_EventNames_0.FindFriendsButtonClicked);
            end;
            v88(v6.SHOW_MATCHED_CONTACTS, v91);
        end or l_Dash_0.noop;
    end;
end;
v28.didMount = function(v92) --[[ Line: 407 ]] --[[ Name: didMount ]]
    v92.getContacts();
end;
v28.render = function(v93) --[[ Line: 411 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagContactImporterIXPCleanup_0 (copy), l_Roact_0 (copy), v19 (copy), v25 (copy), v8 (copy)
    local l_props_7 = v93.props;
    local v95 = if l_FFlagContactImporterIXPCleanup_0 then nil else l_props_7.variant;
    local l_entryPoint_0 = v93.entryPoint;
    return l_Roact_0.createElement(v19, {
        deviceContacts = l_props_7.deviceContacts, 
        matchedContacts = l_props_7.matchedContacts, 
        isFetching = if l_FFlagContactImporterIXPCleanup_0 then v93.state.isFetching else v93.isFetching(v95, v25), 
        requestFriendship = v93.requestFriendship, 
        screenSize = l_props_7.screenSize, 
        hasUploadError = v93.state.hasUploadError, 
        onAddFriendsActivated = v93.onAddFriendsActivated, 
        closeModal = v93.closeModal, 
        showAddFriendsButton = l_entryPoint_0 == v8.EntryPoints.HomePage, 
        variant = if l_FFlagContactImporterIXPCleanup_0 then nil else l_props_7.variant, 
        openProfilePeekView = v93.props.openProfilePeekView, 
        showMatchedContacts = v93.state.showMatchedContacts, 
        openAmpUpsell = v93.openAmpUpsell
    });
end;
return l_RoactRodux_0.connect(v21, v20)(v28);