local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_CorePackages_0.Workspace.Packages.DataHydration);
local v4 = require(script.Parent.Parent.LinkStatus);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local v6 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local v7 = v3.TrustedConnections.TrustedConnectionsStore.get();
local function v10(v8, v9) --[[ Line: 14 ]] --[[ Name: trustedConnectionModal ]]
    -- upvalues: v2 (copy), v6 (copy)
    return {
        {
            {
                name = v2.Home
            }, 
            {
                name = v2.ProfilePlatform, 
                detail = v8, 
                extraProps = {
                    source = v6.Analytics.Enums.Sources.ShareLink
                }
            }, 
            {
                name = v2.TrustedContactsModal, 
                userId = v8, 
                source = v6.Analytics.Enums.Sources.ShareLink, 
                modalVariantOverride = v6.Analytics.Enums.Sources.ShareLinkReceiver, 
                tokens = v9
            }
        }
    };
end;
local function v12(v11) --[[ Line: 36 ]] --[[ Name: expiredLinkModal ]]
    -- upvalues: v2 (copy)
    return {
        {
            {
                name = v2.Home
            }, 
            {
                name = v2.InviteLinkExpiredModal, 
                extraProps = {
                    closeModal = v11
                }
            }
        }
    };
end;
local function v14(v13) --[[ Line: 50 ]] --[[ Name: invalidLinkModal ]]
    -- upvalues: v2 (copy)
    return {
        {
            {
                name = v2.Home
            }, 
            {
                name = v2.ShareLinkInvalidModal, 
                extraProps = {
                    closeModal = v13
                }
            }
        }
    };
end;
return function(v15, v16, v17, v18) --[[ Line: 64 ]]
    -- upvalues: v4 (copy), v7 (copy), v10 (copy), v12 (copy), v14 (copy)
    if v15 == v4.Valid then
        local v19, v20 = v7.validateTrustedFriendLink(v16, v17):await();
        if v19 and v20.responseBody.valid then
            return (v10(v16, v17));
        end;
    elseif v15 == v4.Expired then
        return (v12(v18));
    end;
    return (v14(v18));
end;