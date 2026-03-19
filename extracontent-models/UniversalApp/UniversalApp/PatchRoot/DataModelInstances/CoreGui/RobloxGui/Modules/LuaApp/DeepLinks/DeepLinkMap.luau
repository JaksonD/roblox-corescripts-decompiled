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
local v49 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMessagesDeepLink);
local v50 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoggingForGameDetailLinks);
local l_FFlagLuaAppForumsDeeplinkFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppForumsDeeplinkFix;
local v52 = game:DefineFastFlag("EnableBundleItemDetailHttpLink", false);
local v53 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLookDetailsDeepLink);
local v54 = require(l_Modules_0.LuaApp.Flags.FFlagEnableCatalogSearchDeepLinks);
local v55 = require(l_Modules_0.LuaApp.Flags.FFlagEnableProfilePictureEditorDeepLink);
local l_FFlagEnableShareLinksInGameDetailEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent;
local v57 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local l_GetFFlagUseCommunitiesTranslation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseCommunitiesTranslation;
local v59 = require(l_Modules_0.LuaApp.Flags.FFlagAXEnableCatalogCreatorHttpLink);
local l_FFlagEnableSquadDeeplinkWithChatId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSquadDeeplinkWithChatId;
local l_FFlagLuaAppSortDeeplinkFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSortDeeplinkFix;
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagEnableCommsFAEUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableCommsFAEUpsell;
local v64 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FFlagCiDeprecateFindFriendsModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCiDeprecateFindFriendsModal;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXHandleTaxonomyIdsDeepLinks;
local l_FFlagEnableNotificationsDeeplink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableNotificationsDeeplink;
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
local v68 = string.split(game:GetFastString("LuaExtraHttpLinkBases"), ",");
local v69 = {};
local v70 = {
    notifstream = l_UpsellEntrySurfaceType_0.NotifStream, 
    notifpush = l_UpsellEntrySurfaceType_0.NotifPush
};
local function _(v71, v72) --[[ Line: 178 ]] --[[ Name: addMapping ]]
    -- upvalues: v69 (copy), l_default_0 (copy)
    table.insert(v69, {
        v71, 
        v72
    });
    v71 = v71:gsub("%%", "\\");
    l_default_0:registerURL(v71);
end;
local function v84(v74, v75) --[[ Line: 186 ]] --[[ Name: addHttpMapping ]]
    -- upvalues: v22 (copy), v69 (copy), l_default_0 (copy), v68 (copy)
    for _, v77 in pairs({
        "www", 
        "web", 
        ""
    }) do
        local v78 = v22.new(v77);
        local v79 = v22.new(v77, {
            secure = false
        });
        local v80 = v78 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. v74;
        table.insert(v69, {
            v80, 
            v75
        });
        v80 = v80:gsub("%%", "\\");
        l_default_0:registerURL(v80);
        v80 = v79 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. v74;
        table.insert(v69, {
            v80, 
            v75
        });
        v80 = v80:gsub("%%", "\\");
        l_default_0:registerURL(v80);
    end;
    for _, v82 in ipairs(v68) do
        local v83 = v82 .. v74;
        table.insert(v69, {
            v83, 
            v75
        });
        v83 = v83:gsub("%%", "\\");
        l_default_0:registerURL(v83);
    end;
end;
local function v90(v85) --[[ Line: 201 ]] --[[ Name: buildHistoryFromRoute ]]
    local v86 = {};
    for v87 = 1, #v85 do
        local v88 = {};
        for v89 = 1, v87 do
            table.insert(v88, v85[v89]);
        end;
        table.insert(v86, v88);
    end;
    return v86;
