local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_Sheet_0 = v4.Sheet;
local l_Button_0 = v4.Button;
local l_View_0 = v4.View;
local l_Text_0 = v4.Text;
local l_FillBehavior_0 = v4.Enums.FillBehavior;
local l_useScaledValue_0 = v4.Hooks.useScaledValue;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v13 = require(l_script_FirstAncestor_0.Components.Generic.RobuxText);
local v14 = require(l_script_FirstAncestor_0.Components.Generic.TransferRobuxHeader);
local v15 = require(l_script_FirstAncestor_0.Components.Generic.TransferAmountOptionChips);
local v16 = require(l_script_FirstAncestor_0.Components.Generic.TransferProfileThumbnail);
local v17 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v18 = require(l_script_FirstAncestor_0.Hooks.useTextBoxOnChangeRef);
local v19 = require(l_script_FirstAncestor_0.Hooks.useAutoFocusTextBoxOnMount);
local v20 = require(l_script_FirstAncestor_0.Actions.Send.proceedToConfirm);
return function(_) --[[ Line: 40 ]] --[[ Name: TransferRobuxInputSheet ]]
    -- upvalues: l_useLocalization_0 (copy), v17 (copy), v3 (copy), v2 (copy), v18 (copy), v20 (copy), v19 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v14 (copy), l_View_0 (copy), v16 (copy), v13 (copy), v15 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), l_Text_0 (copy)
    local v22 = l_useLocalization_0({
        SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux", 
        Next = "Features.Transfers.RobuxTransfer.Action.Next", 
        Disclaimer = "Features.Transfers.RobuxTransfer.SentInstantNoFee"
    });
    local v23 = v17();
    local v24 = v3.useSignalState(v23.getSelectedAmount) or 0;
    local l_setSelectedAmount_0 = v23.setSelectedAmount;
    local v26, v27 = v2.useState(500);
    local v28 = v23.getRobuxBalanceAmount(false);
    local v29 = v23.getRecipient(false);
    local v30 = v2.useRef(nil);
    local v34 = v18(v2.useCallback(function(v31) --[[ Line: 56 ]]
        -- upvalues: l_setSelectedAmount_0 (copy)
        l_setSelectedAmount_0(v31 or 0);
    end, {
        l_setSelectedAmount_0
    }), v2.useCallback(function(v32, v33) --[[ Line: 59 ]]
        -- upvalues: v27 (copy), v20 (ref), v23 (copy), v24 (copy)
        if v32 then
            v27(800);
            return;
        elseif v33 then
            v20(v23, v24);
            return;
        else
            v27(500);
            return;
        end;
    end, {
        v23, 
        v24
    }));
    local l_triggerOnClose_0 = v23.triggerOnClose;
    local v36 = v19(v34, 0.05);
    local v38 = v2.useCallback(function(v37) --[[ Line: 76 ]]
        -- upvalues: v30 (copy), v36 (copy)
        if v37 then
            v30.current = v37;
            v36(v37);
        end;
    end, {
        v36
    });
    local v39 = v2.useMemo(function() --[[ Line: 83 ]]
        return {
            {
                amount = 25, 
                text = "25"
            }, 
            {
                amount = 50, 
                text = "50"
            }, 
            {
                amount = 100, 
                text = "100"
            }, 
            {
                amount = 200, 
                text = "200"
            }
        };
    end, {});
    local v41 = v2.useCallback(function(v40) --[[ Line: 92 ]]
        -- upvalues: l_setSelectedAmount_0 (copy)
        l_setSelectedAmount_0(v40);
    end, {
        l_setSelectedAmount_0
    });
    local v42 = v2.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v24 (copy), v28 (copy)
        return not v24 or v24 <= 0 or v28 < v24;
    end, {
        v24, 
        v28
    });
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(v26), 
            0.8
        }, 
        onClose = l_triggerOnClose_0
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v2.createElement(v14, {
                titleText = v22.SendRobux, 
                robuxBalanceAmount = v28
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            SheetContentContainer = v2.createElement(l_View_0, {
                tag = "col gap-large auto-y size-full-0 align-x-center items-center padding-top-xxlarge padding-x-large"
            }, {
                RobuxInputWrapper = v2.createElement("Frame", {
                    Size = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    LayoutOrder = 0
                }, {
                    RobuxInput = v2.createElement("Frame", {
                        Size = UDim2.new(0, 80, 0, 40), 
                        Position = UDim2.new(0, -10000, 0, 0), 
                        BackgroundTransparency = 1
                    }, {
                        TextBox = v2.createElement("TextBox", {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Text = if v24 and v24 > 0 then tostring(v24) else "0", 
                            PlaceholderText = "", 
                            TextInputType = Enum.TextInputType.Number, 
                            BackgroundTransparency = 1, 
                            ref = v38
                        })
                    })
                }), 
                ThumbnailAndAmountArea = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    Content = v2.createElement(l_View_0, {
                        tag = "col gap-xlarge auto-y size-full-0 align-x-center items-center padding-top-xlarge"
                    }, {
                        RecipientProfile = if v29 and v29.targetId then v2.createElement(v16, {
                            userId = tostring(v29.targetId), 
                            username = v29.targetName, 
                            showUsername = true, 
                            size = UDim2.fromOffset(60, 60), 
                            layoutOrder = 1, 
                            thumbnailSize = Enum.ThumbnailSize.Size48x48
                        }) else nil, 
                        AmountContainer = v2.createElement(l_View_0, {
                            tag = "row align-x-center align-y-center size-full-1600 padding-top-xxlarge padding-y-medium", 
                            LayoutOrder = 2
                        }, {
                            AmountWrapper = v2.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1
                            }, {
                                SelectedAmountDisplay = v2.createElement(v13, {
                                    amount = v24, 
                                    layoutOrder = 1
                                }), 
                                AmountTapTarget = v2.createElement("TextButton", {
                                    Size = UDim2.new(1, 0, 1, 0), 
                                    Position = UDim2.new(0, 0, 0, 0), 
                                    Text = "", 
                                    BackgroundTransparency = 1, 
                                    ZIndex = 2, 
                                    [v2.Event.Activated] = function() --[[ Line: 180 ]]
                                        -- upvalues: v30 (copy)
                                        if v30.current then
                                            v30.current:CaptureFocus();
                                        end;
                                    end
                                })
                            })
                        })
                    }), 
                    TapToFocusOverlay = v2.createElement("TextButton", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Text = "", 
                        BackgroundTransparency = 1, 
                        ZIndex = 2, 
                        [v2.Event.Activated] = function() --[[ Line: 196 ]]
                            -- upvalues: v30 (copy)
                            if v30.current then
                                v30.current:CaptureFocus();
                            end;
                        end
                    })
                }), 
                AmountChips = v2.createElement(l_View_0, {
                    tag = "col align-x-center auto-y size-full-1600", 
                    LayoutOrder = 2, 
                    ZIndex = 3
                }, {
                    Chips = v2.createElement(v15, {
                        chips = v39, 
                        onChipSelected = v41, 
                        selectedAmount = v24, 
                        layoutOrder = 1
                    })
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            v2.createElement(l_View_0, {
                tag = "col align-y-center align-x-center size-full-1000 gap-medium"
            }, {
                v2.createElement(l_View_0, {
                    tag = "row auto-y size-full-0 gap-small", 
                    LayoutOrder = 1
                }, {
                    v2.createElement(l_Button_0, {
                        text = v22.Next, 
                        onActivated = function() --[[ Line: 230 ]] --[[ Name: onActivated ]]
                            -- upvalues: v20 (ref), v23 (copy), v24 (copy)
                            v20(v23, v24);
                        end, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill, 
                        isDisabled = v42
                    })
                }); 
                Disclaimer = v2.createElement(l_Text_0, {
                    Text = v22.Disclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 2
                })
            })
        })
    });
end;