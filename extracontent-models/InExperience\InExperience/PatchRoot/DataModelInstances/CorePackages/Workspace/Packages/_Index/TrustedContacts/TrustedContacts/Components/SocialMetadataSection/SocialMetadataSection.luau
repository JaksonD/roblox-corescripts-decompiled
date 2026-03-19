local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserProfiles);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_Parent_0.GraphQLServer);
local v6 = require(l_Parent_0.ApolloProfileInsights);
local l_useProfileInsightsByUserIds_0 = v6.Hooks.useProfileInsightsByUserIds;
local l_getProfileInsightsByUserIdFromData_0 = v6.Selectors.getProfileInsightsByUserIdFromData;
local v9 = require(l_script_FirstAncestor_0.Utils.isCustomNil);
local v10 = require(l_Parent_0.Foundation);
local l_Skeleton_0 = v10.Skeleton;
local l_View_0 = v10.View;
local l_UserTile_0 = require(l_Parent_0.UserTile).UserTile;
local l_LayoutMode_0 = require(l_Parent_0.UserTile).LayoutMode;
local v15 = require(script.Parent.SocialMetadataIconsAndTextsSection);
local l_useSignalProfileInsightsByUserId_0 = require(l_Parent_0.ProfileInsights).useSignalProfileInsightsByUserId;
local l_FFlagProfilePlatformAddTC_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformAddTC;
local l_GetFFlagEnableProfileInsightsApolloMigration_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableProfileInsightsApolloMigration;
return function(v19) --[[ Line: 35 ]]
    -- upvalues: v3 (copy), l_GetFFlagEnableProfileInsightsApolloMigration_0 (copy), l_useSignalProfileInsightsByUserId_0 (copy), l_useProfileInsightsByUserIds_0 (copy), l_getProfileInsightsByUserIdFromData_0 (copy), v9 (copy), l_useLocalization_0 (copy), v2 (copy), v10 (copy), l_View_0 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), l_Skeleton_0 (copy), l_FFlagProfilePlatformAddTC_0 (copy), v15 (copy)
    local v20 = v3.Hooks.useUserProfilesFetch({
        userIds = {
            v19.userId
        }, 
        query = v3.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v21 = "";
    local v22 = "";
    if v20 and v20.data then
        v21 = v3.Selectors.getCombinedNameFromId(v20.data, v19.userId) or "";
        v22 = v3.Selectors.getUsernameFromId(v20.data, v19.userId) or "";
    end;
    local v23 = {};
    local v24 = nil;
    if l_GetFFlagEnableProfileInsightsApolloMigration_0() then
        local v25, v26 = l_useSignalProfileInsightsByUserId_0({
            userId = v19.userId, 
            rankingStrategy = "tc_info_boost"
        });
        v23 = v25;
        v24 = v26;
    else
        local v27 = l_useProfileInsightsByUserIds_0({
            userIds = {
                v19.userId
            }, 
            rankingStrategy = "tc_info_boost", 
            fetchPolicy = "network-only"
        });
        if v27 and v27.data and not v27.loading then
            v23 = l_getProfileInsightsByUserIdFromData_0(v27.data, v19.userId);
        end;
        v24 = v27.loading;
    end;
    local v28 = if not v9(v23.userAgeVerifiedBracket) then v23.userAgeVerifiedBracket else nil;
    local _ = {
        under13 = "AccountIdentity.AgeCheck.Label.AgeBandUnder13", 
        under17 = "AccountIdentity.AgeCheck.Label.AgeBandOver13", 
        under17checked = "AccountIdentity.AgeCheck.Label.AgeBandOver13Checked", 
        over18 = "AccountIdentity.AgeCheck.Label.AgeBandOver18", 
        over18checked = "AccountIdentity.AgeCheck.Label.AgeBandOver18Checked"
    };
    local v30 = l_useLocalization_0({
        userAgeVerifiedBracket = v28
    });
    local v31 = v2.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v30 (copy)
        if v30.userAgeVerifiedBracket then
            return ((" \226\128\162 %*"):format(v30.userAgeVerifiedBracket));
        else
            return nil;
        end;
    end, {
        v30.userAgeVerifiedBracket
    });
    local v33 = v2.useMemo(function() --[[ Line: 97 ]]
        -- upvalues: v10 (ref), v2 (ref), l_View_0 (ref), l_UserTile_0 (ref), v19 (copy), l_LayoutMode_0 (ref), v21 (ref), v22 (ref), v31 (copy)
        local v32 = v10.Hooks.useTokens();
        return v2.createElement(l_View_0, {
            tag = "size-0-1200 auto-x row align-y-center", 
            LayoutOrder = 1
        }, {
            UserTile = v2.createElement(l_UserTile_0, {
                userId = v19.userId, 
                userPresenceType = v10.Enums.UserPresence.None, 
                layoutMode = l_LayoutMode_0.wide, 
                title = v21, 
                subtitle = if v22 ~= "" then ("@%*%*"):format(v22, v31 or "") else nil, 
                titleStyle = v32.Typography.TitleMedium, 
                subtitleStyle = v32.Typography.BodyMedium, 
                triggerAnimation = true, 
                onActivated = nil
            })
        });
    end, {
        v19.userId, 
        v21, 
        v22, 
        v31
    });
    local v34 = v2.useMemo(function() --[[ Line: 115 ]]
        -- upvalues: v9 (ref), v23 (ref)
        return {
            mutualFriends = if not v9(v23.mutualFriends) then v23.mutualFriends else nil, 
            friendshipAgeUnixSeconds = if not v9(v23.friendshipAgeUnixSeconds) then v23.friendshipAgeUnixSeconds else nil, 
            friendRequestOriginSource = if not v9(v23.friendRequestOriginSource) then v23.friendRequestOriginSource else nil, 
            accountCreationDateUnixSeconds = if not v9(v23.accountCreationDateUnixSeconds) then v23.accountCreationDateUnixSeconds else nil, 
            localizedCountryName = if not v9(v23.localizedCountryName) then v23.localizedCountryName else nil
        };
    end, {
        v23
    });
    return v2.createElement(l_View_0, {
        tag = {
            ["col size-full-0 auto-y align-x-left radius-medium bg-shift-100"] = true, 
            ["gap-medium padding-medium"] = v19.isVerticallyConstrained, 
            ["gap-large padding-large"] = not v19.isVerticallyConstrained
        }, 
        LayoutOrder = 2
    }, {
        AvatarWithNames = v33, 
        SocialMetadataIconAndTextList = if v24 then v2.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 0, 50), 
            LayoutOrder = if l_FFlagProfilePlatformAddTC_0 then v19.layoutOrder else 2
        }) else v2.createElement(v15, {
            profileInsightIconItems = v34, 
            isVerticallyConstrained = v19.isVerticallyConstrained, 
            layoutOrder = if l_FFlagProfilePlatformAddTC_0 then v19.layoutOrder else 2
        })
    });
end;