end;
local l_game_FastString_0 = game:GetFastString("GamesPageDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_0, 
    function() --[[ Line: 213 ]]
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
table.insert(v69, {
    l_game_FastString_0, 
    function() --[[ Line: 217 ]]
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
table.insert(v69, {
    l_game_FastString_0, 
    function() --[[ Line: 221 ]]
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
if v55 then
    l_game_FastString_0 = game:GetFastString("AvatarProfilePictureEditor");
    table.insert(v69, {
        l_game_FastString_0, 
        function() --[[ Line: 232 ]]
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
table.insert(v69, {
    l_game_FastString_0, 
    function(v92) --[[ Line: 243 ]]
        -- upvalues: l_AvatarScreen_0 (copy), v26 (copy), v25 (copy), v14 (copy), v90 (copy)
        local v93 = {
            {
                name = l_AvatarScreen_0.AvatarExperienceLandingPage
            }, 
            {
                name = l_AvatarScreen_0.AvatarEditor
            }
        };
        if v92.itemtype == "character" then
            local v94, v95 = v26.findAvatarEditorCategory(v25.CharacterKey, v25.PurchasedCharacterKey);
            local v96 = {
                itemId = v92.itemid, 
                category = v94, 
                subcategory = v95
            };
            table.insert(v93, {
                name = l_AvatarScreen_0.OutfitDetails, 
                extraProps = v96
            });
        elseif v92.itemtype == "asset" then
            local v97, v98 = v26.getCategoryIndicesFromAssetType(v92.itemsubtype);
            local v99 = {
                itemId = v92.itemid, 
                itemType = v14.ItemType.Asset, 
                mountAsFullView = true, 
                category = v97, 
                subcategory = v98, 
                opaquePage = l_AvatarScreen_0.AvatarEditor
            };
            table.insert(v93, {
                name = l_AvatarScreen_0.ItemDetails, 
                extraProps = v99
            });
        end;
        return (v90(v93));
    end
});
l_default_0:registerURL((l_game_FastString_0:gsub("%%", "\\")));
v84(game:GetFastString("AvatarHttpPattern"), function(_, v101) --[[ Line: 284 ]]
    -- upvalues: v5 (copy), l_AvatarScreen_0 (copy)
    return v5.List.join(v101.history, {
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
table.insert(v69, {
    l_game_FastString_1, 
    function() --[[ Line: 297 ]]
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
l_game_FastString_1 = function(v103, v104) --[[ Line: 301 ]] --[[ Name: subSettingsMapping ]]
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
                detail = v103, 
                extraProps = {
                    titleKey = v104, 
                    transitionAnimation = v21.None
                }
            }
        }
    };
end;
local l_game_FastString_2 = game:GetFastString("NotificationSettingsDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_2, 
    function() --[[ Line: 325 ]]
        -- upvalues: v23 (copy), l_game_FastString_1 (copy)
        local v106 = v23.static.settings.notifications();
        return (l_game_FastString_1(v106, "Feature.AccountSettings.Heading.Tab.Notifications"));
    end
});
l_default_0:registerURL((l_game_FastString_2:gsub("%%", "\\")));
if l_FFlagEnableNotificationsDeeplink_0 then
    l_game_FastString_2 = game:GetFastString("NotificationsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_2, 
        function() --[[ Line: 331 ]]
            -- upvalues: l_StreamNotificationStore_0 (copy)
            l_StreamNotificationStore_0.setStreamPresented(true);
            return nil;
        end
    });
    l_default_0:registerURL((l_game_FastString_2:gsub("%%", "\\")));
end;
l_game_FastString_2 = function(v107) --[[ Line: 338 ]] --[[ Name: getChatEntryPointEnum ]]
    -- upvalues: l_ChatEntryPointNames_0 (copy)
    if type(v107) ~= "string" then
        return l_ChatEntryPointNames_0.Unknown;
    else
        for v108, v109 in pairs(l_ChatEntryPointNames_0) do
            if string.lower(v108) == string.lower(v107) then
                return v109;
            end;
        end;
        return l_ChatEntryPointNames_0.Unknown;
    end;
end;
local l_game_FastString_3 = game:GetFastString("RoactChatDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_3, 
    function(v111, v112) --[[ Line: 353 ]]
        -- upvalues: l_game_FastString_2 (copy), l_CreateConversation_0 (copy), v10 (copy)
        local v113 = {
            entryPoint = l_game_FastString_2(v111.entrypoint)
        };
        if v111.chatid == nil and v111.userid ~= nil then
            return l_CreateConversation_0(v112.network, "one_to_one", {
                v111.userid
            }):andThen(function(v114) --[[ Line: 359 ]]
                -- upvalues: v10 (ref), v113 (copy)
                local v115 = tostring(v114.responseBody.conversations[1].id);
                return {
                    {
                        {
                            name = v10.Chat, 
                            detail = v115, 
                            extraProps = v113
                        }
                    }
                };
            end):catch(function() --[[ Line: 370 ]]
                -- upvalues: v10 (ref), v113 (copy)
                return {
                    {
                        {
                            name = v10.Chat, 
                            extraProps = v113
                        }
                    }
                };
            end);
        else
            return {
                {
                    {
                        name = v10.Chat, 
                        detail = v111.chatid, 
                        extraProps = v113
                    }
                }
            };
        end;
    end
});
l_default_0:registerURL((l_game_FastString_3:gsub("%%", "\\")));
l_game_FastString_3 = game:GetFastString("GameDetailsDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_3, 
    function(v116) --[[ Line: 388 ]]
        -- upvalues: v10 (copy), v50 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v16 (copy), v57 (copy), l_HardwareSafeAreaInsets_0 (copy), l_Workspace_0 (copy), l_UseGameDetailsPeekView_0 (copy), v12 (copy)
        local l_GameDetail_0 = v10.GameDetail;
        if v50() then
            if l_FFlagEnableShareLinksInGameDetailEvent_0 then
                v16(v116.gameid, "GameDetailsDeeplink", {});
            else
                v16(v116.gameid, "GameDetailsDeeplink");
            end;
        end;
        if v116.homeroot then
            local v118 = nil;
            v118 = if v57() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else l_Workspace_0.CurrentCamera and l_Workspace_0.CurrentCamera.ViewportSize or Vector2.zero;
            l_GameDetail_0 = if v118.Y > v118.X and l_UseGameDetailsPeekView_0() then v10.GameDetail else v10.ExperienceDetail;
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
                        detail = v12.isNotNil(v116.gameid, "gameId"), 
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
                        detail = v12.isNotNil(v116.gameid, "gameId"), 
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
v84(game:GetFastString("GameDetailsHttpPattern"), function(v119, v120, v121) --[[ Line: 449 ]]
    -- upvalues: v20 (copy), l_ExperienceService_0 (copy), v10 (copy), l_GamesMultigetPlaceDetails_0 (copy), v50 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v16 (copy)
    if v120.privateserverlinkcode ~= nil then
        v121.analyticsImpls.shareLinksAnalytics.openAppViaShareLink({
            placeId = v119, 
            linkCode = v120.privateserverlinkcode, 
            linkType = v20.LongPrivateServerLink
        });
        l_ExperienceService_0:LaunchExperience({
            placeId = if type(v119) == "number" then v119 else tonumber(v119), 
            linkCode = v120.privateserverlinkcode
        });
        return nil;
    else
        local l_GameDetail_1 = v10.GameDetail;
        return l_GamesMultigetPlaceDetails_0(v121.network, v119):andThen(function(v123) --[[ Line: 467 ]]
            -- upvalues: v50 (ref), l_FFlagEnableShareLinksInGameDetailEvent_0 (ref), v16 (ref), v10 (ref), l_GameDetail_1 (copy)
            local v124 = tostring(v123.responseBody[1].universeId);
            if v50() then
                if l_FFlagEnableShareLinksInGameDetailEvent_0 then
                    v16(v124, "GameDetailsHTTPDeepLink", {});
                else
                    v16(v124, "GameDetailsHTTPDeepLink");
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
                        detail = v124, 
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
v84(game:GetFastString("GameDetailsReferralHttpPattern"), function(v125, v126) --[[ Line: 498 ]]
    -- upvalues: v12 (copy), v10 (copy), l_GamesMultigetPlaceDetails_0 (copy), v50 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v16 (copy)
    local v127 = v12.isNotNil(v125.placeid, "placeid");
    local l_GameDetail_2 = v10.GameDetail;
    return l_GamesMultigetPlaceDetails_0(v126.network, v127):andThen(function(v129) --[[ Line: 502 ]]
        -- upvalues: v50 (ref), l_FFlagEnableShareLinksInGameDetailEvent_0 (ref), v16 (ref), v10 (ref), l_GameDetail_2 (copy)
        local v130 = tostring(v129.responseBody[1].universeId);
        if v50() then
            if l_FFlagEnableShareLinksInGameDetailEvent_0 then
                v16(v130, "GameDetailsHTTPReferralDeepLink", {});
            else
                v16(v130, "GameDetailsHTTPReferralDeepLink");
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
                    detail = v130, 
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
table.insert(v69, {
    l_game_FastString_4, 
    function(v132) --[[ Line: 533 ]]
        -- upvalues: v10 (copy), v19 (copy)
        local v133 = v132.userid or "";
        return {
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.ProfilePlatform, 
                    detail = v133, 
                    extraProps = {
                        source = v19.Sources.ProfileDeepLink
                    }
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = game:GetFastString("ProfileDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_4, 
    function(v134, v135) --[[ Line: 550 ]]
        -- upvalues: v12 (copy), v23 (copy), v10 (copy), v21 (copy)
        local v136 = v12.isNotNil(v134.userid, "userId");
        local l_friendshipsourcetype_0 = v134.friendshipsourcetype;
        local v138 = v23.user.profile({
            userId = v136, 
            sourceType = l_friendshipsourcetype_0
        });
        if l_friendshipsourcetype_0 == "profileshare" then
            v135.analyticsImpls.socialProfileShareAnalytics.inviteePageLoad(v136, "playerProfile");
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
                    detail = v138, 
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
table.insert(v69, {
    l_game_FastString_4, 
    function(v139) --[[ Line: 581 ]]
        -- upvalues: v23 (copy), v12 (copy), l_FFlagLuaAppForumsDeeplinkFix_0 (copy), v10 (copy), l_GetFFlagUseCommunitiesTranslation_0 (copy), v21 (copy)
        local v140 = nil;
        v140 = if v139.forumcategoryid and v139.forumcategoryid ~= "" and v139.forumpostid and v139.forumpostid ~= "" and v139.forumcommentid and v139.forumcommentid ~= "" then v23.user.forumComment({
            groupId = v12.isNotNil(v139.groupid, "groupId"), 
            categoryId = if l_FFlagLuaAppForumsDeeplinkFix_0 then "category-" .. v12.isNotNil(v139.forumcategoryid, "categoryId") else v12.isNotNil(v139.forumcategoryid, "categoryId"), 
            postId = if l_FFlagLuaAppForumsDeeplinkFix_0 then "post-" .. v12.isNotNil(v139.forumpostid, "postId") else v12.isNotNil(v139.forumpostid, "postId"), 
            commentId = v12.isNotNil(v139.forumcommentid, "commentId")
        }) else v23.user.group({
            groupId = v12.isNotNil(v139.groupid, "groupId")
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
                    detail = v140, 
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
table.insert(v69, {
    l_game_FastString_4, 
    function(v141, _) --[[ Line: 626 ]]
        -- upvalues: v10 (copy), l_Constants_0 (copy), l_FFlagCiDeprecateFindFriendsModal_0 (copy), l_contactImporterModalInfo_0 (copy), l_AppStorageService_0 (copy), l_LocalPlayer_0 (copy)
        local v143 = nil;
        v143 = if v141.contactid and v141.contactid ~= "" then {
            name = v10.ProfilePlatform, 
            detail = v141.contactid, 
            extraProps = {
                profileType = l_Constants_0.CONTACT
            }
        } else {
            name = if l_FFlagCiDeprecateFindFriendsModal_0 then v10.ContactImporter else if l_contactImporterModalInfo_0:isUserOptedInLocalStorage(l_AppStorageService_0, if l_LocalPlayer_0 and l_LocalPlayer_0.UserId then tostring(l_LocalPlayer_0.UserId) else "") then v10.ContactsList else v10.ContactImporter, 
            detail = "", 
            extraProps = {
                isPhoneVerified = true, 
                entryPoint = if l_FFlagCiDeprecateFindFriendsModal_0 then v141.entryPoint else nil
            }
        };
        return {
            if l_FFlagCiDeprecateFindFriendsModal_0 then {
                {
                    name = v10.Home
                }, 
                v143
            } else {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.AddFriendsPage
                }, 
                v143
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
v84(game:GetFastString("StaticShareLinkHttpPattern"), function(v144, v145, v146, v147) --[[ Line: 674 ]]
    -- upvalues: v36 (copy), v5 (copy)
    return v36(v144, v145, v5.Dictionary.join(v146, {
        isViaAppsFlyer = false
    }), v147);
end);
l_game_FastString_4 = game:GetFastString("StaticShareLinkDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_4, 
    function(v148, v149, v150, v151) --[[ Line: 681 ]]
        -- upvalues: v36 (copy), v5 (copy)
        return v36(v148, v149, v5.Dictionary.join(v150, {
            isViaAppsFlyer = true
        }), v151);
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = game:GetFastString("ShareLinkDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_4, 
    function(v152, v153) --[[ Line: 686 ]]
        -- upvalues: v35 (copy), v5 (copy)
        return v35(v5.Dictionary.join(v152, {
            isViaAppsFlyer = true
        }), v153);
    end
});
l_default_0:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = function(v154, v155) --[[ Line: 690 ]]
    -- upvalues: v35 (copy), v5 (copy)
    return v35(v5.Dictionary.join(v154, {
        isViaAppsFlyer = false
    }), v155);
end;
v84(game:GetFastString("ShareLinkHttpPattern"), l_game_FastString_4);
v84(game:GetFastString("ShortShareLinkHttpPattern"), l_game_FastString_4);
if game:GetFastFlag("EnableJoinLinkWebDeepLink") then
    v84(game:GetFastString("JoinLinkHttpPattern"), function(v156, v157, v158) --[[ Line: 698 ]]
        -- upvalues: v37 (copy)
        return v37(v156, v157, v158);
    end);
end;
local l_game_FastString_5 = game:GetFastString("CatalogEquipDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_5, 
    function(v160) --[[ Line: 703 ]]
        -- upvalues: l_AvatarScreen_0 (copy)
        local v161 = {
            itemId = v160.itemid, 
            itemType = v160.itemtype, 
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
                    extraProps = v161
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
if v54 then
    l_game_FastString_5 = game:GetFastString("CatalogSearchDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_5, 
        function(v162) --[[ Line: 726 ]]
            -- upvalues: l_AvatarScreen_0 (copy), l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (copy), l_FFlagAXDurablesSupport_0 (copy)
            local v163 = {};
            local v164 = {
                {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }
                }
            };
            v163.creatorName = v162.creatorname;
            v163.minPrice = v162.minprice;
            v163.maxPrice = v162.maxprice;
            v163.salesTypeFilter = v162.salestypefilter;
            v163.includeNotForSale = v162.includenotforsale;
            v163.sortType = v162.sorttype;
            v163.sortAggregation = v162.sortaggregation;
            v163.category = v162.category;
            v163.subcategory = v162.subcategory;
            if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then
                v163.taxonomy = v162.taxonomy;
            end;
            v163.keyword = v162.keyword;
            v163.topics = v162.topics;
            if l_FFlagAXDurablesSupport_0 then
                v163.wearTimeFilter = v162.wearTimeFilter;
            end;
            if v163.keyword then
                table.insert(v164, {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }, 
                    {
                        name = l_AvatarScreen_0.CatalogSearch, 
                        extraProps = v163
                    }
                });
                return v164;
            else
                table.insert(v164, {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }, 
                    {
                        name = l_AvatarScreen_0.Catalog, 
                        extraProps = v163
                    }
                });
                return v164;
            end;
        end
    });
    l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
end;
l_game_FastString_5 = game:GetFastString("ExperienceSortDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_5, 
    function(v165, ...) --[[ Line: 776 ]]
        -- upvalues: v32 (copy), v10 (copy), l_FFlagLuaAppSortDeeplinkFix_0 (copy)
        if not v165.sortId then
            return;
        else
            local v166, v167 = v32(v165.sortId);
            return {
                {
                    {
                        name = v10.Home
                    }, 
                    {
                        name = if l_FFlagLuaAppSortDeeplinkFix_0 then v10.DeeplinkGamesList else v10.GamesList, 
                        detail = v166, 
                        extraProps = {
                            sortName = v166, 
                            pageContext = if l_FFlagLuaAppSortDeeplinkFix_0 then nil else "Deeplink", 
                            isOmni = v167, 
                            sortIndex = not l_FFlagLuaAppSortDeeplinkFix_0 and v167 and 1 or nil
                        }
                    }
                }
            };
        end;
    end
});
l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
l_game_FastString_5 = game:GetFastString("CatalogDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_5, 
    function() --[[ Line: 800 ]]
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
table.insert(v69, {
    l_game_FastString_5, 
    function(v168) --[[ Line: 812 ]]
        -- upvalues: v12 (copy), v14 (copy), l_AvatarScreen_0 (copy), v53 (copy)
        local v169 = v12.isNotNil(v168.itemid, "itemId");
        local v170 = v12.isNotNil(v168.itemtype, "itemType");
        local v171 = nil;
        for _, v173 in pairs(v14.ItemType) do
            if string.lower(v170) == string.lower(v173) then
                v171 = v173;
                break;
            end;
        end;
        local v174 = {
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
        local v175 = tostring(v171) .. tostring(v169);
        local l_ItemDetails_0 = l_AvatarScreen_0.ItemDetails;
        if v53 and v171 == v14.ItemType.Look then
            l_ItemDetails_0 = l_AvatarScreen_0.LookDetails;
        end;
        local v177 = {
            name = l_ItemDetails_0, 
            detail = v175, 
            extraProps = {
                itemId = v169, 
                itemType = v171, 
                mountAsFullView = true, 
                mountAnimation = false
            }
        };
        if v171 ~= nil then
            table.insert(v174, {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }, 
                v177
            });
        end;
        return v174;
    end
});
l_default_0:registerURL((l_game_FastString_5:gsub("%%", "\\")));
v84(game:GetFastString("ItemDetailsHttpPattern"), function(v178, _, v180) --[[ Line: 863 ]]
    -- upvalues: v14 (copy), v5 (copy), l_AvatarScreen_0 (copy)
    local l_Asset_0 = v14.ItemType.Asset;
    local v182 = l_Asset_0 .. v178;
    return v5.List.join(v180.history, {
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
                detail = v182, 
                extraProps = {
                    itemId = v178, 
                    itemType = l_Asset_0, 
                    mountAsFullView = true, 
                    mountAnimation = false
                }
            }
        }
    });
end);
if v52 then
    v84(game:GetFastString("BundleItemDetailsHttpPattern"), function(v183, _, v185) --[[ Line: 898 ]]
        -- upvalues: v14 (copy), v5 (copy), l_AvatarScreen_0 (copy)
        local l_Bundle_0 = v14.ItemType.Bundle;
        local v187 = l_Bundle_0 .. v183;
        local l_history_0 = v185.history;
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
                    detail = v187, 
                    extraProps = {
                        itemId = v183, 
                        itemType = l_Bundle_0, 
                        mountAsFullView = true, 
                        mountAnimation = false
                    }
                }
            }
        });
    end);
end;
if v53 then
    v84(game:GetFastString("LookItemDetailsHttpPattern"), function(v189, _, v191) --[[ Line: 925 ]]
        -- upvalues: v14 (copy), v5 (copy), l_AvatarScreen_0 (copy)
        local v192 = v14.ItemType.Look .. v189;
        local l_history_1 = v191.history;
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
                    detail = v192, 
                    extraProps = {
                        itemId = v189, 
                        mountAsFullView = true
                    }
                }
            }
        });
    end);
end;
if v46 then
    local l_game_FastString_6 = game:GetFastString("ItemRedemptionDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_6, 
        function(v195) --[[ Line: 951 ]]
            -- upvalues: v12 (copy), v14 (copy), l_AvatarScreen_0 (copy)
            local v196 = v12.isNotNil(v195.itemid, "itemId");
            local v197 = v12.isNotNil(v195.itemtype, "itemType");
            local v198 = nil;
            for _, v200 in pairs(v14.ItemType) do
                if string.lower(v197) == string.lower(v200) then
                    v198 = v200;
                    break;
                end;
            end;
            local v201 = {
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
            local v202 = tostring(v198) .. tostring(v196);
            local v203 = {
                name = l_AvatarScreen_0.ItemDetails, 
                detail = v202, 
                extraProps = {
                    itemId = v196, 
                    itemType = v198, 
                    mountAsFullView = true, 
                    mountAnimation = false, 
                    redeemQRCodeItem = true
                }
            };
            if v198 ~= nil then
                table.insert(v201, {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceLandingPage
                    }, 
                    {
                        name = l_AvatarScreen_0.Catalog
                    }, 
                    v203
                });
            end;
            return v201;
        end
    });
    l_default_0:registerURL((l_game_FastString_6:gsub("%%", "\\")));
end;
v84(game:GetFastString("CatalogHttpPattern"), function(v204, v205) --[[ Line: 999 ]]
    -- upvalues: v59 (copy), v5 (copy), l_AvatarScreen_0 (copy), v27 (copy)
    if v59 then
        return v5.List.join(v205.history, {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog, 
                    extraProps = v27.convertCatalogSearchParamsV1ToV2(v204)
                }
            }
        });
    else
        return v5.List.join(v205.history, {
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
table.insert(v69, {
    l_game_FastString_7, 
    function() --[[ Line: 1023 ]]
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
if v48() then
    l_game_FastString_7 = game:GetFastString("GiftCardsPageDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1036 ]]
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
if v49() then
    l_game_FastString_7 = game:GetFastString("SystemMessageDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1057 ]]
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
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if game:GetFastFlag("EnableExternalWebDeeplink") then
    l_game_FastString_7 = game:GetFastString("ExternalWebUrlDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function(v207) --[[ Line: 1078 ]]
            -- upvalues: v31 (copy), v10 (copy), v21 (copy)
            local l_domain_0 = v207.domain;
            local v209 = nil;
            local v210 = nil;
            if l_domain_0 == v31.ExternalWebDomainEnum.Zendesk then
                v209 = v31.getZendeskUrl(v207);
                v210 = v31.getZendeskWebViewTitleKey(v207.type);
            end;
            if not v209 then
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
                            detail = v209, 
                            extraProps = {
                                titleKey = v210, 
                                transitionAnimation = v21.None
                            }
                        }
                    }
                };
            end;
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if v47() then
    l_game_FastString_7 = game:GetFastString("CrossDeviceLoginDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function(v211) --[[ Line: 1113 ]]
            -- upvalues: v12 (copy), v64 (copy), v10 (copy)
            local v212 = v12.isNotNil(v211.code, "code");
            local l_source_0 = v211.source;
            return {
                {
                    {
                        name = if v64 then v10.Home else v10.More
                    }, 
                    {
                        name = v10.CrossDeviceLogin, 
                        extraProps = {
                            code = v212, 
                            source = l_source_0
                        }
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
l_game_FastString_7 = game:GetFastString("EventDetailsPageDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_7, 
    function(v214) --[[ Line: 1132 ]]
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
                    detail = v12.isNotNil(v214.eventid, "eventid")
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
l_game_FastString_7 = game:GetFastString("AppealsPortalDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_7, 
    function(v215) --[[ Line: 1147 ]]
        -- upvalues: v64 (copy), v10 (copy), v23 (copy)
        return {
            {
                {
                    name = if v64 then v10.Home else v10.More
                }, 
                {
                    name = v10.GenericWebPage, 
                    detail = if v215.vid then v23.static.appealsPortal.violation({
                        id = v215.vid, 
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
l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
if v39 then
    l_game_FastString_7 = game:GetFastString("PrivacySettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1168 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v216 = v23.static.settings.privacy();
            return (l_game_FastString_1(v216, "Feature.AccountSettings.Heading.Tab.Privacy"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if v43 then
    l_game_FastString_7 = game:GetFastString("AppPermissionsSettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1175 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v217 = v23.static.settings.appPermissions();
            return (l_game_FastString_1(v217, "Feature.AccountSettings.Heading.Tab.AppPermissions"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("ScreentimeSettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1180 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v218 = v23.static.settings.screentimeSettings();
            return (l_game_FastString_1(v218, "Feature.AccountSettings.Heading.ScreenTime"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("CommunicationSettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1184 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v219 = v23.static.settings.communicationSettings();
            return (l_game_FastString_1(v219, "Feature.AccountSettings.Heading.Communications"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("BlockedUsersSettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1189 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v220 = v23.static.settings.blockedUsersSettings();
            return (l_game_FastString_1(v220, "Feature.AccountSettings.Heading.BlockedUsersV2"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("BlockedExpSettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1194 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v221 = v23.static.settings.blockedExperiencesSettings();
            return (l_game_FastString_1(v221, "Feature.AccountSettings.Heading.BlockedExperiences"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("ExperienceChatSettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1199 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v222 = v23.static.settings.experienceChatSettings();
            return (l_game_FastString_1(v222, "Feature.AccountSettings.Heading.ExperienceChat"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("PartySettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1204 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v223 = v23.static.settings.partySettings();
            return (l_game_FastString_1(v223, "Feature.AccountSettings.Label.Party"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("VoiceSettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1209 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v224 = v23.static.settings.voiceSettings();
            return (l_game_FastString_1(v224, "Feature.AccountSettings.Heading.VoiceChat"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("TradingInventorySettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1214 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v225 = v23.static.settings.tradingInventorySettings();
            return (l_game_FastString_1(v225, "Feature.AccountSettings.Heading.TradingAndInventory"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("FriendsContactsSettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1219 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v226 = v23.static.settings.friendsContactsSettings();
            return (l_game_FastString_1(v226, "Feature.AccountSettings.Heading.FriendsAndContacts"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("PrivateServerSettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1224 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v227 = v23.static.settings.privateServerSettings();
            return (l_game_FastString_1(v227, "Feature.AccountSettings.Heading.PrivateServers"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("VisibilitySettingsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1229 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v228 = v23.static.settings.visibilitySettings();
            return (l_game_FastString_1(v228, "Feature.AccountSettings.Heading.Visibility"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if v40 then
    l_game_FastString_7 = game:GetFastString("ParentalControlsDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1236 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v229 = v23.static.settings.parentalControls();
            return (l_game_FastString_1(v229, "Feature.AccountSettings.Heading.Tab.ParentalControls"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if v41 then
    l_game_FastString_7 = game:GetFastString("AccountInfoDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1243 ]]
            -- upvalues: v23 (copy), l_game_FastString_1 (copy)
            local v230 = v23.static.settings.account();
            return (l_game_FastString_1(v230, "Feature.AccountSettings.Heading.Tab.AccountInfo"));
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
l_game_FastString_7 = game:GetFastString("SpendingSettingsDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_7, 
    function() --[[ Line: 1249 ]]
        -- upvalues: v23 (copy), l_game_FastString_1 (copy)
        local v231 = v23.static.settings.billing();
        return (l_game_FastString_1(v231, "Feature.AccountSettings.Heading.Tab.Billing"));
    end
});
l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
if v42 then
    l_game_FastString_7 = game:GetFastString("DevicePreferencesDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function() --[[ Line: 1255 ]]
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
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if l_GetFFlagEnableSecurityAlertDeeplink_0() then
    l_game_FastString_7 = game:GetFastString("SecurityAlertDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function(v232, _) --[[ Line: 1267 ]]
            -- upvalues: l_GetFFlagGenerateLinkWithChannel_0 (copy), v23 (copy), v10 (copy), v21 (copy)
            if v232.payload and v232.payload ~= "" and v232.username and v232.username ~= "" then
                local v234 = nil;
                v234 = if l_GetFFlagGenerateLinkWithChannel_0() then v23.static.securityAlertWithChannel({
                    payload = v232.payload, 
                    username = v232.username, 
                    channel = v232.channel or ""
                }) else v23.static.securityAlert({
                    payload = v232.payload, 
                    username = v232.username
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
                            detail = v234, 
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
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
l_game_FastString_7 = game:GetFastString("SquadLobbyDeepLinkPattern");
table.insert(v69, {
    l_game_FastString_7, 
    function(v235, _) --[[ Line: 1308 ]]
        -- upvalues: v12 (copy), v10 (copy), l_FFlagEnableSquadDeeplinkWithChatId_0 (copy)
        local v237 = v12.isNotNil(v235.partyid, "partyId");
        return {
            {
                {
                    name = v10.SquadLobby, 
                    detail = v237, 
                    extraProps = if l_FFlagEnableSquadDeeplinkWithChatId_0 then {
                        conversationId = v235.chatid
                    } else nil
                }
            }
        };
    end
});
l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
if l_FFlagEnableCommsFAEUpsell_0 then
    l_game_FastString_7 = game:GetFastString("FAEUpsellOverlayDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function(v238) --[[ Line: 1326 ]]
            -- upvalues: v12 (copy), v70 (copy), v10 (copy)
            local v239 = v70[v12.isNotNil(v238.source, "source")] or "";
            local v240 = v238.is_phase2 == "true";
            return {
                {
                    {
                        name = v10.FAEUpsellOverlay, 
                        extraProps = {
                            source = v239, 
                            isPhase2 = v240
                        }
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    l_game_FastString_7 = game:GetFastString("FAEDeepLinkPattern");
    table.insert(v69, {
        l_game_FastString_7, 
        function(v241) --[[ Line: 1344 ]]
            -- upvalues: v12 (copy), v70 (copy), v10 (copy)
            local v242 = v70[v12.isNotNil(v241.source, "source")] or "";
            return {
                {
                    {
                        name = v10.FAE, 
                        extraProps = {
                            source = v242
                        }
                    }
                }
            };
        end
    });
    l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
l_game_FastString_7 = game:GetFastString("EnterAppFromLockScreenWidget");
table.insert(v69, {
    l_game_FastString_7, 
    function(_, _) --[[ Line: 1356 ]]
        -- upvalues: v17 (copy)
        v17("Default");
        return nil;
    end
});
l_default_0:registerURL((l_game_FastString_7:gsub("%%", "\\")));
return v69;