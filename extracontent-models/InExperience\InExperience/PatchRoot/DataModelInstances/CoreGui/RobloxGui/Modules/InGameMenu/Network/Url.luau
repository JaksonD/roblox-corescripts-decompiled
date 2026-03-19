local l_ContentProvider_0 = game:GetService("ContentProvider");
local function v6() --[[ Line: 11 ]] --[[ Name: parseBaseUrlInformation ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    if l_BaseUrl_0:sub(#l_BaseUrl_0) ~= "/" then
        l_BaseUrl_0 = l_BaseUrl_0 .. "/";
    end;
    local _, v3 = l_BaseUrl_0:find("://");
    local v4, v5 = l_BaseUrl_0:find("%.", v3 + 1);
    return l_BaseUrl_0, l_BaseUrl_0:sub(v3 + 1, v4 - 1), (l_BaseUrl_0:sub(v5 + 1));
end;
local function v10(_, _, _) --[[ Line: 33 ]] --[[ Name: preventTableModification ]]
    error("Attempt to modify read-only table");
end;
local function _(v11) --[[ Line: 36 ]] --[[ Name: createReadOnlyTable ]]
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
local v22 = string.format("https://chat.%sv2", v15);
local v23 = string.format("https://create.%s", v15);
local v24 = string.format("https://friends.%sv1", v15);
local v25 = string.format("https://assetgame.%s", v15);
local v26 = string.format("https://games.%s", v15);
local v27 = string.format("https://notifications.%s", v15);
local v28 = string.format("https://presence.%sv1", v15);
local v29 = string.format("https://realtime.%s", v15);
local v30 = string.format("https://web.%s", v15);
local v31 = string.format("https://www.%s", v15);
local v32 = string.format("https://ads.%s", v15);
local v33 = string.format("https://followings.%s", v15);
local v34 = string.format("https://economy.%s", v15);
local v35 = string.format("https://thumbnails.%s", v15);
local v36 = string.format("https://accountsettings.%s", v15);
local v37 = string.format("https://premiumfeatures.%s", v15);
local v38 = string.format("https://locale.%s", v15);
local v39 = string.format("https://badges.%s", v15);
local v40 = string.format("https://metrics.%sv1", v15);
local v41 = string.format("https://apis.rcs.%s", v15);
local v42 = string.format("https://discussions.%s", v15);
local v43 = string.gsub(v13, "http://", "https://");
local v44 = string.format("https://gameinternationalization.%s", v15);
return (setmetatable({}, {
    __index = {
        DOMAIN = v15, 
        PREFIX = v14, 
        BASE_URL = v13, 
        BASE_URL_SECURE = v43, 
        API_URL = v16, 
        APIS_URL = v17, 
        AUTH_URL = v18, 
        ACCOUNT_SETTINGS_URL = v19, 
        AVATAR_URL = v20, 
        CATALOG_URL = v21, 
        CREATOR_HUB_URL = v23, 
        GAME_URL = v26, 
        GAME_ASSET_URL = v25, 
        CHAT_URL = v22, 
        FRIEND_URL = v24, 
        PRESENCE_URL = v28, 
        NOTIFICATION_URL = v27, 
        REALTIME_URL = v29, 
        WEB_URL = v30, 
        WWW_URL = v31, 
        ADS_URL = v32, 
        FOLLOWINGS_URL = v33, 
        ECONOMY_URL = v34, 
        THUMBNAILS_URL = v35, 
        BADGES_URL = v39, 
        ACCOUNT_SETTINGS = v36, 
        PREMIUM_FEATURES = v37, 
        LOCALE = v38, 
        METRICS_URL = v40, 
        APIS_RCS_URL = v41, 
        DISCUSSIONS_URL = v42, 
        BLOG_URL = "https://blog.roblox.com/", 
        CORP_URL = "https://corp.roblox.com/", 
        GAME_I18N_URL = v44, 
        getUserProfileUrl = function(v45, v46) --[[ Line: 117 ]] --[[ Name: getUserProfileUrl ]]
            return string.format("%susers/%s/profile", v45.BASE_URL, v46);
        end, 
        getUserFriendsUrl = function(v47, v48) --[[ Line: 121 ]] --[[ Name: getUserFriendsUrl ]]
            return string.format("%susers/%s/friends", v47.BASE_URL, v48);
        end, 
        getUserInventoryUrl = function(v49, v50) --[[ Line: 125 ]] --[[ Name: getUserInventoryUrl ]]
            return string.format("%susers/%s/inventory", v49.BASE_URL, v50);
        end, 
        getPlaceDefaultThumbnailUrl = function(v51, v52, v53, v54) --[[ Line: 129 ]] --[[ Name: getPlaceDefaultThumbnailUrl ]]
            return string.format("%sThumbs/Asset.ashx?width=%d&height=%d&assetId=%s&ignorePlaceMediaItems=true", v51.BASE_URL, v53, v54, (tostring(v52)));
        end, 
        isVanitySite = function(v55) --[[ Line: 138 ]] --[[ Name: isVanitySite ]]
            return v55.PREFIX ~= "www";
        end, 
        makeQueryString = function(_, v57) --[[ Line: 143 ]] --[[ Name: makeQueryString ]]
            local v58 = {};
            for v59, v60 in pairs(v57) do
                if v60 ~= nil then
                    if type(v60) == "table" then
                        for v61 = 1, #v60 do
                            table.insert(v58, v59 .. "=" .. v60[v61]);
                        end;
                    else
                        table.insert(v58, v59 .. "=" .. tostring(v60));
                    end;
                end;
            end;
            return table.concat(v58, "&");
        end
    }, 
    __newindex = v10, 
    __metatable = false
}));