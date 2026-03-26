local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local l_FriendRequestOriginSource_0 = require(l_Parent_0.ApolloProfileInsights).Enums.FriendRequestOriginSource;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_Icon_0 = require(l_Parent_0.BuilderIcons).Icon;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v8 = {
    mutualFriends = l_Icon_0.TwoPeople, 
    friendshipAgeUnixSeconds = l_Icon_0.Calendar, 
    qrCode = l_Icon_0.SquaresGridQr, 
    search = l_Icon_0.MagnifyingGlass, 
    contacts = l_Icon_0.SmartphonePortrait, 
    accountCreationDateUnixSeconds = l_Icon_0.CircleI, 
    localizedCountryName = l_Icon_0.GlobeDetailed
};
local function _(v9, v10) --[[ Line: 37 ]]
    -- upvalues: l_FriendRequestOriginSource_0 (copy), v8 (copy)
    if v9 == "friendRequestOriginSource" then
        local v11 = nil;
        if v10 == l_FriendRequestOriginSource_0.QrCode then
            v11 = "qrCode";
        elseif v10 == l_FriendRequestOriginSource_0.PhoneContactImporter then
            v11 = "contacts";
        elseif v10 == l_FriendRequestOriginSource_0.PlayerSearch then
            v11 = "search";
        end;
        return v8[v11];
    else
        return v8[v9];
    end;
end;
local function v17(v13, v14, v15) --[[ Line: 53 ]]
    -- upvalues: l_FriendRequestOriginSource_0 (copy)
    local v16 = nil;
    if v13 == "friendshipAgeUnixSeconds" then
        return v15.connectedDuration;
    else
        if v13 == "friendRequestOriginSource" then
            if v14 == l_FriendRequestOriginSource_0.QrCode then
                return v15.fromQrCode;
            elseif v14 == l_FriendRequestOriginSource_0.PhoneContactImporter then
                return v15.fromContacts;
            elseif v14 == l_FriendRequestOriginSource_0.PlayerSearch then
                return v15.fromSearch;
            end;
        elseif v13 == "mutualFriends" then
            if #v14 > 1 then
                return v15.mutualConnections;
            elseif #v14 == 1 then
                return v15.singularMutualConnection;
            end;
        elseif v13 == "localizedCountryName" then
            return v14;
        elseif v13 == "accountCreationDateUnixSeconds" then
            v16 = v15.joinedInYear;
        end;
        return v16;
    end;
end;
return function(v18) --[[ Line: 82 ]] --[[ Name: useProfileInsightsToIconsAndTexts ]]
    -- upvalues: v3 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_LocalizationService_0 (copy), l_useLocalization_0 (copy), l_FriendRequestOriginSource_0 (copy), v8 (copy), v17 (copy), l_dependencyArray_0 (copy)
    local v24 = v3.useMemo(function() --[[ Line: 85 ]]
        -- upvalues: v18 (copy), l_FFlagConnectionsToFriendsRename_0 (ref)
        if v18.friendshipAgeUnixSeconds then
            local v19 = DateTime.now().UnixTimestamp - v18.friendshipAgeUnixSeconds or 0;
            local v20 = math.floor(v19 / 31536000);
            local v21 = math.floor(v19 / 2592000);
            local v22 = math.floor(v19 / 86400);
            local _ = nil;
            if v20 > 1 then
                return {
                    "Feature.Friends.Label.ConnectedNumYears"; 
                    num = v20
                };
            elseif v20 == 1 then
                return "Feature.Friends.Label.ConnectedOneYear";
            elseif v21 > 1 then
                return {
                    "Feature.Friends.Label.ConnectedNumMonths"; 
                    num = v21
                };
            elseif v21 == 1 then
                return "Feature.Friends.Label.ConnectedOneMonth";
            elseif v22 > 1 then
                return {
                    "Feature.Friends.Label.ConnectedNumDays"; 
                    num = v22
                };
            elseif v22 == 1 then
                return "Feature.Friends.Label.ConnectedOneDay";
            elseif l_FFlagConnectionsToFriendsRename_0 then
                return "Feature.Friends.Label.NewFriend";
            else
                return "Feature.Friends.Label.NewConnection";
            end;
        else
            return nil;
        end;
    end, {
        v18.friendshipAgeUnixSeconds
    });
    local v25 = DateTime.fromUnixTimestamp(v18.accountCreationDateUnixSeconds or 0):FormatLocalTime("YYYY", l_LocalizationService_0.RobloxLocaleId);
    local v26 = l_useLocalization_0({
        singularMutualConnection = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.SingularMutualFriend" or "Feature.Friends.Label.MutualConnection", 
        mutualConnections = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.MutualFriendsTitle" or "Feature.Friends.Label.MutualConnections"; 
            numConnections = v18.mutualFriends and #v18.mutualFriends or 0
        }, 
        joinedInYear = {
            "Feature.Friends.Label.JoinedInYear"; 
            year = v25
        }, 
        connectedDuration = v24, 
        fromQrCode = "Feature.Friends.Description.FromQrCode", 
        fromContacts = "Feature.Friends.Description.FromContacts", 
        fromSearch = "Feature.PlayerSearchResults.Label.FromSearch"
    });
    local v27 = {};
    return v3.useMemo(function() --[[ Line: 137 ]]
        -- upvalues: v18 (copy), l_FriendRequestOriginSource_0 (ref), v8 (ref), v17 (ref), v26 (copy), v27 (copy)
        for v28, v29 in v18 do
            local v30;
            if v28 == "friendRequestOriginSource" then
                local v31 = nil;
                if v29 == l_FriendRequestOriginSource_0.QrCode then
                    v31 = "qrCode";
                elseif v29 == l_FriendRequestOriginSource_0.PhoneContactImporter then
                    v31 = "contacts";
                elseif v29 == l_FriendRequestOriginSource_0.PlayerSearch then
                    v31 = "search";
                end;
                v30 = v8[v31];
            else
                v30 = v8[v28];
            end;
            local v32 = v17(v28, v29, v26);
            if v30 and v32 then
                table.insert(v27, {
                    icon = v30, 
                    text = v32
                });
            end;
        end;
        return v27;
    end, l_dependencyArray_0(v26, v18));
end;