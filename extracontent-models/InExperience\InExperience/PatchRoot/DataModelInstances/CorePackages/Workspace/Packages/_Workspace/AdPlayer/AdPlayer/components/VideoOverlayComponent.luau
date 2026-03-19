local l_script_FirstAncestor_0 = script:FindFirstAncestor("AdPlayer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AdGuiInteractivity);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_Parent_0.Foundation);
local l_Text_0 = v5.Text;
local l_View_0 = v5.View;
local l_Image_0 = v5.Image;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_StateLayerAffordance_0 = v5.Enums.StateLayerAffordance;
local v11 = require(l_script_FirstAncestor_0.Flags);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("components");
local v13 = require(l_script_FirstAncestor_1.AdLabelComponent);
local v14 = require(l_script_FirstAncestor_1.LinearProgressComponent);
local l_AdDropdownMenu_0 = v3.AdDropdownMenu;
local v16 = require(l_script_FirstAncestor_1.GetRewardInComponent);
local v17 = v11.GetAdDropdownButtonDefault();
local v18 = v11.GetAdDropdownButtonOpen();
local v19 = v11.GetAdPlayerExitButton();
local v20 = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
local function v23(v21) --[[ Line: 30 ]] --[[ Name: ExitButtonComponent ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_View_0 (copy), l_Image_0 (copy), v19 (copy)
    local v22 = l_useTokens_0();
    return v2.createElement(l_View_0, {
        tag = "size-900 radius-circle", 
        backgroundStyle = v22.Color.Common.Scrim, 
        onActivated = v21.showExitConfirmationModal
    }, {
        icon = v2.createElement(l_Image_0, {
            tag = "size-600 radius-circle position-center-center anchor-center-center", 
            Image = v19
        })
    });
end;
local function v29(v24) --[[ Line: 45 ]] --[[ Name: TimerComponent ]]
    -- upvalues: v2 (copy), l_Text_0 (copy), v20 (copy)
    return v2.createElement(l_Text_0, {
        tag = "size-0-500 auto-x content-emphasis", 
        LayoutOrder = 2, 
        Text = v24.alpha:map(function(v25) --[[ Line: 49 ]]
            -- upvalues: v24 (copy)
            local v26 = math.ceil((1 - v25) * v24.totalDuration);
            local v27 = v26 // 60;
            local v28 = v26 % 60;
            return string.format("%02i:%02i", v27, v28);
        end), 
        fontStyle = {
            Font = v20, 
            FontSize = 14
        }
    });
end;
local function v36(v30) --[[ Line: 63 ]] --[[ Name: ScrimComponent ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), v2 (copy), l_View_0 (copy)
    local v31 = l_useTokens_0();
    local v32, v33 = v4.useAnimatedBinding(0);
    v2.useEffect(function() --[[ Line: 67 ]]
        -- upvalues: v30 (copy), v33 (copy), v4 (ref)
        if v30.showScrim then
            v33(v4.instant(0));
            return nil;
        else
            local v34 = false;
            task.delay(2, function() --[[ Line: 72 ]]
                -- upvalues: v34 (ref), v33 (ref), v4 (ref)
                if not v34 then
                    v33(v4.spring(1));
                end;
            end);
            return function() --[[ Line: 78 ]]
                -- upvalues: v34 (ref)
                v34 = true;
            end;
        end;
    end, {
        v30.showScrim
    });
    local v35 = table.clone(v30.children or {});
    v35.scrim = v2.createElement(l_View_0, {
        tag = "size-full", 
        backgroundStyle = v31.Color.Common.Scrim, 
        ZIndex = -1
    });
    return v2.createElement(l_View_0, {
        tag = "size-full", 
        GroupTransparency = v32, 
        ZIndex = 0
    }, v35);
end;
local function v38(v37) --[[ Line: 100 ]] --[[ Name: TopContainer ]]
    -- upvalues: v2 (copy), l_View_0 (copy)
    return v2.createElement(l_View_0, {
        tag = "size-full-1500 anchor-top-center position-top-center padding-x-medium padding-y-medium"
    }, v37.children);
end;
local function v40(v39) --[[ Line: 106 ]] --[[ Name: BottomContainer ]]
    -- upvalues: v2 (copy), l_View_0 (copy)
    return v2.createElement(l_View_0, {
        tag = "size-full-700 anchor-bottom-center padding-x-medium", 
        Position = UDim2.new(0.5, 0, 1, -24)
    }, v39.children);
end;
local function v43(v41) --[[ Line: 113 ]] --[[ Name: BottomContainerListContainer ]]
    -- upvalues: v11 (copy), v2 (copy), l_View_0 (copy)
    local v42 = nil;
    v42 = if v11.GetEnableLuaRewardTimerUI() then ("size-full-500 row %* align-y-bottom gap-medium"):format(v41.isRightAligned and "align-x-right" or "align-x-left") else "size-full-500 row align-x-left align-y-center gap-medium";
    return v2.createElement(l_View_0, {
        Position = if v11.GetEnableLuaRewardTimerUI() then UDim2.fromOffset(0, v41.yOffset or 0) else nil, 
        tag = v42
    }, v41.children);
end;
return (v2.forwardRef(function(v44, v45) --[[ Line: 142 ]]
    -- upvalues: v2 (copy), l_useTokens_0 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy), v40 (copy), l_AdDropdownMenu_0 (copy), v43 (copy), v13 (copy), v18 (copy), v17 (copy), v11 (copy), v16 (copy), v36 (copy), v14 (copy), v29 (copy), v38 (copy), v23 (copy)
    local v46, v47 = v2.useState(false);
    local v48, v49 = v2.useState(false);
    local v50 = l_useTokens_0();
    local function v51() --[[ Line: 147 ]] --[[ Name: dismissModals ]]
        -- upvalues: v44 (copy), v47 (copy)
        v44.setPaused(false);
        v44.dismissModals();
        v47(false);
    end;
    local function v52() --[[ Line: 153 ]] --[[ Name: handleToggleAdsModal ]]
        -- upvalues: v44 (copy), v47 (copy), v46 (copy)
        v44.setPaused(false);
        v44.dismissModals();
        v47(false);
        if not v46 then
            v44.setPaused(true);
            v47(true);
        end;
    end;
    v2.useImperativeHandle(v45, function() --[[ Line: 162 ]]
        -- upvalues: v51 (copy)
        return {
            dismissModals = v51
        };
    end);
    v2.useEffect(function() --[[ Line: 168 ]]
        -- upvalues: v48 (copy), v49 (copy)
        if v48 then
            v49(false);
        end;
    end, {
        v48
    });
    return v2.createElement(l_View_0, {
        tag = "size-full", 
        onActivated = function() --[[ Line: 176 ]] --[[ Name: onActivated ]]
            -- upvalues: v44 (copy), v47 (copy), v49 (copy)
            v44.setPaused(false);
            v44.dismissModals();
            v47(false);
            v49(true);
        end, 
        stateLayer = {
            affordance = l_StateLayerAffordance_0.None
        }
    }, {
        persistentBottom = v2.createElement(v40, {}, {
            adDropdownMenu = v2.createElement(l_AdDropdownMenu_0, {
                showDropDownMenu = v46, 
                onWhyThisAdActivated = v44.showWhyThisAd, 
                onReportAdActivated = v44.showReportAdModal, 
                transparency = 0.2, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.fromOffset(0, -v50.Padding.Small)
            }), 
            leftBottomListContainer = v2.createElement(v43, {}, {
                adLabel = v2.createElement(v13, {
                    Image = if v46 then v18 else v17, 
                    handleToggleAdsModal = v52
                })
            }), 
            rightBottomListContainer = if v11.GetEnableLuaRewardTimerUI() then v2.createElement(v43, {
                isRightAligned = true, 
                yOffset = -4
            }, {
                getRewardInComponent = if v44.rewardWaitTime then v2.createElement(v16, {
                    rewardWaitTime = v44.rewardWaitTime, 
                    rewardWaitAlpha = v44.rewardWaitAlpha
                }) else nil
            }) else nil
        }), 
        scrim = v2.createElement(v36, {
            showScrim = v46 or v44.parentModalOpen or v48
        }, {
            fadingBottom = v2.createElement(v40, {}, {
                progressBar = v2.createElement(v14, {
                    alpha = v44.alpha, 
                    Size = UDim2.new(1, 0, 0, 2), 
                    Position = UDim2.fromScale(0.5, 1), 
                    AnchorPoint = Vector2.new(0.5, 1)
                }), 
                bottomListContainer = v2.createElement(v43, {}, {
                    dummyAdLabel = v2.createElement(v13, {
                        Visible = false
                    }), 
                    timer = v2.createElement(v29, {
                        alpha = v44.alpha, 
                        totalDuration = v44.totalDuration
                    })
                })
            }), 
            top = v2.createElement(v38, {}, {
                closeButton = v2.createElement(v23, {
                    showExitConfirmationModal = v44.showExitConfirmationModal
                })
            })
        })
    });
end));