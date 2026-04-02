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
local l_FFlagRegisterQRCodeKeyInEngine_0 = require(l_Parent_1.SharedFlags).FFlagRegisterQRCodeKeyInEngine;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_1.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v44 = l_FFlagRegisterQRCodeKeyInEngine_0 and "ProfileQrCodeCameraSettingsModalSeen" or "ScreenshotEventTracking";
local v45 = l_rolloutByApplicationId_0(function() --[[ Line: 62 ]]
    return game:DefineFastInt("CallFriendCountAtStartupRollout", 0);
end);
local v46 = if v39 then l_MessageBusService_0:GetMessageId("Realtime", "appResume") else nil;
local v47 = if v40 then v31.Stores.UserProfileStore.get() else nil;
local v48 = {
    ProfileQRCodeCameraSettingsModalSeen = {
        context = l_Contexts_0.ProfileQRCode, 
        eventType = l_EventTypes_0.SettingsModalSeenSinceLastAppStart, 
        formatRulesForAdditionalInfo = {
            cameraPermissionResponseStatus = v8.identity
        }
    }
};
return l_UniversalAppPolicy_0.connect(function(v49) --[[ Line: 245 ]]
    -- upvalues: l_GetFFlagContactsToastEnabled_0 (copy), l_ContactsToastIXP_0 (copy)
    return {
        isContactImporterPolicyEnabled = v49.getContactImporterEnabled(), 
        isContactsToastPolicyEnabled = if not not l_GetFFlagContactsToastEnabled_0() or l_ContactsToastIXP_0.FFlagContactsToastExperimentEnabled then v49.getContactsToastEnabled() else false
    };
end)(function(v50) --[[ Line: 103 ]] --[[ Name: Container ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_getAppFeaturePolicies_0 (copy), l_useFetchContactImporterInfoOnce_0 (copy), v38 (copy), v37 (copy), v14 (copy), l_useQuery_0 (copy), l_queries_0 (copy), l_userIdExists_0 (copy), v9 (copy), l_FIntFriendsCarouselInitialFetchSize_0 (copy), v40 (copy), v6 (copy), v47 (copy), l_useAutoSyncContacts_0 (copy), v45 (copy), l_NetworkingFriends_0 (copy), v39 (copy), l_MessageBusService_0 (copy), v46 (copy), l_AnalyticsFactory_0 (copy), v48 (copy), l_DefaultAnalyticsService_0 (copy), l_AppStorageService_0 (copy), v44 (copy), l_PermissionsProtocol_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_GetFFlagContactsToastEnabled_0 (copy), l_ContactsToastIXP_0 (copy), v7 (copy), l_CoreGui_0 (copy), l_ContactsToast_0 (copy), v8 (copy), l_getContactImporterParams_0 (copy)
    local v51 = l_useDispatch_0();
    local v52 = l_useLocalUserId_0();
    local v53 = v50.isContactImporterPolicyEnabled or l_getAppFeaturePolicies_0().getContactImporterEnabled();
    l_useFetchContactImporterInfoOnce_0({
        policyIsEnabled = v53
    });
    local v54 = nil;
    if v38 then
        local v55, v56 = v37.usePaginatedFriendsCarouselExperiment();
        local v57 = {
            userId = v52, 
            sort = v55 and v56 or v14.Enums.Sort.FriendshipScore
        };
        v54 = l_useQuery_0(l_queries_0.allFriendsByUserId, {
            errorPolicy = "all", 
            skip = not v55 or not l_userIdExists_0(v52), 
            notifyOnNetworkStatusChange = true, 
            variables = v9.Dictionary.join(v57, {
                pageLimit = l_FIntFriendsCarouselInitialFetchSize_0, 
                pageCursor = ""
            })
        });
        l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
            skip = not v55 or not l_userIdExists_0(v52), 
            notifyOnNetworkStatusChange = true, 
            variables = v57
        });
    end;
    if v40 then
        local v58 = v54 and v54.data and v54.data.allFriendsByUserId and v54.data.allFriendsByUserId.friends;
        local l_v58_0 = v58 --[[ copy: 5 -> 8 ]];
        v6.useEffect(function() --[[ Line: 149 ]]
            -- upvalues: l_userIdExists_0 (ref), v52 (copy), l_v58_0 (copy), v47 (ref)
            if l_userIdExists_0(v52) then
                local v60 = {
                    (tostring(v52))
                };
                if l_v58_0 then
                    for _, v62 in l_v58_0 do
                        if v62 and v62.id then
                            table.insert(v60, (tostring(v62.id)));
                        end;
                    end;
                end;
                v47.fetchNamesByUserIds(v60);
            end;
        end, {
            v52, 
            v58
        });
    end;
    l_useAutoSyncContacts_0();
    if v45() then
        v6.useEffect(function() --[[ Line: 170 ]]
            -- upvalues: l_userIdExists_0 (ref), v52 (copy), v51 (copy), l_NetworkingFriends_0 (ref)
            if l_userIdExists_0(v52) then
                v51(l_NetworkingFriends_0.GetFriendsCountFromUserId.API(v52));
            end;
        end, {
            v52
        });
    end;
    v6.useEffect(function() --[[ Line: 177 ]]
        -- upvalues: l_userIdExists_0 (ref), v52 (copy), v51 (copy), l_NetworkingFriends_0 (ref), v39 (ref), l_MessageBusService_0 (ref), v46 (ref)
        if l_userIdExists_0(v52) then
            v51(l_NetworkingFriends_0.GetNewFriendRequestsCount.API({
                currentUserId = v52
            }));
            if v39 then
                local v63 = l_MessageBusService_0:Subscribe(v46, function() --[[ Line: 183 ]]
                    -- upvalues: v51 (ref), l_NetworkingFriends_0 (ref), v52 (ref)
                    v51(l_NetworkingFriends_0.GetNewFriendRequestsCount.API({
                        currentUserId = v52
                    }));
                end, false, true);
                return function() --[[ Line: 188 ]]
                    -- upvalues: v63 (copy)
                    v63:Disconnect();
                end;
            end;
        end;
        return function() --[[ Line: 193 ]]

        end;
    end, {
        v52
    });
    local v64 = v6.useMemo(function() --[[ Line: 196 ]]
        -- upvalues: l_AnalyticsFactory_0 (ref), v48 (ref), l_DefaultAnalyticsService_0 (ref)
        return l_AnalyticsFactory_0.setUpAnalyticsFactory({
            eventLists = {
                EventStream = v48
            }, 
            analyticsImpl = {
                EventStream = l_DefaultAnalyticsService_0.EventStream
            }
        })();
    end, {});
    v6.useEffect(function() --[[ Line: 207 ]]
        -- upvalues: l_AppStorageService_0 (ref), v44 (ref), l_PermissionsProtocol_0 (ref), v64 (copy)
        if l_AppStorageService_0:GetItem(v44) == "true" then
            l_PermissionsProtocol_0.default:checkOrRequestPermissions({
                l_PermissionsProtocol_0.Permissions.CAMERA_ACCESS
            }):andThen(function(v65) --[[ Line: 215 ]]
                -- upvalues: v64 (ref)
                v64.fireAnalyticsEvent("ProfileQRCodeCameraSettingsModalSeen", {
                    cameraPermissionResponseStatus = v65
                });
            end);
            l_AppStorageService_0:SetItem(v44, "false");
            l_AppStorageService_0:Flush();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v52, 
        v64
    } else l_dependencyArray_0(v52, v64));
    if l_GetFFlagContactsToastEnabled_0() or l_ContactsToastIXP_0.FFlagContactsToastExperimentEnabled and l_ContactsToastIXP_0.useContactsToastVariant() then
        return (v6.createElement(v7.Portal, {
            target = l_CoreGui_0
        }, {
            v6.createElement(l_ContactsToast_0, v8.join(v50, {
                getContactImporterParams = l_getContactImporterParams_0, 
                isContactsToastPolicyEnabled = v50.isContactsToastPolicyEnabled
            }))
        }));
    else
        return nil;
    end;
end);