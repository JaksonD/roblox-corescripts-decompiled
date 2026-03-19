local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_IconSize_0 = v3.Enums.IconSize;
local l_IconButton_0 = v3.IconButton;
local l_Text_0 = v3.Text;
local l_Button_0 = v3.Button;
local l_ButtonSize_0 = v3.Enums.ButtonSize;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_useTokens_0 = v3.Hooks.useTokens;
local v13 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1, 
    restingPositionLimit = 0.5, 
    restingVelocityLimit = 0.1
};
local function _(v14) --[[ Line: 53 ]] --[[ Name: isFullWidth ]]
    return v14 < 540;
end;
local function v17(v16) --[[ Line: 57 ]] --[[ Name: getAnchorPoint ]]
    if v16.X < 540 then
        return Vector2.new(0.5, 1);
    else
        return Vector2.new(0, 0);
    end;
end;
local function v21(v18, v19, v20) --[[ Line: 65 ]] --[[ Name: getSize ]]
    if v18.X < 540 then
        return UDim2.new(0, v18.X, 0, v20);
    else
        return UDim2.new(0, v19, 0, v18.Y);
    end;
end;
local function v24(v22, v23) --[[ Line: 73 ]] --[[ Name: getPosition ]]
    if v22.X < 540 then
        return UDim2.new(0.5, 0, 1, 0);
    else
        return UDim2.new(1, -v23, 0, 0);
    end;
end;
return function(v25) --[[ Line: 81 ]] --[[ Name: SideModal ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v17 (copy), v21 (copy), v24 (copy), v2 (copy), v13 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_FillBehavior_0 (copy)
    local v26 = l_useTokens_0();
    local v27, v28 = v1.useState(v17(v25.screenSize));
    local v29, v30 = v1.useState(v21(v25.screenSize, v25.width, v25.height));
    local v31, v32 = v1.useState(v24(v25.screenSize, v25.width));
    local v33, v34 = v1.useState(true);
    local v35, v36 = v1.useState(false);
    local v37 = v1.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v25 (copy)
        if v25.footerContent then
            return (v25.footerContent());
        else
            return nil;
        end;
    end, {
        v25.footerContent
    });
    local v38 = v37 and 35 or 0;
    local v39, v40 = v2.useAnimatedBinding(1, function() --[[ Line: 95 ]]
        -- upvalues: v33 (copy), v35 (copy), v25 (copy)
        if not v33 then
            if v35 then
                if v25.buttonProps then
                    v25.buttonProps.onActivated();
                    return;
                end;
            elseif v25.onAbandon then
                v25.onAbandon();
            end;
        end;
    end);
    local v41 = v1.useMemo(function() --[[ Line: 110 ]]
        -- upvalues: v33 (copy)
        if v33 then
            return 0;
        else
            return 1;
        end;
    end, {
        v33
    });
    v1.useEffect(function() --[[ Line: 114 ]]
        -- upvalues: v25 (copy), v34 (copy)
        if v25.closeWithAnimation then
            v34(false);
        end;
    end, {
        v25.closeWithAnimation
    });
    v1.useEffect(function() --[[ Line: 120 ]]
        -- upvalues: v40 (copy), v2 (ref), v41 (copy), v13 (ref)
        v40(v2.spring(v41, v13));
    end, {
        v41
    });
    v1.useEffect(function() --[[ Line: 124 ]]
        -- upvalues: v28 (copy), v17 (ref), v25 (copy), v30 (copy), v21 (ref), v32 (copy), v24 (ref)
        v28(v17(v25.screenSize));
        v30(v21(v25.screenSize, v25.width, v25.height));
        v32(v24(v25.screenSize, v25.width));
    end, {
        v25.screenSize
    });
    local v42 = v1.useCallback(function() --[[ Line: 130 ]]
        -- upvalues: v34 (copy)
        v34(false);
    end, {
        v34
    });
    local v43 = v1.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: v25 (copy), v36 (copy), v34 (copy)
        if v25.buttonProps and v25.buttonProps.validateState and not v25.buttonProps.validateState() then
            return;
        else
            v36(true);
            v34(false);
            return;
        end;
    end, {
        v34, 
        v36, 
        v25.buttonProps
    });
    return v1.createElement("TextButton", {
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundTransparency = v39:map(function(v44) --[[ Line: 148 ]]
            return v44 + 0.3;
        end), 
        BackgroundColor3 = Color3.fromHex("#000000"), 
        Text = "", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v1.Event.Activated] = v42
    }, {
        SideModalContainer = v1.createElement(l_View_0, {
            AnchorPoint = Vector2.new(1, 0), 
            Position = v39:map(function(v45) --[[ Line: 160 ]]
                -- upvalues: v25 (copy)
                if v25.screenSize.X < 540 then
                    return (UDim2.new(1, 0, 0, v25.height * v45));
                else
                    return (UDim2.new(1, v25.width * v45, 0, 0));
                end;
            end), 
            tag = "size-full"
        }, {
            SideModal = v1.createElement(l_View_0, {
                AnchorPoint = v27, 
                Position = v31, 
                Size = v29, 
                tag = "bg-surface-300 radius-medium col"
            }, {
                IconRow = v1.createElement(l_View_0, {
                    Size = UDim2.new(1, 0, 0, 32), 
                    tag = "padding-left-medium", 
                    LayoutOrder = 0
                }, {
                    IconButton = v1.createElement(l_IconButton_0, {
                        icon = "icons/navigation/pushBack", 
                        size = l_IconSize_0.Medium, 
                        tag = "anchor-center-left position-center-left", 
                        onActivated = v42
                    })
                }), 
                TitleRow = v1.createElement(l_View_0, {
                    Size = UDim2.new(1, 0, 0, 32), 
                    tag = "auto-xy", 
                    LayoutOrder = 1
                }, {
                    Title = v1.createElement(l_Text_0, {
                        fontStyle = v26.Typography.TitleLarge, 
                        textStyle = v26.Color.Content.Emphasis, 
                        Text = v25.title, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 32), 
                        tag = "auto-xy"
                    })
                }), 
                Content = v1.createElement(l_View_0, {
                    ClipsDescendants = true, 
                    Size = if v25.buttonProps then UDim2.new(1, 0, 1, -116 - v38) else UDim2.new(1, 0, 1, -84 - v38), 
                    tag = "padding-x-medium", 
                    LayoutOrder = 2
                }, {
                    MiddleContent = v1.createElement(l_View_0, {
                        tag = "size-full"
                    }, v25.children)
                }), 
                ButtonRow = v25.buttonProps and v1.createElement(l_View_0, {
                    Size = UDim2.new(1, 0, 0, 32), 
                    tag = "padding-x-medium padding-bottom-medium", 
                    LayoutOrder = 3
                }, {
                    Button = v1.createElement(l_Button_0, {
                        text = v25.buttonProps.text, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        onActivated = v43, 
                        isDisabled = false, 
                        size = l_ButtonSize_0.Small, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                }), 
                BottomFrame = if v25.footerContent then v1.createElement(l_View_0, {
                    Size = UDim2.new(1, 0, 0, 32), 
                    tag = "padding-x-medium padding-bottom-medium", 
                    LayoutOrder = 4, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    FooterContent = v37
                }) else nil
            })
        })
    });
end;