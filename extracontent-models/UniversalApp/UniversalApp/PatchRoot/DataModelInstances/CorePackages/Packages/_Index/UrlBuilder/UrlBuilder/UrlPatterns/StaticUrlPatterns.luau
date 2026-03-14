game:DefineFastFlag("EnableShopGiftCardsURL", false);
return function(v0) --[[ Line: 3 ]]
    local function _() --[[ Line: 4 ]] --[[ Name: isQQ ]]
        -- upvalues: v0 (copy)
        return string.find(v0.fromString("corp:")(), "qq.com");
    end;
    return {
        catalog = v0.fromString("www:catalog"), 
        buildersClub = v0.fromString("www:mobile-app-upgrades/native-ios/bc"), 
        trades = v0.fromString("www:trades"), 
        profile = v0.fromString("www:users/profile"), 
        friends = v0.fromString("www:users/friends"), 
        groups = v0.fromString("www:my/communities"), 
        inventory = v0.fromString("www:users/inventory"), 
        messages = v0.fromString("www:my/messages"), 
        feed = v0.fromString("www:feeds/inapp"), 
        develop = v0.fromString("www:develop"), 
        creatorHub = v0.fromString("create:"), 
        blog = v0.fromString("blog:"), 
        giftCards = function(v2) --[[ Line: 21 ]] --[[ Name: giftCards ]]
            -- upvalues: v0 (copy)
            local v3 = v2 or "";
            local v4 = "www:giftcards?ref={source}";
            if game:GetFastFlag("EnableShopGiftCardsURL") then
                v4 = "www:shopgiftcards?ref={source}";
            end;
            return v0.fromString(v4)({
                source = v3
            });
        end, 
        giftCardsWithRedeem = function(v5, v6) --[[ Line: 29 ]] --[[ Name: giftCardsWithRedeem ]]
            -- upvalues: v0 (copy)
            if v6 and v6 ~= "" then
                local v7 = "www:giftcards-" .. v6 .. "?ref={source}";
                return v0.fromString(v7)({
                    source = v5
                });
            else
                return v0.fromString("www:shopgiftcards?ref={source}")({
                    source = v5
                });
            end;
        end, 
        redeem = v0.fromString("www:redeem"), 
        amazonStore = v0.fromString("https://www.amazon.com/roblox"), 
        help = v0.fromString(string.find(v0.fromString("corp:")(), "qq.com") and "corp:faq" or "www:help"), 
        appealsPortal = {
            main = v0.fromString("www:report-appeals?t_source={source|app}"), 
            violation = v0.fromString("www:report-appeals?vid={id}&t_source={source|app}")
        }, 
        email = {
            getSetEmail = v0.fromString("accountSettings:v1/email"), 
            sendVerificationEmail = v0.fromString("accountSettings:v1/email/verify")
        }, 
        about = {
            us = function(v8) --[[ Line: 53 ]] --[[ Name: us ]]
                -- upvalues: v0 (copy)
                local v9 = v8 or "";
                return v0.fromString("www:info/about-us?locale={localeCode}")({
                    localeCode = v9
                });
            end, 
            careers = function(v10) --[[ Line: 57 ]] --[[ Name: careers ]]
                -- upvalues: v0 (copy)
                if string.find(v0.fromString("corp:")(), "qq.com") then
                    return v0.fromString("corp:careers.html");
                else
                    local v11 = v10 or "";
                    return v0.fromString("www:info/jobs?locale={localeCode}")({
                        localeCode = v11
                    });
                end;
            end, 
            parents = function(v12) --[[ Line: 65 ]] --[[ Name: parents ]]
                -- upvalues: v0 (copy)
                local v13 = v12 or "";
                return v0.fromString("www:info/parents?locale={localeCode}")({
                    localeCode = v13
                });
            end, 
            terms = function(v14) --[[ Line: 69 ]] --[[ Name: terms ]]
                -- upvalues: v0 (copy)
                if string.find(v0.fromString("corp:")(), "qq.com") and v14.useGameQQUrls then
                    return v0.fromString("https://game.qq.com/contract.shtml")();
                else
                    return v0.fromString("www:info/terms")();
                end;
            end, 
            privacy = function(v15) --[[ Line: 76 ]] --[[ Name: privacy ]]
                -- upvalues: v0 (copy)
                if string.find(v0.fromString("corp:")(), "qq.com") and v15.useGameQQUrls then
                    return v0.fromString("https://game.qq.com/privacy_guide.shtml")();
                else
                    return v0.fromString("www:info/privacy")();
                end;
            end, 
            guidelines = v0.fromString("www:info/community-guidelines"), 
            support = v0.fromString("www:support")
        }, 
        settings = {
            account = v0.fromString("www:my/account#!/info"), 
            security = v0.fromString("www:my/account#!/security"), 
            privacy = v0.fromString("www:my/account#!/privacy"), 
            parentalControls = v0.fromString("www:my/account#!/parental-controls"), 
            billing = v0.fromString("www:my/account#!/billing"), 
            subscriptions = v0.fromString("www:my/account#!/subscriptions"), 
            notifications = v0.fromString("www:my/account#!/notifications"), 
            appPermissions = v0.fromString("www:my/account#!/app-permissions"), 
            screentimeSettings = v0.fromString("www:my/account#!/privacy/Screentime"), 
            blockedExperiencesSettings = v0.fromString("www:my/account#!/privacy/ContentRestrictions/BlockedExperiences"), 
            blockedUsersSettings = v0.fromString("www:my/account#!/privacy/BlockedUsers"), 
            experienceChatSettings = v0.fromString("www:my/account#!/privacy/Communication/ExperienceChat"), 
            partySettings = v0.fromString("www:my/account#!/privacy/Communication/Party"), 
            communicationSettings = v0.fromString("www:my/account#!/privacy/Communication"), 
            voiceSettings = v0.fromString("www:my/account#!/privacy/Communication/Voice"), 
            tradingInventorySettings = v0.fromString("www:my/account#!/privacy/TradingAndInventory"), 
            friendsContactsSettings = v0.fromString("www:my/account#!/privacy/FriendsAndContacts"), 
            privateServerSettings = v0.fromString("www:my/account#!/privacy/VisibilityAndPrivateServers/PrivateServerPrivacy"), 
            visibilitySettings = v0.fromString("www:my/account#!/privacy/VisibilityAndPrivateServers/Visibility")
        }, 
        tencent = {
            childrenPrivacyGuide = v0.fromString("https://game.qq.com/privacy_guide_children.shtml"), 
            luobuRiderTerms = v0.fromString("https://roblox.qq.com/web201904/newsdetail.html?newsid=12429812"), 
            reputationInfo = v0.fromString("https://gamecredit.qq.com/static/games/index.htm"), 
            luobuThirdPartyDataUse = v0.fromString("https://game.qq.com/zlkdatasys/privacy_SDK.html")
        }, 
        idVerification = {
            verify = v0.fromString("www:id-verification/verify"), 
            getAge = v0.fromString("apis:age-verification-service/v1/age-verification/get-verified-age")
        }, 
        notifications = {
            clearUnread = v0.fromString("notifications:stream-notifications/clear-unread"), 
            unreadCount = v0.fromString("notifications:stream-notifications/unread-count")
        }, 
        securityAlert = v0.fromString("www:security-feedback?payload={payload}&username={username}"), 
        securityAlertWithChannel = v0.fromString("www:security-feedback?payload={payload}&username={username}&channel={channel}")
    };
end;