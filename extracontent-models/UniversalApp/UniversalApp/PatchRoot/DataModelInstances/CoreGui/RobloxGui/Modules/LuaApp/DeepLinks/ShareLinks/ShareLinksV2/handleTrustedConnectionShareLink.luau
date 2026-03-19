local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_CorePackages_0.Workspace.Packages.DataHydration);
local v4 = require(script.Parent.Parent.LinkStatus);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local v6 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local _ = require(script.Parent.Parent.Types);
local l_FFlagTCUpdateProfileCTAButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCUpdateProfileCTAButton;
local v9 = v3.TrustedConnections.TrustedConnectionsStore.get();
local function v13(v10, v11, v12) --[[ Line: 18 ]] --[[ Name: trustedConnectionModal ]]
    -- upvalues: v2 (copy), v6 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy)
    return {
        {
            {
                name = v2.Home
            }, 
            {
                name = v2.ProfilePlatform, 
                detail = v10, 
                extraProps = {
                    source = v6.Analytics.Enums.Sources.ShareLink
                }
            }, 
            {
                name = v2.TrustedContactsModal, 
                userId = v10, 
                source = v6.Analytics.Enums.Sources.ShareLink, 
                modalVariantOverride = v6.Analytics.Enums.Sources.ShareLinkReceiver, 
                tokens = v11, 
                onRequestAccepted = l_FFlagTCUpdateProfileCTAButton_0 and v12 and v12.RefreshProfilePlatformActionInfo and function() --[[ Line: 38 ]]
                    -- upvalues: v12 (copy), v10 (copy)
                    v12.RefreshProfilePlatformActionInfo((tostring(v10)));
                end or nil
            }
        }
    };
end;
local function v15(v14) --[[ Line: 47 ]] --[[ Name: expiredLinkModal ]]
    -- upvalues: v2 (copy)
    return {
        {
            {
                name = v2.Home
            }, 
            {
                name = v2.InviteLinkExpiredModal, 
                extraProps = {
                    closeModal = v14
                }
            }
        }
    };
end;
local function v17(v16) --[[ Line: 61 ]] --[[ Name: invalidLinkModal ]]
    -- upvalues: v2 (copy)
    return {
        {
            {
                name = v2.Home
            }, 
            {
                name = v2.ShareLinkInvalidModal, 
                extraProps = {
                    closeModal = v16
                }
            }
        }
    };
end;
return function(v18, v19, v20, v21, v22) --[[ Line: 75 ]]
    -- upvalues: v4 (copy), v9 (copy), v13 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy), v15 (copy), v17 (copy)
    if v18 == v4.Valid then
        local v23, v24 = v9.validateTrustedFriendLink(v19, v20):await();
        if v23 and v24.responseBody.valid then
            return (v13(v19, v20, if l_FFlagTCUpdateProfileCTAButton_0 then v22 else nil));
        end;
    elseif v18 == v4.Expired then
        return (v15(v21));
    end;
    return (v17(v21));
end;