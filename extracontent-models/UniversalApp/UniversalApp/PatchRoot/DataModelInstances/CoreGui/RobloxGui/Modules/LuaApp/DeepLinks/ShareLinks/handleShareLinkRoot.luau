local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.AppPage);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local l_ShareLinksRodux_0 = require(script.Parent.dependencies).ShareLinksRodux;
local v5 = require(l_CorePackages_0.Workspace.Packages.SocialStopwatch);
local v6 = require(script.Parent.handleExperienceInviteLinkResponse);
local v7 = require(script.Parent.handleInvalidLink);
local v8 = require(script.Parent.handleOffNetworkFriendRequest);
local v9 = require(script.Parent.handleExperienceDetailsLink);
local v10 = require(script.Parent.handleExperienceAffiliateLink);
local v11 = require(script.Parent.handleAvatarItemDetailsLink);
local v12 = require(script.Parent.handleNotificationExperienceInviteLink);
local v13 = require(script.Parent.handleProfileLink);
local v14 = require(script.Parent.handleExperienceEventLink);
local v15 = require(script.Parent.ShareLinksV2.handleShareLinkV2);
local l_LinkStatus_0 = l_ShareLinksRodux_0.Enums.LinkStatus;
local v17 = require(script.Parent.ShareLinkTypes);
local _ = require(script.Parent.Types);
local v19 = require(l_CorePackages_0.Packages.Cryo);
local l_FFlagTCShareLinkReceiverUI_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCShareLinkReceiverUI;
return function(v21, v22) --[[ Line: 28 ]]
    -- upvalues: v17 (copy), v5 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), v19 (copy), v15 (copy), v2 (copy), v7 (copy), v6 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v13 (copy), v12 (copy), v14 (copy), l_LinkStatus_0 (copy)
    local v23 = string.lower(v21.type or v17.Unknown);
    local l_code_0 = v21.code;
    local l_shareLinksAnalytics_0 = v22.analyticsImpls.shareLinksAnalytics;
    v5.Stopwatch.start(v5.Events.ShareLinkOpened);
    v22.closeCentralOverlay();
    if v21.v == "v2" or l_FFlagTCShareLinkReceiverUI_0 and v21.v == "v2-filtered" then
        return v22.resolveLinkFromLinkIdV2(l_code_0):andThen(function(v26) --[[ Line: 39 ]]
            -- upvalues: l_shareLinksAnalytics_0 (copy), v19 (ref), v21 (copy), l_code_0 (copy), v15 (ref), v23 (copy), v22 (copy)
            l_shareLinksAnalytics_0.openAppViaShareLink(v19.Dictionary.union(v21, {
                code = v19.None, 
                linkId = l_code_0, 
                linkType = v26.responseBody.linkType, 
                type = v19.None
            }));
            return v15({
                linkId = l_code_0, 
                linkType = v23, 
                responseBody = v26.responseBody, 
                isViaAppsFlyer = v21.isViaAppsFlyer
            }, v22);
        end);
    else
        l_shareLinksAnalytics_0.openAppViaShareLink(v19.Dictionary.join(v21, {
            code = v19.None, 
            linkId = l_code_0, 
            linkType = v23, 
            type = v19.None
        }));
        if v23 == string.lower(v17.Home) then
            v5.Stopwatch.stop(v5.Events.ShareLinkOpened);
            return {
                {
                    {
                        name = v2.Home
                    }
                }
            };
        elseif v23 == string.lower(v17.Unknown) then
            v5.Stopwatch.stop(v5.Events.ShareLinkOpened);
            return v7({
                type = v23, 
                code = v21.code, 
                isViaAppsFlyer = v21.isViaAppsFlyer, 
                stamp = v21.stamp
            }, v22);
        else
            return v22.resolveLinkFromLinkId(l_code_0, v23):andThen(function(v27) --[[ Line: 84 ]]
                -- upvalues: v19 (ref), v21 (copy), v23 (copy), l_code_0 (copy), v17 (ref), v6 (ref), v22 (copy), v8 (ref), v9 (ref), v10 (ref), v11 (ref), v13 (ref), v12 (ref), v14 (ref), v5 (ref)
                local v28 = v19.Dictionary.join(v21, {
                    code = v19.None, 
                    linkType = v23, 
                    linkId = l_code_0, 
                    responseBody = v27.responseBody
                });
                if v23 == string.lower(v17.ExperienceInviteLinkType) or v23 == string.lower(v17.PrivateServerLinkType) then
                    return (v6(v28, v22));
                elseif v23 == string.lower(v17.ScreenshotInviteLinkType) then
                    return v6(v28, v22);
                elseif v23 == string.lower(v17.OffNetworkFriendRequestLinkType) then
                    return v8(v28, v22);
                elseif v23 == string.lower(v17.ExperienceDetails) then
                    return v9(v28, v22);
                elseif v23 == string.lower(v17.ExperienceAffiliate) then
                    return v10(v28, v22);
                elseif v23 == string.lower(v17.AvatarItemDetails) then
                    return v11(v28, v22);
                elseif v23 == string.lower(v17.Profile) then
                    return v13(v28, v22, v21.source);
                elseif v23 == string.lower(v17.NotificationExperienceInviteLinkType) then
                    return v12(v28, v22);
                elseif v23 == string.lower(v17.ExperienceEvent) then
                    return v14(v28, v22);
                else
                    v5.Stopwatch.stop(v5.Events.ShareLinkOpened);
                    return nil;
                end;
            end):catch(function() --[[ Line: 118 ]]
                -- upvalues: v5 (ref), v2 (ref), l_shareLinksAnalytics_0 (copy), l_code_0 (copy), v23 (copy), l_LinkStatus_0 (ref)
                v5.Stopwatch.stop(v5.Events.ShareLinkOpened);
                return {
                    {
                        {
                            name = v2.Games
                        }
                    }, 
                    {
                        {
                            name = v2.Games
                        }, 
                        {
                            name = v2.ShareLinkInvalidModal, 
                            extraProps = {
                                closeModal = function() --[[ Line: 129 ]] --[[ Name: closeModal ]]
                                    -- upvalues: l_shareLinksAnalytics_0 (ref), l_code_0 (ref), v23 (ref), l_LinkStatus_0 (ref)
                                    l_shareLinksAnalytics_0.errorJoinDialogButtonClick({
                                        linkId = l_code_0, 
                                        linkType = v23, 
                                        linkStatus = l_LinkStatus_0.Invalid.rawValue()
                                    });
                                end
                            }
                        }
                    }
                };
            end);
        end;
    end;
end;