local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_Icon_0 = v2.Icon;
local l_Skeleton_0 = v2.Skeleton;
local l_Button_0 = v2.Button;
local l_Radius_0 = v2.Enums.Radius;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_Parent_0.DataHydration);
local v13 = require(l_Parent_0.SignalsReact);
local l_CompositionTags_0 = require(l_Parent_0.AppComposition).CompositionTags;
local v15 = require(script.Parent.ExperienceDetailsFallbackAttributionRow);
local v16 = require(script.Parent.Parent.useGameInfo);
local function v21(v17) --[[ Line: 41 ]] --[[ Name: ExperienceDetailsFeedSkeleton ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_CompositionTags_0 (copy), v15 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local l_universeId_0 = v17.universeId;
    local v19 = l_useTokens_0();
    local l_isSmallScreen_0 = v17.isSmallScreen;
    return v1.createElement(l_View_0, {
        tag = {
            ["col gap-xlarge size-full auto-y"] = true, 
            ["padding-x-xlarge"] = l_isSmallScreen_0, 
            ["align-x-left"] = not l_isSmallScreen_0, 
            [l_CompositionTags_0.ContentRegion.Body] = true
        }, 
        testId = "--edp-fallback-feed-skeleton"
    }, {
        AttributionRow = v1.createElement(v15, {
            universeId = l_universeId_0, 
            isLoading = true, 
            isSmallScreen = l_isSmallScreen_0, 
            launchSource = v17.launchSource, 
            referralSource = v17.referralSource, 
            experienceJoinData = v17.experienceJoinData, 
            placeIdOverride = v17.placeIdOverride
        }), 
        MediaGallerySkeleton = v1.createElement(l_View_0, {
            tag = "size-full-0", 
            LayoutOrder = l_isSmallScreen_0 and 2 or 3, 
            aspectRatio = {
                AspectRatio = 1.7777777777777777, 
                AspectType = Enum.AspectType.ScaleWithParentSize, 
                DominantAxis = Enum.DominantAxis.Width
            }
        }, {
            Skeleton = v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromScale(1, 1), 
                radius = l_Radius_0.Medium
            })
        }), 
        ActionModuleSkeleton = v1.createElement(l_View_0, {
            tag = "row gap-small size-full-0 auto-y", 
            LayoutOrder = l_isSmallScreen_0 and 3 or 2
        }, {
            Chip1 = v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromOffset(v19.Size.Size_2400, v19.Size.Size_800), 
                radius = l_Radius_0.Large, 
                LayoutOrder = 1
            }), 
            Chip2 = v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromOffset(v19.Size.Size_2000, v19.Size.Size_800), 
                radius = l_Radius_0.Large, 
                LayoutOrder = 2
            }), 
            Chip3 = v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromOffset(v19.Size.Size_2000, v19.Size.Size_800), 
                radius = l_Radius_0.Large, 
                LayoutOrder = 3
            }), 
            Chip4 = v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromOffset(v19.Size.Size_2000, v19.Size.Size_800), 
                radius = l_Radius_0.Large, 
                LayoutOrder = 4
            })
        }), 
        DescriptionSkeleton = v1.createElement(l_View_0, {
            tag = "col gap-medium size-full-0 auto-y", 
            LayoutOrder = 4
        }, {
            HeaderSkeleton = v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromOffset(v19.Size.Size_2800 * 2, v19.Typography.HeadingSmall.LineHeight * v19.Typography.HeadingSmall.FontSize), 
                radius = l_Radius_0.Small, 
                LayoutOrder = 1
            }), 
            TextSkeleton = v1.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v19.Typography.BodyLarge.LineHeight * v19.Typography.BodyLarge.FontSize * 3), 
                radius = l_Radius_0.Small, 
                LayoutOrder = 2
            })
        })
    });
