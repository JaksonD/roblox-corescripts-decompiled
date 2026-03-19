local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local l_FriendRequestOriginSource_0 = require(l_Parent_0.ApolloProfileInsights).Enums.FriendRequestOriginSource;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_Icon_0 = require(l_Parent_0.BuilderIcons).Icon;
local v7 = {
    mutualFriends = l_Icon_0.TwoPeople, 
    friendshipAgeUnixSeconds = l_Icon_0.Calendar, 
    qrCode = l_Icon_0.SquaresGridQr, 
    search = l_Icon_0.MagnifyingGlass, 
    contacts = l_Icon_0.SmartphonePortrait, 
    accountCreationDateUnixSeconds = l_Icon_0.CircleI, 
    localizedCountryName = l_Icon_0.GlobeDetailed
};
local function _(v8, v9) --[[ Line: 35 ]]
    -- upvalues: l_FriendRequestOriginSource_0 (copy), v7 (copy)
    if v8 == "friendRequestOriginSource" then
        local v10 = nil;
        if v9 == l_FriendRequestOriginSource_0.QrCode then
            v10 = "qrCode";
        elseif v9 == l_FriendRequestOriginSource_0.PhoneContactImporter then
            v10 = "contacts";
        elseif v9 == l_FriendRequestOriginSource_0.PlayerSearch then
            v10 = "search";
        end;
        return v7[v10];
    else
        return v7[v8];
    end;
end;
local function v16(v12, v13, v14) --[[ Line: 51 ]]
    -- upvalues: l_FriendRequestOriginSource_0 (copy)
    local v15 = nil;
    if v12 == "friendshipAgeUnixSeconds" then
        return v14.connectedDuration;
    else
        if v12 == "friendRequestOriginSource" then
            if v13 == l_FriendRequestOriginSource_0.QrCode then
                return v14.fromQrCode;
            elseif v13 == l_FriendRequestOriginSource_0.PhoneContactImporter then
                return v14.fromContacts;
            elseif v13 == l_FriendRequestOriginSource_0.PlayerSearch then
                return v14.fromSearch;
            end;
        elseif v12 == "mutualFriends" then
            if #v13 > 1 then
                return v14.mutualConnections;
            elseif #v13 == 1 then
                return v14.singularMutualConnection;
            end;
        elseif v12 == "localizedCountryName" then
            return v13;
        elseif v12 == "accountCreationDateUnixSeconds" then
            v15 = v14.joinedInYear;
        end;
        return v15;
    end;
end;
return function(v17) --[[ Line: 80 ]] --[[ Name: useProfileInsightsToIconsAndTexts ]]
    -- upvalues: v3 (copy), l_LocalizationService_0 (copy), l_useLocalization_0 (copy), l_FriendRequestOriginSource_0 (copy), v7 (copy), v16 (copy), l_dependencyArray_0 (copy)
    local v23 = v3.useMemo(function() --[[ Line: 83 ]]
        -- upvalues: v17 (copy)
        if v17.friendshipAgeUnixSeconds then
            local v18 = DateTime.now().UnixTimestamp - v17.friendshipAgeUnixSeconds or 0;
            local v19 = math.floor(v18 / 31536000);
            local v20 = math.floor(v18 / 2592000);
            local v21 = math.floor(v18 / 86400);
            local _ = nil;
            if v19 > 1 then
                return {
                    "Feature.Friends.Label.ConnectedNumYears"; 
                    num = v19
                };
            elseif v19 == 1 then
                return "Feature.Friends.Label.ConnectedOneYear";
            elseif v20 > 1 then
                return {
                    "Feature.Friends.Label.ConnectedNumMonths"; 
                    num = v20
                };
            elseif v20 == 1 then
                return "Feature.Friends.Label.ConnectedOneMonth";
            elseif v21 > 1 then
                return {
                    "Feature.Friends.Label.ConnectedNumDays"; 
                    num = v21
                };
            elseif v21 == 1 then
                return "Feature.Friends.Label.ConnectedOneDay";
            else
                return "Feature.Friends.Label.NewConnection";
            end;
        else
            return nil;
        end;
    end, {
        v17.friendshipAgeUnixSeconds
    });
    local v24 = DateTime.fromUnixTimestamp(v17.accountCreationDateUnixSeconds or 0):FormatLocalTime("YYYY", l_LocalizationService_0.RobloxLocaleId);
    local v25 = l_useLocalization_0({
        singularMutualConnection = "Feature.Friends.Label.MutualConnection", 
        mutualConnections = {
            "Feature.Friends.Label.MutualConnections"; 
            numConnections = v17.mutualFriends and #v17.mutualFriends or 0
        }, 
        joinedInYear = {
            "Feature.Friends.Label.JoinedInYear"; 
            year = v24
        }, 
        connectedDuration = v23, 
        fromQrCode = "Feature.Friends.Description.FromQrCode", 
        fromContacts = "Feature.Friends.Description.FromContacts", 
        fromSearch = "Feature.PlayerSearchResults.Label.FromSearch"
    });
    local v26 = {};
    return v3.useMemo(function() --[[ Line: 129 ]]
        -- upvalues: v17 (copy), l_FriendRequestOriginSource_0 (ref), v7 (ref), v16 (ref), v25 (copy), v26 (copy)
        for v27, v28 in v17 do
            local v29;
            if v27 == "friendRequestOriginSource" then
                local v30 = nil;
                if v28 == l_FriendRequestOriginSource_0.QrCode then
                    v30 = "qrCode";
                elseif v28 == l_FriendRequestOriginSource_0.PhoneContactImporter then
                    v30 = "contacts";
                elseif v28 == l_FriendRequestOriginSource_0.PlayerSearch then
                    v30 = "search";
                end;
                v29 = v7[v30];
            else
                v29 = v7[v27];
            end;
            local v31 = v16(v27, v28, v25);
            if v29 and v31 then
                table.insert(v26, {
                    icon = v29, 
                    text = v31
                });
            end;
        end;
        return v26;
    end, l_dependencyArray_0(v25, v17));
end;