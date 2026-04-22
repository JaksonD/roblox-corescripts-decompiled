local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local l_GamesMultigetPlaceDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GamesByPlaceId.GamesMultigetPlaceDetails;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol.default;
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local v10 = require(l_Modules_0.LuaApp.AppPage);
local v11 = require(l_CorePackages_0.Workspace.Packages.AppChatNetworking);
local v12 = require(l_Modules_0.LuaApp.ArgCheck);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_CreateConversation_0 = v11.http.CreateConversation;
local v16 = require(script.Parent.logGameDetailsDeepLinkEvent);
local v17 = require(script.Parent.logLockScreenWidgetClicked);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local v19 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.Enums);
local v20 = require(l_Modules_0.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes);
local v21 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v22 = require(l_Modules_0.LuaApp.Http.UrlBase);
local v23 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_UseGameDetailsPeekView_0 = require(l_CorePackages_0.Workspace.Packages.GameDetail).PeekView.UseGameDetailsPeekView;
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v27 = require(l_Modules_0.AvatarExperience.Common.DeepLinkUtils);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Constants;
local l_UpsellEntrySurfaceType_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Analytics.Enum.UpsellEntrySurfaceType;
local l_contactImporterModalInfo_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.contactImporterModalInfo;
local v31 = require(l_Modules_0.LuaApp.DeepLinks.Utils.ExternalWebUrlNavigationHelper);
local v32 = require(l_Modules_0.LuaApp.DeepLinks.Utils.SortIdMapper);
local l_HardwareSafeAreaInsets_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).HardwareSafeAreaInsets;
local l_StreamNotificationStore_0 = require(l_CorePackages_0.Workspace.Packages.StreamNotifications).StreamNotificationStore;
local v35 = require(script.Parent.ShareLinks.handleShareLinkRoot);
local v36 = require(script.Parent.ShareLinks.StaticLinks.handleStaticShareLink);
local v37 = require(script.Parent.ShareLinks.handleJoinLink);
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v39 = game:DefineFastFlag("EnablePrivacySettingsDeeplinks", false);
local v40 = game:DefineFastFlag("EnableParentalControlsDeeplinks", false);
local v41 = game:DefineFastFlag("EnableAccountInfoDeeplinks", false);
game:SetFlagVersion("EnableDevicePreferencesDeeplink", 2);
local v42 = game:DefineFastFlag("EnableDevicePreferencesDeeplink", false);
local v43 = game:DefineFastFlag("EnableSettingSubpageDeeplinks", false);
local l_GetFFlagEnableSecurityAlertDeeplink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSecurityAlertDeeplink;
local l_GetFFlagGenerateLinkWithChannel_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGenerateLinkWithChannel;
local v46 = require(l_Modules_0.AvatarExperience.Flags.FFlagQRCodeItemRedemptionEnabled);
local v47 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local v48 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableGiftCardsDeepLink);
local v49 = game:DefineFastFlag("EnableBuyRobuxDeepLink", false);
local l_FFlagEnableCurrencyTransferDeepLink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableCurrencyTransferDeepLink;
local v51 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMessagesDeepLink);
local v52 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoggingForGameDetailLinks);
local l_FFlagLuaAppForumsDeeplinkFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppForumsDeeplinkFix;
local v54 = game:DefineFastFlag("EnableBundleItemDetailHttpLink", false);
local v55 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLookDetailsDeepLink);
local v56 = require(l_Modules_0.LuaApp.Flags.FFlagEnableCatalogSearchDeepLinks);
local v57 = require(l_Modules_0.LuaApp.Flags.FFlagEnableProfilePictureEditorDeepLink);
local l_FFlagEnableShareLinksInGameDetailEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent;
local v59 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local l_GetFFlagUseCommunitiesTranslation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseCommunitiesTranslation;
local v61 = require(l_Modules_0.LuaApp.Flags.FFlagAXEnableCatalogCreatorHttpLink);
local l_FFlagEnableSquadDeeplinkWithChatId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSquadDeeplinkWithChatId;
local l_FFlagLuaAppSortDeeplinkFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSortDeeplinkFix;
local v64 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FFlagCiDeprecateFindFriendsModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCiDeprecateFindFriendsModal;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXHandleTaxonomyIdsDeepLinks;
local l_FFlagEnableNotificationsDeeplink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableNotificationsDeeplink;
local l_FFlagTCParentChildAutoUpgrade_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCParentChildAutoUpgrade;
local l_FFlagTCUnifyNavigationEntry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCUnifyNavigationEntry;
game:DefineFastString("GamesPageDeepLinkPattern", "roblox.*://navigation/games");
game:DefineFastString("HomePageDeepLinkPattern", "roblox.*://navigation/home");
game:DefineFastString("AvatarClothingSortingView", "roblox.*://navigation/avatar_clothing_sort");
game:DefineFastString("AvatarProfilePictureEditor", "roblox.*://navigation/avatar_profile_picture_editor");
game:DefineFastString("AvatarDeepLinkPattern", "roblox.*://navigation/avatar.*");
game:DefineFastString("AvatarHttpPattern", "/my/avatar");
game:DefineFastString("MorePageDeepLinkPattern", "roblox.*://navigation/more");
game:DefineFastString("NotificationsDeepLinkPattern", "roblox.*://navigation/notifications");
game:DefineFastString("NotificationSettingsDeepLinkPattern", "roblox.*://navigation/notification_settings");
game:DefineFastString("RoactChatDeepLinkPattern", "roblox.*://navigation/chat.*");
game:DefineFastString("GameDetailsDeepLinkPattern", "roblox.*://navigation/game_details.*");
game:DefineFastString("GameDetailsHttpPattern", "/games/(%d+)/?[%w_-]*%??r?e?f?P?a?g?e?I?d?=?[%w%-]*");
game:DefineFastString("GameDetailsReferralHttpPattern", "/games/refer.*");
game:DefineFastString("ProfileCardDeepLinkPattern", "roblox.*://navigation/profile_card.*");
game:DefineFastString("ProfileTrustedFriendsDeepLinkPattern", "roblox.*://navigation/profile_trustedfriends.*");
game:DefineFastString("ProfileDeepLinkPattern", "roblox.*://navigation/profile.*");
game:DefineFastString("CatalogSearchDeepLinkPattern", "roblox.*://navigation/catalog?.+");
game:DefineFastString("CatalogEquipDeepLinkPattern", "roblox.*://navigation/catalog/equip?.+");
game:DefineFastString("CatalogDeepLinkPattern", "roblox.*://navigation/catalog");
game:DefineFastString("CatalogHttpPattern", "/catalog[^/]*");
game:DefineFastString("ItemDetailsDeepLinkPattern", "roblox.*://navigation/item_details.*");
game:DefineFastString("ItemDetailsHttpPattern", "/catalog/(%d+)/.*");
game:DefineFastString("BundleItemDetailsHttpPattern", "/bundles/(%d+)/.*");
game:DefineFastString("LookItemDetailsHttpPattern", "/looks/(%d+)/.*");
game:DefineFastString("ItemRedemptionDeepLinkPattern", "roblox.*://navigation/qr_code_redemption.*");
if v43 then
    game:DefineFastString("FriendsPageDeepLinkPattern", "roblox.*://navigation/friends$");
