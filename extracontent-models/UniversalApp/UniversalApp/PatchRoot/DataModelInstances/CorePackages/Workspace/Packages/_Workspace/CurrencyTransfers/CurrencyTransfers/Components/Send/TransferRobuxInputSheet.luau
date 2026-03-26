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
local v21 = require(l_script_FirstAncestor_0.Actions.Send.setTransferPromptState);
local v22 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v23 = require(l_script_FirstAncestor_0.Flags.GetFIntCurrencyTransferMinAmount);
local v24 = require(l_script_FirstAncestor_0.Flags.GetFIntCurrencyTransferMaxAmount);
return function(_) --[[ Line: 44 ]] --[[ Name: TransferRobuxInputSheet ]]
    -- upvalues: l_useLocalization_0 (copy), v17 (copy), v3 (copy), v2 (copy), v23 (copy), v24 (copy), v21 (copy), v22 (copy), v20 (copy), v18 (copy), v19 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v14 (copy), l_View_0 (copy), v16 (copy), v13 (copy), l_Text_0 (copy), v15 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v26 = l_useLocalization_0({
        SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux", 
        Next = "Features.Transfers.RobuxTransfer.Action.Next", 
        Disclaimer = "Features.Transfers.RobuxTransfer.SentInstantNoFee", 
        LowerThanMinAmount = "Features.Transfers.Error.LowerThanMinAmount", 
        GreaterThanMaxAmount = "Features.Transfers.Error.GreaterThanMaxAmount"
    });
    local v27 = v17();
    local v28 = v3.useSignalState(v27.getSelectedAmount) or 0;
    local l_setSelectedAmount_0 = v27.setSelectedAmount;
    local v30, v31 = v2.useState(500);
    local v32, v33 = v2.useState(false);
    local v34 = v27.getRobuxBalanceAmount(false);
    local v35 = v27.getRecipient(false);
    local v36 = v2.useRef(nil);
    local v37 = v23();
    local v38 = v24();
    v2.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v28 (copy), v37 (copy), v38 (copy), v33 (copy)
        if v28 == 0 or v37 <= v28 and v28 <= v38 then
            v33(false);
        end;
    end, {
        v28, 
        v37, 
        v38
    });
    local v39 = v2.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v28 (copy), v37 (copy), v38 (copy), v33 (copy), v34 (copy), v21 (ref), v27 (copy), v22 (ref), v20 (ref)
        if v28 and (v28 < v37 or v38 < v28) then
            v33(true);
            return;
        elseif v28 and v34 < v28 then
            v21(v27, v22.TransferInsufficientBalance);
            return;
        else
            v20(v27, v28 or 0);
            return;
        end;
    end, {
        v27, 
        v28, 
        v34, 
        v37, 
        v38
    });
    local v43 = v18(v2.useCallback(function(v40) --[[ Line: 85 ]]
        -- upvalues: l_setSelectedAmount_0 (copy)
        l_setSelectedAmount_0(v40 or 0);
    end, {
        l_setSelectedAmount_0
    }), v2.useCallback(function(v41, v42) --[[ Line: 88 ]]
        -- upvalues: v31 (copy), v28 (copy), v37 (copy), v38 (copy), v33 (copy), v39 (copy)
        if v41 then
            v31(800);
            return;
        elseif v42 then
            if v28 and v28 > 0 and (v28 < v37 or v38 < v28) then
                v33(true);
            else
                v39();
            end;
            v31(500);
            return;
        else
            v31(500);
            return;
        end;
    end, {
        v39, 
        v28, 
        v37, 
        v38
    }));
    local l_triggerOnClose_0 = v27.triggerOnClose;
    local v45 = v19(v43, 0.05);
    local v47 = v2.useCallback(function(v46) --[[ Line: 114 ]]
        -- upvalues: v36 (copy), v45 (copy)
        if v46 then
            v36.current = v46;
            v45(v46);
        end;
    end, {
        v45
    });
    local v48 = v2.useMemo(function() --[[ Line: 121 ]]
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
    local v50 = v2.useCallback(function(v49) --[[ Line: 130 ]]
        -- upvalues: l_setSelectedAmount_0 (copy)
        l_setSelectedAmount_0(v49);
    end, {
        l_setSelectedAmount_0
    });
    local v51 = false;
    if v28 > 0 then
        v51 = true;
        if v28 >= v37 then
            v51 = v38 < v28;
        end;
    end;
    local v52 = v32 and v51;
    local v53 = v2.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: v52 (copy), v28 (copy), v37 (copy), v26 (copy), v38 (copy)
        if not v52 or not v28 or v28 <= 0 then
            return nil;
        elseif v28 < v37 then
            return v26.LowerThanMinAmount;
        elseif v38 < v28 then
            return v26.GreaterThanMaxAmount;
        else
            return nil;
        end;
    end, {
        v52, 
        v28, 
        v37, 
        v38, 
        v26.LowerThanMinAmount, 
        v26.GreaterThanMaxAmount
    });
    local v54 = v2.useMemo(function() --[[ Line: 159 ]]
        -- upvalues: v28 (copy)
        return not v28 or v28 <= 0;
    end, {
        v28
    });
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(v30), 
            0.8
        }, 
        onClose = l_triggerOnClose_0
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v2.createElement(v14, {
                titleText = v26.SendRobux, 
                robuxBalanceAmount = v34
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
                            Text = if v28 and v28 > 0 then tostring(v28) else "0", 
                            PlaceholderText = "", 
                            TextInputType = Enum.TextInputType.Number, 
                            BackgroundTransparency = 1, 
                            ref = v47
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
                        RecipientProfile = if v35 and v35.targetId then v2.createElement(v16, {
                            userId = tostring(v35.targetId), 
                            username = v35.targetName, 
                            showUsername = true, 
                            size = UDim2.fromOffset(60, 60), 
                            layoutOrder = 1, 
                            thumbnailSize = Enum.ThumbnailSize.Size48x48
                        }) else nil, 
                        AmountContainer = v2.createElement(l_View_0, {
                            tag = "col align-x-center align-y-start size-full-1600 gap-large", 
                            LayoutOrder = 2
                        }, {
                            ThumbnailAmountGap = v2.createElement(l_View_0, {
                                tag = "size-full-0", 
                                Size = UDim2.new(1, 0, 0, 20), 
                                LayoutOrder = 1
                            }), 
                            AmountRow = v2.createElement(l_View_0, {
                                tag = "row align-x-center align-y-center", 
                                LayoutOrder = 2
                            }, {
                                AmountWrapper = v2.createElement("Frame", {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    BackgroundTransparency = 1, 
                                    LayoutOrder = 1
                                }, {
                                    SelectedAmountDisplay = v2.createElement(v13, {
                                        amount = v28, 
                                        layoutOrder = 1
                                    }), 
                                    AmountTapTarget = v2.createElement("TextButton", {
                                        Size = UDim2.new(1, 0, 1, 0), 
                                        Position = UDim2.new(0, 0, 0, 0), 
                                        Text = "", 
                                        BackgroundTransparency = 1, 
                                        ZIndex = 2, 
                                        [v2.Event.Activated] = function() --[[ Line: 251 ]]
                                            -- upvalues: v36 (copy)
                                            if v36.current then
                                                v36.current:CaptureFocus();
                                            end;
                                        end
                                    })
                                })
                            }), 
                            ErrorSlot = v2.createElement(l_View_0, {
                                tag = "col align-x-center justify-y-center size-full-0 padding-top-medium", 
                                Size = UDim2.new(1, 0, 0, 40), 
                                LayoutOrder = 3
                            }, {
                                ValidationErrorText = if v53 then v2.createElement(l_Text_0, {
                                    Text = v53, 
                                    tag = "auto-xy text-caption-small content-system-alert text-align-x-center", 
                                    LayoutOrder = 1
                                }) else nil
                            })
                        })
                    }), 
                    TapToFocusOverlay = v2.createElement("TextButton", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Text = "", 
                        BackgroundTransparency = 1, 
                        ZIndex = 2, 
                        [v2.Event.Activated] = function() --[[ Line: 281 ]]
                            -- upvalues: v36 (copy)
                            if v36.current then
                                v36.current:CaptureFocus();
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
                        chips = v48, 
                        onChipSelected = v50, 
                        selectedAmount = v28, 
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
                        text = v26.Next, 
                        onActivated = v39, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill, 
                        isDisabled = v54
                    })
                }); 
                Disclaimer = v2.createElement(l_Text_0, {
                    Text = v26.Disclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 2
                })
            })
        })
    });
end;