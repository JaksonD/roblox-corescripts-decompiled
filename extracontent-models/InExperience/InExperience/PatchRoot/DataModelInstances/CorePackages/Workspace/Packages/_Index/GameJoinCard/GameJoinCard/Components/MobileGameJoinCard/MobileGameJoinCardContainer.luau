local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RobloxAppEnums);
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_Parent_0.SocialExperienceJoin);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v6 = require(l_Parent_0.GameDetail);
local l_useExperienceBannerImage_0 = v6.useExperienceBannerImage;
local l_OpenGameDetails_0 = v6.OpenGameDetails;
local l_AppPage_0 = v2.AppPage;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useJoinUserInExperience_0 = v4.useJoinUserInExperience;
local v12 = require(script.Parent.MobileGameJoinCard);
return function() --[[ Line: 19 ]] --[[ Name: MobileGameJoinCardContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useExperienceBannerImage_0 (copy), l_useJoinUserInExperience_0 (copy), v1 (copy), l_AppPage_0 (copy), l_OpenGameDetails_0 (copy), v12 (copy)
    local v13 = l_useDispatch_0();
    local v14 = l_useNavigation_0();
    local v15 = v14.getParam("userId") or "";
    local v16 = v14.getParam("universeId") or "";
    local v17 = v14.getParam("playerName") or "";
    local v18 = v14.getParam("experienceName") or "";
    local v19 = l_useExperienceBannerImage_0(v16);
    local v20 = l_useJoinUserInExperience_0(v15, {
        isHomePageCarousel = true
    });
    local v21 = v1.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v14 (copy)
        v14.goBack();
    end, {
        v14
    });
    local v22 = v1.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v14 (copy), l_AppPage_0 (ref), v15 (copy)
        v14.goBack();
        v14.navigate(l_AppPage_0.ProfilePlatform, {
            detail = v15
        });
    end, {
        v14, 
        v15
    });
    local v23 = v1.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v14 (copy), v13 (copy), l_OpenGameDetails_0 (ref), v16 (copy)
        v14.goBack();
        v13(l_OpenGameDetails_0(v16, v14));
    end, {
        v13, 
        v14, 
        v16
    });
    return v1.createElement(v12, {
        onClose = v21, 
        onJoin = v20.joinExperience, 
        onViewProfile = v22, 
        onViewExperienceDetails = v23, 
        userId = v15, 
        universeId = v16, 
        playerName = v17, 
        experienceName = v18, 
        bannerImageUrl = v19.url
    });
end;