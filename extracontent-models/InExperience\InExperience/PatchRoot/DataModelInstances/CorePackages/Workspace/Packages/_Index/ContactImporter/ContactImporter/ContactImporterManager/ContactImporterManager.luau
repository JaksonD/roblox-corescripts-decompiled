local l_Parent_0 = script.Parent.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_Parent_1 = l_Parent_0.Parent;
local v5 = require(l_Parent_0.dependencies);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.Roact);
local v8 = require(l_Parent_1.Dash);
local v9 = require(l_Parent_1.Cryo);
local v10 = require(l_Parent_1.RobloxAppHooks);
local v11 = require(l_Parent_1.SocialCommon);
local l_useQuery_0 = require(l_Parent_1.ApolloClient).useQuery;
local v13 = require(l_Parent_1.ApolloLocalState);
local v14 = require(l_Parent_1.ApolloFriends);
local l_queries_0 = v13.queries;
local l_dependencyArray_0 = require(l_Parent_1.RoactUtils).Hooks.dependencyArray;
local v17 = require(l_Parent_1.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v17.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v17.Analytics.DefaultAnalyticsService;
local l_EventTypes_0 = v17.Analytics.Enums.EventTypes;
local l_Contexts_0 = v17.Analytics.Enums.Contexts;
local l_ContactsToast_0 = require(l_Parent_1.ContactsToast).ContactsToast;
local l_ContactsToastIXP_0 = require(l_Parent_1.ContactsToast).ContactsToastIXP;
local l_useDispatch_0 = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useFetchContactImporterInfoOnce_0 = require(l_Parent_0.Utils).useFetchContactImporterInfoOnce;
local l_useAutoSyncContacts_0 = require(l_Parent_0.Utils).useAutoSyncContacts;
local l_getContactImporterParams_0 = require(l_Parent_0.Utils).getContactImporterParams;
local l_userIdExists_0 = v11.Utils.userIdExists;
local l_PermissionsProtocol_0 = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol;
local l_rolloutByApplicationId_0 = require(l_Parent_1.AppCommonLib).rolloutByApplicationId;
local v31 = require(l_Parent_1.UserProfiles);
local l_useLocalUserId_0 = v10.useLocalUserId;
local l_UniversalAppPolicy_0 = v5.UniversalAppPolicy;
local l_getAppFeaturePolicies_0 = require(l_Parent_1.UniversalAppPolicy).getAppFeaturePolicies;
local l_NetworkingFriends_0 = v5.NetworkingFriends;
local l_GetFFlagContactsToastEnabled_0 = require(l_Parent_1.SharedFlags).GetFFlagContactsToastEnabled;
local v37 = require(l_Parent_0.Experiments.PaginatedFriendsCarouselIXP);
local v38 = game:DefineFastFlag("EarlierFetchTimeForFriendsCarousel_v1", false);
local v39 = game:DefineFastFlag("FixNewFriendRequestCountOnAppResume", false);
local v40 = game:DefineFastFlag("PrefetchProfileNamesOnStartup_v2", false);
local l_FIntFriendsCarouselInitialFetchSize_0 = require(l_Parent_1.SharedFlags).FIntFriendsCarouselInitialFetchSize;
local v42 = require(l_Parent_1.SharedFlags).FFlagRegisterQRCodeKeyInEngine and "ProfileQrCodeCameraSettingsModalSeen" or "ScreenshotEventTracking";
local v43 = l_rolloutByApplicationId_0(function() --[[ Line: 59 ]]
    return game:DefineFastInt("CallFriendCountAtStartupRollout", 0);
end);
local v44 = if v39 then l_MessageBusService_0:GetMessageId("Realtime", "appResume") else nil;
local v45 = if v40 then v31.Stores.UserProfileStore.get() else nil;
local v46 = {
    ProfileQRCodeCameraSettingsModalSeen = {
        context = l_Contexts_0.ProfileQRCode, 
        eventType = l_EventTypes_0.SettingsModalSeenSinceLastAppStart, 
        formatRulesForAdditionalInfo = {
            cameraPermissionResponseStatus = v8.identity
        }
    }
};
return l_UniversalAppPolicy_0.connect(function(v47) --[[ Line: 237 ]]
    -- upvalues: l_GetFFlagContactsToastEnabled_0 (copy), l_ContactsToastIXP_0 (copy)
    return {
        isContactImporterPolicyEnabled = v47.getContactImporterEnabled(), 
        isContactsToastPolicyEnabled = if not not l_GetFFlagContactsToastEnabled_0() or l_ContactsToastIXP_0.FFlagContactsToastExperimentEnabled then v47.getContactsToastEnabled() else false
    };
end)(function(v48) --[[ Line: 100 ]] --[[ Name: Container ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_getAppFeaturePolicies_0 (copy), l_useFetchContactImporterInfoOnce_0 (copy), v38 (copy), v37 (copy), v14 (copy), l_useQuery_0 (copy), l_queries_0 (copy), l_userIdExists_0 (copy), v9 (copy), l_FIntFriendsCarouselInitialFetchSize_0 (copy), v40 (copy), v6 (copy), v45 (copy), l_useAutoSyncContacts_0 (copy), v43 (copy), l_NetworkingFriends_0 (copy), v39 (copy), l_MessageBusService_0 (copy), v44 (copy), l_AnalyticsFactory_0 (copy), v46 (copy), l_DefaultAnalyticsService_0 (copy), l_AppStorageService_0 (copy), v42 (copy), l_PermissionsProtocol_0 (copy), l_dependencyArray_0 (copy), l_GetFFlagContactsToastEnabled_0 (copy), l_ContactsToastIXP_0 (copy), v7 (copy), l_CoreGui_0 (copy), l_ContactsToast_0 (copy), v8 (copy), l_getContactImporterParams_0 (copy)
    local v49 = l_useDispatch_0();
    local v50 = l_useLocalUserId_0();
    local v51 = v48.isContactImporterPolicyEnabled or l_getAppFeaturePolicies_0().getContactImporterEnabled();
    l_useFetchContactImporterInfoOnce_0({
        policyIsEnabled = v51
    });
    local v52 = nil;
    if v38 then
        local v53, v54 = v37.usePaginatedFriendsCarouselExperiment();
        local v55 = {
            userId = v50, 
            sort = v53 and v54 or v14.Enums.Sort.FriendshipScore
        };
        v52 = l_useQuery_0(l_queries_0.allFriendsByUserId, {
            errorPolicy = "all", 
            skip = not v53 or not l_userIdExists_0(v50), 
            notifyOnNetworkStatusChange = true, 
            variables = v9.Dictionary.join(v55, {
                pageLimit = l_FIntFriendsCarouselInitialFetchSize_0, 
                pageCursor = ""
            })
        });
        l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
            skip = not v53 or not l_userIdExists_0(v50), 
            notifyOnNetworkStatusChange = true, 
            variables = v55
        });
    end;
    if v40 then
        local v56 = v52 and v52.data and v52.data.allFriendsByUserId and v52.data.allFriendsByUserId.friends;
        local l_v56_0 = v56 --[[ copy: 5 -> 8 ]];
        v6.useEffect(function() --[[ Line: 146 ]]
            -- upvalues: l_userIdExists_0 (ref), v50 (copy), l_v56_0 (copy), v45 (ref)
            if l_userIdExists_0(v50) then
                local v58 = {
                    (tostring(v50))
                };
                if l_v56_0 then
                    for _, v60 in l_v56_0 do
                        if v60 and v60.id then
                            table.insert(v58, (tostring(v60.id)));
                        end;
                    end;
                end;
                v45.fetchNamesByUserIds(v58);
            end;
        end, {
            v50, 
            v56
        });
    end;
    l_useAutoSyncContacts_0();
    if v43() then
        v6.useEffect(function() --[[ Line: 167 ]]
            -- upvalues: l_userIdExists_0 (ref), v50 (copy), v49 (copy), l_NetworkingFriends_0 (ref)
            if l_userIdExists_0(v50) then
                v49(l_NetworkingFriends_0.GetFriendsCountFromUserId.API(v50));
            end;
        end, {
            v50
        });
    end;
    v6.useEffect(function() --[[ Line: 174 ]]
        -- upvalues: l_userIdExists_0 (ref), v50 (copy), v49 (copy), l_NetworkingFriends_0 (ref), v39 (ref), l_MessageBusService_0 (ref), v44 (ref)
        if l_userIdExists_0(v50) then
            v49(l_NetworkingFriends_0.GetNewFriendRequestsCount.API({
                currentUserId = v50
            }));
            if v39 then
                local v61 = l_MessageBusService_0:Subscribe(v44, function() --[[ Line: 180 ]]
                    -- upvalues: v49 (ref), l_NetworkingFriends_0 (ref), v50 (ref)
                    v49(l_NetworkingFriends_0.GetNewFriendRequestsCount.API({
                        currentUserId = v50
                    }));
                end, false, true);
                return function() --[[ Line: 185 ]]
                    -- upvalues: v61 (copy)
                    v61:Disconnect();
                end;
            end;
        end;
        return function() --[[ Line: 190 ]]

        end;
    end, {
        v50
    });
    local v62 = v6.useMemo(function() --[[ Line: 193 ]]
        -- upvalues: l_AnalyticsFactory_0 (ref), v46 (ref), l_DefaultAnalyticsService_0 (ref)
        return l_AnalyticsFactory_0.setUpAnalyticsFactory({
            eventLists = {
                EventStream = v46
            }, 
            analyticsImpl = {
                EventStream = l_DefaultAnalyticsService_0.EventStream
            }
        })();
    end, {});
    v6.useEffect(function() --[[ Line: 203 ]]
        -- upvalues: l_AppStorageService_0 (ref), v42 (ref), l_PermissionsProtocol_0 (ref), v62 (copy)
        if l_AppStorageService_0:GetItem(v42) == "true" then
            l_PermissionsProtocol_0.default:checkOrRequestPermissions({
                l_PermissionsProtocol_0.Permissions.CAMERA_ACCESS
            }):andThen(function(v63) --[[ Line: 211 ]]
                -- upvalues: v62 (ref)
                v62.fireAnalyticsEvent("ProfileQRCodeCameraSettingsModalSeen", {
                    cameraPermissionResponseStatus = v63
                });
            end);
            l_AppStorageService_0:SetItem(v42, "false");
            l_AppStorageService_0:Flush();
        end;
    end, l_dependencyArray_0(v50, v62));
    if l_GetFFlagContactsToastEnabled_0() or l_ContactsToastIXP_0.FFlagContactsToastExperimentEnabled and l_ContactsToastIXP_0.useContactsToastVariant() then
        return (v6.createElement(v7.Portal, {
            target = l_CoreGui_0
        }, {
            v6.createElement(l_ContactsToast_0, v8.join(v48, {
                getContactImporterParams = l_getContactImporterParams_0, 
                isContactsToastPolicyEnabled = v48.isContactsToastPolicyEnabled
            }))
        }));
    else
        return nil;
    end;
end);