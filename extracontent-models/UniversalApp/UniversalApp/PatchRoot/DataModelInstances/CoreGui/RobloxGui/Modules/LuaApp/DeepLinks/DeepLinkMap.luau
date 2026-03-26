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
local v19 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
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
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagEnableCommsFAEUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableCommsFAEUpsell;
local v66 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FFlagCiDeprecateFindFriendsModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCiDeprecateFindFriendsModal;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXHandleTaxonomyIdsDeepLinks;
local l_FFlagEnableNotificationsDeeplink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableNotificationsDeeplink;
local l_FFlagTCParentChildAutoUpgrade_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCParentChildAutoUpgrade;
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
local v71 = string.split(game:GetFastString("LuaExtraHttpLinkBases"), ",");
local v72 = {};
local v73 = {
    notifstream = l_UpsellEntrySurfaceType_0.NotifStream, 
    notifpush = l_UpsellEntrySurfaceType_0.NotifPush
};
local function _(v74, v75) --[[ Line: 185 ]] --[[ Name: addMapping ]]
    -- upvalues: v72 (copy), l_default_0 (copy)
    table.insert(v72, {
        v74, 
        v75
    });
    v74 = v74:gsub("%%", "\\");
    l_default_0:registerURL(v74);
end;
local function v87(v77, v78) --[[ Line: 193 ]] --[[ Name: addHttpMapping ]]
    -- upvalues: v22 (copy), v72 (copy), l_default_0 (copy), v71 (copy)
    for _, v80 in pairs({
        "www", 
        "web", 
        ""
    }) do
        local v81 = v22.new(v80);
        local v82 = v22.new(v80, {
            secure = false
        });
        local v83 = v81 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. v77;
        table.insert(v72, {
            v83, 
            v78
        });
        v83 = v83:gsub("%%", "\\");
        l_default_0:registerURL(v83);
        v83 = v82 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. v77;
        table.insert(v72, {
            v83, 
            v78
        });
        v83 = v83:gsub("%%", "\\");
        l_default_0:registerURL(v83);
    end;
    for _, v85 in ipairs(v71) do
        local v86 = v85 .. v77;
        table.insert(v72, {
            v86, 
            v78
        });
        v86 = v86:gsub("%%", "\\");
        l_default_0:registerURL(v86);
    end;
end;
local function v93(v88) --[[ Line: 208 ]] --[[ Name: buildHistoryFromRoute ]]
    local v89 = {};
    for v90 = 1, #v88 do
        local v91 = {};
        for v92 = 1, v90 do
            table.insert(v91, v88[v92]);
        end;
        table.insert(v89, v91);
    end;
    return v89;
