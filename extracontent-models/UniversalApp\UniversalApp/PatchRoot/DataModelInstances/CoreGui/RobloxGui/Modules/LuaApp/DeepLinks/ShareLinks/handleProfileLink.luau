local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(script.Parent.LinkStatus);
local l_getDeepValue_0 = require(script.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue;
local _ = require(script.Parent.Types);
local l_FriendshipOriginSourceType_0 = require(l_CorePackages_0.Workspace.Packages.FriendsNetworking).Enums.FriendshipOriginSourceType;
local v7 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
return function(v8, v9, v10) --[[ Line: 14 ]]
    -- upvalues: l_getDeepValue_0 (copy), v3 (copy), v2 (copy), v7 (copy), l_FriendshipOriginSourceType_0 (copy)
    local v11 = l_getDeepValue_0(v8, "responseBody.profileLinkResolutionResponseData") or {};
    local l_shareLinksAnalytics_0 = v9.analyticsImpls.shareLinksAnalytics;
    if v11.userId then
        l_shareLinksAnalytics_0.resolveLink({
            linkStatus = v3.Valid, 
            linkId = v8.linkId, 
            linkType = v8.linkType, 
            isViaAppsFlyer = v8.isViaAppsFlyer
        });
        return {
            {
                {
                    name = v2.Home
                }, 
                {
                    name = v2.ProfilePlatform, 
                    detail = tostring(v11.userId), 
                    extraProps = {
                        friendshipOriginSourceType = if string.lower(v10 or "") == string.lower(v7.Sources.ProfileShare) then l_FriendshipOriginSourceType_0.ProfileShare.rawValue() else l_FriendshipOriginSourceType_0.QrCode.rawValue(), 
                        source = if string.lower(v10 or "") == string.lower(v7.Sources.ProfileShare) then v7.Sources.ProfileShare else v7.Sources.QrCode, 
                        shareLinkId = v8.linkId
                    }
                }
            }
        };
    else
        l_shareLinksAnalytics_0.resolveLink({
            linkStatus = v3.Invalid, 
            linkId = v8.linkId, 
            linkType = v8.linkType, 
            isViaAppsFlyer = v8.isViaAppsFlyer
        });
        return {
            {
                {
                    name = v2.Home
                }, 
                {
                    name = v2.ShareLinkInvalidModal
                }
            }
        };
    end;
end;