else
    game:DefineFastString("FriendsPageDeepLinkPattern", "roblox.*://navigation/friends");
end;
game:DefineFastString("GiftCardsPageDeepLinkPattern", "roblox.*://navigation/gift_cards");
game:DefineFastString("BuyRobuxDeepLinkPattern", "roblox.*://navigation/buy_robux");
game:DefineFastString("CurrencyTransferDeepLinkPattern", "roblox.*://navigation/currency_transfer.*");
game:DefineFastString("GroupsDeepLinkPattern", "roblox.*://navigation/group.*");
game:DefineFastString("CrossDeviceLoginDeepLinkPattern", "roblox.*://navigation/crossdevice.*");
game:DefineFastString("EventDetailsPageDeepLinkPattern", "roblox.*://navigation/event_details.*");
game:DefineFastString("ShareLinkDeepLinkPattern", "roblox.*://navigation/share_links.*");
game:DefineFastString("StaticShareLinkDeepLinkPattern", "roblox.*://navigation/share_links/(%w)/([%w%-]+).*");
game:DefineFastString("JoinLinkHttpPattern", "/join/([%w]+).*");
game:DefineFastString("ShareLinkHttpPattern", "/share.*");
game:DefineFastString("StaticShareLinkHttpPattern", "/share/(%w)/([%w%-]+).*");
game:DefineFastString("ShortShareLinkHttpPattern", "/shortlink.*");
game:DefineFastString("ContentPostDeepLinkPattern", "roblox.*://navigation/content_post.*");
game:DefineFastString("ContactsDeepLinkPattern", "roblox.*://navigation/contacts.*");
game:DefineFastString("AppealsPortalDeepLinkPattern", "roblox.*://navigation/appeals.*");
game:DefineFastString("PrivacySettingsDeepLinkPattern", "roblox.*://navigation/privacy_settings");
game:DefineFastString("AppPermissionsSettingsDeepLinkPattern", "roblox.*://navigation/app_permissions_settings");
game:DefineFastString("ScreentimeSettingsDeepLinkPattern", "roblox.*://navigation/screentime_subsettings");
game:DefineFastString("CommunicationSettingsDeepLinkPattern", "roblox.*://navigation/communication_subsettings");
game:DefineFastString("BlockedUsersSettingsDeepLinkPattern", "roblox.*://navigation/blocked_users_subsettings");
game:DefineFastString("BlockedExpSettingsDeepLinkPattern", "roblox.*://navigation/blocked_experiences_subsettings");
game:DefineFastString("ExperienceChatSettingsDeepLinkPattern", "roblox.*://navigation/experience_chat_subsettings");
game:DefineFastString("PartySettingsDeepLinkPattern", "roblox.*://navigation/party_subsettings");
game:DefineFastString("VoiceSettingsDeepLinkPattern", "roblox.*://navigation/voice_subsettings");
game:DefineFastString("TradingInventorySettingsDeepLinkPattern", "roblox.*://navigation/trading_inventory_subsettings");
game:DefineFastString("PrivateServerSettingsDeepLinkPattern", "roblox.*://navigation/private_server_subsettings");
game:DefineFastString("FriendsContactsSettingsDeepLinkPattern", "roblox.*://navigation/friends_contacts_subsettings");
game:DefineFastString("VisibilitySettingsDeepLinkPattern", "roblox.*://navigation/visibility_subsettings");
game:DefineFastString("ParentalControlsDeepLinkPattern", "roblox.*://navigation/parental_controls");
game:DefineFastString("AccountInfoDeepLinkPattern", "roblox.*://navigation/account_info");
game:DefineFastString("SpendingSettingsDeepLinkPattern", "roblox.*://navigation/spending_settings");
game:DefineFastString("ExternalWebUrlDeepLinkPattern", "roblox.*://navigation/external_web_link.*");
game:DefineFastString("SecurityAlertDeepLinkPattern", "roblox.*://navigation/security_alert.*");
game:DefineFastString("ExperienceSortDeepLinkPattern", "roblox.*://navigation/experience_sort.*");
game:DefineFastString("SquadLobbyDeepLinkPattern", "roblox.*://navigation/party.*");
game:DefineFastString("EnterAppFromLockScreenWidget", "roblox.*://open/lock_screen_widget");
game:DefineFastString("DevicePreferencesDeepLinkPattern", "roblox.*://navigation/device_preferences");
game:DefineFastString("FAEDeepLinkPattern", "roblox.*://navigation/fae.*");
game:DefineFastString("FAEUpsellOverlayDeepLinkPattern", "roblox.*://navigation/fae_upsell_overlay.*");
game:DefineFastString("SystemMessageDeepLinkPattern", "roblox.*://navigation/messages.*");
game:DefineFastString("LuaExtraHttpLinkBases", "");
game:DefineFastFlag("EnableExternalWebDeeplink", false);
game:DefineFastFlag("EnableJoinLinkWebDeepLink", false);
local v70 = string.split(game:GetFastString("LuaExtraHttpLinkBases"), ",");
local v71 = {};
local v72 = {
    notifstream = l_UpsellEntrySurfaceType_0.NotifStream, 
    notifpush = l_UpsellEntrySurfaceType_0.NotifPush
};
local function _(v73, v74) --[[ Line: 184 ]] --[[ Name: addMapping ]]
    -- upvalues: v71 (copy), l_default_0 (copy)
    table.insert(v71, {
        v73, 
        v74
    });
    v73 = v73:gsub("%%", "\\");
    l_default_0:registerURL(v73);
end;
local function v86(v76, v77) --[[ Line: 192 ]] --[[ Name: addHttpMapping ]]
    -- upvalues: v22 (copy), v71 (copy), l_default_0 (copy), v70 (copy)
    for _, v79 in pairs({
        "www", 
        "web", 
        ""
    }) do
        local v80 = v22.new(v79);
        local v81 = v22.new(v79, {
            secure = false
        });
        local v82 = v80 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. v76;
        table.insert(v71, {
            v82, 
            v77
        });
        v82 = v82:gsub("%%", "\\");
        l_default_0:registerURL(v82);
        v82 = v81 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. v76;
        table.insert(v71, {
            v82, 
            v77
        });
        v82 = v82:gsub("%%", "\\");
        l_default_0:registerURL(v82);
    end;
    for _, v84 in ipairs(v70) do
        local v85 = v84 .. v76;
        table.insert(v71, {
            v85, 
            v77
        });
        v85 = v85:gsub("%%", "\\");
        l_default_0:registerURL(v85);
    end;
