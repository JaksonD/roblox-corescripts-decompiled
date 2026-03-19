local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v2 = require(script.Parent.dependencies);
local l_PlayButtonReferralSource_0 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton).PlayButtonReferralSource;
local v4 = require(script.Parent.LinkStatus);
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(script.Parent.Parent.logGameDetailsDeepLinkEvent);
local _ = require(script.Parent.Types);
local l_FFlagEnableShareLinksInGameDetailEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent;
return function(v10, v11) --[[ Line: 19 ]]
    -- upvalues: l_getDeepValue_0 (copy), v6 (copy), v4 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v7 (copy), l_AppPage_0 (copy), l_PlayButtonReferralSource_0 (copy)
    local l_shareLinksAnalytics_0 = v11.analyticsImpls.shareLinksAnalytics;
    local v13 = tostring((l_getDeepValue_0(v10, "responseBody.experienceDetailsInviteData") or {}).universeId);
    local v14 = v6.Dictionary.join(v10, {
        responseBody = v6.None, 
        type = v6.None, 
        linkStatus = v4.Valid, 
        universeId = v13
    });
    l_shareLinksAnalytics_0.resolveLink(v14);
    if l_FFlagEnableShareLinksInGameDetailEvent_0 then
        v7(v13, "GameDetailsShareLink", {});
    else
        v7(v13, "GameDetailsShareLink");
    end;
    local l_GameDetail_0 = l_AppPage_0.GameDetail;
    return {
        {
            {
                name = l_AppPage_0.Games
            }
        }, 
        {
            {
                name = l_AppPage_0.Games
            }, 
            {
                name = l_GameDetail_0, 
                detail = v13, 
                extraProps = {
                    mountAsFullView = true, 
                    mountAnimation = false, 
                    referralSource = l_PlayButtonReferralSource_0.ExperienceDetailsLink
                }
            }
        }
    };
end;