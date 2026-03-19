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
local l_FFlagTCUpdateProfileCTAButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCUpdateProfileCTAButton;
return function(v12, v13) --[[ Line: 25 ]]
    -- upvalues: v8 (copy), l_HttpService_0 (copy), v7 (copy), v6 (copy), l_default_0 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), v5 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy), v3 (copy)
    local v14 = v12.responseBody or {};
    local v15 = v14.linkType or v8.Unknown;
    local v16 = v14.customData or {};
    local v17 = tostring(v14.status);
    local v18 = l_HttpService_0:GenerateGUID(false);
    local l_shareLinksAnalytics_0 = v13.analyticsImpls.shareLinksAnalytics;
    local v20 = {
        linkStatus = v17, 
        linkId = v12.linkId, 
        linkType = v15, 
        isViaAppsFlyer = v12.isViaAppsFlyer, 
        placeId = v14.targetId, 
        joinAttemptId = v18
    };
    l_shareLinksAnalytics_0.resolveLink(v20);
    local function v22(v21) --[[ Line: 46 ]]
        -- upvalues: l_shareLinksAnalytics_0 (copy), v12 (copy), v15 (copy), v17 (copy), v14 (copy), v7 (ref)
        l_shareLinksAnalytics_0.gameLaunch({
            linkId = v12.linkId, 
            linkType = v15, 
            linkStatus = v17, 
            placeId = v14.targetId, 
            joinAttemptId = v21
        });
        v7(v15, v17);
    end;
    if v15 == v8.Experience and v17 == v6.Valid then
        if v17 == v6.Valid then
            local v23 = {
                launchData = v16
            };
            v13.launchGame(v14.targetId, v15, v23, l_default_0, "ExperienceValidLink", v22);
            return nil;
        end;
    elseif l_FFlagTCShareLinkReceiverUI_0 and v15 == v8.UserTrustedConnection then
        local l_FriendRequestTokenIds_0 = l_HttpService_0:JSONDecode(v16).FriendRequestTokenIds;
        return v5(v17, v14.targetId, l_FriendRequestTokenIds_0, function() --[[ Line: 75 ]]
            -- upvalues: l_shareLinksAnalytics_0 (copy), v20 (copy)
            l_shareLinksAnalytics_0.errorDialogButtonClick(v20);
        end, if l_FFlagTCUpdateProfileCTAButton_0 then v13 else nil);
    end;
    return {
        {
            {
                name = v3.Games
            }, 
            {
                name = v3.ShareLinkInvalidModal, 
                extraProps = {
                    closeModal = function() --[[ Line: 94 ]] --[[ Name: closeModal ]]
                        -- upvalues: l_shareLinksAnalytics_0 (copy), v20 (copy)
                        l_shareLinksAnalytics_0.errorDialogButtonClick(v20);
                    end
                }
            }
        }
    };
end;