end;
local function v92(v87) --[[ Line: 207 ]] --[[ Name: buildHistoryFromRoute ]]
    local v88 = {};
    for v89 = 1, #v87 do
        local v90 = {};
        for v91 = 1, v89 do
            table.insert(v90, v87[v91]);
        end;
        table.insert(v88, v90);
    end;
    return v88;
end;
local l_game_FastString_0 = game:GetFastString("GamesPageDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_0, 
    function() --[[ Line: 219 ]]
        -- upvalues: v10 (copy)
        return {
            {
                {
                    name = v10.Games
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_0:gsub("%%", "\\")));
l_game_FastString_0 = game:GetFastString("HomePageDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_0, 
    function() --[[ Line: 223 ]]
        -- upvalues: v10 (copy)
        return {
            {
                {
                    name = v10.Home
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_0:gsub("%%", "\\")));
l_game_FastString_0 = game:GetFastString("AvatarClothingSortingView");
table.insert(v71, {
    l_game_FastString_0, 
    function() --[[ Line: 227 ]]
        -- upvalues: l_AvatarScreen_0 (copy)
        return {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }, 
                {
                    name = l_AvatarScreen_0.LayeredClothingSort
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_0:gsub("%%", "\\")));
if v57 then
    l_game_FastString_0 = game:GetFastString("AvatarProfilePictureEditor");
    table.insert(v71, {
        l_game_FastString_0, 
        function() --[[ Line: 238 ]]
            -- upvalues: l_AvatarScreen_0 (copy)
            return {
                {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }, 
                    {
                        name = l_AvatarScreen_0.Catalog
                    }, 
                    {
                        name = l_AvatarScreen_0.ProfilePictureEditorEmotes
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_0:gsub("%%", "\\")));
end;
l_game_FastString_0 = game:GetFastString("AvatarDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_0, 
    function(v94) --[[ Line: 249 ]]
        -- upvalues: l_AvatarScreen_0 (copy), v26 (copy), v25 (copy), v14 (copy), v92 (copy)
        local v95 = {
            {
                name = l_AvatarScreen_0.AvatarExperienceLandingPage
            }, 
            {
                name = l_AvatarScreen_0.AvatarEditor
            }
        };
        if v94.itemtype == "character" then
            local v96, v97 = v26.findAvatarEditorCategory(v25.CharacterKey, v25.PurchasedCharacterKey);
            local v98 = {
                itemId = v94.itemid, 
                category = v96, 
                subcategory = v97
            };
            table.insert(v95, {
                name = l_AvatarScreen_0.OutfitDetails, 
                extraProps = v98
            });
        elseif v94.itemtype == "asset" then
            local v99, v100 = v26.getCategoryIndicesFromAssetType(v94.itemsubtype);
            local v101 = {
                itemId = v94.itemid, 
                itemType = v14.ItemType.Asset, 
                mountAsFullView = true, 
                category = v99, 
                subcategory = v100, 
                opaquePage = l_AvatarScreen_0.AvatarEditor
            };
            table.insert(v95, {
                name = l_AvatarScreen_0.ItemDetails, 
                extraProps = v101
            });
        end;
        return (v92(v95));
    end
});
l_default_0:registerURL((l_game_FastString_0:gsub("%%", "\\")));
v86(game:GetFastString("AvatarHttpPattern"), function(_, v103) --[[ Line: 290 ]]
    -- upvalues: v5 (copy), l_AvatarScreen_0 (copy)
    return v5.List.join(v103.history, {
        {
            {
                name = l_AvatarScreen_0.AvatarExperienceLandingPage
            }
        }, 
        {
            {
                name = l_AvatarScreen_0.AvatarExperienceLandingPage
            }, 
            {
                name = l_AvatarScreen_0.AvatarEditor
            }
        }
    });
end);
local l_game_FastString_1 = game:GetFastString("MorePageDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_1, 
    function() --[[ Line: 303 ]]
        -- upvalues: v64 (copy), v10 (copy)
        return {
            {
                {
                    name = if v64 then v10.Home else v10.More
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_1:gsub("%%", "\\")));
l_game_FastString_1 = function(v105, v106) --[[ Line: 307 ]] --[[ Name: subSettingsMapping ]]
    -- upvalues: v64 (copy), v10 (copy), v21 (copy)
    return {
        {
            {
                name = if v64 then v10.Home else v10.More
            }
        }, 
        {
            {
                name = if v64 then v10.Home else v10.More
            }, 
            {
                name = v10.Settings
            }
        }, 
        {
            {
                name = if v64 then v10.Home else v10.More
            }, 
            {
                name = v10.Settings
            }, 
            {
                name = v10.SettingsSubPage, 
                detail = v105, 
                extraProps = {
                    titleKey = v106, 
                    transitionAnimation = v21.None
                }
            }
        }
    };
end;
local l_game_FastString_2 = game:GetFastString("NotificationSettingsDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_2, 
    function() --[[ Line: 331 ]]
        -- upvalues: v23 (copy), l_game_FastString_1 (copy)
        local v108 = v23.static.settings.notifications();
        return (l_game_FastString_1(v108, "Feature.AccountSettings.Heading.Tab.Notifications"));
    end
});
l_default_0:registerURL((l_game_FastString_2:gsub("%%", "\\")));
if l_FFlagEnableNotificationsDeeplink_0 then
    l_game_FastString_2 = game:GetFastString("NotificationsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_2, 
        function() --[[ Line: 337 ]]
            -- upvalues: l_StreamNotificationStore_0 (copy)
            l_StreamNotificationStore_0.setStreamPresented(true);
            return nil;
        end
    });
    l_default_0:registerURL((l_game_FastString_2:gsub("%%", "\\")));
end;
l_game_FastString_2 = function(v109) --[[ Line: 344 ]] --[[ Name: getChatEntryPointEnum ]]
    -- upvalues: l_ChatEntryPointNames_0 (copy)
    if type(v109) ~= "string" then
        return l_ChatEntryPointNames_0.Unknown;
    else
        for v110, v111 in pairs(l_ChatEntryPointNames_0) do
            if string.lower(v110) == string.lower(v109) then
                return v111;
            end;
        end;
        return l_ChatEntryPointNames_0.Unknown;
    end;
end;
local l_game_FastString_3 = game:GetFastString("RoactChatDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_3, 
    function(v113, v114) --[[ Line: 359 ]]
        -- upvalues: l_game_FastString_2 (copy), l_CreateConversation_0 (copy), v10 (copy)
        local v115 = {
            entryPoint = l_game_FastString_2(v113.entrypoint)
        };
        if v113.chatid == nil and v113.userid ~= nil then
            return l_CreateConversation_0(v114.network, "one_to_one", {
                v113.userid
            }):andThen(function(v116) --[[ Line: 365 ]]
                -- upvalues: v10 (ref), v115 (copy)
                local v117 = tostring(v116.responseBody.conversations[1].id);
                return {
                    {
                        {
                            name = v10.Chat, 
                            detail = v117, 
                            extraProps = v115
                        }
                    }
                };
            end):catch(function() --[[ Line: 376 ]]
                -- upvalues: v10 (ref), v115 (copy)
                return {
                    {
                        {
                            name = v10.Chat, 
                            extraProps = v115
                        }
                    }
                };
            end);
        else
            return {
                {
                    {
                        name = v10.Chat, 
                        detail = v113.chatid, 
                        extraProps = v115
                    }
                }
            };
        end;
    end
});
l_default_0:registerURL((l_game_FastString_3:gsub("%%", "\\")));
l_game_FastString_3 = game:GetFastString("GameDetailsDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_3, 
    function(v118) --[[ Line: 394 ]]
        -- upvalues: v10 (copy), v52 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v16 (copy), v59 (copy), l_HardwareSafeAreaInsets_0 (copy), l_Workspace_0 (copy), l_UseGameDetailsPeekView_0 (copy), v12 (copy)
        local l_GameDetail_0 = v10.GameDetail;
        if v52() then
            if l_FFlagEnableShareLinksInGameDetailEvent_0 then
                v16(v118.gameid, "GameDetailsDeeplink", {});
            else
                v16(v118.gameid, "GameDetailsDeeplink");
            end;
        end;
        if v118.homeroot then
            local v120 = nil;
            v120 = if v59() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else l_Workspace_0.CurrentCamera and l_Workspace_0.CurrentCamera.ViewportSize or Vector2.zero;
            l_GameDetail_0 = if v120.Y > v120.X and l_UseGameDetailsPeekView_0() then v10.GameDetail else v10.ExperienceDetail;
            return {
                {
                    {
                        name = v10.Home
                    }
                }, 
                {
                    {
                        name = v10.Home
                    }, 
                    {
                        name = l_GameDetail_0, 
                        detail = v12.isNotNil(v118.gameid, "gameId"), 
                        extraProps = {
                            mountAsFullView = false, 
                            mountAnimation = true
                        }
                    }
                }
            };
        else
            return {
                {
                    {
                        name = v10.Games
                    }
                }, 
                {
                    {
                        name = v10.Games
                    }, 
                    {
                        name = l_GameDetail_0, 
                        detail = v12.isNotNil(v118.gameid, "gameId"), 
                        extraProps = {
                            mountAsFullView = true, 
                            mountAnimation = false
                        }
                    }
                }
            };
        end;
    end
});
l_default_0:registerURL((l_game_FastString_3:gsub("%%", "\\")));
v86(game:GetFastString("GameDetailsHttpPattern"), function(v121, v122, v123) --[[ Line: 455 ]]
    -- upvalues: v20 (copy), l_ExperienceService_0 (copy), v10 (copy), l_GamesMultigetPlaceDetails_0 (copy), v52 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v16 (copy)
    if v122.privateserverlinkcode ~= nil then
        v123.analyticsImpls.shareLinksAnalytics.openAppViaShareLink({
            placeId = v121, 
            linkCode = v122.privateserverlinkcode, 
            linkType = v20.LongPrivateServerLink
        });
        l_ExperienceService_0:LaunchExperience({
            placeId = if type(v121) == "number" then v121 else tonumber(v121), 
            linkCode = v122.privateserverlinkcode
        });
        return nil;
    else
        local l_GameDetail_1 = v10.GameDetail;
        return l_GamesMultigetPlaceDetails_0(v123.network, v121):andThen(function(v125) --[[ Line: 473 ]]
            -- upvalues: v52 (ref), l_FFlagEnableShareLinksInGameDetailEvent_0 (ref), v16 (ref), v10 (ref), l_GameDetail_1 (copy)
            local v126 = tostring(v125.responseBody[1].universeId);
            if v52() then
                if l_FFlagEnableShareLinksInGameDetailEvent_0 then
                    v16(v126, "GameDetailsHTTPDeepLink", {});
                else
                    v16(v126, "GameDetailsHTTPDeepLink");
                end;
            end;
            return {
                {
                    {
                        name = v10.Games
                    }
                }, 
                {
                    {
                        name = v10.Games
                    }, 
                    {
                        name = l_GameDetail_1, 
                        detail = v126, 
                        extraProps = {
                            mountAsFullView = true, 
                            mountAnimation = false
                        }
                    }
                }
            };
        end);
    end;
end);
v86(game:GetFastString("GameDetailsReferralHttpPattern"), function(v127, v128) --[[ Line: 504 ]]
    -- upvalues: v12 (copy), v10 (copy), l_GamesMultigetPlaceDetails_0 (copy), v52 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v16 (copy)
    local v129 = v12.isNotNil(v127.placeid, "placeid");
    local l_GameDetail_2 = v10.GameDetail;
    return l_GamesMultigetPlaceDetails_0(v128.network, v129):andThen(function(v131) --[[ Line: 508 ]]
        -- upvalues: v52 (ref), l_FFlagEnableShareLinksInGameDetailEvent_0 (ref), v16 (ref), v10 (ref), l_GameDetail_2 (copy)
        local v132 = tostring(v131.responseBody[1].universeId);
        if v52() then
            if l_FFlagEnableShareLinksInGameDetailEvent_0 then
                v16(v132, "GameDetailsHTTPReferralDeepLink", {});
            else
                v16(v132, "GameDetailsHTTPReferralDeepLink");
            end;
        end;
        return {
            {
                {
                    name = v10.Games
                }
            }, 
            {
                {
                    name = v10.Games
                }, 
                {
                    name = l_GameDetail_2, 
                    detail = v132, 
                    extraProps = {
                        mountAsFullView = true, 
                        mountAnimation = false
                    }
                }
            }
        };
    end);
end);
local l_game_FastString_4 = game:GetFastString("ProfileCardDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_4, 
    function(v134) --[[ Line: 539 ]]
        -- upvalues: v10 (copy), v19 (copy)
        local v135 = v134.userid or "";
        return {
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.ProfilePlatform, 
                    detail = v135, 
                    extraProps = {
                        source = v19.Sources.ProfileDeepLink
                    }
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
if l_FFlagTCParentChildAutoUpgrade_0 then
    l_game_FastString_4 = game:GetFastString("ProfileTrustedFriendsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_4, 
        function(v136, _) --[[ Line: 557 ]]
            -- upvalues: v10 (copy), v19 (copy), l_FFlagTCUnifyNavigationEntry_0 (copy)
            local v138 = v136.userid or "";
            return {
                {
                    {
                        name = v10.Home
                    }, 
                    {
                        name = v10.ProfilePlatform, 
                        detail = v138, 
                        extraProps = {
                            source = v19.Sources.ProfileDeepLink
                        }
                    }, 
                    {
                        name = v10.TrustedContactsModal, 
                        props = if l_FFlagTCUnifyNavigationEntry_0 then {
                            userId = v138, 
                            source = "Deeplink_Profile_TrustedFriends"
                        } else nil, 
                        userId = if l_FFlagTCUnifyNavigationEntry_0 then nil else v138, 
                        source = if l_FFlagTCUnifyNavigationEntry_0 then nil else "Deeplink_Profile_TrustedFriends"
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
end;
l_game_FastString_4 = game:GetFastString("ProfileDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_4, 
    function(v139, v140) --[[ Line: 586 ]]
        -- upvalues: v12 (copy), v23 (copy), v10 (copy), v21 (copy)
        local v141 = v12.isNotNil(v139.userid, "userId");
        local l_friendshipsourcetype_0 = v139.friendshipsourcetype;
        local v143 = v23.user.profile({
            userId = v141, 
            sourceType = l_friendshipsourcetype_0
        });
        if l_friendshipsourcetype_0 == "profileshare" then
            v140.analyticsImpls.socialProfileShareAnalytics.inviteePageLoad(v141, "playerProfile");
        end;
        return {
            {
                {
                    name = v10.Home
                }
            }, 
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.GenericWebPage, 
                    detail = v143, 
                    extraProps = {
                        titleKey = "CommonUI.Features.Label.Profile", 
                        transitionAnimation = v21.None
                    }
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = game:GetFastString("GroupsDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_4, 
    function(v144) --[[ Line: 617 ]]
        -- upvalues: v23 (copy), v12 (copy), l_FFlagLuaAppForumsDeeplinkFix_0 (copy), v10 (copy), l_GetFFlagUseCommunitiesTranslation_0 (copy), v21 (copy)
        local v145 = nil;
        v145 = if v144.forumcategoryid and v144.forumcategoryid ~= "" and v144.forumpostid and v144.forumpostid ~= "" and v144.forumcommentid and v144.forumcommentid ~= "" then v23.user.forumComment({
            groupId = v12.isNotNil(v144.groupid, "groupId"), 
            categoryId = if l_FFlagLuaAppForumsDeeplinkFix_0 then "category-" .. v12.isNotNil(v144.forumcategoryid, "categoryId") else v12.isNotNil(v144.forumcategoryid, "categoryId"), 
            postId = if l_FFlagLuaAppForumsDeeplinkFix_0 then "post-" .. v12.isNotNil(v144.forumpostid, "postId") else v12.isNotNil(v144.forumpostid, "postId"), 
            commentId = v12.isNotNil(v144.forumcommentid, "commentId")
        }) else v23.user.group({
            groupId = v12.isNotNil(v144.groupid, "groupId")
        });
        return {
            {
                {
                    name = v10.Home
                }
            }, 
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.GenericWebPage, 
                    detail = v145, 
                    extraProps = {
                        titleKey = l_GetFFlagUseCommunitiesTranslation_0() and "CommonUI.Features.Label.Groups" or "CommonUI.Features.Label.sGroups", 
                        transitionAnimation = v21.None
                    }
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = game:GetFastString("ContactsDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_4, 
    function(v146, _) --[[ Line: 662 ]]
        -- upvalues: v10 (copy), l_Constants_0 (copy), l_FFlagCiDeprecateFindFriendsModal_0 (copy), l_contactImporterModalInfo_0 (copy), l_AppStorageService_0 (copy), l_LocalPlayer_0 (copy)
        local v148 = nil;
        v148 = if v146.contactid and v146.contactid ~= "" then {
            name = v10.ProfilePlatform, 
            detail = v146.contactid, 
            extraProps = {
                profileType = l_Constants_0.CONTACT
            }
        } else {
            name = if l_FFlagCiDeprecateFindFriendsModal_0 then v10.ContactImporter else if l_contactImporterModalInfo_0:isUserOptedInLocalStorage(l_AppStorageService_0, if l_LocalPlayer_0 and l_LocalPlayer_0.UserId then tostring(l_LocalPlayer_0.UserId) else "") then v10.ContactsList else v10.ContactImporter, 
            detail = "", 
            extraProps = {
                isPhoneVerified = true, 
                entryPoint = if l_FFlagCiDeprecateFindFriendsModal_0 then v146.entryPoint else nil
            }
        };
        return {
            if l_FFlagCiDeprecateFindFriendsModal_0 then {
                {
                    name = v10.Home
                }, 
                v148
            } else {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.AddFriendsPage
                }, 
                v148
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
v86(game:GetFastString("StaticShareLinkHttpPattern"), function(v149, v150, v151, v152) --[[ Line: 710 ]]
    -- upvalues: v36 (copy), v5 (copy)
    return v36(v149, v150, v5.Dictionary.join(v151, {
        isViaAppsFlyer = false
    }), v152);
end);
l_game_FastString_4 = game:GetFastString("StaticShareLinkDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_4, 
    function(v153, v154, v155, v156) --[[ Line: 717 ]]
        -- upvalues: v36 (copy), v5 (copy)
        return v36(v153, v154, v5.Dictionary.join(v155, {
            isViaAppsFlyer = true
        }), v156);
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = game:GetFastString("ShareLinkDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_4, 
    function(v157, v158) --[[ Line: 722 ]]
        -- upvalues: v35 (copy), v5 (copy)
        return v35(v5.Dictionary.join(v157, {
            isViaAppsFlyer = true
        }), v158);
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = function(v159, v160) --[[ Line: 726 ]]
    -- upvalues: v35 (copy), v5 (copy)
    return v35(v5.Dictionary.join(v159, {
        isViaAppsFlyer = false
    }), v160);
end;
v86(game:GetFastString("ShareLinkHttpPattern"), l_game_FastString_4);
v86(game:GetFastString("ShortShareLinkHttpPattern"), l_game_FastString_4);
if game:GetFastFlag("EnableJoinLinkWebDeepLink") then
    v86(game:GetFastString("JoinLinkHttpPattern"), function(v161, v162, v163) --[[ Line: 734 ]]
        -- upvalues: v37 (copy)
        return v37(v161, v162, v163);
    end);
end;
local l_game_FastString_5 = game:GetFastString("CatalogEquipDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_5, 
    function(v165) --[[ Line: 739 ]]
        -- upvalues: l_AvatarScreen_0 (copy)
        local v166 = {
            itemId = v165.itemid, 
            itemType = v165.itemtype, 
            wasItemEquipped = false, 
            fetchItemFailed = false
        };
        return {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }
            }, 
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog, 
                    extraProps = v166
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
if v56 then
    l_game_FastString_5 = game:GetFastString("CatalogSearchDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_5, 
        function(v167) --[[ Line: 762 ]]
            -- upvalues: l_AvatarScreen_0 (copy), l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (copy)
            local v168 = {};
            local v169 = {
                {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }
                }
            };
            v168.creatorName = v167.creatorname;
            v168.minPrice = v167.minprice;
            v168.maxPrice = v167.maxprice;
            v168.salesTypeFilter = v167.salestypefilter;
            v168.includeNotForSale = v167.includenotforsale;
            v168.sortType = v167.sorttype;
            v168.sortAggregation = v167.sortaggregation;
            v168.category = v167.category;
            v168.subcategory = v167.subcategory;
            if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then
                v168.taxonomy = v167.taxonomy;
            end;
            v168.keyword = v167.keyword;
            v168.topics = v167.topics;
            v168.wearTimeFilter = v167.wearTimeFilter;
            if v168.keyword then
                table.insert(v169, {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }, 
                    {
                        name = l_AvatarScreen_0.CatalogSearch, 
                        extraProps = v168
                    }
                });
                return v169;
            else
                table.insert(v169, {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }, 
                    {
                        name = l_AvatarScreen_0.Catalog, 
                        extraProps = v168
                    }
                });
                return v169;
            end;
        end
    });
    l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
end;
l_game_FastString_5 = game:GetFastString("ExperienceSortDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_5, 
    function(v170, ...) --[[ Line: 809 ]]
        -- upvalues: v32 (copy), v10 (copy), l_FFlagLuaAppSortDeeplinkFix_0 (copy)
        if not v170.sortId then
            return;
        else
            local v171, v172 = v32(v170.sortId);
            return {
                {
                    {
                        name = v10.Home
                    }, 
                    {
                        name = if l_FFlagLuaAppSortDeeplinkFix_0 then v10.DeeplinkGamesList else v10.GamesList, 
                        detail = v171, 
                        extraProps = {
                            sortName = v171, 
                            pageContext = if l_FFlagLuaAppSortDeeplinkFix_0 then nil else "Deeplink", 
                            isOmni = v172, 
                            sortIndex = not l_FFlagLuaAppSortDeeplinkFix_0 and v172 and 1 or nil
                        }
                    }
                }
            };
        end;
    end
});
l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
l_game_FastString_5 = game:GetFastString("CatalogDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_5, 
    function() --[[ Line: 833 ]]
        -- upvalues: l_AvatarScreen_0 (copy)
        return {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }
            }, 
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
l_game_FastString_5 = game:GetFastString("ItemDetailsDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_5, 
    function(v173) --[[ Line: 845 ]]
        -- upvalues: v12 (copy), v14 (copy), l_AvatarScreen_0 (copy), v55 (copy)
        local v174 = v12.isNotNil(v173.itemid, "itemId");
        local v175 = v12.isNotNil(v173.itemtype, "itemType");
        local v176 = nil;
        for _, v178 in pairs(v14.ItemType) do
            if string.lower(v175) == string.lower(v178) then
                v176 = v178;
                break;
            end;
        end;
        local v179 = {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }
            }, 
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }
            }
        };
        local v180 = tostring(v176) .. tostring(v174);
        local l_ItemDetails_0 = l_AvatarScreen_0.ItemDetails;
        if v55 and v176 == v14.ItemType.Look then
            l_ItemDetails_0 = l_AvatarScreen_0.LookDetails;
        end;
        local v182 = {
            name = l_ItemDetails_0, 
            detail = v180, 
            extraProps = {
                itemId = v174, 
                itemType = v176, 
                mountAsFullView = true, 
                mountAnimation = false
            }
        };
        if v176 ~= nil then
            table.insert(v179, {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }, 
                v182
            });
        end;
        return v179;
    end
});
l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
v86(game:GetFastString("ItemDetailsHttpPattern"), function(v183, _, v185) --[[ Line: 896 ]]
    -- upvalues: v14 (copy), v5 (copy), l_AvatarScreen_0 (copy)
    local l_Asset_0 = v14.ItemType.Asset;
    local v187 = l_Asset_0 .. v183;
    return v5.List.join(v185.history, {
        {
            {
                name = l_AvatarScreen_0.AvatarExperienceLandingPage
            }, 
            {
                name = l_AvatarScreen_0.Catalog
            }
        }
    }, {
        {
            {
                name = l_AvatarScreen_0.AvatarExperienceLandingPage
            }, 
            {
                name = l_AvatarScreen_0.Catalog
            }, 
            {
                name = l_AvatarScreen_0.ItemDetails, 
                detail = v187, 
                extraProps = {
                    itemId = v183, 
                    itemType = l_Asset_0, 
                    mountAsFullView = true, 
                    mountAnimation = false
                }
            }
        }
    });
end);
if v54 then
    v86(game:GetFastString("BundleItemDetailsHttpPattern"), function(v188, _, v190) --[[ Line: 931 ]]
        -- upvalues: v14 (copy), v5 (copy), l_AvatarScreen_0 (copy)
        local l_Bundle_0 = v14.ItemType.Bundle;
        local v192 = l_Bundle_0 .. v188;
        local l_history_0 = v190.history;
        return v5.List.join(l_history_0, {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }, 
                {
                    name = l_AvatarScreen_0.ItemDetails, 
                    detail = v192, 
                    extraProps = {
                        itemId = v188, 
                        itemType = l_Bundle_0, 
                        mountAsFullView = true, 
                        mountAnimation = false
                    }
                }
            }
        });
    end);
end;
if v55 then
    v86(game:GetFastString("LookItemDetailsHttpPattern"), function(v194, _, v196) --[[ Line: 958 ]]
        -- upvalues: v14 (copy), v5 (copy), l_AvatarScreen_0 (copy)
        local v197 = v14.ItemType.Look .. v194;
        local l_history_1 = v196.history;
        return v5.List.join(l_history_1, {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }, 
                {
                    name = l_AvatarScreen_0.LookDetails, 
                    detail = v197, 
                    extraProps = {
                        itemId = v194, 
                        mountAsFullView = true
                    }
                }
            }
        });
    end);
end;
if v46 then
    local l_game_FastString_6 = game:GetFastString("ItemRedemptionDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_6, 
        function(v200) --[[ Line: 984 ]]
            -- upvalues: v12 (copy), v14 (copy), l_AvatarScreen_0 (copy)
            local v201 = v12.isNotNil(v200.itemid, "itemId");
            local v202 = v12.isNotNil(v200.itemtype, "itemType");
            local v203 = nil;
            for _, v205 in pairs(v14.ItemType) do
                if string.lower(v202) == string.lower(v205) then
                    v203 = v205;
                    break;
                end;
            end;
            local v206 = {
                {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }
                }, 
                {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }, 
                    {
                        name = l_AvatarScreen_0.Catalog
                    }
                }
            };
            local v207 = tostring(v203) .. tostring(v201);
            local v208 = {
                name = l_AvatarScreen_0.ItemDetails, 
                detail = v207, 
                extraProps = {
                    itemId = v201, 
                    itemType = v203, 
                    mountAsFullView = true, 
                    mountAnimation = false, 
                    redeemQRCodeItem = true
                }
            };
            if v203 ~= nil then
                table.insert(v206, {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }, 
                    {
                        name = l_AvatarScreen_0.Catalog
                    }, 
                    v208
                });
            end;
            return v206;
        end
    });
    l_default_0:registerURL((l_game_FastString_6:gsub("%%", "\\")));
