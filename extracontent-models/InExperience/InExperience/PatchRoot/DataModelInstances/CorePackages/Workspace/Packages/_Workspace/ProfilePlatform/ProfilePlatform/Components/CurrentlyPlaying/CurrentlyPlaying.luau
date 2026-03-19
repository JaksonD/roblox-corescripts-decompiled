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
return function(v30) --[[ Line: 45 ]] --[[ Name: CurrentlyPlaying ]]
    -- upvalues: l_useTokens_0 (copy), v14 (copy), v15 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v17 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v2 (copy), v18 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v16 (copy), l_AppPage_0 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (copy), l_OpenGameDetails_0 (copy), l_getRbxThumb_0 (copy), l_ThumbnailType_0 (copy), l_ThumbnailSize_0 (copy), l_ContentProvider_0 (copy), l_HorizontalPageMargin_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Text_0 (copy)
    local v31 = l_useTokens_0();
    local v32 = v14(v15.Components.CurrentlyPlaying);
    local v33 = l_useDispatch_0();
    local v34 = l_useNavigation_0();
    local v35 = v17();
    local v36 = v35 and v35.profileId;
    local v37 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local l_universeId_0 = v32.universeId;
    v2.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v33 (copy), v18 (ref), l_universeId_0 (copy)
        v33(v18.GetExperiencesDetails.API({
            (tostring(l_universeId_0))
        })):catch(function(v39) --[[ Line: 57 ]]
            -- upvalues: l_universeId_0 (ref)
            warn("CurrentlyPlaying: failed to fetch experience details for universeId", l_universeId_0, v39);
        end);
    end, l_dependencyArray_0(l_universeId_0, v33));
    local v41 = l_useSelector_0(function(v40) --[[ Line: 62 ]]
        -- upvalues: v16 (ref), l_universeId_0 (copy)
        return v16(v40, (("ProfilePlatform.Games.byGameId.%*"):format((tostring(l_universeId_0)))));
    end);
    local v42 = v41 and v41.rootPlaceId;
    local v43 = v41 and v41.name or "";
    local v44 = v2.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v37 (copy), v42 (copy), l_universeId_0 (copy), l_AppPage_0 (ref), v30 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v36 (copy), v33 (copy), l_OpenGameDetails_0 (ref), v34 (copy)
        v37.reportOpenGameDetailFromProfile(v42 or tostring(l_universeId_0), 0, 1, tostring(l_universeId_0), l_AppPage_0.ProfilePlatform, v30.layoutOrder, 1, if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v36 else nil);
        v33(l_OpenGameDetails_0(tostring(l_universeId_0), v34, {
            mountAsFullView = false, 
            showBackButton = true
        }));
    end, {
        l_universeId_0, 
        v42, 
        v36, 
        v30.layoutOrder, 
        v37, 
        v33, 
        v34
    });
    local v45 = l_getRbxThumb_0(l_ThumbnailType_0.GameIcon, l_universeId_0, l_ThumbnailSize_0.Small);
    local v46, v47 = v2.useState(l_ContentProvider_0:GetAssetFetchStatus(v45));
    v2.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: l_ContentProvider_0 (ref), v45 (copy), v47 (copy)
        local v48 = l_ContentProvider_0:GetAssetFetchStatusChangedSignal(v45):Connect(v47);
        return function() --[[ Line: 98 ]]
            -- upvalues: v48 (copy)
            v48:Disconnect();
        end;
    end, {
        v45
    });
    local v49 = v16(v32, "ageRecommendation.ageRecommendationSummary.ageRecommendation.displayNameWithHeaderShort");
    local v50 = true;
    if v43 ~= nil then
        v50 = true;
        if v43 ~= "" then
            v50 = v46 == Enum.AssetFetchStatus.Loading;
        end;
    end;
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = UDim2.new(1, 0, 0, 0), 
        backgroundTransparency = 1, 
        layoutOrder = v30.layoutOrder, 
        useAutomaticSizing = true
    }, {
        Content = v2.createElement(l_View_0, {
            tag = "row size-full-0 auto-y bg-shift-100 radius-medium padding-large stroke-standard stroke-default gap-medium align-y-center", 
            onActivated = v44
        }, {
            GameThumbnail = if not v50 then v2.createElement(l_Image_0, {
                tag = "radius-small aspect-1-1 size-1000-1000 auto-xy content-default align-y-center", 
                LayoutOrder = 1, 
                Image = v45
            }) else v2.createElement(l_Skeleton_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v31.Size.Size_1000, v31.Size.Size_1000), 
                Radius = l_Radius_0.Small
            }), 
            TextStack = v2.createElement(l_View_0, {
                tag = "col size-0-0 auto-xy content-default text-truncate-end text-align-x-left gap-xsmall align-y-center", 
                LayoutOrder = 2
            }, {
                GameTitle = if not v50 then v2.createElement(l_Text_0, {
                    tag = "auto-xy text-title-medium emphasis", 
                    Text = v43, 
                    LayoutOrder = 1
                }) else v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.7, 0, 0, v31.Typography.TitleMedium.FontSize), 
                    Radius = l_Radius_0.Small, 
                    LayoutOrder = 1
                }), 
                AgeRecommendationText = if not v50 then v2.createElement(l_Text_0, {
                    tag = "text-body-medium auto-xy", 
                    Text = v49, 
                    LayoutOrder = 2
                }) else v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.5, 0, 0, v31.Typography.BodyMedium.FontSize), 
                    Radius = l_Radius_0.Small, 
                    LayoutOrder = 2
                })
            })
        })
    });
end;