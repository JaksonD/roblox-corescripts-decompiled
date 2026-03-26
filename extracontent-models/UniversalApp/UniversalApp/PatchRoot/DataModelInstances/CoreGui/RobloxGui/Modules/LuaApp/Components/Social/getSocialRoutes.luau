local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v5 = require(l_Modules_0.LuaApp.AppPageProperties);
local v6 = require(l_Modules_0.LuaApp.Enum.SystemBarVisibility);
local v7 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v7.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v7.TenFootUiRNTypes.GlobalNavDisplayOption;
local v10 = require(l_Modules_0.LuaApp.Components.DiscoverabilityModal.api);
local l_SocialNetworksInEditProfileIXP_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).Flags.SocialNetworksInEditProfileIXP;
local l_FFlagEnableSocialProofUserList_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSocialProofUserList;
local l_FFlagProfilePlatformAddTC_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformAddTC;
local l_FFlagTCVerifiedParentalControl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCVerifiedParentalControl;
local l_FFlagUseNewDiscoverabilityModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNewDiscoverabilityModal;
local l_FFlagCreateConnectionsHub_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCreateConnectionsHub;
local l_FFlagCiDeprecateFindFriendsModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCiDeprecateFindFriendsModal;
local l_FFlagEnableSocialProofVerticalUserListSheet_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSocialProofVerticalUserListSheet;
local l_FFlagEnableMobileGameJoinCard_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMobileGameJoinCard;
return function() --[[ Line: 35 ]]
    -- upvalues: l_AppPage_0 (copy), l_Modules_0 (copy), v5 (copy), l_CorePackages_0 (copy), l_SocialNetworksInEditProfileIXP_0 (copy), v6 (copy), l_ScreenKind_0 (copy), l_GlobalNavDisplayOption_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_FFlagUseNewDiscoverabilityModal_0 (copy), v10 (copy), l_FFlagCiDeprecateFindFriendsModal_0 (copy), l_FFlagProfilePlatformAddTC_0 (copy), l_FFlagTCVerifiedParentalControl_0 (copy), l_FFlagEnableSocialProofUserList_0 (copy), l_FFlagEnableSocialProofVerticalUserListSheet_0 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy)
    return {
        {
            [l_AppPage_0.SocialUnableToJoinExperience] = {
                getScreen = function() --[[ Line: 39 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.SocialUnableToJoinExperience);
                end, 
                navigationOptions = v5[l_AppPage_0.SocialUnableToJoinExperience]
            }
        }, 
        {
            [l_AppPage_0.SocialToast] = {
                getScreen = function() --[[ Line: 47 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.SocialToast).ToastScreen;
                end, 
                navigationOptions = v5[l_AppPage_0.SocialToast]
            }
        }, 
        {
            [l_AppPage_0.SocialPurchaseExperience] = {
                getScreen = function() --[[ Line: 55 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.SocialExperienceJoin).PurchaseExperienceModal;
                end, 
                navigationOptions = v5[l_AppPage_0.SocialPurchaseExperience]
            }
        }, 
        {
            [l_AppPage_0.SetNicknameModal] = {
                getScreen = function() --[[ Line: 63 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.FriendRequestNicknames).SetNicknameModal;
                end, 
                navigationOptions = v5[l_AppPage_0.SetNicknameModal]
            }
        }, 
        {
            [l_AppPage_0.ContentFeed] = {
                getScreen = function() --[[ Line: 71 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.ContentFeed).App;
                end, 
                navigationOptions = v5[l_AppPage_0.ContentFeed]
            }
        }, 
        if l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then {
            [l_AppPage_0.EditSocialNetworks] = {
                getScreen = function() --[[ Line: 80 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.EditProfile).EditSocialLinksModal;
                end, 
                navigationOptions = v5[l_AppPage_0.EditSocialNetworks]
            }
        } else nil, 
        if l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then {
            [l_AppPage_0.EditSocialNetworksError] = {
                getScreen = function() --[[ Line: 90 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.EditProfile).EditSocialNetworksErrorModal;
                end, 
                navigationOptions = v5[l_AppPage_0.EditSocialNetworksError]
            }
        } else nil, 
        {
            [l_AppPage_0.ViewFriends] = {
                getScreen = function() --[[ Line: 99 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.FriendsLanding.FriendsLandingUniversalAppWrapper.Container);
                end, 
                navigationOptions = {
                    hasSubNavigation = true, 
                    tabBarHidden = v6.PolicyDependent, 
                    nativeWrapper = false, 
                    renderUnderlyingPage = false
                }
            }
        }, 
        {
            [l_AppPage_0.AddFriendsPage] = {
                getScreen = function() --[[ Line: 113 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.AddFriends.AddFriendsUniversalAppWrapper);
                end, 
                navigationOptions = {
                    tabBarHidden = v6.PolicyDependent, 
                    screenKind = l_ScreenKind_0.Default, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly, 
                    nativeWrapper = false, 
                    bottomTabBarHidden = true, 
                    sideTabBarHidden = false
                }
            }
        }, 
        if l_FFlagCreateConnectionsHub_0 then {
            [l_AppPage_0.ConnectionsHub] = {
                getScreen = function() --[[ Line: 129 ]] --[[ Name: getScreen ]]
                    return require(script.Parent.ConnectionsHub.ConnectionsHubNavigator);
                end
            }
        } else nil, 
        {
            [l_AppPage_0.UserSearch] = {
                getScreen = function() --[[ Line: 137 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.UserSearch.UserSearchScreenUniversalWrapper.UserSearchScreenUniversalWrapper);
                end, 
                navigationOptions = {
                    tabBarHidden = v6.PolicyDependent
                }
            }
        }, 
        {
            [l_AppPage_0.DiscoverabilityOverlay] = {
                getScreen = function() --[[ Line: 149 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_FFlagUseNewDiscoverabilityModal_0 (ref), v10 (ref)
                    if l_FFlagUseNewDiscoverabilityModal_0 then
                        return v10.DiscoverabilityWithAudit;
                    else
                        return v10.DiscoverabilityOverlay;
                    end;
                end, 
                navigationOptions = v5[l_AppPage_0.DiscoverabilityOverlay]
            }
        }, 
        {
            [l_AppPage_0.ContactImporter] = {
                getScreen = function() --[[ Line: 162 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_FFlagCiDeprecateFindFriendsModal_0 (ref), l_Modules_0 (ref)
                    if l_FFlagCiDeprecateFindFriendsModal_0 then
                        return require(l_Modules_0.LuaApp.Components.ContactImporter.api).ContactImporterLandingPage;
                    else
                        return require(l_Modules_0.LuaApp.Components.ContactImporter.api).FindFriendsModal;
                    end;
                end, 
                navigationOptions = v5[l_AppPage_0.ContactImporter]
            }
        }, 
        {
            [l_AppPage_0.FindFriendsModal] = {
                getScreen = function() --[[ Line: 174 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.ContactImporter.api).FindFriendsModal;
                end, 
                navigationOptions = v5[l_AppPage_0.FindFriendsModal]
            }
        }, 
        {
            [l_AppPage_0.ContactsList] = {
                getScreen = function() --[[ Line: 182 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.ContactImporter.ContactsListUniversalAppWrapper);
                end, 
                navigationOptions = v5[l_AppPage_0.ContactsList]
            }
        }, 
        {
            [l_AppPage_0.ContactsRevokedAccessDialog] = {
                getScreen = function() --[[ Line: 191 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.ContactImporter.api).ContactsRevokedAccessDialog;
                end, 
                navigationOptions = v5[l_AppPage_0.ContactsRevokedAccessDialog]
            }
        }, 
        {
            [l_AppPage_0.TrustedContactsEducationModal] = {
                getScreen = function() --[[ Line: 199 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.TrustedContacts).TrustedContactsEducationModal;
                end, 
                navigationOptions = v5[l_AppPage_0.TrustedContactsEducationModal]
            }
        }, 
        {
            [l_AppPage_0.SettingsPermissionInteractiveAlert] = {
                getScreen = function() --[[ Line: 207 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.SocialCommon).Components.SettingsPermissionInteractiveAlert;
                end, 
                navigationOptions = v5[l_AppPage_0.SettingsPermissionInteractiveAlert]
            }
        }, 
        if l_FFlagProfilePlatformAddTC_0 then {
            [l_AppPage_0.TrustedContactsModal] = {
                getScreen = function() --[[ Line: 216 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.TrustedContacts).TrustedContactsModal.Screen;
                end, 
                navigationOptions = v5[l_AppPage_0.TrustedContactsModal]
            }
        } else nil, 
        if l_FFlagTCVerifiedParentalControl_0 then {
            [l_AppPage_0.TrustedFriendsVPCPrologue] = {
                getScreen = function() --[[ Line: 226 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.TrustedContacts).TrustedFriendsVPCPrologue.Screen;
                end, 
                navigationOptions = v5[l_AppPage_0.TrustedFriendsVPCPrologue]
            }
        } else nil, 
        {
            [l_AppPage_0.FriendsRenameInfoModal] = {
                getScreen = function() --[[ Line: 235 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.TrustedContacts).FriendsRenameInfoModal;
                end, 
                navigationOptions = v5[l_AppPage_0.FriendsRenameInfoModal]
            }
        }, 
        {
            [l_AppPage_0.BlockingModal] = {
                getScreen = function() --[[ Line: 243 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.SocialBlockingModal).BlockingModal;
                end, 
                navigationOptions = v5[l_AppPage_0.BlockingModal]
            }
        }, 
        if l_FFlagEnableSocialProofUserList_0 then {
            [l_AppPage_0.FriendsOwnedUserList] = {
                getScreen = function() --[[ Line: 252 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.SocialProof).UserLists.FriendsOwnedUserList;
                end, 
                navigationOptions = v5[l_AppPage_0.FriendsOwnedUserList]
            }
        } else nil, 
        {
            [l_AppPage_0.MutualConnectionList] = {
                getScreen = function() --[[ Line: 261 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.ProfilePlatform).UserLists.MutualConnectionList;
                end, 
                navigationOptions = v5[l_AppPage_0.MutualConnectionList]
            }
        }, 
        {
            [l_AppPage_0.AboutDetailsSheet] = {
                getScreen = function() --[[ Line: 270 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.ProfilePlatform).AboutDetailsSheet;
                end, 
                navigationOptions = v5[l_AppPage_0.AboutDetailsSheet]
            }
        }, 
        if l_FFlagEnableSocialProofVerticalUserListSheet_0 then {
            [l_AppPage_0.SocialProofVerticalUserListSheet] = {
                getScreen = function() --[[ Line: 279 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.SocialProof).UserLists.SocialProofVerticalUserListSheet;
                end, 
                navigationOptions = v5[l_AppPage_0.SocialProofVerticalUserListSheet]
            }
        } else nil, 
        if l_FFlagEnableMobileGameJoinCard_0 then {
            [l_AppPage_0.GameJoinCard] = {
                getScreen = function() --[[ Line: 289 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.GameJoinCard).MobileGameJoinCard;
                end, 
                navigationOptions = v5[l_AppPage_0.GameJoinCard]
            }
        } else nil
    };
end;