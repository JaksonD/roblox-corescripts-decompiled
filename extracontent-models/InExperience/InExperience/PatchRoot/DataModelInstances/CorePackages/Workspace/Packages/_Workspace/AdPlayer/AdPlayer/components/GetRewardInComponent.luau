local l_script_FirstAncestor_0 = script:FindFirstAncestor("AdPlayer");
if not require(l_script_FirstAncestor_0.Flags).GetEnableLuaRewardTimerUI() then
    return nil;
else
    local l_Parent_0 = l_script_FirstAncestor_0.Parent;
    local v2 = require(l_Parent_0.React);
    local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
    local v4 = require(l_Parent_0.Foundation);
    local v5 = require(l_Parent_0.ReactOtter);
    local l_useTokens_0 = v4.Hooks.useTokens;
    local l_Text_0 = v4.Text;
    local l_View_0 = v4.View;
    local l_Image_0 = v4.Image;
    local v10 = require(l_script_FirstAncestor_0.components.RadialProgressComponent);
    local v11 = {
        getRewardIn = "Features.OnDemandAds.Get_Reward_In", 
        rewardEarned = "Features.OnDemandAds.Reward_Earned"
    };
    local function _(v12) --[[ Line: 37 ]] --[[ Name: linearEaseOptions ]]
        return {
            duration = v12, 
            easingStyle = Enum.EasingStyle.Linear
        };
    end;
    return function(v14) --[[ Line: 44 ]]
        -- upvalues: v2 (copy), v5 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v11 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy), v10 (copy)
        local v15 = v2.useRef(nil);
        local v16, v17 = v2.useState(0);
        local v18, v19 = v5.useAnimatedBinding(0);
        local v20, v21 = v5.useAnimatedBinding(0);
        local v22 = v2.useRef(nil);
        local v23, v24 = v2.useState(0);
        local v25, v26 = v5.useAnimatedBinding(1);
        local v27, v28 = v5.useAnimatedBinding(0);
        local v29 = l_useTokens_0();
        local v30 = l_useLocalization_0(v11);
        local v31, v32 = v5.useAnimatedBinding(0);
        local v33, v34 = v5.useAnimatedBinding(1);
        local v35, v36 = v5.useAnimatedBinding(0);
        local v37, v38 = v5.useAnimatedBinding(0);
        local v39, v40 = v2.useState(true);
        local v41, _ = v2.useBinding(1);
        v2.useEffect(function() --[[ Line: 64 ]]
            -- upvalues: v39 (copy), v38 (copy), v5 (ref)
            if v39 then
                v38(v5.instant(0));
                return;
            else
                local v43 = false;
                task.delay(3, function() --[[ Line: 71 ]]
                    -- upvalues: v43 (ref), v38 (ref), v5 (ref)
                    if not v43 then
                        v38(v5.ease(1));
                    end;
                end);
                return function() --[[ Line: 77 ]]
                    -- upvalues: v43 (ref)
                    v43 = true;
                end;
            end;
        end, {
            v39
        });
        v2.useEffect(function() --[[ Line: 82 ]]
            -- upvalues: v15 (copy), v17 (copy), v22 (copy), v24 (copy)
            local l_current_0 = v15.current;
            if l_current_0 then
                v17(l_current_0.TextBounds.X);
            end;
            local l_current_1 = v22.current;
            if l_current_1 then
                v24(l_current_1.TextBounds.X);
            end;
        end, {});
        v2.useEffect(function() --[[ Line: 94 ]]
            -- upvalues: v39 (copy), v32 (copy), v5 (ref), v16 (copy), v23 (copy)
            if v39 then
                v32(v5.instant(24 + v16 + 8 + 20));
                return;
            else
                v32(v5.ease(24 + v23 + 8 + 20 - 4, {
                    duration = 0.4, 
                    easingStyle = Enum.EasingStyle.Linear
                }));
                return;
            end;
        end, {
            v39, 
            v16, 
            v23
        });
        v2.useEffect(function() --[[ Line: 114 ]]
            -- upvalues: v39 (copy), v19 (copy), v5 (ref), v21 (copy), v26 (copy), v28 (copy), v36 (copy), v34 (copy)
            local v46 = false;
            if v39 then
                v19(v5.instant(0));
                v21(v5.instant(0));
                v26(v5.instant(1));
                v28(v5.instant(28));
                v36(v5.instant(0));
                v34(v5.instant(1));
            else
                v21(v5.ease(24, {
                    duration = 0.4, 
                    easingStyle = Enum.EasingStyle.Linear
                }));
                v28(v5.ease(0, {
                    duration = 0.4, 
                    easingStyle = Enum.EasingStyle.Linear
                }));
                v36(v5.ease(1, {
                    duration = 0.1, 
                    easingStyle = Enum.EasingStyle.Linear
                }));
                task.delay(0.1, function() --[[ Line: 130 ]]
                    -- upvalues: v46 (ref), v19 (ref), v5 (ref), v26 (ref)
                    if not v46 then
                        v19(v5.ease(1, {
                            duration = 0.1, 
                            easingStyle = Enum.EasingStyle.Linear
                        }));
                        v26(v5.ease(0, {
                            duration = 0.1, 
                            easingStyle = Enum.EasingStyle.Linear
                        }));
                    end;
                end);
                task.delay(0.4, function() --[[ Line: 137 ]]
                    -- upvalues: v46 (ref), v34 (ref), v5 (ref)
                    if not v46 then
                        v34(v5.ease(0, {
                            duration = 0.1, 
                            easingStyle = Enum.EasingStyle.Linear
                        }));
                    end;
                end);
            end;
            return function() --[[ Line: 144 ]]
                -- upvalues: v46 (ref)
                v46 = true;
            end;
        end, {
            v39
        });
        return v2.createElement(l_View_0, {
            tag = "padding-y-xsmall padding-x-medium bg-over-media-300 radius-small clip", 
            Size = v31:map(function(v47) --[[ Line: 151 ]]
                return UDim2.fromOffset(v47, 32);
            end), 
            GroupTransparency = v37, 
            Visible = v16 > 0
        }, {
            checkIcon = v2.createElement(l_Image_0, {
                tag = "size-500 anchor-center-left", 
                Image = "rbxassetid://125702125855534", 
                imageStyle = {
                    Transparency = v33
                }, 
                LayoutOrder = 1, 
                Position = UDim2.new(0, -4, 0.5, 0), 
                Visible = v14.rewardWaitAlpha:map(function(v48) --[[ Line: 165 ]]
                    -- upvalues: v40 (copy)
                    v40(v48 < 1);
                    return v48 == 1;
                end)
            }), 
            getRewardInLabel = v2.createElement(l_Text_0, {
                tag = "text-label-medium text-align-x-left text-align-y-center", 
                Text = v30.getRewardIn, 
                Size = UDim2.new(0, v16, 1, 0), 
                Position = v20:map(function(v49) --[[ Line: 174 ]]
                    return UDim2.new(0, v49, 0, 0);
                end), 
                textStyle = {
                    Color3 = v29.Color.ActionEmphasis.Foreground.Color3, 
                    Transparency = v18
                }, 
                ref = v15
            }), 
            rewardEarnedLabel = v2.createElement(l_Text_0, {
                tag = "text-label-medium text-align-x-right text-align-y-center anchor-top-right", 
                Text = v30.rewardEarned, 
                Size = UDim2.new(0, v23, 1, 0), 
                Position = v27:map(function(v50) --[[ Line: 187 ]]
                    return UDim2.new(1, -v50, 0, 0);
                end), 
                textStyle = {
                    Color3 = v29.Color.ActionEmphasis.Foreground.Color3, 
                    Transparency = v25
                }, 
                ref = v22
            }), 
            progressContainer = v2.createElement(l_View_0, {
                tag = "radius-circle bg-over-media-200 size-500 anchor-center-right position-center-right", 
                GroupTransparency = v35
            }, {
                progressBackground = v2.createElement(v10, {
                    alpha = v41, 
                    thickness = 2, 
                    Size = UDim2.fromScale(1, 1), 
                    SizeConstraint = Enum.SizeConstraint.RelativeYY, 
                    BackgroundTransparency = 1, 
                    ImageColor3 = v29.Color.Content.Muted.Color3, 
                    LayoutOrder = 3, 
                    Visible = v14.rewardWaitAlpha:map(function(v51) --[[ Line: 208 ]]
                        return v51 < 1;
                    end)
                }, {
                    radialProgress = v2.createElement(v10, {
                        alpha = v14.rewardWaitAlpha, 
                        thickness = 2, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        ImageColor3 = v29.Color.Extended.White.White_0.Color3
                    }, {
                        timerLabel = v2.createElement(l_Text_0, {
                            tag = "size-full-300 anchor-center-center position-center-center content-emphasis text-caption-small text-align-x-center text-align-y-center", 
                            Text = v14.rewardWaitAlpha:map(function(v52) --[[ Line: 221 ]]
                                -- upvalues: v14 (copy)
                                return (tostring((math.ceil(v14.rewardWaitTime - v14.rewardWaitTime * v52))));
                            end), 
                            TextScaled = true
                        })
                    })
                })
            })
        });
    end;
end;