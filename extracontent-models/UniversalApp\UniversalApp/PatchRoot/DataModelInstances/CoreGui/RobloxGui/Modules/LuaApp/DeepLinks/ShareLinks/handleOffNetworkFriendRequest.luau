local l_SocialLibraries_0 = require(script.Parent.dependencies).SocialLibraries;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(script.Parent.LinkStatus);
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local _ = require(script.Parent.Types);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums;
local v8 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
return function(v9, v10) --[[ Line: 12 ]]
    -- upvalues: l_getDeepValue_0 (copy), v2 (copy), l_Enums_0 (copy), v8 (copy), v3 (copy)
    local v11 = l_getDeepValue_0(v9, "responseBody.friendInviteData") or {};
    local l_shareLinksAnalytics_0 = v10.analyticsImpls.shareLinksAnalytics;
    if v11.senderUserId then
        local v13 = v11.friendingToken and v11.friendingToken ~= "";
        local l_status_0 = v11.status;
        l_shareLinksAnalytics_0.resolveLink({
            linkStatus = l_status_0, 
            linkId = v9.linkId, 
            linkType = v9.linkType, 
            isViaAppsFlyer = v9.isViaAppsFlyer
        });
        return {
            {
                {
                    name = v2.Home
                }, 
                {
                    name = v2.ProfilePlatform, 
                    detail = tostring(v11.senderUserId), 
                    extraProps = if v13 then {
                        offNetworkFriendRequestToken = v11.friendingToken, 
                        shareLinkId = v9.linkId, 
                        contextualInfoType = l_Enums_0.ContextualInfoTypes.OffNetworkFriendRequest, 
                        source = v8.Sources.OffNetworkFriendRequest
                    } else {
                        source = v8.Sources.OffNetworkFriendRequest
                    }
                }
            }
        };
    else
        l_shareLinksAnalytics_0.resolveLink({
            linkStatus = v3.Invalid, 
            linkId = v9.linkId, 
            linkType = v9.linkType, 
            isViaAppsFlyer = v9.isViaAppsFlyer
        });
        return {
            {
                {
                    name = v2.Home
                }, 
                {
                    name = v2.ShareLinkInvalidModal, 
                    extraProps = {
                        closeModal = function() --[[ Line: 58 ]] --[[ Name: closeModal ]]
                            -- upvalues: l_shareLinksAnalytics_0 (copy), v9 (copy), v3 (ref)
                            l_shareLinksAnalytics_0.errorDialogButtonClick({
                                linkId = v9.linkId, 
                                linkStatus = v3.Invalid, 
                                linkType = v9.linkType
                            });
                        end
                    }
                }
            }
        };
    end;
end;