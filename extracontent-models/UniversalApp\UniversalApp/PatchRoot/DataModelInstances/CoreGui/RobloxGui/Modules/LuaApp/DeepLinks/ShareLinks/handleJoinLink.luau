local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_AffiliateJoinLinkResolver_0 = require(l_CorePackages_0.Workspace.Packages.AffiliateLinks).AffiliateJoinLinkResolver;
local l_PlayButtonReferralSource_0 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton).PlayButtonReferralSource;
local v4 = require(script.Parent.Parent.Utils.ExperienceJoinDataHelper);
local v5 = require(script.Parent.LinkStatus);
local v6 = require(script.Parent.Parent.logGameDetailsDeepLinkEvent);
local _ = require(script.Parent.Types);
local v8 = require(script.Parent.ShareLinkTypes);
local l_FFlagEnableShareLinksInGameDetailEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent;
local v10 = {
    HOME = "Home", 
    INVALID = "Invalid", 
    PROFILE = "Profile"
};
return function(v11, _, v13) --[[ Line: 26 ]]
    -- upvalues: l_AffiliateJoinLinkResolver_0 (copy), l_AppPage_0 (copy), v5 (copy), v8 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v6 (copy), l_PlayButtonReferralSource_0 (copy), v4 (copy), v10 (copy)
    local l_shareLinksAnalytics_0 = v13.analyticsImpls.shareLinksAnalytics;
    return l_AffiliateJoinLinkResolver_0.resolveReferralCode(v13.network, v11):andThen(function(v15) --[[ Line: 29 ]]
        -- upvalues: l_AppPage_0 (ref), v5 (ref), v8 (ref), l_shareLinksAnalytics_0 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (ref), v6 (ref), l_PlayButtonReferralSource_0 (ref), v4 (ref), v10 (ref)
        local v16 = nil;
        local l_responseBody_0 = v15.responseBody;
        local l_GameDetail_0 = l_AppPage_0.GameDetail;
        local v19 = tostring(l_responseBody_0.linkId);
        if l_responseBody_0.universeId ~= nil and l_responseBody_0.universeId ~= 0 then
            v16 = tostring(l_responseBody_0.universeId);
        end;
        local v20 = {
            linkStatus = v5.Valid, 
            linkType = v8.ExperienceAffiliate, 
            linkId = v19, 
            universeId = v16, 
            isViaAppsFlyer = false
        };
        l_shareLinksAnalytics_0.resolveLink(v20);
        if l_responseBody_0.universeId ~= nil and l_responseBody_0.universeId ~= 0 then
            if l_FFlagEnableShareLinksInGameDetailEvent_0 then
                v6(v16, "ExperienceAffiliateShareLink", {
                    linkType = v8.ExperienceAffiliate, 
                    linkId = v19
                });
            else
                v6(v16, "ExperienceAffiliateShareLink");
            end;
            local v21 = {
                mountAsFullView = true, 
                mountAnimation = false, 
                referralSource = l_PlayButtonReferralSource_0.ExperienceAffiliateLink
            };
            local l_joinData_0 = l_responseBody_0.joinData;
            local v23 = if l_joinData_0 then v4.mergeExperienceJoinData(v21, l_joinData_0) else v21;
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
                        detail = v16, 
                        extraProps = v23
                    }
                }
            };
        elseif l_responseBody_0.fallbackType == v10.PROFILE then
            return {
                {
                    {
                        name = l_AppPage_0.Home
                    }, 
                    {
                        name = l_AppPage_0.ProfilePlatform, 
                        detail = tostring(l_responseBody_0.fallbackId)
                    }
                }
            };
        else
            return {
                {
                    {
                        name = l_AppPage_0.Home
                    }
                }
            };
        end;
    end):catch(function() --[[ Line: 103 ]]
        -- upvalues: v5 (ref), v8 (ref), l_shareLinksAnalytics_0 (copy), l_AppPage_0 (ref)
        local v24 = {
            linkStatus = v5.Invalid, 
            linkId = "", 
            linkType = v8.ExperienceAffiliate, 
            isViaAppsFlyer = false
        };
        l_shareLinksAnalytics_0.resolveLink(v24);
        return {
            {
                {
                    name = l_AppPage_0.Home
                }, 
                {
                    name = l_AppPage_0.ShareLinkInvalidModal, 
                    extraProps = {
                        closeModal = function() --[[ Line: 118 ]] --[[ Name: closeModal ]]
                            -- upvalues: l_shareLinksAnalytics_0 (ref), v24 (copy)
                            l_shareLinksAnalytics_0.errorJoinDialogButtonClick(v24);
                        end
                    }
                }
            }
        };
    end);
end;