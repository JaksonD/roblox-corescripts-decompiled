local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_View_0 = require(l_CorePackages_0.Packages.Foundation).View;
local v3 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.Enums);
local v4 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.useProfileJsonComponent);
local v5 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.ProfileWrapperContext);
local v6 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.AvatarHeadshotComponent);
local v7 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.SocialChipCountsRow);
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_FFlagFriendRequestNicknames_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFriendRequestNicknames;
local function _(v10, v11, v12) --[[ Line: 20 ]]
    local v13 = v10.names.primaryName or "";
    if v11.profileUserNickname and v12 and v11.profileUserNickname ~= "" then
        return v11.profileUserNickname .. " (" .. v13 .. ")";
    else
        return v13;
    end;
end;
return v1.memo(function(v15) --[[ Line: 42 ]] --[[ Name: ProfileHeader ]]
    -- upvalues: v1 (copy), v5 (copy), v4 (copy), v3 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_useAppPolicy_0 (copy), l_View_0 (copy), v6 (copy), v7 (copy)
    local v16 = v1.useContext(v5);
    local v17 = v4(v3.Components.UserProfileHeader);
    local v18 = v17.counts ~= nil;
    local v20 = if l_FFlagFriendRequestNicknames_0 then l_useAppPolicy_0(function(v19) --[[ Line: 49 ]]
        return v19.getFriendRequestNicknamesEnabled();
    end) else false;
    local l_createElement_0 = v1.createElement;
    local l_l_View_0_0 = l_View_0;
    local v23 = {
        tag = "size-full-0 auto-y col gap-large", 
        LayoutOrder = v15.layoutOrder
    };
    local v24 = {};
    local l_createElement_1 = v1.createElement;
    local l_v6_0 = v6;
    local v27 = {
        userId = v15.profileId
    };
    local v28 = v17.names.primaryName or "";
    v27.primaryName = if v16.profileUserNickname and v20 and v16.profileUserNickname ~= "" then v16.profileUserNickname .. " (" .. v28 .. ")" else v28;
    v27.username = v17.names.username;
    v27.isPremium = v17.isPremium;
    v27.isVerified = v17.isVerified;
    v27.isRobloxAdmin = v17.isRobloxAdmin;
    v27.layoutOrder = 1;
    v24.AvatarHeadshotComponent = l_createElement_1(l_v6_0, v27);
    v24.SocialCountsRow = if v18 then v1.createElement(v7, {
        size = UDim2.fromScale(1, 0), 
        layoutOrder = 2
    }) else nil;
    return l_createElement_0(l_l_View_0_0, v23, v24);
end);