end;
return {
    Skeleton = v1.memo(v21), 
    Error = v1.memo(function(v22) --[[ Line: 141 ]] --[[ Name: ExperienceDetailsFeedError ]]
        -- upvalues: l_useTokens_0 (copy), v16 (copy), v13 (copy), v12 (copy), l_useLocalization_0 (copy), v1 (copy), v21 (copy), l_View_0 (copy), l_Icon_0 (copy), v2 (copy), l_Text_0 (copy), l_CompositionTags_0 (copy), v15 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy)
        local l_universeId_1 = v22.universeId;
        local l_isSmallScreen_1 = v22.isSmallScreen;
        local v25 = l_useTokens_0();
        local v26 = v16(l_universeId_1);
        local v27 = v13.useSignalState(v12.Game.getAgeRecommendationStore(false).getAgeRecommendation(l_universeId_1).data);
        local v28 = l_useLocalization_0({
            somethingWentWrongMessage = "Feature.Toast.NetworkingError.SomethingIsWrong", 
            experienceUnavailableMessage = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable", 
            retryButtonText = "InGame.CommonUI.Button.Retry"
        });
        if v26 == nil then
            return v1.createElement(v21, {
                universeId = l_universeId_1, 
                isSmallScreen = l_isSmallScreen_1, 
                launchSource = v22.launchSource, 
                referralSource = v22.referralSource, 
                experienceJoinData = v22.experienceJoinData, 
                placeIdOverride = v22.placeIdOverride
            });
        else
            local l_creator_0 = v26.creator;
            local l_name_0 = v26.name;
            local v31 = l_creator_0 and l_creator_0.name;
            local v32 = if l_creator_0 then l_creator_0.hasVerifiedBadge == true else false;
            local v33 = v27 and v27.displayNameWithHeaderShort;
            if v26.isUnavailable == true then
                return v1.createElement(l_View_0, {
                    tag = "col align-x-center align-y-center size-full-0 auto-y", 
                    testId = "--edp-fallback-feed-unavailable"
                }, {
                    ErrorIcon = v1.createElement(l_Icon_0, {
                        size = v25.Size.Size_2500, 
                        name = v2.Enums.IconName.TriangleExclamation, 
                        LayoutOrder = 1
                    }), 
                    ErrorText = v1.createElement(l_Text_0, {
                        tag = "auto-xy padding-top-medium text-body-large text-align-x-center content-default", 
                        Text = v28.experienceUnavailableMessage, 
                        LayoutOrder = 2
                    })
                });
            else
                return v1.createElement(l_View_0, {
                    tag = {
                        ["col gap-xlarge size-full auto-y"] = true, 
                        ["padding-x-xlarge"] = l_isSmallScreen_1, 
                        ["align-x-left"] = not l_isSmallScreen_1, 
                        [l_CompositionTags_0.ContentRegion.Body] = true
                    }, 
                    testId = "--edp-fallback-feed-error"
                }, {
                    AttributionRow = v1.createElement(v15, {
                        universeId = l_universeId_1, 
                        gameName = l_name_0, 
                        creatorName = v31, 
                        hasVerifiedBadge = v32, 
                        ageRecDisplayName = v33, 
                        isSmallScreen = l_isSmallScreen_1, 
                        launchSource = v22.launchSource, 
                        referralSource = v22.referralSource, 
                        experienceJoinData = v22.experienceJoinData, 
                        placeIdOverride = v22.placeIdOverride
                    }), 
                    ErrorBlock = v1.createElement(l_View_0, {
                        tag = "col align-x-center size-full-0 auto-y padding-top-xxlarge", 
                        LayoutOrder = 2, 
                        testId = "--edp-fallback-error-state"
                    }, {
                        ErrorIcon = v1.createElement(l_Icon_0, {
                            size = v25.Size.Size_2500, 
                            name = v2.Enums.IconName.TriangleExclamation, 
                            LayoutOrder = 1
                        }), 
                        ErrorText = v1.createElement(l_Text_0, {
                            tag = "auto-xy padding-bottom-medium text-body-large text-align-x-center content-default", 
                            Text = v28.somethingWentWrongMessage, 
                            LayoutOrder = 2
                        }), 
                        RetryButton = v1.createElement(l_Button_0, {
                            text = v28.retryButtonText, 
                            onActivated = v22.refresh, 
                            variant = l_ButtonVariant_0.Standard, 
                            LayoutOrder = 3, 
                            testId = "--edp-fallback-error-state-retry"
                        })
                    })
                });
            end;
        end;
    end)
};