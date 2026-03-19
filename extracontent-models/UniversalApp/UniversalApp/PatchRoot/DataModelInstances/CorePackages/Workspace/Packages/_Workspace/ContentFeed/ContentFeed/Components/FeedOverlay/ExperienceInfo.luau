local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ExperienceService_0 = require(l_Parent_1.ExperienceService).ExperienceService;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.Foundation);
local v6 = require(l_Parent_1.Localization);
local v7 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v8 = require(l_Parent_1.RobloxAppEnums);
local v9 = require(l_Parent_1.UIBlox);
local l_AppPage_0 = v8.AppPage;
local v11 = require(l_Parent_0.Constants);
local v12 = require(l_Parent_0.Analytics.EventNames);
local v13 = require(l_Parent_0.App.FeedContext);
local l_getDeepValue_0 = v7.SocialLibraries.config({}).Dictionary.getDeepValue;
local v15 = require(l_Parent_0.Utils.getExperienceThumbnailImage);
local l_LoadableImage_0 = v9.App.Loading.LoadableImage;
local v17 = require(l_Parent_0.App.Networking);
local l_PlayButtonStates_0 = require(l_Parent_1.GamePlayButton).PlayButtonStates;
local l_Icon_0 = v5.Icon;
local l_Skeleton_0 = v5.Skeleton;
local l_Text_0 = v5.Text;
local l_View_0 = v5.View;
local v23 = require(l_Parent_0.Hooks.useAnalytics);
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_usePlayButtonState_0 = require(l_Parent_1.GamePlayButton).usePlayButtonState;
local l_useNavigation_0 = require(l_Parent_1.Navigation).useNavigation;
local v27 = require(l_Parent_0.Hooks.useSafeZoneOffsets);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useTokens_0 = v5.Hooks.useTokens;
return function(v30) --[[ Line: 53 ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), v13 (copy), l_useNavigation_0 (copy), v27 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v23 (copy), l_usePlayButtonState_0 (copy), v17 (copy), l_PlayButtonStates_0 (copy), v12 (copy), l_AppPage_0 (copy), l_ExperienceService_0 (copy), v11 (copy), l_useLocalization_0 (copy), l_View_0 (copy), l_LoadableImage_0 (copy), v15 (copy), l_Text_0 (copy), l_Skeleton_0 (copy), l_Icon_0 (copy)
    local v31 = l_useTokens_0();
    local v32 = v3.useContext(v13);
    local v33 = l_useNavigation_0();
    local v34 = v27();
    local v36 = l_useSelector_0(function(v35) --[[ Line: 61 ]]
        -- upvalues: l_getDeepValue_0 (ref), v30 (copy)
        return l_getDeepValue_0(v35, "Games.byGameId." .. v30.universeId .. ".name");
    end);
    local v38 = l_useSelector_0(function(v37) --[[ Line: 65 ]]
        -- upvalues: l_getDeepValue_0 (ref), v30 (copy)
        return l_getDeepValue_0(v37, "Games.byGameId." .. v30.universeId .. ".rootPlaceId");
    end);
    local v42 = l_useSelector_0(function(v39) --[[ Line: 69 ]]
        -- upvalues: l_getDeepValue_0 (ref), v30 (copy)
        local v40 = l_getDeepValue_0(v39, "GameVotes." .. v30.universeId .. ".upVotes");
        local v41 = l_getDeepValue_0(v39, "GameVotes." .. v30.universeId .. ".downVotes");
        if not v40 or not v41 then
            return nil;
        else
            return (math.round(100 * v40 / (v40 + v41)));
        end;
    end);
    local v43 = v23();
    local v44 = l_usePlayButtonState_0(v17.ContentFeedNetworkImpl, (tostring(v30.universeId)));
    local v45 = "icons/common/play";
    if v44.playButtonState == l_PlayButtonStates_0.PaidAccess then
        v45 = "icons/common/robux";
    elseif v44.playButtonState ~= l_PlayButtonStates_0.Playable then
        v45 = "icons/actions/block";
    end;
    local v46 = v3.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v32 (copy), v43 (copy), v12 (ref), v30 (copy), v44 (copy), l_PlayButtonStates_0 (ref), v33 (copy), l_AppPage_0 (ref), l_ExperienceService_0 (ref), v38 (copy), v11 (ref)
        if v32.isZooming then
            return;
        else
            v43.fireEvent(v12.ContentFeedPlayButtonPressed, {
                postId = v30.postId
            });
            if v44.playButtonState == l_PlayButtonStates_0.PaidAccess then
                v33.goBack();
                v33.navigate(l_AppPage_0.GameDetail, {
                    detail = tostring(v30.universeId), 
                    extraProps = {
                        mountAsFullView = true
                    }
                });
            end;
            if v44.playButtonState == l_PlayButtonStates_0.Playable then
                l_ExperienceService_0:LaunchExperience({
                    placeId = if v38 then v38 else v30.placeId
                }, v11.LaunchExperienceSource);
            end;
            return;
        end;
    end, {
        v32.isZooming, 
        v33, 
        v44.playButtonState, 
        v30.placeId, 
        v30.postId, 
        v30.universeId, 
        v38
    });
    local v47 = l_useLocalization_0({
        notRated = "Feature.ContentFeed.Label.NotRated", 
        ratingPercentage = {
            "Feature.ContentFeed.Label.Rating"; 
            rating = tostring(v42)
        }
    });
    local v48 = v42 ~= v42;
    local l_createElement_0 = v3.createElement;
    local l_l_View_0_0 = l_View_0;
    local v51 = {
        LayoutOrder = v30.layoutOrder, 
        tag = "bg-surface-100 auto-y size-full-0 row align-x-left align-y-center gap-small"
    };
    local v52 = {
        UIPadding = v3.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 20 + v34.bottom), 
            PaddingLeft = UDim.new(0, 20), 
            PaddingRight = UDim.new(0, 20), 
            PaddingTop = UDim.new(0, 20)
        }), 
        ExperienceThumbnail = v3.createElement(l_LoadableImage_0, {
            BackgroundTransparency = 1, 
            cornerRadius = UDim.new(0, v31.Radius.Medium), 
            Image = v15(v30.universeId, 150), 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Fit, 
            Size = UDim2.fromOffset(40, 40), 
            useShimmerAnimationWhileLoading = true
        }), 
        ExperienceMetadata = v3.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "auto-y bg-action-subtle grow col align-x-left align-y-center gap-xsmall"
        }, {
            ExperienceName = if v36 then v3.createElement(l_Text_0, {
                LayoutOrder = 1, 
                tag = "text-title-large content-action-emphasis text-truncate-end text-align-x-left text-align-y-top size-full-0 auto-y", 
                Text = v36
            }) else nil, 
            ExperienceNameShimmerPanel = if not v36 then v3.createElement(l_Skeleton_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(160, 15)
            }) else nil, 
            ExperienceRating = if v42 then v3.createElement(l_Text_0, {
                LayoutOrder = 2, 
                tag = "auto-xy content-default size-full-0 text-align-x-left text-align-y-top text-body-medium text-truncate-end", 
                Text = if v48 then v47.notRated else v47.ratingPercentage
            }) else nil, 
            ExperienceRatingShimmerPanel = if not v42 then v3.createElement(l_Skeleton_0, {
                LayoutOrder = 2, 
                Size = UDim2.fromOffset(160, 15)
            }) else nil
        })
    };
    local l_createElement_1 = v3.createElement;
    local l_l_View_0_1 = l_View_0;
    local v55 = {};
    local v56 = false;
    if v44.playButtonState ~= l_PlayButtonStates_0.Loading then
        v56 = false;
        if v44.playButtonState ~= l_PlayButtonStates_0.PaidAccess then
            v56 = v44.playButtonState ~= l_PlayButtonStates_0.Playable;
        end;
    end;
    v55.isDisabled = v56;
    v55.LayoutOrder = 3;
    v55.onActivated = v46;
    v55.tag = "bg-action-emphasis size-2000-1000 radius-medium";
    v52.JoinCTA = l_createElement_1(l_l_View_0_1, v55, {
        PlayIcon = v3.createElement(l_Icon_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            name = v45, 
            Position = UDim2.fromScale(0.5, 0.5), 
            style = v31.Color.ActionEmphasis.Foreground
        })
    });
    return l_createElement_0(l_l_View_0_0, v51, v52);
end;