end;
v86(game:GetFastString("CatalogHttpPattern"), function(v209, v210) --[[ Line: 1032 ]]
    -- upvalues: v61 (copy), v5 (copy), l_AvatarScreen_0 (copy), v27 (copy)
    if v61 then
        return v5.List.join(v210.history, {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog, 
                    extraProps = v27.convertCatalogSearchParamsV1ToV2(v209)
                }
            }
        });
    else
        return v5.List.join(v210.history, {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }
            }
        });
    end;
end);
local l_game_FastString_7 = game:GetFastString("FriendsPageDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_7, 
    function() --[[ Line: 1056 ]]
        -- upvalues: v10 (copy)
        return {
            {
                {
                    name = v10.Home
                }
            }, 
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.ViewFriends
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
if v49 then
    l_game_FastString_7 = game:GetFastString("BuyRobuxDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_7, 
        function(v212) --[[ Line: 1069 ]]
            -- upvalues: v10 (copy)
            local v213 = {};
            if v212.analyticid and v212.analyticid ~= "" then
                v213.analyticId = v212.analyticid;
            end;
            if v212.product_id and v212.product_id ~= "" then
                v213.productId = v212.product_id;
            end;
            return {
                {
                    {
                        name = v10.Home
                    }
                }, 
                {
                    {
                        name = v10.Home
                    }, 
                    {
                        name = v10.PurchaseRobux, 
                        extraProps = if next(v213) then v213 else nil
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if v48() then
    l_game_FastString_7 = game:GetFastString("GiftCardsPageDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_7, 
        function() --[[ Line: 1093 ]]
            -- upvalues: v10 (copy), v23 (copy), v21 (copy)
            return {
                {
                    {
                        name = v10.Home
                    }
                }, 
                {
                    {
                        name = v10.Home
                    }, 
                    {
                        name = v10.GenericWebPage, 
                        detail = v23.static.giftCards(), 
                        extraProps = {
                            titleKey = "CommonUI.Features.Label.GiftCards", 
                            transitionAnimation = v21.None
                        }
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
l_game_FastString_7 = function(v214, _) --[[ Line: 1116 ]] --[[ Name: handleCurrencyTransferLink ]]
    -- upvalues: v10 (copy)
    local l_direction_0 = v214.direction;
    if not l_direction_0 or l_direction_0 ~= "send" and l_direction_0 ~= "receive" then
        return nil;
    else
        if l_direction_0 == "send" then
            if not v214.userid or v214.userid == "" then
                return nil;
            end;
        elseif not v214.transferrequestid or v214.transferrequestid == "" then
            return nil;
        end;
        local v217 = {
            direction = l_direction_0
        };
        if l_direction_0 == "send" then
            v217.recipientUserId = v214.userid;
            if v214.transferorigination then
                v217.transferOrigination = v214.transferorigination;
            end;
        else
            v217.transferId = v214.transferrequestid;
        end;
        return {
            {
                {
                    name = v10.Home
                }
            }, 
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.TransferRobuxFlow, 
                    extraProps = v217
                }
            }
        };
    end;
end;
if l_FFlagEnableCurrencyTransferDeepLink_0 then
    local l_game_FastString_8 = game:GetFastString("CurrencyTransferDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_8, 
        l_game_FastString_7
    });
    l_default_0:registerURL((l_game_FastString_8:gsub("%%", "\\")));
end;
if v51() then
    local l_game_FastString_9 = game:GetFastString("SystemMessageDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_9, 
        function() --[[ Line: 1161 ]]
            -- upvalues: v10 (copy), v23 (copy), v21 (copy)
            return {
                {
                    {
                        name = v10.Home
                    }
                }, 
                {
                    {
                        name = v10.Home
                    }, 
                    {
                        name = v10.GenericWebPage, 
                        detail = v23.static.messages(), 
                        extraProps = {
                            titleKey = "CommonUI.Features.Label.Messages", 
                            transitionAnimation = v21.None
                        }
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_9:gsub("%%", "\\")));
end;
if game:GetFastFlag("EnableExternalWebDeeplink") then
    local l_game_FastString_10 = game:GetFastString("ExternalWebUrlDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_10, 
        function(v221) --[[ Line: 1182 ]]
            -- upvalues: v31 (copy), v10 (copy), v21 (copy)
            local l_domain_0 = v221.domain;
            local v223 = nil;
            local v224 = nil;
            if l_domain_0 == v31.ExternalWebDomainEnum.Zendesk then
                v223 = v31.getZendeskUrl(v221);
                v224 = v31.getZendeskWebViewTitleKey(v221.type);
            end;
            if not v223 then
                return nil;
            else
                return {
                    {
                        {
                            name = v10.Home
                        }
                    }, 
                    {
                        {
                            name = v10.Home
                        }, 
                        {
                            name = v10.GenericWebPage, 
                            detail = v223, 
                            extraProps = {
                                titleKey = v224, 
                                transitionAnimation = v21.None
                            }
                        }
                    }
                };
            end;
        end
    });
    l_default_0:registerURL((l_game_FastString_10:gsub("%%", "\\")));
end;
if v47() then
    local l_game_FastString_11 = game:GetFastString("CrossDeviceLoginDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_11, 
        function(v226) --[[ Line: 1217 ]]
            -- upvalues: v12 (copy), v64 (copy), v10 (copy)
            local v227 = v12.isNotNil(v226.code, "code");
            local l_source_0 = v226.source;
            return {
                {
                    {
                        name = if v64 then v10.Home else v10.More
                    }, 
                    {
                        name = v10.CrossDeviceLogin, 
                        extraProps = {
                            code = v227, 
                            source = l_source_0
                        }
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_11:gsub("%%", "\\")));
end;
local l_game_FastString_12 = game:GetFastString("EventDetailsPageDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_12, 
    function(v230) --[[ Line: 1236 ]]
        -- upvalues: v10 (copy), v12 (copy)
        return {
            {
                {
                    name = v10.Home
                }
            }, 
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.EventDetails, 
                    detail = v12.isNotNil(v230.eventid, "eventid")
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
l_game_FastString_12 = game:GetFastString("AppealsPortalDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_12, 
    function(v231) --[[ Line: 1251 ]]
        -- upvalues: v64 (copy), v10 (copy), v23 (copy)
        return {
            {
                {
                    name = if v64 then v10.Home else v10.More
                }, 
                {
                    name = v10.GenericWebPage, 
                    detail = if v231.vid then v23.static.appealsPortal.violation({
                        id = v231.vid, 
                        source = "deeplink"
                    }) else v23.static.appealsPortal.main({
                        source = "deeplink"
                    }), 
                    extraProps = {
                        titleKey = "Feature.AppealsPortal.Label.ReportAndAppeals"
                    }
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
if v39 then
    l_game_FastString_12 = game:GetFastString("PrivacySettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1272 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v232 = v23.static.settings.privacy();
            return (l_game_FastString_1(v232, "Feature.AccountSettings.Heading.Tab.Privacy"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
end;
if v43 then
    l_game_FastString_12 = game:GetFastString("AppPermissionsSettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1279 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v233 = v23.static.settings.appPermissions();
            return (l_game_FastString_1(v233, "Feature.AccountSettings.Heading.Tab.AppPermissions"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("ScreentimeSettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1284 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v234 = v23.static.settings.screentimeSettings();
            return (l_game_FastString_1(v234, "Feature.AccountSettings.Heading.ScreenTime"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("CommunicationSettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1288 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v235 = v23.static.settings.communicationSettings();
            return (l_game_FastString_1(v235, "Feature.AccountSettings.Heading.Communications"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("BlockedUsersSettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1293 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v236 = v23.static.settings.blockedUsersSettings();
            return (l_game_FastString_1(v236, "Feature.AccountSettings.Heading.BlockedUsersV2"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("BlockedExpSettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1298 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v237 = v23.static.settings.blockedExperiencesSettings();
            return (l_game_FastString_1(v237, "Feature.AccountSettings.Heading.BlockedExperiences"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("ExperienceChatSettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1303 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v238 = v23.static.settings.experienceChatSettings();
            return (l_game_FastString_1(v238, "Feature.AccountSettings.Heading.ExperienceChat"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("PartySettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1308 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v239 = v23.static.settings.partySettings();
            return (l_game_FastString_1(v239, "Feature.AccountSettings.Label.Party"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("VoiceSettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1313 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v240 = v23.static.settings.voiceSettings();
            return (l_game_FastString_1(v240, "Feature.AccountSettings.Heading.VoiceChat"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("TradingInventorySettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1318 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v241 = v23.static.settings.tradingInventorySettings();
            return (l_game_FastString_1(v241, "Feature.AccountSettings.Heading.TradingAndInventory"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("FriendsContactsSettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1323 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v242 = v23.static.settings.friendsContactsSettings();
            return (l_game_FastString_1(v242, "Feature.AccountSettings.Heading.FriendsAndContacts"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("PrivateServerSettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1328 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v243 = v23.static.settings.privateServerSettings();
            return (l_game_FastString_1(v243, "Feature.AccountSettings.Heading.PrivateServers"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("VisibilitySettingsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1333 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v244 = v23.static.settings.visibilitySettings();
            return (l_game_FastString_1(v244, "Feature.AccountSettings.Heading.Visibility"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
end;
if v40 then
    l_game_FastString_12 = game:GetFastString("ParentalControlsDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1340 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v245 = v23.static.settings.parentalControls();
            return (l_game_FastString_1(v245, "Feature.AccountSettings.Heading.Tab.ParentalControls"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
end;
if v41 then
    l_game_FastString_12 = game:GetFastString("AccountInfoDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1347 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v246 = v23.static.settings.account();
            return (l_game_FastString_1(v246, "Feature.AccountSettings.Heading.Tab.AccountInfo"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
end;
l_game_FastString_12 = game:GetFastString("SpendingSettingsDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_12, 
    function() --[[ Line: 1353 ]]
        -- upvalues: v23 (copy), l_game_FastString_1 (copy)
        local v247 = v23.static.settings.billing();
        return (l_game_FastString_1(v247, "Feature.AccountSettings.Heading.Tab.Billing"));
    end
});
l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
if v42 then
    l_game_FastString_12 = game:GetFastString("DevicePreferencesDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function() --[[ Line: 1359 ]]
            -- upvalues: v64 (copy), v10 (copy)
            return {
                {
                    {
                        name = if v64 then v10.Home else v10.More
                    }, 
                    {
                        name = v10.Settings
                    }, 
                    {
                        name = v10.Accessibility
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
end;
if l_GetFFlagEnableSecurityAlertDeeplink_0() then
    l_game_FastString_12 = game:GetFastString("SecurityAlertDeepLinkPattern");
    table.insert(v71, {
        l_game_FastString_12, 
        function(v248, _) --[[ Line: 1371 ]]
            -- upvalues: l_GetFFlagGenerateLinkWithChannel_0 (copy), v23 (copy), v10 (copy), v21 (copy)
            if v248.payload and v248.payload ~= "" and v248.username and v248.username ~= "" then
                local v250 = nil;
                v250 = if l_GetFFlagGenerateLinkWithChannel_0() then v23.static.securityAlertWithChannel({
                    payload = v248.payload, 
                    username = v248.username, 
                    channel = v248.channel or ""
                }) else v23.static.securityAlert({
                    payload = v248.payload, 
                    username = v248.username
                });
                return {
                    {
                        {
                            name = v10.Home
                        }
                    }, 
                    {
                        {
                            name = v10.Home
                        }, 
                        {
                            name = v10.SecurityAlertInfo, 
                            detail = v250, 
                            extraProps = {
                                transitionAnimation = v21.None
                            }
                        }
                    }
                };
            else
                return {
                    {
                        {
                            name = v10.Home
                        }
                    }
                };
            end;
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
end;
l_game_FastString_12 = game:GetFastString("SquadLobbyDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_12, 
    function(v251, _) --[[ Line: 1412 ]]
        -- upvalues: v12 (copy), v10 (copy), l_FFlagEnableSquadDeeplinkWithChatId_0 (copy)
        local v253 = v12.isNotNil(v251.partyid, "partyId");
        return {
            {
                {
                    name = v10.SquadLobby, 
                    detail = v253, 
                    extraProps = if l_FFlagEnableSquadDeeplinkWithChatId_0 then {
                        conversationId = v251.chatid
                    } else nil
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
l_game_FastString_12 = game:GetFastString("FAEUpsellOverlayDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_12, 
    function(v254) --[[ Line: 1428 ]]
        -- upvalues: v12 (copy), v72 (copy), v10 (copy)
        local v255 = v72[v12.isNotNil(v254.source, "source")] or "";
        local v256 = v254.is_phase2 == "true";
        return {
            {
                {
                    name = v10.FAEUpsellOverlay, 
                    extraProps = {
                        source = v255, 
                        isPhase2 = v256
                    }
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
l_game_FastString_12 = game:GetFastString("FAEDeepLinkPattern");
table.insert(v71, {
    l_game_FastString_12, 
    function(v257) --[[ Line: 1446 ]]
        -- upvalues: v12 (copy), v72 (copy), v10 (copy)
        local v258 = v72[v12.isNotNil(v257.source, "source")] or "";
        return {
            {
                {
                    name = v10.FAE, 
                    extraProps = {
                        source = v258
                    }
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
l_game_FastString_12 = game:GetFastString("EnterAppFromLockScreenWidget");
table.insert(v71, {
    l_game_FastString_12, 
    function(_, _) --[[ Line: 1457 ]]
        -- upvalues: v17 (copy)
        v17("Default");
        return nil;
    end
});
l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
return v71;