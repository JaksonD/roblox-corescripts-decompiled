local l_ContentProvider_0 = game:GetService("ContentProvider");
local function v6() --[[ Line: 12 ]] --[[ Name: parseBaseUrlInformation ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    if l_BaseUrl_0:sub(#l_BaseUrl_0) ~= "/" then
        l_BaseUrl_0 = l_BaseUrl_0 .. "/";
    end;
    local _, v3 = l_BaseUrl_0:find("://");
    local v4, v5 = l_BaseUrl_0:find("%.", v3 + 1);
    return l_BaseUrl_0, l_BaseUrl_0:sub(v3 + 1, v4 - 1), (l_BaseUrl_0:sub(v5 + 1));
end;
local function v10(_, _, _) --[[ Line: 34 ]] --[[ Name: preventTableModification ]]
    error("Attempt to modify read-only table");
end;
local function _(v11) --[[ Line: 37 ]] --[[ Name: createReadOnlyTable ]]
    -- upvalues: v10 (copy)
    return (setmetatable({}, {
        __index = v11, 
        __newindex = v10, 
        __metatable = false
    }));
end;
local v13, v14, v15 = v6();
local v16 = string.format("https://api.%s", v15);
local v17 = string.format("https://apis.%s", v15);
local v18 = string.format("https://auth.%s", v15);
local v19 = string.format("https://accountsettings.%s", v15);
local v20 = string.format("https://avatar.%s", v15);
local v21 = string.format("https://catalog.%s", v15);
local v22 = string.format("https://create.%s", v15);
local v23 = string.format("https://inventory.%s", v15);
local v24 = string.format("https://chat.%sv2", v15);
local v25 = string.format("https://friends.%sv1", v15);
local v26 = string.format("https://users.%sv1", v15);
local v27 = string.format("https://assetgame.%s", v15);
local v28 = string.format("https://games.%s", v15);
local v29 = string.format("https://groups.%s", v15);
local v30 = string.format("https://notifications.%s", v15);
local v31 = string.format("https://presence.%sv1", v15);
local v32 = string.format("https://realtime.%s", v15);
local v33 = string.format("https://web.%s", v15);
local v34 = string.format("https://www.%s", v15);
local v35 = string.format("https://ads.%s", v15);
local v36 = string.format("https://adconfiguration.%s", v15);
local v37 = string.format("https://followings.%s", v15);
local v38 = string.format("https://economy.%s", v15);
local v39 = string.format("https://thumbnails.%s", v15);
local v40 = string.format("https://thumbnailsdelivery.%s", v15);
local v41 = string.format("https://accountsettings.%s", v15);
local v42 = string.format("https://premiumfeatures.%s", v15);
local v43 = string.format("https://locale.%s", v15);
local v44 = string.format("https://badges.%s", v15);
local v45 = string.format("https://metrics.%sv1", v15);
local v46 = string.format("https://apis.rcs.%s", v15);
local v47 = string.format("https://discussions.%s", v15);
local v48 = string.format("https://contacts.%s", v15);
local v49 = string.format("https://search.%s", v15);
local v50 = string.format("https://static.%s", v15);
local v51 = string.format("https://gamesearchuitreatments.api.%s", v15);
local v52 = string.format("https://economycreatorstats.%s", v15);
local v53 = string.format("https://usermoderation.%s", v15);
local v54 = string.gsub(v13, "http://", "https://");
local v55 = string.format("https://voice.%s", v15);
local v56 = string.format("https://translations.%s", v15);
local v57 = string.format("https://twostepverification.%s", v15);
local v58 = string.format("https://privatemessages.%sv1", v15);
local l_v50_0 = v50;
if v15 == "roblox.com/" then
    l_v50_0 = string.gsub(l_v50_0, v15, "rbxcdn.com/");
end;
return (setmetatable({}, {
    __index = {
        DOMAIN = v15, 
        PREFIX = v14, 
        BASE_URL = v54, 
        BASE_URL_SECURE = v54, 
        API_URL = v16, 
        APIS_URL = v17, 
        AUTH_URL = v18, 
        ACCOUNT_SETTINGS_URL = v19, 
        AVATAR_URL = v20, 
        CATALOG_URL = v21, 
        CREATOR_HUB_URL = v22, 
        INVENTORY_URL = v23, 
        GAME_URL = v28, 
        GAME_ASSET_URL = v27, 
        GROUPS_URL = v29, 
        CHAT_URL = v24, 
        FRIEND_URL = v25, 
        USERS_URL = v26, 
        PRESENCE_URL = v31, 
        NOTIFICATION_URL = v30, 
        REALTIME_URL = v32, 
        WEB_URL = v33, 
        WWW_URL = v34, 
        ADS_URL = v35, 
        AD_CONFIGURATION_URL = v36, 
        SEARCH_URL = v49, 
        GAME_SEARCH_UI_TREATMENTS = v51, 
        FOLLOWINGS_URL = v37, 
        ECONOMY_URL = v38, 
        THUMBNAILS_URL = v39, 
        THUMBNAILSDELIVERY_URL = v40, 
        BADGES_URL = v44, 
        ACCOUNT_SETTINGS = v41, 
        PREMIUM_FEATURES = v42, 
        LOCALE = v43, 
        METRICS_URL = v45, 
        APIS_RCS_URL = v46, 
        DISCUSSIONS_URL = v47, 
        CONTACTS_URL = v48, 
        STATIC_URL = v50, 
        STATIC_CDN_URL = l_v50_0, 
        BLOG_URL = "https://blog.roblox.com/", 
        CORP_URL = "https://corp.roblox.com/", 
        STORE_URL = "https://www.amazon.com/roblox", 
        ECNOMY_CREATOR_STATS = v52, 
        USER_MODERATION_URL = v53, 
        VOICE_URL = v55, 
        TRANSLATIONS_URL = v56, 
        TWOSTEPVERIFICATION_URL = v57, 
        PRIVATEMESSAGES_URL = v58, 
        getUserProfileUrl = function(v60, v61) --[[ Line: 153 ]] --[[ Name: getUserProfileUrl ]]
            return string.format("%susers/%s/profile", v60.BASE_URL, v61);
        end, 
        getUserFriendsUrl = function(v62, v63) --[[ Line: 157 ]] --[[ Name: getUserFriendsUrl ]]
            return string.format("%susers/%s/friends", v62.BASE_URL, v63);
        end, 
        getUserInventoryUrl = function(v64, v65) --[[ Line: 161 ]] --[[ Name: getUserInventoryUrl ]]
            return string.format("%susers/%s/inventory", v64.BASE_URL, v65);
        end, 
        getPlaceDefaultThumbnailUrl = function(v66, v67, v68, v69) --[[ Line: 165 ]] --[[ Name: getPlaceDefaultThumbnailUrl ]]
            return string.format("%sThumbs/Asset.ashx?width=%d&height=%d&assetId=%s&ignorePlaceMediaItems=true", v66.BASE_URL, v68, v69, (tostring(v67)));
        end, 
        isVanitySite = function(v70) --[[ Line: 175 ]] --[[ Name: isVanitySite ]]
            return v70.PREFIX ~= "www";
        end, 
        makeQueryString = function(_, v72) --[[ Line: 180 ]] --[[ Name: makeQueryString ]]
            local v73 = {};
            for v74, v75 in pairs(v72) do
                if v75 ~= nil then
                    if type(v75) == "table" then
                        for v76 = 1, #v75 do
                            table.insert(v73, v74 .. "=" .. v75[v76]);
                        end;
                    else
                        table.insert(v73, v74 .. "=" .. tostring(v75));
                    end;
                end;
            end;
            return table.concat(v73, "&");
        end, 
        stripHttpsAndTrailingSlash = function(v77) --[[ Line: 203 ]] --[[ Name: stripHttpsAndTrailingSlash ]]
            return (string.gsub(string.gsub(v77, "^https://", ""), "/*$", ""));
        end
    }, 
    __newindex = v10, 
    __metatable = false
}));