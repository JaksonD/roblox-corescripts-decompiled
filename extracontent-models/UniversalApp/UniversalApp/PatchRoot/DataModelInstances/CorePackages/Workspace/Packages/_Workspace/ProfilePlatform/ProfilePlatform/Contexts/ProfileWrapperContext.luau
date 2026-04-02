local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_Parent_0.CurrencyTransfers);
local l_FFlagProfilePlatformEnableStore_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableStore;
local l_FFlagAddSocialLinksToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddSocialLinksToCommunityProfile;
local l_FFlagEnablePlatformProfileContextualMenuOption_0 = require(l_Parent_0.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption;
local l_FFlagAddIEMProfilePage_0 = require(l_Parent_0.SharedFlags).FFlagAddIEMProfilePage;
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditAppearanceMenu);
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
return v2.createContext({
    profileId = "TEST_ID", 
    profilePlatformId = l_FFlagEnablePlatformProfileContextualMenuOption_0 and "TEST_PLATFORM_ID" or nil, 
    profileType = v3.ProfileTypes.User, 
    navigateTo = {
        qRCodePage = function() --[[ Line: 89 ]] --[[ Name: qRCodePage ]]

        end, 
        previousView = function() --[[ Line: 90 ]] --[[ Name: previousView ]]

        end, 
        itemDetails = function() --[[ Line: 91 ]] --[[ Name: itemDetails ]]

        end, 
        itemOrBundleDetails = l_FFlagProfilePlatformEnableStore_0 and function() --[[ Line: 92 ]]

        end or nil, 
        catalogSearch = l_FFlagProfilePlatformEnableStore_0 and function() --[[ Line: 93 ]]

        end or nil, 
        inspectAvatar = l_FFlagAddIEMProfilePage_0 and function() --[[ Line: 94 ]]

        end or nil, 
        editEmotes = v9 and function() --[[ Line: 95 ]]

        end or nil, 
        switchAvatar = v9 and function() --[[ Line: 96 ]]

        end or nil, 
        editAvatar = function() --[[ Line: 97 ]] --[[ Name: editAvatar ]]

        end, 
        editUsername = function() --[[ Line: 98 ]] --[[ Name: editUsername ]]

        end, 
        openLeaveRobloxAlertUIBlox = l_FFlagAddSocialLinksToCommunityProfile_0 and function() --[[ Line: 99 ]]

        end or nil, 
        closeLeaveRobloxAlert = l_FFlagAddSocialLinksToCommunityProfile_0 and function() --[[ Line: 100 ]]

        end or nil, 
        navigateToTransfer = l_FFlagProfilePlatformEnableCurrencyTransfer_0 and function() --[[ Line: 101 ]]

        end or nil
    }, 
    externalAnalytics = {
        catalogAnalytics = {}
    }, 
    sourceInfo = {
        isRecommendation = false, 
        source = "TEST_SOURCE", 
        contextualInfoType = "TEST_CONTEXTUAL_INFO_TYPE", 
        contextualOverride = {}, 
        friendshipOriginSourceType = "TEST_FRIENDSHIP_ORIGIN_SOURCE_TYPE"
    }
});