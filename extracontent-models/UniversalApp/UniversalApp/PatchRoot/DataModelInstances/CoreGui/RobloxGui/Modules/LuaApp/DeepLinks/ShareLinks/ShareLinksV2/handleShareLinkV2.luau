local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.AppPage);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameProtocol.default;
local v5 = require(script.Parent.handleTrustedConnectionShareLink);
local v6 = require(script.Parent.Parent.LinkStatus);
local v7 = require(script.Parent.Parent.Analytics.sendShareLinkLatencyEvent);
local v8 = require(script.Parent.ShareLinkTypesV2);
local _ = require(script.Parent.Parent.Types);
local l_FFlagTCShareLinkReceiverUI_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCShareLinkReceiverUI;
return function(v11, v12) --[[ Line: 24 ]]
    -- upvalues: v8 (copy), l_HttpService_0 (copy), v7 (copy), v6 (copy), l_default_0 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), v5 (copy), v3 (copy)
    local v13 = v11.responseBody or {};
    local v14 = v13.linkType or v8.Unknown;
    local v15 = v13.customData or {};
    local v16 = tostring(v13.status);
    local v17 = l_HttpService_0:GenerateGUID(false);
    local l_shareLinksAnalytics_0 = v12.analyticsImpls.shareLinksAnalytics;
    local v19 = {
        linkStatus = v16, 
        linkId = v11.linkId, 
        linkType = v14, 
        isViaAppsFlyer = v11.isViaAppsFlyer, 
        placeId = v13.targetId, 
        joinAttemptId = v17
    };
    l_shareLinksAnalytics_0.resolveLink(v19);
    local function v21(v20) --[[ Line: 45 ]]
        -- upvalues: l_shareLinksAnalytics_0 (copy), v11 (copy), v14 (copy), v16 (copy), v13 (copy), v7 (ref)
        l_shareLinksAnalytics_0.gameLaunch({
            linkId = v11.linkId, 
            linkType = v14, 
            linkStatus = v16, 
            placeId = v13.targetId, 
            joinAttemptId = v20
        });
        v7(v14, v16);
    end;
    if v14 == v8.Experience and v16 == v6.Valid then
        if v16 == v6.Valid then
            local v22 = {
                launchData = v15
            };
            v12.launchGame(v13.targetId, v14, v22, l_default_0, "ExperienceValidLink", v21);
            return nil;
        end;
    elseif l_FFlagTCShareLinkReceiverUI_0 and v14 == v8.UserTrustedConnection then
        local l_FriendRequestTokenIds_0 = l_HttpService_0:JSONDecode(v15).FriendRequestTokenIds;
        return v5(v16, v13.targetId, l_FriendRequestTokenIds_0, function() --[[ Line: 74 ]]
            -- upvalues: l_shareLinksAnalytics_0 (copy), v19 (copy)
            l_shareLinksAnalytics_0.errorDialogButtonClick(v19);
        end);
    end;
    return {
        {
            {
                name = v3.Games
            }, 
            {
                name = v3.ShareLinkInvalidModal, 
                extraProps = {
                    closeModal = function() --[[ Line: 87 ]] --[[ Name: closeModal ]]
                        -- upvalues: l_shareLinksAnalytics_0 (copy), v19 (copy)
                        l_shareLinksAnalytics_0.errorDialogButtonClick(v19);
                    end
                }
            }
        }
    };
end;