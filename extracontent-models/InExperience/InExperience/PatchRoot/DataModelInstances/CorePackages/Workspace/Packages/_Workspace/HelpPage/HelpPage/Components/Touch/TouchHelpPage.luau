local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_0.Hooks.useKeybinds);
local v5 = require(l_Parent_0.Enums.TouchControlsEnum);
local v6 = require(l_Parent_0.Components.Touch.TouchAction);
local v7 = require(l_Parent_1.RobloxAppHooks);
local v8 = require(l_Parent_1.RobloxAppEnums);
local v9 = require(l_Parent_1.Display);
local v10 = require(l_Parent_0.Constants);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_View_0 = v3.View;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useDeviceOrientation_0 = v7.useDeviceOrientation;
local l_DeviceOrientationMode_0 = v8.DeviceOrientationMode;
local function _(v16, v17, v18) --[[ Line: 24 ]] --[[ Name: getTapOrRotate ]]
    assert(not (v18[v16] and v18[v17]), "Cannot assign a position to both tap and rotate simultaneously.");
    if v18[v16] then
        return v16;
    elseif v18[v17] then
        return v17;
    else
        return nil;
    end;
end;
local v31 = v2.memo(function(v20) --[[ Line: 60 ]]
    -- upvalues: l_useTokens_0 (copy), l_DeviceOrientationMode_0 (copy), v2 (copy), l_View_0 (copy)
    local v21 = l_useTokens_0();
    local l_components_0 = v20.components;
    local v23 = v20.orientation == l_DeviceOrientationMode_0.Portrait;
    local function v28(v24, v25, v26, v27) --[[ Line: 66 ]] --[[ Name: createSideColumn ]]
        -- upvalues: v2 (ref), l_View_0 (ref)
        return v2.createElement(l_View_0, {
            tag = ("align-x-%* auto-x col flex-y-between size-0-full"):format(v24), 
            LayoutOrder = v25
        }, {
            topComponent = v26, 
            bottomComponent = v27
        });
    end;
    local v29 = v28(v23 and "center" or "left", 1, l_components_0.topLeftComponent, l_components_0.bottomLeftComponent);
    local v30 = v28(v23 and "center" or "right", 3, l_components_0.topRightComponent, l_components_0.bottomRightComponent);
    if v23 then
        return v2.createElement(l_View_0, {
            tag = "auto-y flex-x-between row size-full-0"
        }, {
            Inner = v2.createElement(l_View_0, {
                tag = "col flex-y-fill padding-y-large padding-x-xxlarge size-full", 
                LayoutOrder = 1
            }, {
                TopRow = v2.createElement(l_View_0, {
                    tag = "auto-y size-full-0", 
                    LayoutOrder = 1
                }, {
                    Columns = v2.createElement(l_View_0, {
                        tag = "auto-y flex-x-between row size-full-0"
                    }, {
                        LeftColumn = v29, 
                        RightColumn = v30
                    }), 
                    Center = v2.createElement(l_View_0, {
                        tag = "auto-xy", 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5)
                    }, {
                        TopMid = l_components_0.topMidComponent
                    })
                }), 
                BottomRow = v2.createElement(l_View_0, {
                    tag = "auto-y size-full-0", 
                    LayoutOrder = 2
                }, {
                    BottomMid = v2.createElement(l_View_0, {
                        tag = "align-x-center align-y-bottom auto-y padding-top-xxlarge row size-full-0", 
                        LayoutOrder = 4
                    }, {
                        bottomMid = l_components_0.bottomMidComponent
                    })
                })
            })
        });
    else
        return v2.createElement(l_View_0, {
            tag = "auto-y flex-x-between row size-full-0", 
            LayoutOrder = 1, 
            padding = UDim2.fromOffset(v21.Margin.Large, v21.Margin.Small)
        }, {
            leftColumn = v29, 
            middleColumn = v2.createElement(l_View_0, {
                tag = "align-x-center auto-x col flex-y-fill size-0-full", 
                LayoutOrder = 2
            }, {
                topMidContainer = v2.createElement(l_View_0, {
                    tag = "align-y-center auto-x col size-0-full", 
                    LayoutOrder = 1
                }, {
                    topMid = l_components_0.topMidComponent
                }), 
                bottomMidContainer = v2.createElement(l_View_0, {
                    tag = "align-y-bottom auto-xy col", 
                    LayoutOrder = 2
                }, {
                    bottomMid = l_components_0.bottomMidComponent
                })
            }), 
            rightColumn = v30
        });
    end;
