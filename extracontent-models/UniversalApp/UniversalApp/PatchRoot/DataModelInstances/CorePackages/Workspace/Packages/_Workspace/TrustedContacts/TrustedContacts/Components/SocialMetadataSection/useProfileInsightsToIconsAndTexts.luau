local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local l_FriendRequestOriginSource_0 = require(l_Parent_0.ApolloProfileInsights).Enums.FriendRequestOriginSource;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_Icon_0 = require(l_Parent_0.BuilderIcons).Icon;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v9 = game:DefineFastFlag("MutualFriendRenameFix", false);
local v10 = {
    mutualFriends = l_Icon_0.TwoPeople, 
    friendshipAgeUnixSeconds = l_Icon_0.Calendar, 
    qrCode = l_Icon_0.SquaresGridQr, 
    search = l_Icon_0.MagnifyingGlass, 
    contacts = l_Icon_0.SmartphonePortrait, 
    accountCreationDateUnixSeconds = l_Icon_0.CircleI, 
    localizedCountryName = l_Icon_0.GlobeDetailed
};
local function _(v11, v12) --[[ Line: 41 ]]
    -- upvalues: l_FriendRequestOriginSource_0 (copy), v10 (copy)
    if v11 == "friendRequestOriginSource" then
        local v13 = nil;
        if v12 == l_FriendRequestOriginSource_0.QrCode then
            v13 = "qrCode";
        elseif v12 == l_FriendRequestOriginSource_0.PhoneContactImporter then
            v13 = "contacts";
        elseif v12 == l_FriendRequestOriginSource_0.PlayerSearch then
            v13 = "search";
        end;
        return v10[v13];
    else
        return v10[v11];
    end;
end;
local function v19(v15, v16, v17) --[[ Line: 57 ]]
    -- upvalues: l_FriendRequestOriginSource_0 (copy)
    local v18 = nil;
    if v15 == "friendshipAgeUnixSeconds" then
        return v17.connectedDuration;
    else
        if v15 == "friendRequestOriginSource" then
            if v16 == l_FriendRequestOriginSource_0.QrCode then
                return v17.fromQrCode;
            elseif v16 == l_FriendRequestOriginSource_0.PhoneContactImporter then
                return v17.fromContacts;
            elseif v16 == l_FriendRequestOriginSource_0.PlayerSearch then
                return v17.fromSearch;
            end;
        elseif v15 == "mutualFriends" then
            if #v16 > 1 then
                return v17.mutualConnections;
            elseif #v16 == 1 then
                return v17.singularMutualConnection;
            end;
        elseif v15 == "localizedCountryName" then
            return v16;
        elseif v15 == "accountCreationDateUnixSeconds" then
            v18 = v17.joinedInYear;
        end;
        return v18;
    end;
end;
return function(v20) --[[ Line: 86 ]] --[[ Name: useProfileInsightsToIconsAndTexts ]]
    -- upvalues: v3 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_LocalizationService_0 (copy), l_useLocalization_0 (copy), v9 (copy), l_FriendRequestOriginSource_0 (copy), v10 (copy), v19 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v26 = v3.useMemo(function() --[[ Line: 89 ]]
        -- upvalues: v20 (copy), l_FFlagConnectionsToFriendsRename_0 (ref)
        if v20.friendshipAgeUnixSeconds then
            local v21 = DateTime.now().UnixTimestamp - v20.friendshipAgeUnixSeconds or 0;
            local v22 = math.floor(v21 / 31536000);
            local v23 = math.floor(v21 / 2592000);
            local v24 = math.floor(v21 / 86400);
            local _ = nil;
            if v22 > 1 then
                return {
                    "Feature.Friends.Label.ConnectedNumYears"; 
                    num = v22
                };
            elseif v22 == 1 then
                return "Feature.Friends.Label.ConnectedOneYear";
            elseif v23 > 1 then
                return {
                    "Feature.Friends.Label.ConnectedNumMonths"; 
                    num = v23
                };
            elseif v23 == 1 then
                return "Feature.Friends.Label.ConnectedOneMonth";
            elseif v24 > 1 then
                return {
                    "Feature.Friends.Label.ConnectedNumDays"; 
                    num = v24
                };
            elseif v24 == 1 then
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
        v20.friendshipAgeUnixSeconds
    });
    local v27 = DateTime.fromUnixTimestamp(v20.accountCreationDateUnixSeconds or 0):FormatLocalTime("YYYY", l_LocalizationService_0.RobloxLocaleId);
    local v28 = l_useLocalization_0({
        singularMutualConnection = v9 and "Feature.Friends.Label.MutualFriendTitle" or l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.SingularMutualFriend" or "Feature.Friends.Label.MutualConnection", 
        mutualConnections = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.MutualFriendsTitle" or "Feature.Friends.Label.MutualConnections"; 
            numConnections = v20.mutualFriends and #v20.mutualFriends or 0
        }, 
        joinedInYear = {
            "Feature.Friends.Label.JoinedInYear"; 
            year = v27
        }, 
        connectedDuration = v26, 
        fromQrCode = "Feature.Friends.Description.FromQrCode", 
        fromContacts = "Feature.Friends.Description.FromContacts", 
        fromSearch = "Feature.PlayerSearchResults.Label.FromSearch"
    });
    local v29 = {};
    return v3.useMemo(function() --[[ Line: 143 ]]
        -- upvalues: v20 (copy), l_FriendRequestOriginSource_0 (ref), v10 (ref), v19 (ref), v28 (copy), v29 (copy)
        for v30, v31 in v20 do
            local v32;
            if v30 == "friendRequestOriginSource" then
                local v33 = nil;
                if v31 == l_FriendRequestOriginSource_0.QrCode then
                    v33 = "qrCode";
                elseif v31 == l_FriendRequestOriginSource_0.PhoneContactImporter then
                    v33 = "contacts";
                elseif v31 == l_FriendRequestOriginSource_0.PlayerSearch then
                    v33 = "search";
                end;
                v32 = v10[v33];
            else
                v32 = v10[v30];
            end;
            local v34 = v19(v30, v31, v28);
            if v32 and v34 then
                table.insert(v29, {
                    icon = v32, 
                    text = v34
                });
            end;
        end;
        return v29;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v28, 
        v20
    } else l_dependencyArray_0(v28, v20));
end;