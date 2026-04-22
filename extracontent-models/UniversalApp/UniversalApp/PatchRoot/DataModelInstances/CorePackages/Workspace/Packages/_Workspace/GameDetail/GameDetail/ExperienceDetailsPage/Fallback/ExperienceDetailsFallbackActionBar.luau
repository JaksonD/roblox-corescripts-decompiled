local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Skeleton_0 = v2.Skeleton;
local l_Radius_0 = v2.Enums.Radius;
local l_ButtonSize_0 = v2.Enums.ButtonSize;
local l_useTokens_0 = v2.Hooks.useTokens;
local v8 = require(l_Parent_0.GamePlayButton);
local v9 = require(script.Parent.Parent.useGameInfo);
local l_PlayButton_0 = v8.PlayButton;
return {
    Skeleton = v1.memo(function(v11) --[[ Line: 24 ]] --[[ Name: ExperienceDetailsActionBarSkeleton ]]
        -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_PlayButton_0 (copy), l_ButtonSize_0 (copy), v2 (copy)
        local l_Size_1200_0 = l_useTokens_0().Size.Size_1200;
        return v1.createElement(l_View_0, {
            tag = "row align-y-center gap-small size-full-0 auto-y padding-xlarge bg-surface-0", 
            testId = "--edp-fallback-action-bar-skeleton"
        }, {
            IconButtonSkeleton1 = v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromOffset(l_Size_1200_0, l_Size_1200_0), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 1
            }), 
            IconButtonSkeleton2 = v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromOffset(l_Size_1200_0, l_Size_1200_0), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 2
            }), 
            PlayBtn = v1.createElement(l_PlayButton_0, {
                universeId = v11.universeId, 
                referralSource = v11.referralSource, 
                launchSource = v11.launchSource, 
                experienceJoinData = v11.experienceJoinData, 
                placeId = v11.placeIdOverride, 
                buttonSize = l_ButtonSize_0.Large, 
                fillBehavior = v2.Enums.FillBehavior.Fill, 
                LayoutOrder = 3, 
                testId = "--edp-fallback-play-button"
            })
        });
    end), 
    Error = v1.memo(function(v13) --[[ Line: 56 ]] --[[ Name: ExperienceDetailsActionBarError ]]
        -- upvalues: v9 (copy), v1 (copy), l_View_0 (copy), l_PlayButton_0 (copy), l_ButtonSize_0 (copy), v2 (copy)
        local v14 = v9(v13.universeId);
        local v15 = false;
        if v14 ~= nil then
            v15 = v14.isUnavailable == true;
        end;
        if v15 then
            return nil;
        else
            return v1.createElement(l_View_0, {
                tag = "row align-y-center gap-small size-full-0 auto-y padding-xlarge bg-surface-0", 
                testId = "--edp-fallback-action-bar-error"
            }, {
                PlayBtn = v1.createElement(l_PlayButton_0, {
                    universeId = v13.universeId, 
                    referralSource = v13.referralSource, 
                    launchSource = v13.launchSource, 
                    experienceJoinData = v13.experienceJoinData, 
                    placeId = v13.placeIdOverride, 
                    buttonSize = l_ButtonSize_0.Large, 
                    fillBehavior = v2.Enums.FillBehavior.Fill, 
                    LayoutOrder = 1, 
                    testId = "--edp-fallback-play-button"
                })
            });
        end;
    end)
};