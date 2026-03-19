local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateToUserInfo);
local v8 = require(l_Modules_0.LuaApp.Common.wrapComponent);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdCheckDev;
local v12 = require(script.NameBadge);
local v19 = v3.connect(function(v13) --[[ Line: 21 ]]
    -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy)
    local v14 = v13.Users[v13.LocalUserId];
    if v14 then
        local v15 = l_getRbxthumbWithTypeSizeAndOptions_0(v13.LocalUserId, l_Constants_0.RbxthumbTypes.AvatarHeadShot, 150);
        return {
            displayName = v14.displayName or v14.name, 
            thumbnail = v15, 
            isPremium = v14.membership == Enum.MembershipType.Premium, 
            isVerified = v14.hasVerifiedBadge, 
            isRobloxSubscriber = l_FFlagEnableBlackbirdCheckDev_0 and v14.hasRobloxSubscription == true or false, 
            localUserId = v13.LocalUserId
        };
    else
        return {};
    end;
end, function(v16) --[[ Line: 38 ]]
    -- upvalues: v6 (copy), v5 (copy), l_UrlBuilder_0 (copy), v7 (copy)
    return {
        openProfile = function() --[[ Line: 40 ]] --[[ Name: openProfile ]]
            -- upvalues: v16 (copy), v6 (ref), v5 (ref), l_UrlBuilder_0 (ref)
            v16(v6({
                name = v5.ViewProfile, 
                detail = l_UrlBuilder_0.static.profile()
            }));
        end, 
        openLuaProfile = function(v17, v18) --[[ Line: 46 ]] --[[ Name: openLuaProfile ]]
            -- upvalues: v16 (copy), v7 (ref)
            v16(v7(v17, v18));
        end
    };
end)(v12);
return (v8(function(v20, v21) --[[ Line: 52 ]]
    -- upvalues: v2 (copy)
    if v21.isSearching then
        return nil;
    else
        return v2.createElement(v20, v21);
    end;
end)(v19));