end);
return v2.memo(function() --[[ Line: 163 ]] --[[ Name: TouchHelpPage ]]
    -- upvalues: l_useDeviceOrientation_0 (copy), v4 (copy), v2 (copy), l_UserGameSettings_0 (copy), v9 (copy), v5 (copy), v6 (copy), l_View_0 (copy), v31 (copy), v10 (copy)
    local v32 = l_useDeviceOrientation_0();
    local l_controls_0 = v4().controls;
    local v34, v35 = v2.useState(l_UserGameSettings_0.TouchMovementMode);
    local v36 = v9.GetDisplayStore(false).getViewportSize(false);
    v2.useEffect(function() --[[ Line: 170 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v35 (copy)
        local v37 = l_UserGameSettings_0:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 171 ]]
            -- upvalues: v35 (ref), l_UserGameSettings_0 (ref)
            v35(l_UserGameSettings_0.TouchMovementMode);
        end);
        return function() --[[ Line: 175 ]]
            -- upvalues: v37 (copy)
            v37:Disconnect();
        end;
    end, {});
    local v38 = v34 == Enum.TouchMovementMode.ClickToMove;
    local v45 = v2.useMemo(function() --[[ Line: 183 ]]
        -- upvalues: l_controls_0 (copy), v38 (copy)
        local v39 = {};
        if l_controls_0 == nil then
            return v39;
        else
            for _, v41 in l_controls_0 do
                if v41.touchInput ~= nil then
                    local v42 = nil;
                    v42 = if v38 then v41.touchInput.tapToMoveInput else v41.touchInput.thumbstickInput;
                    for _, v44 in ipairs(v42) do
                        assert(v39[v44] == nil, "A touch input position cannot have multiple actions.");
                        v39[v44] = v41.label;
                    end;
                end;
            end;
            return v39;
        end;
    end, {
        l_controls_0, 
        v34
    });
    if l_controls_0 == nil then
        return nil;
    else
        local l_TopMidTap_0 = v5.TopMidTap;
        local l_TopMidRotate_0 = v5.TopMidRotate;
        assert(not (v45[l_TopMidTap_0] and v45[l_TopMidRotate_0]), "Cannot assign a position to both tap and rotate simultaneously.");
        local v48 = if v45[l_TopMidTap_0] then l_TopMidTap_0 else if v45[l_TopMidRotate_0] then l_TopMidRotate_0 else nil;
        l_TopMidRotate_0 = v5.TopRightTap;
        local l_TopRightRotate_0 = v5.TopRightRotate;
        assert(not (v45[l_TopMidRotate_0] and v45[l_TopRightRotate_0]), "Cannot assign a position to both tap and rotate simultaneously.");
        l_TopMidTap_0 = if v45[l_TopMidRotate_0] then l_TopMidRotate_0 else if v45[l_TopRightRotate_0] then l_TopRightRotate_0 else nil;
        l_TopRightRotate_0 = v5.BottomLeftTap;
        local l_BottomLeftRotate_0 = v5.BottomLeftRotate;
        assert(not (v45[l_TopRightRotate_0] and v45[l_BottomLeftRotate_0]), "Cannot assign a position to both tap and rotate simultaneously.");
        l_TopMidRotate_0 = if v45[l_TopRightRotate_0] then l_TopRightRotate_0 else if v45[l_BottomLeftRotate_0] then l_BottomLeftRotate_0 else nil;
        l_TopRightRotate_0 = {
            topLeftComponent = v45[v5.TopLeft] and v2.createElement(v6, {
                action = v45[v5.TopLeft], 
                touchInput = v5.TopLeft, 
                layoutOrder = 0
            }) or v2.createElement(l_View_0), 
            bottomLeftComponent = l_TopMidRotate_0 and v2.createElement(v6, {
                action = l_TopMidRotate_0 and v45[l_TopMidRotate_0], 
                touchInput = l_TopMidRotate_0, 
                layoutOrder = 1
            }) or v2.createElement(l_View_0), 
            topMidComponent = v48 and v2.createElement(v6, {
                action = v48 and v45[v48], 
                touchInput = v48, 
                layoutOrder = 1
            }) or v2.createElement(l_View_0), 
            bottomMidComponent = v45[v5.BottomMid] and v2.createElement(v6, {
                action = v45[v5.BottomMid], 
                touchInput = v5.BottomMid, 
                layoutOrder = 1
            }) or v2.createElement(l_View_0), 
            topRightComponent = l_TopMidTap_0 and v2.createElement(v6, {
                action = l_TopMidTap_0 and v45[l_TopMidTap_0], 
                touchInput = l_TopMidTap_0, 
                layoutOrder = 1
            }) or v2.createElement(l_View_0), 
            bottomRightComponent = v45[v5.BottomRight] and v2.createElement(v6, {
                action = v45[v5.BottomRight], 
                touchInput = v5.BottomRight, 
                layoutOrder = 2
            }) or v2.createElement(l_View_0)
        };
        l_BottomLeftRotate_0 = v2.createElement(v31, {
            components = l_TopRightRotate_0, 
            orientation = v32
        });
        local l_BIG_SCREEN_OFFSET_0 = v10.HELP_PAGE.TOUCH_OFFSETS.BIG_SCREEN_OFFSET;
        if v36.X < v10.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_X or v36.Y < v10.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_CUTOFF_Y then
            l_BIG_SCREEN_OFFSET_0 = v10.HELP_PAGE.TOUCH_OFFSETS.SMALL_SCREEN_OFFSET;
        end;
        return v2.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, v36.Y - l_BIG_SCREEN_OFFSET_0), 
            ClipsDescendants = true
        }, {
            pageComponent = l_BottomLeftRotate_0
        });
    end;
end);