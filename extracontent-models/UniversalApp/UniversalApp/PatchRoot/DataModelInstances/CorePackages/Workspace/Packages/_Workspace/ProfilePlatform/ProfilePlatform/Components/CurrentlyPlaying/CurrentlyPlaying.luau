local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_HorizontalPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.HorizontalPageMargin;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Image_0 = v3.Image;
local l_Skeleton_0 = v3.Skeleton;
local l_getRbxThumb_0 = v3.Utility.getRbxThumb;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_Radius_0 = v3.Enums.Radius;
local l_ThumbnailSize_0 = v3.Enums.ThumbnailSize;
local l_ThumbnailType_0 = v3.Enums.ThumbnailType;
local v14 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v15 = require(l_script_FirstAncestor_0.Common.Enums);
local v16 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v17 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v18 = require(l_script_FirstAncestor_0.Networking.NetworkingGames);
local v19 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v19.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v19.Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = v19.Hooks.dependencyArray;
local l_useNavigation_0 = require(l_script_FirstAncestor_0.Parent.Navigation).useNavigation;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_Parent_0.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v31) --[[ Line: 47 ]] --[[ Name: CurrentlyPlaying ]]
    -- upvalues: l_useTokens_0 (copy), v14 (copy), v15 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v17 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v2 (copy), v18 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v16 (copy), l_AppPage_0 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (copy), l_OpenGameDetails_0 (copy), l_getRbxThumb_0 (copy), l_ThumbnailType_0 (copy), l_ThumbnailSize_0 (copy), l_ContentProvider_0 (copy), l_HorizontalPageMargin_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Text_0 (copy)
    local v32 = l_useTokens_0();
    local v33 = v14(v15.Components.CurrentlyPlaying);
    local v34 = l_useDispatch_0();
    local v35 = l_useNavigation_0();
    local v36 = v17();
    local v37 = v36 and v36.profileId;
    local v38 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local l_universeId_0 = v33.universeId;
    v2.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: l_universeId_0 (copy), v34 (copy), v18 (ref)
        if not l_universeId_0 then
            return;
        else
            v34(v18.GetExperiencesDetails.API({
                (tostring(l_universeId_0))
            })):catch(function(v40) --[[ Line: 63 ]]
                -- upvalues: l_universeId_0 (ref)
                warn("CurrentlyPlaying: failed to fetch experience details for universeId", l_universeId_0, v40);
            end);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_universeId_0, 
        v34
    } else l_dependencyArray_0(l_universeId_0, v34));
    local v42 = l_useSelector_0(function(v41) --[[ Line: 72 ]]
        -- upvalues: v16 (ref), l_universeId_0 (copy)
        return v16(v41, (("ProfilePlatform.Games.byGameId.%*"):format((tostring(l_universeId_0)))));
    end);
    local v43 = v42 and v42.rootPlaceId;
    local v44 = v42 and v42.name or "";
    local v45 = v2.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v38 (copy), v43 (copy), l_universeId_0 (copy), l_AppPage_0 (ref), v31 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v37 (copy), v34 (copy), l_OpenGameDetails_0 (ref), v35 (copy)
        v38.reportOpenGameDetailFromProfile(v43 or tostring(l_universeId_0), 0, 1, tostring(l_universeId_0), l_AppPage_0.ProfilePlatform, v31.layoutOrder, 1, if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v37 else nil);
        v34(l_OpenGameDetails_0(tostring(l_universeId_0), v35, {
            mountAsFullView = false, 
            showBackButton = true
        }));
    end, {
        l_universeId_0, 
        v43, 
        v37, 
        v31.layoutOrder, 
        v38, 
        v34, 
        v35
    });
    local v46 = if l_universeId_0 then l_getRbxThumb_0(l_ThumbnailType_0.GameIcon, l_universeId_0, l_ThumbnailSize_0.Small) else nil;
    local v47, v48 = v2.useState(if v46 then l_ContentProvider_0:GetAssetFetchStatus(v46) else Enum.AssetFetchStatus.None);
    v2.useEffect(function() --[[ Line: 108 ]]
        -- upvalues: v46 (copy), l_ContentProvider_0 (ref), v48 (copy)
        if not v46 then
            return;
        else
            local v49 = l_ContentProvider_0:GetAssetFetchStatusChangedSignal(v46):Connect(v48);
            return function() --[[ Line: 114 ]]
                -- upvalues: v49 (copy)
                v49:Disconnect();
            end;
        end;
    end, {
        v46
    });
    local v50 = v16(v33, "ageRecommendation.ageRecommendationSummary.ageRecommendation.displayNameWithHeaderShort");
    local v51 = true;
    if v44 ~= nil then
        v51 = true;
        if v44 ~= "" then
            v51 = v47 == Enum.AssetFetchStatus.Loading;
        end;
    end;
    if not l_universeId_0 then
        return nil;
    else
        return v2.createElement(l_HorizontalPageMargin_0, {
            size = UDim2.new(1, 0, 0, 0), 
            backgroundTransparency = 1, 
            layoutOrder = v31.layoutOrder, 
            useAutomaticSizing = true
        }, {
            Content = v2.createElement(l_View_0, {
                tag = "row align-y-center gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-medium bg-shift-100", 
                onActivated = v45
            }, {
                GameThumbnail = if not v51 then v2.createElement(l_Image_0, {
                    tag = "radius-small aspect-1-1 size-1000-1000 auto-xy align-y-center", 
                    LayoutOrder = 1, 
                    Image = v46
                }) else v2.createElement(l_Skeleton_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(v32.Size.Size_1000, v32.Size.Size_1000), 
                    Radius = l_Radius_0.Small
                }), 
                TextStack = v2.createElement(l_View_0, {
                    tag = "col align-y-center fill gap-xsmall auto-y content-default", 
                    LayoutOrder = 2
                }, {
                    GameTitle = if not v51 then v2.createElement(l_Text_0, {
                        tag = "emphasis size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end", 
                        Text = v44, 
                        LayoutOrder = 1
                    }) else v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.7, 0, 0, v32.Typography.TitleMedium.FontSize), 
                        Radius = l_Radius_0.Small, 
                        LayoutOrder = 1
                    }), 
                    AgeRecommendationText = if not v51 then v2.createElement(l_Text_0, {
                        tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end", 
                        Text = v50, 
                        LayoutOrder = 2
                    }) else v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.5, 0, 0, v32.Typography.BodyMedium.FontSize), 
                        Radius = l_Radius_0.Small, 
                        LayoutOrder = 2
                    })
                })
            })
        });
    end;
end;