end;
local l_game_FastString_0 = game:GetFastString("GamesPageDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_0, 
    function() --[[ Line: 220 ]]
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
table.insert(v72, {
    l_game_FastString_0, 
    function() --[[ Line: 224 ]]
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
table.insert(v72, {
    l_game_FastString_0, 
    function() --[[ Line: 228 ]]
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
    table.insert(v72, {
        l_game_FastString_0, 
        function() --[[ Line: 239 ]]
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
table.insert(v72, {
    l_game_FastString_0, 
    function(v95) --[[ Line: 250 ]]
        -- upvalues: l_AvatarScreen_0 (copy), v26 (copy), v25 (copy), v14 (copy), v93 (copy)
        local v96 = {
            {
                name = l_AvatarScreen_0.AvatarExperienceLandingPage
            }, 
            {
                name = l_AvatarScreen_0.AvatarEditor
            }
        };
        if v95.itemtype == "character" then
            local v97, v98 = v26.findAvatarEditorCategory(v25.CharacterKey, v25.PurchasedCharacterKey);
            local v99 = {
                itemId = v95.itemid, 
                category = v97, 
                subcategory = v98
            };
            table.insert(v96, {
                name = l_AvatarScreen_0.OutfitDetails, 
                extraProps = v99
            });
        elseif v95.itemtype == "asset" then
            local v100, v101 = v26.getCategoryIndicesFromAssetType(v95.itemsubtype);
            local v102 = {
                itemId = v95.itemid, 
                itemType = v14.ItemType.Asset, 
                mountAsFullView = true, 
                category = v100, 
                subcategory = v101, 
                opaquePage = l_AvatarScreen_0.AvatarEditor
            };
            table.insert(v96, {
                name = l_AvatarScreen_0.ItemDetails, 
                extraProps = v102
            });
        end;
        return (v93(v96));
    end
});
l_default_0:registerURL((l_game_FastString_0:gsub("%%", "\\")));
v87(game:GetFastString("AvatarHttpPattern"), function(_, v104) --[[ Line: 291 ]]
    -- upvalues: v5 (copy), l_AvatarScreen_0 (copy)
    return v5.List.join(v104.history, {
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
table.insert(v72, {
    l_game_FastString_1, 
    function() --[[ Line: 304 ]]
        -- upvalues: v66 (copy), v10 (copy)
        return {
            {
                {
                    name = if v66 then v10.Home else v10.More
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_1:gsub("%%", "\\")));
l_game_FastString_1 = function(v106, v107) --[[ Line: 308 ]] --[[ Name: subSettingsMapping ]]
    -- upvalues: v66 (copy), v10 (copy), v21 (copy)
    return {
        {
            {
                name = if v66 then v10.Home else v10.More
            }
        }, 
        {
            {
                name = if v66 then v10.Home else v10.More
            }, 
            {
                name = v10.Settings
            }
        }, 
        {
            {
                name = if v66 then v10.Home else v10.More
            }, 
            {
                name = v10.Settings
            }, 
            {
                name = v10.SettingsSubPage, 
                detail = v106, 
                extraProps = {
                    titleKey = v107, 
                    transitionAnimation = v21.None
                }
            }
        }
    };
end;
local l_game_FastString_2 = game:GetFastString("NotificationSettingsDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_2, 
    function() --[[ Line: 332 ]]
        -- upvalues: v23 (copy), l_game_FastString_1 (copy)
        local v109 = v23.static.settings.notifications();
        return (l_game_FastString_1(v109, "Feature.AccountSettings.Heading.Tab.Notifications"));
    end
});
l_default_0:registerURL((l_game_FastString_2:gsub("%%", "\\")));
if l_FFlagEnableNotificationsDeeplink_0 then
    l_game_FastString_2 = game:GetFastString("NotificationsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_2, 
        function() --[[ Line: 338 ]]
            -- upvalues: l_StreamNotificationStore_0 (copy)
            l_StreamNotificationStore_0.setStreamPresented(true);
            return nil;
        end
    });
    l_default_0:registerURL((l_game_FastString_2:gsub("%%", "\\")));
end;
l_game_FastString_2 = function(v110) --[[ Line: 345 ]] --[[ Name: getChatEntryPointEnum ]]
    -- upvalues: l_ChatEntryPointNames_0 (copy)
    if type(v110) ~= "string" then
        return l_ChatEntryPointNames_0.Unknown;
    else
        for v111, v112 in pairs(l_ChatEntryPointNames_0) do
            if string.lower(v111) == string.lower(v110) then
                return v112;
            end;
        end;
        return l_ChatEntryPointNames_0.Unknown;
    end;
end;
local l_game_FastString_3 = game:GetFastString("RoactChatDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_3, 
    function(v114, v115) --[[ Line: 360 ]]
        -- upvalues: l_game_FastString_2 (copy), l_CreateConversation_0 (copy), v10 (copy)
        local v116 = {
            entryPoint = l_game_FastString_2(v114.entrypoint)
        };
        if v114.chatid == nil and v114.userid ~= nil then
            return l_CreateConversation_0(v115.network, "one_to_one", {
                v114.userid
            }):andThen(function(v117) --[[ Line: 366 ]]
                -- upvalues: v10 (ref), v116 (copy)
                local v118 = tostring(v117.responseBody.conversations[1].id);
                return {
                    {
                        {
                            name = v10.Chat, 
                            detail = v118, 
                            extraProps = v116
                        }
                    }
                };
            end):catch(function() --[[ Line: 377 ]]
                -- upvalues: v10 (ref), v116 (copy)
                return {
                    {
                        {
                            name = v10.Chat, 
                            extraProps = v116
                        }
                    }
                };
            end);
        else
            return {
                {
                    {
                        name = v10.Chat, 
                        detail = v114.chatid, 
                        extraProps = v116
                    }
                }
            };
        end;
    end
});
l_default_0:registerURL((l_game_FastString_3:gsub("%%", "\\")));
l_game_FastString_3 = game:GetFastString("GameDetailsDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_3, 
    function(v119) --[[ Line: 395 ]]
        -- upvalues: v10 (copy), v52 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v16 (copy), v59 (copy), l_HardwareSafeAreaInsets_0 (copy), l_Workspace_0 (copy), l_UseGameDetailsPeekView_0 (copy), v12 (copy)
        local l_GameDetail_0 = v10.GameDetail;
        if v52() then
            if l_FFlagEnableShareLinksInGameDetailEvent_0 then
                v16(v119.gameid, "GameDetailsDeeplink", {});
            else
                v16(v119.gameid, "GameDetailsDeeplink");
            end;
        end;
        if v119.homeroot then
            local v121 = nil;
            v121 = if v59() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else l_Workspace_0.CurrentCamera and l_Workspace_0.CurrentCamera.ViewportSize or Vector2.zero;
            l_GameDetail_0 = if v121.Y > v121.X and l_UseGameDetailsPeekView_0() then v10.GameDetail else v10.ExperienceDetail;
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
                        detail = v12.isNotNil(v119.gameid, "gameId"), 
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
                        detail = v12.isNotNil(v119.gameid, "gameId"), 
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
v87(game:GetFastString("GameDetailsHttpPattern"), function(v122, v123, v124) --[[ Line: 456 ]]
    -- upvalues: v20 (copy), l_ExperienceService_0 (copy), v10 (copy), l_GamesMultigetPlaceDetails_0 (copy), v52 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v16 (copy)
    if v123.privateserverlinkcode ~= nil then
        v124.analyticsImpls.shareLinksAnalytics.openAppViaShareLink({
            placeId = v122, 
            linkCode = v123.privateserverlinkcode, 
            linkType = v20.LongPrivateServerLink
        });
        l_ExperienceService_0:LaunchExperience({
            placeId = if type(v122) == "number" then v122 else tonumber(v122), 
            linkCode = v123.privateserverlinkcode
        });
        return nil;
    else
        local l_GameDetail_1 = v10.GameDetail;
        return l_GamesMultigetPlaceDetails_0(v124.network, v122):andThen(function(v126) --[[ Line: 474 ]]
            -- upvalues: v52 (ref), l_FFlagEnableShareLinksInGameDetailEvent_0 (ref), v16 (ref), v10 (ref), l_GameDetail_1 (copy)
            local v127 = tostring(v126.responseBody[1].universeId);
            if v52() then
                if l_FFlagEnableShareLinksInGameDetailEvent_0 then
                    v16(v127, "GameDetailsHTTPDeepLink", {});
                else
                    v16(v127, "GameDetailsHTTPDeepLink");
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
                        detail = v127, 
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
v87(game:GetFastString("GameDetailsReferralHttpPattern"), function(v128, v129) --[[ Line: 505 ]]
    -- upvalues: v12 (copy), v10 (copy), l_GamesMultigetPlaceDetails_0 (copy), v52 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v16 (copy)
    local v130 = v12.isNotNil(v128.placeid, "placeid");
    local l_GameDetail_2 = v10.GameDetail;
    return l_GamesMultigetPlaceDetails_0(v129.network, v130):andThen(function(v132) --[[ Line: 509 ]]
        -- upvalues: v52 (ref), l_FFlagEnableShareLinksInGameDetailEvent_0 (ref), v16 (ref), v10 (ref), l_GameDetail_2 (copy)
        local v133 = tostring(v132.responseBody[1].universeId);
        if v52() then
            if l_FFlagEnableShareLinksInGameDetailEvent_0 then
                v16(v133, "GameDetailsHTTPReferralDeepLink", {});
            else
                v16(v133, "GameDetailsHTTPReferralDeepLink");
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
                    detail = v133, 
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
table.insert(v72, {
    l_game_FastString_4, 
    function(v135) --[[ Line: 540 ]]
        -- upvalues: v10 (copy), v19 (copy)
        local v136 = v135.userid or "";
        return {
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.ProfilePlatform, 
                    detail = v136, 
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
    table.insert(v72, {
        l_game_FastString_4, 
        function(v137, _) --[[ Line: 558 ]]
            -- upvalues: v10 (copy), v19 (copy)
            local v139 = v137.userid or "";
            return {
                {
                    {
                        name = v10.Home
                    }, 
                    {
                        name = v10.ProfilePlatform, 
                        detail = v139, 
                        extraProps = {
                            source = v19.Sources.ProfileDeepLink
                        }
                    }, 
                    {
                        name = v10.TrustedContactsModal, 
                        userId = v139, 
                        source = "Deeplink_Profile_TrustedFriends"
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
end;
l_game_FastString_4 = game:GetFastString("ProfileDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_4, 
    function(v140, v141) --[[ Line: 581 ]]
        -- upvalues: v12 (copy), v23 (copy), v10 (copy), v21 (copy)
        local v142 = v12.isNotNil(v140.userid, "userId");
        local l_friendshipsourcetype_0 = v140.friendshipsourcetype;
        local v144 = v23.user.profile({
            userId = v142, 
            sourceType = l_friendshipsourcetype_0
        });
        if l_friendshipsourcetype_0 == "profileshare" then
            v141.analyticsImpls.socialProfileShareAnalytics.inviteePageLoad(v142, "playerProfile");
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
                    detail = v144, 
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
table.insert(v72, {
    l_game_FastString_4, 
    function(v145) --[[ Line: 612 ]]
        -- upvalues: v23 (copy), v12 (copy), l_FFlagLuaAppForumsDeeplinkFix_0 (copy), v10 (copy), l_GetFFlagUseCommunitiesTranslation_0 (copy), v21 (copy)
        local v146 = nil;
        v146 = if v145.forumcategoryid and v145.forumcategoryid ~= "" and v145.forumpostid and v145.forumpostid ~= "" and v145.forumcommentid and v145.forumcommentid ~= "" then v23.user.forumComment({
            groupId = v12.isNotNil(v145.groupid, "groupId"), 
            categoryId = if l_FFlagLuaAppForumsDeeplinkFix_0 then "category-" .. v12.isNotNil(v145.forumcategoryid, "categoryId") else v12.isNotNil(v145.forumcategoryid, "categoryId"), 
            postId = if l_FFlagLuaAppForumsDeeplinkFix_0 then "post-" .. v12.isNotNil(v145.forumpostid, "postId") else v12.isNotNil(v145.forumpostid, "postId"), 
            commentId = v12.isNotNil(v145.forumcommentid, "commentId")
        }) else v23.user.group({
            groupId = v12.isNotNil(v145.groupid, "groupId")
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
                    detail = v146, 
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
table.insert(v72, {
    l_game_FastString_4, 
    function(v147, _) --[[ Line: 657 ]]
        -- upvalues: v10 (copy), l_Constants_0 (copy), l_FFlagCiDeprecateFindFriendsModal_0 (copy), l_contactImporterModalInfo_0 (copy), l_AppStorageService_0 (copy), l_LocalPlayer_0 (copy)
        local v149 = nil;
        v149 = if v147.contactid and v147.contactid ~= "" then {
            name = v10.ProfilePlatform, 
            detail = v147.contactid, 
            extraProps = {
                profileType = l_Constants_0.CONTACT
            }
        } else {
            name = if l_FFlagCiDeprecateFindFriendsModal_0 then v10.ContactImporter else if l_contactImporterModalInfo_0:isUserOptedInLocalStorage(l_AppStorageService_0, if l_LocalPlayer_0 and l_LocalPlayer_0.UserId then tostring(l_LocalPlayer_0.UserId) else "") then v10.ContactsList else v10.ContactImporter, 
            detail = "", 
            extraProps = {
                isPhoneVerified = true, 
                entryPoint = if l_FFlagCiDeprecateFindFriendsModal_0 then v147.entryPoint else nil
            }
        };
        return {
            if l_FFlagCiDeprecateFindFriendsModal_0 then {
                {
                    name = v10.Home
                }, 
                v149
            } else {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.AddFriendsPage
                }, 
                v149
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
v87(game:GetFastString("StaticShareLinkHttpPattern"), function(v150, v151, v152, v153) --[[ Line: 705 ]]
    -- upvalues: v36 (copy), v5 (copy)
    return v36(v150, v151, v5.Dictionary.join(v152, {
        isViaAppsFlyer = false
    }), v153);
end);
l_game_FastString_4 = game:GetFastString("StaticShareLinkDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_4, 
    function(v154, v155, v156, v157) --[[ Line: 712 ]]
        -- upvalues: v36 (copy), v5 (copy)
        return v36(v154, v155, v5.Dictionary.join(v156, {
            isViaAppsFlyer = true
        }), v157);
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = game:GetFastString("ShareLinkDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_4, 
    function(v158, v159) --[[ Line: 717 ]]
        -- upvalues: v35 (copy), v5 (copy)
        return v35(v5.Dictionary.join(v158, {
            isViaAppsFlyer = true
        }), v159);
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = function(v160, v161) --[[ Line: 721 ]]
    -- upvalues: v35 (copy), v5 (copy)
    return v35(v5.Dictionary.join(v160, {
        isViaAppsFlyer = false
    }), v161);
end;
v87(game:GetFastString("ShareLinkHttpPattern"), l_game_FastString_4);
v87(game:GetFastString("ShortShareLinkHttpPattern"), l_game_FastString_4);
if game:GetFastFlag("EnableJoinLinkWebDeepLink") then
    v87(game:GetFastString("JoinLinkHttpPattern"), function(v162, v163, v164) --[[ Line: 729 ]]
        -- upvalues: v37 (copy)
        return v37(v162, v163, v164);
    end);
end;
local l_game_FastString_5 = game:GetFastString("CatalogEquipDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_5, 
    function(v166) --[[ Line: 734 ]]
        -- upvalues: l_AvatarScreen_0 (copy)
        local v167 = {
            itemId = v166.itemid, 
            itemType = v166.itemtype, 
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
                    extraProps = v167
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
if v56 then
    l_game_FastString_5 = game:GetFastString("CatalogSearchDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_5, 
        function(v168) --[[ Line: 757 ]]
            -- upvalues: l_AvatarScreen_0 (copy), l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (copy), l_FFlagAXDurablesSupport_0 (copy)
            local v169 = {};
            local v170 = {
                {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }
                }
            };
            v169.creatorName = v168.creatorname;
            v169.minPrice = v168.minprice;
            v169.maxPrice = v168.maxprice;
            v169.salesTypeFilter = v168.salestypefilter;
            v169.includeNotForSale = v168.includenotforsale;
            v169.sortType = v168.sorttype;
            v169.sortAggregation = v168.sortaggregation;
            v169.category = v168.category;
            v169.subcategory = v168.subcategory;
            if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then
                v169.taxonomy = v168.taxonomy;
            end;
            v169.keyword = v168.keyword;
            v169.topics = v168.topics;
            if l_FFlagAXDurablesSupport_0 then
                v169.wearTimeFilter = v168.wearTimeFilter;
            end;
            if v169.keyword then
                table.insert(v170, {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }, 
                    {
                        name = l_AvatarScreen_0.CatalogSearch, 
                        extraProps = v169
                    }
                });
                return v170;
            else
                table.insert(v170, {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }, 
                    {
                        name = l_AvatarScreen_0.Catalog, 
                        extraProps = v169
                    }
                });
                return v170;
            end;
        end
    });
    l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
end;
l_game_FastString_5 = game:GetFastString("ExperienceSortDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_5, 
    function(v171, ...) --[[ Line: 807 ]]
        -- upvalues: v32 (copy), v10 (copy), l_FFlagLuaAppSortDeeplinkFix_0 (copy)
        if not v171.sortId then
            return;
        else
            local v172, v173 = v32(v171.sortId);
            return {
                {
                    {
                        name = v10.Home
                    }, 
                    {
                        name = if l_FFlagLuaAppSortDeeplinkFix_0 then v10.DeeplinkGamesList else v10.GamesList, 
                        detail = v172, 
                        extraProps = {
                            sortName = v172, 
                            pageContext = if l_FFlagLuaAppSortDeeplinkFix_0 then nil else "Deeplink", 
                            isOmni = v173, 
                            sortIndex = not l_FFlagLuaAppSortDeeplinkFix_0 and v173 and 1 or nil
                        }
                    }
                }
            };
        end;
    end
});
l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
l_game_FastString_5 = game:GetFastString("CatalogDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_5, 
    function() --[[ Line: 831 ]]
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
table.insert(v72, {
    l_game_FastString_5, 
    function(v174) --[[ Line: 843 ]]
        -- upvalues: v12 (copy), v14 (copy), l_AvatarScreen_0 (copy), v55 (copy)
        local v175 = v12.isNotNil(v174.itemid, "itemId");
        local v176 = v12.isNotNil(v174.itemtype, "itemType");
        local v177 = nil;
        for _, v179 in pairs(v14.ItemType) do
            if string.lower(v176) == string.lower(v179) then
                v177 = v179;
                break;
            end;
        end;
        local v180 = {
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
        local v181 = tostring(v177) .. tostring(v175);
        local l_ItemDetails_0 = l_AvatarScreen_0.ItemDetails;
        if v55 and v177 == v14.ItemType.Look then
            l_ItemDetails_0 = l_AvatarScreen_0.LookDetails;
        end;
        local v183 = {
            name = l_ItemDetails_0, 
            detail = v181, 
            extraProps = {
                itemId = v175, 
                itemType = v177, 
                mountAsFullView = true, 
                mountAnimation = false
            }
        };
        if v177 ~= nil then
            table.insert(v180, {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }, 
                v183
            });
        end;
        return v180;
    end
});
l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
v87(game:GetFastString("ItemDetailsHttpPattern"), function(v184, _, v186) --[[ Line: 894 ]]
    -- upvalues: v14 (copy), v5 (copy), l_AvatarScreen_0 (copy)
    local l_Asset_0 = v14.ItemType.Asset;
    local v188 = l_Asset_0 .. v184;
    return v5.List.join(v186.history, {
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
                detail = v188, 
                extraProps = {
                    itemId = v184, 
                    itemType = l_Asset_0, 
                    mountAsFullView = true, 
                    mountAnimation = false
                }
            }
        }
    });
end);
if v54 then
    v87(game:GetFastString("BundleItemDetailsHttpPattern"), function(v189, _, v191) --[[ Line: 929 ]]
        -- upvalues: v14 (copy), v5 (copy), l_AvatarScreen_0 (copy)
        local l_Bundle_0 = v14.ItemType.Bundle;
        local v193 = l_Bundle_0 .. v189;
        local l_history_0 = v191.history;
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
                    detail = v193, 
                    extraProps = {
                        itemId = v189, 
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
    v87(game:GetFastString("LookItemDetailsHttpPattern"), function(v195, _, v197) --[[ Line: 956 ]]
        -- upvalues: v14 (copy), v5 (copy), l_AvatarScreen_0 (copy)
        local v198 = v14.ItemType.Look .. v195;
        local l_history_1 = v197.history;
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
                    detail = v198, 
                    extraProps = {
                        itemId = v195, 
                        mountAsFullView = true
                    }
                }
            }
        });
    end);
end;
if v46 then
    local l_game_FastString_6 = game:GetFastString("ItemRedemptionDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_6, 
        function(v201) --[[ Line: 982 ]]
            -- upvalues: v12 (copy), v14 (copy), l_AvatarScreen_0 (copy)
            local v202 = v12.isNotNil(v201.itemid, "itemId");
            local v203 = v12.isNotNil(v201.itemtype, "itemType");
            local v204 = nil;
            for _, v206 in pairs(v14.ItemType) do
                if string.lower(v203) == string.lower(v206) then
                    v204 = v206;
                    break;
                end;
            end;
            local v207 = {
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
            local v208 = tostring(v204) .. tostring(v202);
            local v209 = {
                name = l_AvatarScreen_0.ItemDetails, 
                detail = v208, 
                extraProps = {
                    itemId = v202, 
                    itemType = v204, 
                    mountAsFullView = true, 
                    mountAnimation = false, 
                    redeemQRCodeItem = true
                }
            };
            if v204 ~= nil then
                table.insert(v207, {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }, 
                    {
                        name = l_AvatarScreen_0.Catalog
                    }, 
                    v209
                });
            end;
            return v207;
        end
    });
    l_default_0:registerURL((l_game_FastString_6:gsub("%%", "\\")));
end;
v87(game:GetFastString("CatalogHttpPattern"), function(v210, v211) --[[ Line: 1030 ]]
    -- upvalues: v61 (copy), v5 (copy), l_AvatarScreen_0 (copy), v27 (copy)
    if v61 then
        return v5.List.join(v211.history, {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog, 
                    extraProps = v27.convertCatalogSearchParamsV1ToV2(v210)
                }
            }
        });
    else
        return v5.List.join(v211.history, {
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
table.insert(v72, {
    l_game_FastString_7, 
    function() --[[ Line: 1054 ]]
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
    table.insert(v72, {
        l_game_FastString_7, 
        function(v213) --[[ Line: 1067 ]]
            -- upvalues: v10 (copy)
            local v214 = {};
            if v213.analyticid and v213.analyticid ~= "" then
                v214.analyticId = v213.analyticid;
            end;
            if v213.product_id and v213.product_id ~= "" then
                v214.productId = v213.product_id;
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
                        extraProps = if next(v214) then v214 else nil
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if v48() then
    l_game_FastString_7 = game:GetFastString("GiftCardsPageDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_7, 
        function() --[[ Line: 1091 ]]
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
l_game_FastString_7 = function(v215, _) --[[ Line: 1114 ]] --[[ Name: handleCurrencyTransferLink ]]
    -- upvalues: v10 (copy)
    local l_direction_0 = v215.direction;
    if not l_direction_0 or l_direction_0 ~= "send" and l_direction_0 ~= "receive" then
        return nil;
    else
        if l_direction_0 == "send" then
            if not v215.userid or v215.userid == "" then
                return nil;
            end;
        elseif not v215.transferrequestid or v215.transferrequestid == "" then
            return nil;
        end;
        local v218 = {
            direction = l_direction_0
        };
        if l_direction_0 == "send" then
            v218.recipientUserId = v215.userid;
            if v215.transferorigination then
                v218.transferOrigination = v215.transferorigination;
            end;
        else
            v218.transferId = v215.transferrequestid;
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
                    extraProps = v218
                }
            }
        };
    end;
end;
if l_FFlagEnableCurrencyTransferDeepLink_0 then
    local l_game_FastString_8 = game:GetFastString("CurrencyTransferDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_8, 
        l_game_FastString_7
    });
    l_default_0:registerURL((l_game_FastString_8:gsub("%%", "\\")));
end;
if v51() then
    local l_game_FastString_9 = game:GetFastString("SystemMessageDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_9, 
        function() --[[ Line: 1159 ]]
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
    table.insert(v72, {
        l_game_FastString_10, 
        function(v222) --[[ Line: 1180 ]]
            -- upvalues: v31 (copy), v10 (copy), v21 (copy)
            local l_domain_0 = v222.domain;
            local v224 = nil;
            local v225 = nil;
            if l_domain_0 == v31.ExternalWebDomainEnum.Zendesk then
                v224 = v31.getZendeskUrl(v222);
                v225 = v31.getZendeskWebViewTitleKey(v222.type);
            end;
            if not v224 then
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
                            detail = v224, 
                            extraProps = {
                                titleKey = v225, 
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
    table.insert(v72, {
        l_game_FastString_11, 
        function(v227) --[[ Line: 1215 ]]
            -- upvalues: v12 (copy), v66 (copy), v10 (copy)
            local v228 = v12.isNotNil(v227.code, "code");
            local l_source_0 = v227.source;
            return {
                {
                    {
                        name = if v66 then v10.Home else v10.More
                    }, 
                    {
                        name = v10.CrossDeviceLogin, 
                        extraProps = {
                            code = v228, 
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
table.insert(v72, {
    l_game_FastString_12, 
    function(v231) --[[ Line: 1234 ]]
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
                    detail = v12.isNotNil(v231.eventid, "eventid")
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
l_game_FastString_12 = game:GetFastString("AppealsPortalDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_12, 
    function(v232) --[[ Line: 1249 ]]
        -- upvalues: v66 (copy), v10 (copy), v23 (copy)
        return {
            {
                {
                    name = if v66 then v10.Home else v10.More
                }, 
                {
                    name = v10.GenericWebPage, 
                    detail = if v232.vid then v23.static.appealsPortal.violation({
                        id = v232.vid, 
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
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1270 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v233 = v23.static.settings.privacy();
            return (l_game_FastString_1(v233, "Feature.AccountSettings.Heading.Tab.Privacy"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
end;
if v43 then
    l_game_FastString_12 = game:GetFastString("AppPermissionsSettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1277 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v234 = v23.static.settings.appPermissions();
            return (l_game_FastString_1(v234, "Feature.AccountSettings.Heading.Tab.AppPermissions"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("ScreentimeSettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1282 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v235 = v23.static.settings.screentimeSettings();
            return (l_game_FastString_1(v235, "Feature.AccountSettings.Heading.ScreenTime"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("CommunicationSettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1286 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v236 = v23.static.settings.communicationSettings();
            return (l_game_FastString_1(v236, "Feature.AccountSettings.Heading.Communications"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("BlockedUsersSettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1291 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v237 = v23.static.settings.blockedUsersSettings();
            return (l_game_FastString_1(v237, "Feature.AccountSettings.Heading.BlockedUsersV2"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("BlockedExpSettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1296 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v238 = v23.static.settings.blockedExperiencesSettings();
            return (l_game_FastString_1(v238, "Feature.AccountSettings.Heading.BlockedExperiences"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("ExperienceChatSettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1301 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v239 = v23.static.settings.experienceChatSettings();
            return (l_game_FastString_1(v239, "Feature.AccountSettings.Heading.ExperienceChat"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("PartySettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1306 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v240 = v23.static.settings.partySettings();
            return (l_game_FastString_1(v240, "Feature.AccountSettings.Label.Party"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("VoiceSettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1311 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v241 = v23.static.settings.voiceSettings();
            return (l_game_FastString_1(v241, "Feature.AccountSettings.Heading.VoiceChat"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("TradingInventorySettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1316 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v242 = v23.static.settings.tradingInventorySettings();
            return (l_game_FastString_1(v242, "Feature.AccountSettings.Heading.TradingAndInventory"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("FriendsContactsSettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1321 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v243 = v23.static.settings.friendsContactsSettings();
            return (l_game_FastString_1(v243, "Feature.AccountSettings.Heading.FriendsAndContacts"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("PrivateServerSettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1326 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v244 = v23.static.settings.privateServerSettings();
            return (l_game_FastString_1(v244, "Feature.AccountSettings.Heading.PrivateServers"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("VisibilitySettingsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1331 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v245 = v23.static.settings.visibilitySettings();
            return (l_game_FastString_1(v245, "Feature.AccountSettings.Heading.Visibility"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
end;
if v40 then
    l_game_FastString_12 = game:GetFastString("ParentalControlsDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1338 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v246 = v23.static.settings.parentalControls();
            return (l_game_FastString_1(v246, "Feature.AccountSettings.Heading.Tab.ParentalControls"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
end;
if v41 then
    l_game_FastString_12 = game:GetFastString("AccountInfoDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1345 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v247 = v23.static.settings.account();
            return (l_game_FastString_1(v247, "Feature.AccountSettings.Heading.Tab.AccountInfo"));
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
end;
l_game_FastString_12 = game:GetFastString("SpendingSettingsDeepLinkPattern");
table.insert(v72, {
    l_game_FastString_12, 
    function() --[[ Line: 1351 ]]
        -- upvalues: v23 (copy), l_game_FastString_1 (copy)
        local v248 = v23.static.settings.billing();
        return (l_game_FastString_1(v248, "Feature.AccountSettings.Heading.Tab.Billing"));
    end
});
l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
if v42 then
    l_game_FastString_12 = game:GetFastString("DevicePreferencesDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function() --[[ Line: 1357 ]]
            -- upvalues: v66 (copy), v10 (copy)
            return {
                {
                    {
                        name = if v66 then v10.Home else v10.More
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
    table.insert(v72, {
        l_game_FastString_12, 
        function(v249, _) --[[ Line: 1369 ]]
            -- upvalues: l_GetFFlagGenerateLinkWithChannel_0 (copy), v23 (copy), v10 (copy), v21 (copy)
            if v249.payload and v249.payload ~= "" and v249.username and v249.username ~= "" then
                local v251 = nil;
                v251 = if l_GetFFlagGenerateLinkWithChannel_0() then v23.static.securityAlertWithChannel({
                    payload = v249.payload, 
                    username = v249.username, 
                    channel = v249.channel or ""
                }) else v23.static.securityAlert({
                    payload = v249.payload, 
                    username = v249.username
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
                            detail = v251, 
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
table.insert(v72, {
    l_game_FastString_12, 
    function(v252, _) --[[ Line: 1410 ]]
        -- upvalues: v12 (copy), v10 (copy), l_FFlagEnableSquadDeeplinkWithChatId_0 (copy)
        local v254 = v12.isNotNil(v252.partyid, "partyId");
        return {
            {
                {
                    name = v10.SquadLobby, 
                    detail = v254, 
                    extraProps = if l_FFlagEnableSquadDeeplinkWithChatId_0 then {
                        conversationId = v252.chatid
                    } else nil
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
if l_FFlagEnableCommsFAEUpsell_0 then
    l_game_FastString_12 = game:GetFastString("FAEUpsellOverlayDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function(v255) --[[ Line: 1428 ]]
            -- upvalues: v12 (copy), v73 (copy), v10 (copy)
            local v256 = v73[v12.isNotNil(v255.source, "source")] or "";
            local v257 = v255.is_phase2 == "true";
            return {
                {
                    {
                        name = v10.FAEUpsellOverlay, 
                        extraProps = {
                            source = v256, 
                            isPhase2 = v257
                        }
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
    l_game_FastString_12 = game:GetFastString("FAEDeepLinkPattern");
    table.insert(v72, {
        l_game_FastString_12, 
        function(v258) --[[ Line: 1446 ]]
            -- upvalues: v12 (copy), v73 (copy), v10 (copy)
            local v259 = v73[v12.isNotNil(v258.source, "source")] or "";
            return {
                {
                    {
                        name = v10.FAE, 
                        extraProps = {
                            source = v259
                        }
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
end;
l_game_FastString_12 = game:GetFastString("EnterAppFromLockScreenWidget");
table.insert(v72, {
    l_game_FastString_12, 
    function(_, _) --[[ Line: 1458 ]]
        -- upvalues: v17 (copy)
        v17("Default");
        return nil;
    end
});
l_default_0:registerURL((l_game_FastString_12:gsub("%%", "\\")));
return v72;