local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v3 = require(script.Parent.EventNames);
local l_FFlagProfilePlatformEnableStore_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableStore;
local l_FFlagEnablePlatformProfileContextualMenuOption_0 = require(l_Parent_0.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption;
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields);
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("ProfilePlatformAnalyticsThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v3.ProfileLoadingStage] = {
        description = "Stage of loading profile", 
        lastUpdated = {
            24, 
            6, 
            6
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    status = function(v9) --[[ Line: 30 ]] --[[ Name: status ]]
                        return v9;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                overrideName = function(v10) --[[ Line: 37 ]] --[[ Name: overrideName ]]
                    -- upvalues: v3 (copy)
                    return v3.ProfileLoadingStage .. "Time" .. v10.status;
                end, 
                dynamicCustomFields = {
                    status = function(v11) --[[ Line: 41 ]] --[[ Name: status ]]
                        return v11;
                    end, 
                    isProfilePlatform = function(v12) --[[ Line: 44 ]] --[[ Name: isProfilePlatform ]]
                        return v12 or false;
                    end
                }
            }
        }
    }, 
    [v3.ProfilePlatformPageReloaded] = {
        description = "ReloadedProfilePlatform", 
        lastUpdated = {
            25, 
            4, 
            25
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    reloadCount = function(v13) --[[ Line: 58 ]] --[[ Name: reloadCount ]]
                        if v13 <= 10 then
                            return (("ReloadCount$%*"):format(v13));
                        else
                            return "ReloadCount5+";
                        end;
                    end
                }
            }
        }
    }, 
    [v3.ProfileInExperienceUserLoadingStage] = {
        description = "User in experience opened", 
        lastUpdated = {
            24, 
            6, 
            10
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    status = function(v14) --[[ Line: 78 ]] --[[ Name: status ]]
                        return v14;
                    end, 
                    isInExperience = function(v15) --[[ Line: 81 ]] --[[ Name: isInExperience ]]
                        return v15;
                    end
                }
            }
        }
    }, 
    [v3.ProfilePageLoadedWithData] = {
        description = "Profile page loaded with data", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    friendStatus = function(v16) --[[ Line: 95 ]] --[[ Name: friendStatus ]]
                        return v16;
                    end
                }
            }
        }
    }, 
    [v3.ProfilePresenceLoaded] = {
        description = "Profile presence loaded", 
        lastUpdated = {
            25, 
            2, 
            19
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    presenceType = function(v17) --[[ Line: 109 ]] --[[ Name: presenceType ]]
                        return v17;
                    end
                }
            }
        }
    }, 
    [v3.ContextualMenuButtonChat] = {
        description = "Chat button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonIgnoreFriendRequest] = {
        description = "Ignore friend request button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonReport] = {
        description = "Report button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonUnfriend] = {
        description = "Unfriend button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonBlock] = {
        description = "Block button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonSetAlias] = {
        description = "Set alias button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonCopyLink] = {
        description = "Copy Link button clicked", 
        lastUpdated = {
            25, 
            3, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonLeaveCommunity] = {
        description = "Leave Community button clicked", 
        lastUpdated = {
            25, 
            3, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonMakePrimaryCommunity] = {
        description = "Make Primary Community button clicked", 
        lastUpdated = {
            25, 
            3, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonRemovePrimaryCommunity] = {
        description = "Remove Primary Community button clicked", 
        lastUpdated = {
            25, 
            3, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonRemoveTrustedConnection] = {
        description = "Remove Trusted Connection button clicked", 
        lastUpdated = {
            25, 
            6, 
            16
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonAddTrustedConnection] = {
        description = "Add Trusted Connection button clicked", 
        lastUpdated = {
            25, 
            9, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = if l_FFlagTCShareLinkSenderUI_0 then {
                    modalVariantOverride = function(v18) --[[ Line: 223 ]] --[[ Name: modalVariantOverride ]]
                        return v18;
                    end
                } else nil
            }
        }
    }, 
    [v3.ContextualMenuButtonAddIncomingTrustedConnection] = {
        description = "Accept Trusted Connection button clicked", 
        lastUpdated = {
            25, 
            9, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonOpenEditProfilePage] = {
        description = "Open edit profile page button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonChat] = {
        description = "Chat button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonUnfriend] = {
        description = "Unfriend button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonUnblock] = {
        description = "Unblock button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonAddFriend] = {
        description = "Add friend button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonAddFriendFromContacts] = {
        description = "Add friend from contacts clicked", 
        lastUpdated = {
            24, 
            9, 
            12
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonAcceptFriendRequest] = {
        description = "Accept friend request button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonEditAvatar] = {
        description = "Edit avatar button clicked", 
        lastUpdated = {
            25, 
            9, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonEditLook] = {
        description = "Edit look button clicked", 
        lastUpdated = {
            26, 
            3, 
            18
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonShareProfile] = {
        description = "Share profile button clicked", 
        lastUpdated = {
            25, 
            3, 
            12
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonShareProfileQRCode] = {
        description = "Share profile QR code button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonJoinCommunity] = {
        description = "Join Community button clicked", 
        lastUpdated = {
            25, 
            3, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonViewCommunity] = {
        description = "View Community button clicked", 
        lastUpdated = {
            25, 
            3, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CTAButtonCancelJoinCommunityRequest] = {
        description = "Cancel Join Community Request button clicked", 
        lastUpdated = {
            25, 
            3, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.FriendsButton] = {
        description = "Friends button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.FollowersButton] = {
        description = "Followers button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.FollowingsButton] = {
        description = "Following button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.MutualFriendsButton] = {
        description = "Mutual friends button clicked", 
        lastUpdated = {
            25, 
            8, 
            19
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ViewPlayerProfileButton] = {
        description = "View player profile button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButton] = {
        description = "Contextual menu button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.GameDetailsButton] = {
        description = "Game details button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.EditDisplayNameButton] = {
        description = "Edit display name button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.SetAliasButton] = {
        description = "Set alias button clicked", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ProfileClosed] = {
        description = "Profile closed", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v3.StoreHeaderButton] = {
        description = "Store header button clicked", 
        lastUpdated = {
            25, 
            4, 
            23
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.CatalogItemOpened] = {
        description = "Catalog item opened", 
        lastUpdated = {
            24, 
            7, 
            31
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = if l_FFlagProfilePlatformEnableStore_0 then if v6 then {
                    btnContext = function(v19) --[[ Line: 474 ]] --[[ Name: btnContext ]]
                        return v19;
                    end
                } else {
                    source = function(v20) --[[ Line: 479 ]] --[[ Name: source ]]
                        return v20;
                    end
                } else nil
            }
        }
    }, 
    [v3.ProfileImpressionsSent] = {
        description = "Impressions sent", 
        lastUpdated = {
            25, 
            2, 
            24
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    component = function(v21) --[[ Line: 494 ]] --[[ Name: component ]]
                        return v21;
                    end
                }
            }
        }
    }, 
    [v3.UsernameCopied] = {
        description = "Username copied to clipboard", 
        lastUpdated = {
            25, 
            8, 
            5
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v3.ContextualMenuButtonViewPlatformProfile] = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then {
        description = "View platform profile button clicked", 
        lastUpdated = {
            25, 
            9, 
            11
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v3.ContextualMenuButtonCurrencyTransfer] = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then {
        description = "Currency transfer button clicked from contextual menu", 
        lastUpdated = {
            26, 
            3, 
            24
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil, 
    [v3.CTAButtonCurrencyTransfer] = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then {
        description = "Currency transfer CTA button clicked", 
        lastUpdated = {
            26, 
            3, 
            24
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    } else nil
};