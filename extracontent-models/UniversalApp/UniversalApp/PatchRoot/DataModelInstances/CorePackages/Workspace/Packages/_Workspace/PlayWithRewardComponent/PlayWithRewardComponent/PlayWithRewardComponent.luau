local l_AdService_0 = game:GetService("AdService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayWithRewardComponent");
local v3 = require(l_script_FirstAncestor_0.PlayWithRewardBlackoutCurtain);
local v4 = require(l_script_FirstAncestor_0.PlayWithRewardTelemetry);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.PlayWithRewardState);
local v7 = require(l_Parent_0.Foundation);
local v8 = require(l_Parent_0.GamePlayButton);
local v9 = require(l_Parent_0.React);
local v10 = require(l_Parent_0.RobloxAppHooks);
local v11 = require(l_Parent_0.RobloxAppUpdate);
local v12 = require(l_Parent_0.RoactServiceTags);
local v13 = require(l_Parent_0.RoactUtils);
local l_SetPlayWithRewardState_0 = v6.SetPlayWithRewardState;
local l_Button_0 = v7.Button;
local l_Enums_0 = v7.Enums;
local l_Icon_0 = v7.Icon;
local l_Image_0 = v7.Image;
local l_Skeleton_0 = v7.Skeleton;
local l_Text_0 = v7.Text;
local l_View_0 = v7.View;
local l_useTokens_0 = v7.Hooks.useTokens;
local l_PlayButtonReferralSource_0 = v8.PlayButtonReferralSource;
local l_usePlayButtonLaunchGame_0 = v8.usePlayButtonLaunchGame;
local l_RoactAnalytics_0 = v12.RoactAnalytics;
local l_AppUpdateService_0 = v12.AppUpdateService;
local l_useDispatch_0 = v13.Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = v10.useRoactService;
local l_CheckForUpdate_0 = v11.Thunks.CheckForUpdate;
local l_game_EngineFeature_0 = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly");
local l_game_EngineFeature_1 = game:GetEngineFeature("CanPerformBinaryUpdateEnabled");
local v32 = game:DefineFastInt("PlayWithRewardFallbackBannerProductImageAssetId", 0);
local v33 = game:DefineFastInt("LuaAppPlayWithRewardSkeletonLayoutOrder", 120);
PlayWithRewardComponent = function(v34) --[[ Line: 58 ]] --[[ Name: PlayWithRewardComponent ]]
    -- upvalues: l_useTokens_0 (copy), l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppUpdateService_0 (copy), l_useDispatch_0 (copy), l_Players_0 (copy), v9 (copy), l_usePlayButtonLaunchGame_0 (copy), l_PlayButtonReferralSource_0 (copy), v4 (copy), v3 (copy), l_SetPlayWithRewardState_0 (copy), l_AdService_0 (copy), v32 (copy), l_game_EngineFeature_0 (copy), l_CheckForUpdate_0 (copy), l_game_EngineFeature_1 (copy), l_Skeleton_0 (copy), v33 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Image_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy)
    local v35 = l_useTokens_0();
    local v36 = l_useRoactService_0(l_RoactAnalytics_0);
    local v37 = l_useRoactService_0(l_AppUpdateService_0);
    local v38 = l_useDispatch_0();
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v40 = v9.useRef(false);
    local l_playWithRewardAdData_0 = v34.playWithRewardAdData;
    local v42 = tonumber(l_playWithRewardAdData_0 and l_playWithRewardAdData_0.productId or 0) or 0;
    local v43 = false;
    if v34.flowId ~= "" then
        v43 = v34.isAdDataExpected;
    end;
    local v44 = false;
    if l_LocalPlayer_0 ~= nil then
        v44 = false;
        if v34.flowId ~= "" then
            v44 = false;
            if v34.fetchedUniverseId ~= nil then
                v44 = false;
                if v34.fetchedUniverseId == v34.universeId then
                    v44 = false;
                    if l_playWithRewardAdData_0 ~= nil then
                        v44 = false;
                        if l_playWithRewardAdData_0.adAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable then
                            v44 = false;
                            if l_playWithRewardAdData_0.experimentVariantData ~= nil then
                                v44 = false;
                                if l_playWithRewardAdData_0.experimentVariantData.layoutOrder ~= 0 then
                                    v44 = v42 ~= 0;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local v45 = l_usePlayButtonLaunchGame_0(v34.universeId, v34.placeId, v34.placeId, l_PlayButtonReferralSource_0.PlayWithReward, "PlayWithRewardGameDetails", "PlayWithRewardButton");
    v9.useEffect(function() --[[ Line: 91 ]]
        -- upvalues: v44 (copy), v40 (copy), v4 (ref), v34 (copy)
        if v44 then
            v40.current = true;
            v4.logPlayWithRewardButtonShown(v34.flowId, v34.universeId, "startShow");
        end;
        return function() --[[ Line: 97 ]]
            -- upvalues: v40 (ref), v4 (ref), v34 (ref)
            if v40.current then
                v40.current = false;
                v4.logPlayWithRewardButtonShown(v34.flowId, v34.universeId, "endShow");
            end;
        end;
    end, {
        v44, 
        v34.flowId, 
        v34.universeId
    });
    local v46 = if l_playWithRewardAdData_0 then l_playWithRewardAdData_0.productName else "";
    local v47 = if l_playWithRewardAdData_0 then l_playWithRewardAdData_0.productImageAssetId else "";
    local v48 = v47 == "";
    local v52 = v9.useCallback(function() --[[ Line: 110 ]]
        -- upvalues: v4 (ref), v34 (copy), v3 (ref), v38 (copy), l_SetPlayWithRewardState_0 (ref), l_AdService_0 (ref), v46 (copy), v48 (copy), v32 (ref), v47 (copy), v45 (copy), l_game_EngineFeature_0 (ref), l_CheckForUpdate_0 (ref), v37 (copy), l_game_EngineFeature_1 (ref), v36 (copy)
        local function v51() --[[ Line: 111 ]] --[[ Name: showAdThenLaunch ]]
            -- upvalues: v4 (ref), v34 (ref), v3 (ref), v38 (ref), l_SetPlayWithRewardState_0 (ref), l_AdService_0 (ref), v46 (ref), v48 (ref), v32 (ref), v47 (ref), v45 (ref)
            v4.logPlayWithRewardBlackoutCurtainAction(v34.flowId, v34.universeId, "shown");
            v3.show();
            v4.logPlayWithRewardButtonClicked(v34.flowId, v34.universeId);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 117 ]]
                -- upvalues: v38 (ref), l_SetPlayWithRewardState_0 (ref), v34 (ref), v4 (ref), l_AdService_0 (ref)
                v38(l_SetPlayWithRewardState_0(v34.flowId, v34.universeId, false, nil));
                v4.logPlayWithRewardAdPlaybackAttempted(v34.flowId, v34.universeId);
                return l_AdService_0:ShowRewardedVideoAdAtClientAsync(v34.universeId);
            end);
            pcall(function() --[[ Line: 123 ]]
                -- upvalues: v4 (ref), v34 (ref), l_result_0 (copy), l_AdService_0 (ref), l_status_0 (copy), v46 (ref), v48 (ref), v32 (ref), v47 (ref)
                v4.logPlayWithRewardAdPlaybackStopped(v34.flowId, v34.universeId, (tostring(l_result_0)));
                l_AdService_0:SubmitAdNotification(tonumber(v34.universeId) or 0, l_status_0 and l_result_0 ~= nil, l_result_0 == Enum.ShowAdResult.ShowCompleted, v46, if v48 then v32 else tonumber(v47) or v32);
            end);
            v4.logPlayWithRewardBlackoutCurtainAction(v34.flowId, v34.universeId, "hidden");
            v3.hide();
            if v45 then
                v4.logPlayWithRewardGameJoinInitiated(v34.flowId, v34.universeId);
                v45(nil);
            end;
        end;
        if l_game_EngineFeature_0 then
            v38(l_CheckForUpdate_0(v37, l_game_EngineFeature_1, v36, v51, {
                ctx = "PlayWithRewardGameDetails"
            }));
            return;
        else
            v51();
            return;
        end;
    end, {
        v34.flowId, 
        v34.universeId, 
        v38, 
        v37, 
        v36, 
        v45, 
        v47, 
        v46, 
        v48
    });
    local l_Medium_0 = v35.Padding.Medium;
    local l_Small_0 = v35.Padding.Small;
    local l_Medium_1 = v35.Padding.Medium;
    local v56 = l_Small_0 + 66 + v35.Gap.Medium;
    if v43 then
        return v9.createElement(l_Skeleton_0, {
            tag = "padding-top-medium", 
            Size = UDim2.new(1, 0, 0, v35.Size.Size_1000 + l_Medium_0 * 2 + l_Medium_1), 
            LayoutOrder = v33
        });
    elseif not v44 then
        return nil;
    else
        local l_titleText_0 = l_playWithRewardAdData_0.experimentVariantData.titleText;
        local l_subtitleText_0 = l_playWithRewardAdData_0.experimentVariantData.subtitleText;
        local l_buttonText_0 = l_playWithRewardAdData_0.experimentVariantData.buttonText;
        local l_layoutOrder_0 = l_playWithRewardAdData_0.experimentVariantData.layoutOrder;
        local l_showButton_0 = l_playWithRewardAdData_0.experimentVariantData.showButton;
        local v62 = if v48 then v9.createElement(l_Icon_0, {
            name = l_Enums_0.IconName.GiftBox, 
            size = 66, 
            Position = UDim2.fromOffset(l_Small_0, -l_Medium_1), 
            ZIndex = 2
        }) else v9.createElement(l_Image_0, {
            Size = UDim2.fromOffset(66, 66), 
            Position = UDim2.fromOffset(l_Small_0, -l_Medium_1), 
            Image = "rbxassetid://" .. v47, 
            BackgroundTransparency = 1, 
            ZIndex = 2
        });
        return v9.createElement(l_View_0, {
            tag = "size-full-0 auto-y padding-top-medium", 
            LayoutOrder = l_layoutOrder_0
        }, {
            Banner = v9.createElement(l_View_0, {
                tag = "size-full-0 auto-y radius-medium no-clip bg-shift-300", 
                onActivated = if l_showButton_0 then nil else v52
            }, {
                ProductImage = v62, 
                ContentView = v9.createElement(l_View_0, {
                    tag = "row align-y-center gap-medium size-full-0 auto-y", 
                    padding = {
                        left = UDim.new(0, v56), 
                        top = UDim.new(0, l_Medium_0), 
                        right = UDim.new(0, l_Medium_0), 
                        bottom = UDim.new(0, l_Medium_0)
                    }
                }, {
                    TextContainer = v9.createElement(l_View_0, {
                        tag = "col fill auto-y", 
                        LayoutOrder = 1
                    }, {
                        RewardTitle = if l_titleText_0 ~= "" then v9.createElement(l_Text_0, {
                            tag = "auto-xy text-title-medium text-wrap text-align-x-left content-emphasis", 
                            Text = l_titleText_0, 
                            LayoutOrder = 1
                        }) else nil, 
                        RewardDescription = if l_subtitleText_0 ~= "" then v9.createElement(l_Text_0, {
                            tag = "auto-xy text-body-small text-wrap text-align-x-left content-emphasis", 
                            Text = l_subtitleText_0, 
                            LayoutOrder = 2
                        }) else nil
                    }), 
                    ClickableIndicator = if l_showButton_0 then v9.createElement(l_Button_0, {
                        text = l_buttonText_0, 
                        onActivated = v52, 
                        variant = l_Enums_0.ButtonVariant.SoftEmphasis, 
                        LayoutOrder = 2
                    }) else v9.createElement(l_View_0, {
                        tag = "align-x-center align-y-center size-800-1000", 
                        LayoutOrder = 2
                    }, {
                        Icon = v9.createElement(l_Icon_0, {
                            name = l_Enums_0.IconName.ChevronLargeRight, 
                            style = v35.Color.Content.Emphasis
                        })
                    })
                })
            })
        });
    end;
end;
return PlayWithRewardComponent;