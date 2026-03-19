local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameProtocol.default;
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(script.Parent.dependencies);
local v6 = require(script.Parent.LinkStatus);
local l_getDeepValue_0 = v5.SocialLibraries.Dictionary.getDeepValue;
local v8 = require(script.Parent.Analytics.sendShareLinkLatencyEvent);
local v9 = require(script.Parent.ShareLinkTypes);
local _ = require(script.Parent.Types);
local v11 = require(script.Parent.Flags.FFlagShareLinkAddReferredByPlayerIdLaunchParam);
local v12 = {
    [string.lower(v9.ExperienceInviteLinkType)] = {
        expiredLinkStr = "ExperienceInviteExpiredLink", 
        linkType = v9.ExperienceInviteLinkType, 
        responseInviteDataPath = "responseBody.experienceInviteData", 
        validLinkStr = "ExperienceInviteValidLink", 
        invalidLinkPage = v4.InviteLinkExpiredModal
    }, 
    [string.lower(v9.ScreenshotInviteLinkType)] = {
        expiredLinkStr = "ScreenshotInviteExpiredLink", 
        linkType = v9.ScreenshotInviteLinkType, 
        responseInviteDataPath = "responseBody.screenshotInviteData", 
        validLinkStr = "ScreenshotInviteValidLink", 
        invalidLinkPage = v4.InviteLinkExpiredModal
    }, 
    [string.lower(v9.PrivateServerLinkType)] = {
        expiredLinkStr = "PrivateServerExpiredLink", 
        linkType = v9.PrivateServerLinkType, 
        responseInviteDataPath = "responseBody.privateServerInviteData", 
        validLinkStr = "PrivateServerValidLink", 
        invalidLinkPage = v4.ShareLinkInvalidModal
    }
};
return function(v13, v14) --[[ Line: 55 ]]
    -- upvalues: v12 (copy), l_HttpService_0 (copy), l_getDeepValue_0 (copy), v8 (copy), v6 (copy), v11 (copy), l_default_0 (copy), v4 (copy), v9 (copy)
    local v15 = v12[string.lower(v13.linkType)];
    local l_linkType_0 = v15.linkType;
    local l_expiredLinkStr_0 = v15.expiredLinkStr;
    local l_responseInviteDataPath_0 = v15.responseInviteDataPath;
    local l_validLinkStr_0 = v15.validLinkStr;
    local l_invalidLinkPage_0 = v15.invalidLinkPage;
    local v21 = l_HttpService_0:GenerateGUID(false);
    local l_shareLinksAnalytics_0 = v14.analyticsImpls.shareLinksAnalytics;
    local v23 = l_getDeepValue_0(v13, l_responseInviteDataPath_0) or {};
    local v24 = tostring(v23.status);
    local v25 = {
        linkStatus = v24, 
        linkId = v13.linkId, 
        linkType = v13.linkType, 
        isViaAppsFlyer = v13.isViaAppsFlyer, 
        placeId = v23.placeId, 
        joinAttemptId = v21
    };
    l_shareLinksAnalytics_0.resolveLink(v25);
    local function v27(v26) --[[ Line: 78 ]]
        -- upvalues: l_shareLinksAnalytics_0 (copy), v13 (copy), v24 (copy), v23 (copy), v8 (ref), l_linkType_0 (copy)
        l_shareLinksAnalytics_0.gameLaunch({
            linkId = v13.linkId, 
            linkType = v13.linkType, 
            linkStatus = v24, 
            placeId = v23.placeId, 
            joinAttemptId = v26
        });
        v8(l_linkType_0, v24);
    end;
    local v28 = v24 == v6.Valid;
    local v29 = v23.launchData and v23.launchData ~= "";
    local l_launchData_0 = v23.launchData;
    local v31 = v11 and v23.inviterId;
    if v28 then
        local v32 = {
            gameInstanceId = if v23.inviterId then nil else v23.instanceId, 
            userId = if v23.inviterId then v23.inviterId else nil, 
            joinAttemptId = v21, 
            linkCode = v23.linkCode, 
            launchData = if v29 then l_launchData_0 else nil, 
            referredByPlayerId = if v31 then v23.inviterId else nil
        };
        v14.launchGame(v23.placeId, l_linkType_0, v32, l_default_0, l_validLinkStr_0, v27);
        return nil;
    else
        local function v34() --[[ Line: 107 ]]
            -- upvalues: v29 (copy), l_launchData_0 (copy), v31 (copy), v23 (copy), v14 (copy), l_linkType_0 (copy), l_default_0 (ref), l_expiredLinkStr_0 (copy), v27 (copy)
            local v33 = {
                launchData = if v29 then l_launchData_0 else nil, 
                referredByPlayerId = if v31 then v23.inviterId else nil
            };
            v14.launchGame(v23.placeId, l_linkType_0, v33, l_default_0, l_expiredLinkStr_0, v27);
        end;
        local v35 = {
            {
                name = v4.Games
            }
        };
        if l_linkType_0 == v9.ExperienceInviteLinkType or l_linkType_0 == v9.ScreenshotInviteLinkType then
            table.insert(v35, {
                name = v4.GameDetail, 
                detail = tostring(v23.universeId), 
                extraProps = {
                    mountAsFullView = true, 
                    mountAnimation = false
                }
            });
        end;
        table.insert(v35, {
            name = l_invalidLinkPage_0, 
            extraProps = {
                launchGame = v34, 
                closeModal = function(v36) --[[ Line: 142 ]] --[[ Name: closeModal ]]
                    -- upvalues: l_shareLinksAnalytics_0 (copy), v25 (copy)
                    if v36 then
                        l_shareLinksAnalytics_0.errorJoinDialogButtonClick(v25);
                        return;
                    else
                        l_shareLinksAnalytics_0.errorDialogButtonClick(v25);
                        return;
                    end;
                end, 
                universeId = tostring(v23.universeId), 
                linkStatus = v24
            }
        });
        return {
            {
                {
                    name = v4.Games
                }
            }, 
            v35
        };
    end;
end;