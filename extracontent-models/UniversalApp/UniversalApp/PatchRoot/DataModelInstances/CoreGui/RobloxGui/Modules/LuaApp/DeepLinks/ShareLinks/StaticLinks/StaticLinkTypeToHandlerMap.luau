local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameProtocol.default;
local l_GamesMultigetPlaceDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GamesByPlaceId.GamesMultigetPlaceDetails;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local l_LaunchGame_0 = require(l_CorePackages_0.Workspace.Packages.GameLaunch).LaunchGame;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v9 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local l_EnableCommunityProfilePageIXP_0 = v9.EnableCommunityProfilePageIXP;
local l_Sources_0 = v9.Sources;
local l_ProfileTypes_0 = v9.ProfileTypes;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local v16 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v19 = require(l_Parent_0.StaticShareLinkTypes);
local _ = require(l_Parent_1.Types);
return {
    [v19.Asset] = function(v21, _, _) --[[ Line: 29 ]]
        -- upvalues: v14 (copy), l_AvatarScreen_0 (copy)
        local l_Asset_0 = v14.ItemType.Asset;
        local v25 = l_Asset_0 .. v21;
        return {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }, 
                {
                    name = l_AvatarScreen_0.ItemDetails, 
                    detail = v25, 
                    extraProps = {
                        itemId = v21, 
                        itemType = l_Asset_0, 
                        mountAsFullView = true, 
                        mountAnimation = false
                    }
                }
            }
        };
    end, 
    [v19.Bundle] = function(v26, _, _) --[[ Line: 50 ]]
        -- upvalues: v14 (copy), l_AvatarScreen_0 (copy)
        local l_Bundle_0 = v14.ItemType.Bundle;
        local v30 = l_Bundle_0 .. v26;
        return {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }, 
                {
                    name = l_AvatarScreen_0.ItemDetails, 
                    detail = v30, 
                    extraProps = {
                        itemId = v26, 
                        itemType = l_Bundle_0, 
                        mountAsFullView = true, 
                        mountAnimation = false
                    }
                }
            }
        };
    end, 
    [v19.ExperienceDetails] = function(v31, v32, v33) --[[ Line: 71 ]]
        -- upvalues: l_GamesMultigetPlaceDetails_0 (copy), l_AppPage_0 (copy)
        local _, v37 = l_GamesMultigetPlaceDetails_0(v33.network, v31):andThen(function(v34) --[[ Line: 73 ]]
            -- upvalues: l_AppPage_0 (ref), v32 (copy)
            local v35 = tostring(v34.responseBody[1].universeId);
            return {
                {
                    {
                        name = l_AppPage_0.Games
                    }, 
                    {
                        name = l_AppPage_0.GameDetail, 
                        detail = v35, 
                        extraProps = v32
                    }
                }
            };
        end):catch(function() --[[ Line: 86 ]]
            return nil;
        end):await();
        return v37;
    end, 
    [v19.Group] = function(v38, v39, _) --[[ Line: 94 ]]
        -- upvalues: l_EnableCommunityProfilePageIXP_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppPage_0 (copy), v3 (copy), l_ProfileTypes_0 (copy), l_Sources_0 (copy), l_UrlBuilder_0 (copy), v16 (copy)
        local v41 = nil;
        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled then
            l_IXPServiceWrapper_0:WaitForInitialization();
            l_EnableCommunityProfilePageIXP_0.logExposure();
            local v42 = l_IXPServiceWrapper_0:GetLayerData(l_EnableCommunityProfilePageIXP_0.EnableCommunityProfilePageExperimentLayer) or {};
            v41 = l_EnableCommunityProfilePageIXP_0.isFeatureActive({
                [l_EnableCommunityProfilePageIXP_0.EnableCommunityProfilePageExperimentLayer] = v42
            });
        end;
        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and v41 then
            return {
                {
                    {
                        name = l_AppPage_0.Home
                    }, 
                    {
                        name = l_AppPage_0.ProfilePlatform, 
                        detail = v38, 
                        extraProps = v3.Dictionary.union(v39, {
                            profileType = l_ProfileTypes_0.Community, 
                            source = l_Sources_0.ProfileShare
                        })
                    }
                }
            };
        else
            local v43 = l_UrlBuilder_0.user.group({
                groupId = v38
            });
            return {
                {
                    {
                        name = l_AppPage_0.Home
                    }, 
                    {
                        name = l_AppPage_0.GenericWebPage, 
                        detail = v43, 
                        extraProps = {
                            titleKey = "CommonUI.Features.Label.Groups", 
                            transitionAnimation = v16.None
                        }
                    }
                }
            };
        end;
    end, 
    [v19.Look] = function(v44, _, _) --[[ Line: 142 ]]
        -- upvalues: v14 (copy), l_AvatarScreen_0 (copy)
        local l_Look_0 = v14.ItemType.Look;
        local v48 = l_Look_0 .. v44;
        return {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }, 
                {
                    name = l_AvatarScreen_0.LookDetails, 
                    detail = v48, 
                    extraProps = {
                        itemId = v44, 
                        itemType = l_Look_0, 
                        mountAsFullView = true, 
                        mountAnimation = false
                    }
                }
            }
        };
    end, 
    [v19.Server] = function(v49, v50, v51) --[[ Line: 165 ]]
        -- upvalues: l_LaunchGame_0 (copy), v19 (copy), l_default_0 (copy), l_GamesMultigetPlaceDetails_0 (copy), l_AppPage_0 (copy)
        if v50.code then
            local l_code_0 = v50.code;
            v50.code = nil;
            v50.linkCode = l_code_0;
        end;
        if v50.linkCode then
            l_LaunchGame_0(v49, "Static" .. v19.Server, v50, l_default_0);
        end;
        local _, v56 = l_GamesMultigetPlaceDetails_0(v51.network, v49):andThen(function(v53) --[[ Line: 177 ]]
            -- upvalues: l_AppPage_0 (ref), v50 (copy)
            local v54 = tostring(v53.responseBody[1].universeId);
            return {
                {
                    {
                        name = l_AppPage_0.Games
                    }, 
                    {
                        name = l_AppPage_0.GameDetail, 
                        detail = v54, 
                        extraProps = v50
                    }
                }
            };
        end):catch(function() --[[ Line: 190 ]]
            return nil;
        end):await();
        return v56;
    end, 
    [v19.UserProfile] = function(v57, v58, _) --[[ Line: 198 ]]
        -- upvalues: l_AppPage_0 (copy)
        return {
            {
                {
                    name = l_AppPage_0.Home
                }, 
                {
                    name = l_AppPage_0.ProfilePlatform, 
                    detail = v57, 
                    extraProps = v58
                }
            }
        };
    end, 
    [v19.Unknown] = function(_, _, _) --[[ Line: 211 ]]
        return nil;
    end
};