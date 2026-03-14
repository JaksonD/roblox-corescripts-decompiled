local l_AdService_0 = game:GetService("AdService");
local l_Players_0 = game:GetService("Players");
local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayWithRewardComponent");
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
local v14 = require(l_Parent_0.UIBlox);
local l_SetPlayWithRewardState_0 = v6.SetPlayWithRewardState;
local l_Enums_0 = v7.Enums;
local l_Icon_0 = v7.Icon;
local l_PlayButtonReferralSource_0 = v8.PlayButtonReferralSource;
local l_usePlayButtonLaunchGame_0 = v8.usePlayButtonLaunchGame;
local l_ImageSetLabel_0 = v14.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v14.Core.Style.useStyle;
local l_RoactAnalytics_0 = v12.RoactAnalytics;
local l_AppUpdateService_0 = v12.AppUpdateService;
local l_useDispatch_0 = v13.Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = v10.useRoactService;
local l_CheckForUpdate_0 = v11.Thunks.CheckForUpdate;
local l_game_EngineFeature_0 = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly");
local l_game_EngineFeature_1 = game:GetEngineFeature("CanPerformBinaryUpdateEnabled");
local v29 = game:DefineFastInt("PlayWithRewardFallbackBannerProductImageAssetId", 0);
PlayWithRewardComponent = function(v30) --[[ Line: 55 ]] --[[ Name: PlayWithRewardComponent ]]
    -- upvalues: l_useStyle_0 (copy), l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppUpdateService_0 (copy), l_useDispatch_0 (copy), l_Players_0 (copy), l_usePlayButtonLaunchGame_0 (copy), l_PlayButtonReferralSource_0 (copy), v9 (copy), v4 (copy), l_TextService_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_ImageSetLabel_0 (copy), l_SetPlayWithRewardState_0 (copy), l_AdService_0 (copy), v29 (copy), l_game_EngineFeature_0 (copy), l_CheckForUpdate_0 (copy), l_game_EngineFeature_1 (copy)
    local v31 = l_useStyle_0();
    local v32 = l_useRoactService_0(l_RoactAnalytics_0);
    local v33 = l_useRoactService_0(l_AppUpdateService_0);
    local v34 = l_useDispatch_0();
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_playWithRewardAdData_0 = v30.playWithRewardAdData;
    local v37 = tonumber(l_playWithRewardAdData_0 and l_playWithRewardAdData_0.productId or 0) or 0;
    local v38 = false;
    if l_LocalPlayer_0 ~= nil then
        v38 = false;
        if v30.flowId ~= "" then
            v38 = false;
            if v30.fetchedUniverseId ~= nil then
                v38 = false;
                if v30.fetchedUniverseId == v30.universeId then
                    v38 = false;
                    if l_playWithRewardAdData_0 ~= nil then
                        v38 = false;
                        if l_playWithRewardAdData_0.adAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable then
                            v38 = false;
                            if l_playWithRewardAdData_0.experimentVariantData ~= nil then
                                v38 = false;
                                if l_playWithRewardAdData_0.experimentVariantData.layoutOrder ~= 0 then
                                    v38 = v37 ~= 0;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local v39 = l_usePlayButtonLaunchGame_0(v30.universeId, v30.placeId, v30.placeId, l_PlayButtonReferralSource_0.PlayWithReward, "PlayWithRewardGameDetails", "PlayWithRewardButton");
    v9.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: v38 (copy), v4 (ref), v30 (copy)
        if v38 then
            v4.logPlayWithRewardButtonShown(v30.flowId, v30.universeId);
        end;
    end, {
        v38, 
        v30.flowId, 
        v30.universeId
    });
    if not v38 then
        return nil;
    else
        local l_titleText_0 = l_playWithRewardAdData_0.experimentVariantData.titleText;
        local l_subtitleText_0 = l_playWithRewardAdData_0.experimentVariantData.subtitleText;
        local l_buttonText_0 = l_playWithRewardAdData_0.experimentVariantData.buttonText;
        local l_layoutOrder_0 = l_playWithRewardAdData_0.experimentVariantData.layoutOrder;
        local v44 = v31.Font.Body.RelativeSize * v31.Font.BaseSize;
        local l_Font_0 = v31.Font.Header2.Font;
        local l_Font_1 = v31.Font.Body.Font;
        local v47 = 20 + l_TextService_0:GetTextSize(l_buttonText_0, v44, l_Font_1, Vector2.new(1e999, 1e999)).X;
        local l_productName_0 = l_playWithRewardAdData_0.productName;
        local v49 = l_playWithRewardAdData_0.productImageAssetId == "";
        local v50 = "rbxassetid://" .. l_playWithRewardAdData_0.productImageAssetId;
        local v51 = if v49 then v9.createElement(l_Icon_0, {
            name = l_Enums_0.IconName.GiftBox, 
            size = l_Enums_0.IconSize.Large, 
            LayoutOrder = 1
        }) else v9.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, 44, 0, 44), 
            Image = v50, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        });
        return v9.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 64), 
            BackgroundColor3 = v31.Tokens.Semantic.Color.Ui.Emphasis.Color3, 
            BackgroundTransparency = v31.Tokens.Semantic.Color.Ui.Emphasis.Transparency, 
            LayoutOrder = l_layoutOrder_0
        }, {
            Stroke = v9.createElement("UIStroke", {
                Color = v31.Theme.TextEmphasis.Color, 
                Thickness = 2, 
                Transparency = v31.Tokens.Semantic.Color.Ui.Emphasis.Transparency, 
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                LineJoinMode = Enum.LineJoinMode.Round
            }), 
            Layout = v9.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            Padding = v9.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingTop = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 10)
            }), 
            Corner = v9.createElement("UICorner", {
                CornerRadius = UDim.new(0, 9)
            }), 
            LeftContentFrame = v9.createElement("Frame", {
                Size = UDim2.new(1, -v47 - 10, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Layout = v9.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 10)
                }), 
                RewardIcon = v51, 
                RewardTextFrame = v9.createElement("Frame", {
                    Size = UDim2.new(0, 0, 1, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    Layout = v9.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }), 
                    RewardTitle = v9.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = l_titleText_0, 
                        Font = l_Font_0, 
                        TextSize = v44, 
                        TextColor3 = v31.Theme.TextEmphasis.Color, 
                        TextTransparency = v31.Theme.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }), 
                    RewardDescription = v9.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = l_subtitleText_0, 
                        Font = l_Font_1, 
                        TextSize = v44, 
                        TextColor3 = v31.Theme.TextEmphasis.Color, 
                        TextTransparency = v31.Theme.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    })
                })
            }), 
            JoinWithAdButton = v9.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = l_buttonText_0, 
                Font = l_Font_0, 
                TextSize = v44, 
                TextColor3 = v31.Theme.TextEmphasis.Color, 
                TextTransparency = v31.Theme.TextEmphasis.Transparency, 
                BackgroundColor3 = v31.Tokens.Semantic.Color.Ui.Emphasis.Color, 
                BackgroundTransparency = v31.Tokens.Semantic.Color.Ui.Emphasis.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                LayoutOrder = 2, 
                [v9.Event.Activated] = function() --[[ Line: 212 ]]
                    -- upvalues: v4 (ref), v30 (copy), v34 (copy), l_SetPlayWithRewardState_0 (ref), l_AdService_0 (ref), l_productName_0 (copy), v49 (copy), v29 (ref), l_playWithRewardAdData_0 (copy), v39 (copy), l_game_EngineFeature_0 (ref), l_CheckForUpdate_0 (ref), v33 (copy), l_game_EngineFeature_1 (ref), v32 (copy)
                    local function v54() --[[ Line: 213 ]] --[[ Name: showAdThenLaunch ]]
                        -- upvalues: v4 (ref), v30 (ref), v34 (ref), l_SetPlayWithRewardState_0 (ref), l_AdService_0 (ref), l_productName_0 (ref), v49 (ref), v29 (ref), l_playWithRewardAdData_0 (ref), v39 (ref)
                        v4.logPlayWithRewardButtonClicked(v30.flowId, v30.universeId);
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 216 ]]
                            -- upvalues: v34 (ref), l_SetPlayWithRewardState_0 (ref), v30 (ref), v4 (ref), l_AdService_0 (ref)
                            v34(l_SetPlayWithRewardState_0(v30.flowId, v30.universeId, nil));
                            v4.logPlayWithRewardAdPlaybackAttempted(v30.flowId, v30.universeId);
                            return l_AdService_0:ShowRewardedVideoAdAtClientAsync(v30.universeId);
                        end);
                        v4.logPlayWithRewardAdPlaybackStopped(v30.flowId, v30.universeId, (tostring(l_result_0)));
                        l_AdService_0:SubmitAdNotification(tonumber(v30.universeId) or 0, l_status_0 and l_result_0 ~= nil, l_result_0 == Enum.ShowAdResult.ShowCompleted, l_productName_0, if v49 then v29 else tonumber(l_playWithRewardAdData_0.productImageAssetId) or v29);
                        if v39 then
                            v4.logPlayWithRewardGameJoinInitiated(v30.flowId, v30.universeId);
                            v39(nil);
                        end;
                    end;
                    if l_game_EngineFeature_0 then
                        v34(l_CheckForUpdate_0(v33, l_game_EngineFeature_1, v32, v54, {
                            ctx = "PlayWithRewardGameDetails"
                        }));
                        return;
                    else
                        v54();
                        return;
                    end;
                end
            }, {
                Padding = v9.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 10), 
                    PaddingTop = UDim.new(0, 10), 
                    PaddingRight = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 10)
                }), 
                Corner = v9.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 9)
                })
            })
        });
    end;
end;
return PlayWithRewardComponent;