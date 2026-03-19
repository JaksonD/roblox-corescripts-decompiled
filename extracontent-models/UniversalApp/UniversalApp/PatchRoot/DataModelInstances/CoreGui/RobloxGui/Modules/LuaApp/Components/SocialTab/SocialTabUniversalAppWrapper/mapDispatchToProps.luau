local l_CorePackages_0 = game:GetService("CorePackages");
local l_join_0 = require(l_CorePackages_0.Packages.Cryo).Dictionary.join;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v3 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.LuaApp.Constants);
local v5 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local v6 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local v7 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateBack);
local l_NavigateDownToNotifications_0 = v6.Thunks.NavigateDownToNotifications;
local v9 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenGroupsListPage);
local l_NavigateDownToPrivacySettings_0 = v6.Thunks.NavigateDownToPrivacySettings;
local l_NavigateDownToReportAbuse_0 = v6.Thunks.NavigateDownToReportAbuse;
local l_NavigateDownToViewUserProfile_0 = v6.Thunks.NavigateDownToViewUserProfile;
local l_NavigateDownToGroups_0 = v6.Thunks.NavigateDownToGroups;
local v14 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownToAddFriends);
local v15 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownToFriendRequests);
local v16 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownToAddFriendsAccountProvider);
local v17 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenProfilePeekView);
local v18 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenCentralOverlayForPeopleList);
local l_SetTabBarVisibleFromChat_0 = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Thunks.SetTabBarVisibleFromChat;
local l_ToggleChatPaused_0 = v5.Actions.ToggleChatPaused;
local l_GetUnreadConversationCount_0 = require(l_CorePackages_0.Workspace.Packages.SocialTabState).Requests.GetUnreadConversationCount;
local v22 = require(l_script_FirstAncestor_0.LuaApp.Actions.SetCurrentToastMessage);
local v23 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenGameDetails);
local v24 = require(l_script_FirstAncestor_0.LuaApp.Thunks.openGameDetailsPageFromChat);
local v25 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateToUserInfo);
local v26 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenVerifiedBadgeModal);
local v27 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenReportDialog);
local v28 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenCentralOverlayForDiscoverabilityUpsell);
local v29 = require(l_script_FirstAncestor_0.LuaApp.Thunks.CloseCentralOverlay);
local v30 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local l_OpenAmpWizardContainer_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer;
local v32 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownTo3DQRCodePage);
local v33 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenCentralOverlayForPlayerContextualMenu);
local l_GetFFlagLuafiedReportEntryPoints_0 = v3.GetFFlagLuafiedReportEntryPoints;
return function(v35) --[[ Line: 45 ]]
    -- upvalues: v7 (copy), l_NavigateDownToNotifications_0 (copy), l_NavigateDownToPrivacySettings_0 (copy), l_NavigateDownToReportAbuse_0 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), v27 (copy), v4 (copy), l_NavigateDownToViewUserProfile_0 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), l_NavigateDownToGroups_0 (copy), v9 (copy), l_SetTabBarVisibleFromChat_0 (copy), l_ToggleChatPaused_0 (copy), v18 (copy), l_join_0 (copy), l_GetUnreadConversationCount_0 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v30 (copy), v28 (copy), v29 (copy), v22 (copy), v32 (copy), l_OpenAmpWizardContainer_0 (copy), v33 (copy)
    return {
        navigateBack = function() --[[ Line: 47 ]] --[[ Name: navigateBack ]]
            -- upvalues: v35 (copy), v7 (ref)
            v35(v7());
        end, 
        navigateDownToNotifications = function(v36) --[[ Line: 50 ]] --[[ Name: navigateDownToNotifications ]]
            -- upvalues: v35 (copy), l_NavigateDownToNotifications_0 (ref)
            v35(l_NavigateDownToNotifications_0(v36));
        end, 
        navigateDownToPrivacySettings = function(v37) --[[ Line: 53 ]] --[[ Name: navigateDownToPrivacySettings ]]
            -- upvalues: v35 (copy), l_NavigateDownToPrivacySettings_0 (ref)
            v35(l_NavigateDownToPrivacySettings_0(v37));
        end, 
        navigateDownToReportAbuse = function(v38, v39, v40) --[[ Line: 56 ]] --[[ Name: navigateDownToReportAbuse ]]
            -- upvalues: v35 (copy), l_NavigateDownToReportAbuse_0 (ref)
            v35(l_NavigateDownToReportAbuse_0(v38, v39, v40));
        end, 
        openReportDialog = l_GetFFlagLuafiedReportEntryPoints_0() and function(v41, v42) --[[ Line: 60 ]]
            -- upvalues: v35 (copy), v27 (ref), v4 (ref)
            v35(v27({
                reportEntryPoint = v4.ReportDialogEntryPoints.Chat, 
                userId = v41, 
                conversationId = v42
            }));
        end or nil, 
        navigateDownToViewUserProfile = function(v43, v44) --[[ Line: 68 ]] --[[ Name: navigateDownToViewUserProfile ]]
            -- upvalues: v35 (copy), l_NavigateDownToViewUserProfile_0 (ref)
            v35(l_NavigateDownToViewUserProfile_0(v43, v44));
        end, 
        navigateDownToAddFriends = function(v45) --[[ Line: 71 ]] --[[ Name: navigateDownToAddFriends ]]
            -- upvalues: v35 (copy), v14 (ref)
            v35(v14(v45));
        end, 
        navigateDownToFriendFinder = function(v46) --[[ Line: 74 ]] --[[ Name: navigateDownToFriendFinder ]]
            -- upvalues: v35 (copy), v15 (ref)
            v35(v15(v46));
        end, 
        navigateDownToAddFriendsAccountProvider = function(v47, v48) --[[ Line: 77 ]] --[[ Name: navigateDownToAddFriendsAccountProvider ]]
            -- upvalues: v35 (copy), v16 (ref)
            v35(v16(v47, v48));
        end, 
        openProfilePeekView = function(v49, v50) --[[ Line: 80 ]] --[[ Name: openProfilePeekView ]]
            -- upvalues: v35 (copy), v17 (ref)
            v35(v17(v49, v50));
        end, 
        navigateDownToGroups = function(v51) --[[ Line: 83 ]] --[[ Name: navigateDownToGroups ]]
            -- upvalues: v35 (copy), l_NavigateDownToGroups_0 (ref)
            v35(l_NavigateDownToGroups_0(v51));
        end, 
        openGroupsListPage = function(v52) --[[ Line: 86 ]] --[[ Name: openGroupsListPage ]]
            -- upvalues: v35 (copy), v9 (ref)
            v35(v9(v52));
        end, 
        setTabBarVisibleFromChat = function(v53) --[[ Line: 89 ]] --[[ Name: setTabBarVisibleFromChat ]]
            -- upvalues: v35 (copy), l_SetTabBarVisibleFromChat_0 (ref)
            v35(l_SetTabBarVisibleFromChat_0(v53));
        end, 
        toggleChatPaused = function(v54) --[[ Line: 92 ]] --[[ Name: toggleChatPaused ]]
            -- upvalues: v35 (copy), l_ToggleChatPaused_0 (ref)
            v35(l_ToggleChatPaused_0(v54));
        end, 
        openContextualMenu = function(v55) --[[ Line: 95 ]] --[[ Name: openContextualMenu ]]
            -- upvalues: v35 (copy), v18 (ref), l_join_0 (ref)
            v35(v18(l_join_0(v55, {
                analyticContext = "SocialTab"
            })));
        end, 
        fetchUnreadConversationCount = function() --[[ Line: 100 ]] --[[ Name: fetchUnreadConversationCount ]]
            -- upvalues: v35 (copy), l_GetUnreadConversationCount_0 (ref)
            v35(l_GetUnreadConversationCount_0.API());
        end, 
        openGameDetailsPeekView = function(v56) --[[ Line: 103 ]] --[[ Name: openGameDetailsPeekView ]]
            -- upvalues: v35 (copy), v23 (ref)
            assert(type(v56) == "string", "Expected universeId to be a string");
            v35(v23(v56));
        end, 
        navigateToGameDetails = function(v57, v58) --[[ Line: 107 ]] --[[ Name: navigateToGameDetails ]]
            -- upvalues: v35 (copy), v24 (ref)
            v35(v24(v57, v58));
        end, 
        navigateToUserInfo = function(v59, v60) --[[ Line: 110 ]]
            -- upvalues: v35 (copy), v25 (ref)
            assert(type(v59) == "string", "Expected userId to be a string");
            v35(v25(v59, v60));
        end or nil, 
        openVerifiedBadgeModal = function() --[[ Line: 114 ]] --[[ Name: openVerifiedBadgeModal ]]
            -- upvalues: v35 (copy), v26 (ref)
            v35(v26());
        end, 
        openLearnMoreLink = function() --[[ Line: 117 ]] --[[ Name: openLearnMoreLink ]]
            -- upvalues: v35 (copy), v30 (ref)
            v35(v30());
        end, 
        openDiscoverabilityModal = function(v61) --[[ Line: 120 ]] --[[ Name: openDiscoverabilityModal ]]
            -- upvalues: v35 (copy), v28 (ref)
            v35(v28(v61));
        end, 
        closeCentralOverlay = function() --[[ Line: 123 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v35 (copy), v29 (ref)
            v35(v29());
        end, 
        showToast = function(v62) --[[ Line: 126 ]] --[[ Name: showToast ]]
            -- upvalues: v35 (copy), v22 (ref)
            v35(v22({
                toastMessage = v62
            }));
        end, 
        navigateTo3DQRCodePage = function(v63) --[[ Line: 131 ]] --[[ Name: navigateTo3DQRCodePage ]]
            -- upvalues: v35 (copy), v32 (ref)
            v35(v32(v63));
        end, 
        openAmpWizardContainer = function(v64, v65) --[[ Line: 134 ]] --[[ Name: openAmpWizardContainer ]]
            -- upvalues: v35 (copy), l_OpenAmpWizardContainer_0 (ref)
            v35(l_OpenAmpWizardContainer_0(v64, v65));
        end, 
        openPlayerContextualMenu = function(v66) --[[ Line: 137 ]] --[[ Name: openPlayerContextualMenu ]]
            -- upvalues: v35 (copy), v33 (ref)
            v35(v33(v66));
        end
    };
end;