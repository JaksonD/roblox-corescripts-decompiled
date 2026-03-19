local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v2 = require(script.Parent.dependencies);
local l_PlayButtonReferralSource_0 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton).PlayButtonReferralSource;
local v4 = require(script.Parent.Parent.Utils.ExperienceJoinDataHelper);
local v5 = require(script.Parent.LinkStatus);
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(script.Parent.Parent.logGameDetailsDeepLinkEvent);
local _ = require(script.Parent.Types);
local v10 = require(script.Parent.Enums.ExperienceAffiliateDeepLinkFallbackType);
local l_FFlagEnableShareLinksInGameDetailEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent;
shouldResolveToProfileFallbackType = function(v12) --[[ Line: 26 ]] --[[ Name: shouldResolveToProfileFallbackType ]]
    -- upvalues: v10 (copy)
    local v13 = v10.fromRawValue(v12);
    local v14 = false;
    if v13 ~= nil then
        v14 = v13 == v10.EXPERIENCE_AFFILIATE_DEEP_LINK_FALLBACK_TYPE_PROFILE;
    end;
    return v14;
end;
return function(v15, v16) --[[ Line: 34 ]]
    -- upvalues: l_getDeepValue_0 (copy), l_AppPage_0 (copy), v7 (copy), v5 (copy), l_FFlagEnableShareLinksInGameDetailEvent_0 (copy), v8 (copy), l_PlayButtonReferralSource_0 (copy), v4 (copy)
    local l_shareLinksAnalytics_0 = v16.analyticsImpls.shareLinksAnalytics;
    local v18 = l_getDeepValue_0(v15, "responseBody.experienceAffiliateData") or {};
    if v18.universeId ~= nil and v18.universeId ~= 0 then
        local l_GameDetail_0 = l_AppPage_0.GameDetail;
        local v20 = tostring(v18.universeId);
        local v21 = v7.Dictionary.join(v15, {
            responseBody = v7.None, 
            type = v7.None, 
            linkStatus = v5.Valid, 
            universeId = v20
        });
        l_shareLinksAnalytics_0.resolveLink(v21);
        if l_FFlagEnableShareLinksInGameDetailEvent_0 then
            v8(v20, "ExperienceAffiliateShareLink", {
                linkType = v15.linkType, 
                linkId = v15.linkId
            });
        else
            v8(v20, "ExperienceAffiliateShareLink");
        end;
        local v22 = {
            mountAsFullView = true, 
            mountAnimation = false, 
            referralSource = l_PlayButtonReferralSource_0.ExperienceAffiliateLink
        };
        local l_joinData_0 = v18.joinData;
        local v24 = if l_joinData_0 then v4.mergeExperienceJoinData(v22, l_joinData_0) else v22;
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
                    detail = v20, 
                    extraProps = v24
                }
            }
        };
    else
        local v25 = v7.Dictionary.join(v15, {
            responseBody = v7.None, 
            type = v7.None, 
            linkStatus = v5.Valid
        });
        l_shareLinksAnalytics_0.resolveLink(v25);
        if shouldResolveToProfileFallbackType(v18.fallbackType) then
            return {
                {
                    {
                        name = l_AppPage_0.Home
                    }, 
                    {
                        name = l_AppPage_0.ProfilePlatform, 
                        detail = tostring(v18.fallbackId)
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
    end;
end;