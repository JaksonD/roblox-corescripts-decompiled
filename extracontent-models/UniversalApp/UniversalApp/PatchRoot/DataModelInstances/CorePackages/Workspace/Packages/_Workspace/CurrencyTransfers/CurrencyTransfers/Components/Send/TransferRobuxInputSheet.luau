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
local v25 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v26 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
return function(_) --[[ Line: 46 ]] --[[ Name: TransferRobuxInputSheet ]]
    -- upvalues: l_useLocalization_0 (copy), v17 (copy), v2 (copy), v26 (copy), v25 (copy), v3 (copy), v23 (copy), v24 (copy), v21 (copy), v22 (copy), v20 (copy), v18 (copy), v19 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v14 (copy), l_View_0 (copy), v16 (copy), v13 (copy), l_Text_0 (copy), v15 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v28 = l_useLocalization_0({
        SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux", 
        Next = "Features.Transfers.RobuxTransfer.Action.Next", 
        Disclaimer = "Features.Transfers.RobuxTransfer.SentInstantNoFee", 
        LowerThanMinAmount = "Features.Transfers.Error.LowerThanMinAmount", 
        GreaterThanMaxAmount = "Features.Transfers.Error.GreaterThanMaxAmount"
    });
    local v29 = v17();
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v26 (ref), v29 (copy), v25 (ref)
        v26(v29, v25.CurrencyTransferInputSheetShownCounter);
        return nil;
    end, {});
    local v30 = v3.useSignalState(v29.getSelectedAmount) or 0;
    local l_setSelectedAmount_0 = v29.setSelectedAmount;
    local v32, v33 = v2.useState(500);
    local v34, v35 = v2.useState(false);
    local v36 = v29.getRobuxBalanceAmount(false);
    local v37 = v29.getRecipient(false);
    local v38 = v2.useRef(nil);
    local v39 = v23();
    local v40 = v24();
    v2.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v30 (copy), v39 (copy), v40 (copy), v35 (copy)
        if v30 == 0 or v39 <= v30 and v30 <= v40 then
            v35(false);
        end;
    end, {
        v30, 
        v39, 
        v40
    });
    local v41 = v2.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v30 (copy), v39 (copy), v40 (copy), v35 (copy), v36 (copy), v21 (ref), v29 (copy), v22 (ref), v20 (ref)
        if v30 and (v30 < v39 or v40 < v30) then
            v35(true);
            return;
        elseif v30 and v36 < v30 then
            v21(v29, v22.TransferInsufficientBalance);
            return;
        else
            v20(v29, v30 or 0);
            return;
        end;
    end, {
        v29, 
        v30, 
        v36, 
        v39, 
        v40
    });
    local v45 = v18(v2.useCallback(function(v42) --[[ Line: 93 ]]
        -- upvalues: l_setSelectedAmount_0 (copy)
        l_setSelectedAmount_0(v42 or 0);
    end, {
        l_setSelectedAmount_0
    }), v2.useCallback(function(v43, v44) --[[ Line: 96 ]]
        -- upvalues: v33 (copy), v30 (copy), v39 (copy), v40 (copy), v35 (copy), v41 (copy)
        if v43 then
            v33(800);
            return;
        elseif v44 then
            if v30 and v30 > 0 and (v30 < v39 or v40 < v30) then
                v35(true);
            else
                v41();
            end;
            v33(500);
            return;
        else
            v33(500);
            return;
        end;
    end, {
        v41, 
        v30, 
        v39, 
        v40
    }));
    local l_triggerOnClose_0 = v29.triggerOnClose;
    local v47 = v19(v45, 0.05);
    local v49 = v2.useCallback(function(v48) --[[ Line: 122 ]]
        -- upvalues: v38 (copy), v47 (copy)
        if v48 then
            v38.current = v48;
            v47(v48);
        end;
    end, {
        v47
    });
    local v50 = v2.useMemo(function() --[[ Line: 129 ]]
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
    local v52 = v2.useCallback(function(v51) --[[ Line: 138 ]]
        -- upvalues: l_setSelectedAmount_0 (copy)
        l_setSelectedAmount_0(v51);
    end, {
        l_setSelectedAmount_0
    });
    local v53 = false;
    if v30 > 0 then
        v53 = true;
        if v30 >= v39 then
            v53 = v40 < v30;
        end;
    end;
    local v54 = v34 and v53;
    local v55 = v2.useMemo(function() --[[ Line: 146 ]]
        -- upvalues: v54 (copy), v30 (copy), v39 (copy), v28 (copy), v40 (copy)
        if not v54 or not v30 or v30 <= 0 then
            return nil;
        elseif v30 < v39 then
            return v28.LowerThanMinAmount;
        elseif v40 < v30 then
            return v28.GreaterThanMaxAmount;
        else
            return nil;
        end;
    end, {
        v54, 
        v30, 
        v39, 
        v40, 
        v28.LowerThanMinAmount, 
        v28.GreaterThanMaxAmount
    });
    local v56 = v2.useMemo(function() --[[ Line: 167 ]]
        -- upvalues: v30 (copy)
        return not v30 or v30 <= 0;
    end, {
        v30
    });
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(v32), 
            0.8
        }, 
        onClose = l_triggerOnClose_0
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v2.createElement(v14, {
                titleText = v28.SendRobux, 
                robuxBalanceAmount = v36
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
                            Text = if v30 and v30 > 0 then tostring(v30) else "0", 
                            PlaceholderText = "", 
                            TextInputType = Enum.TextInputType.Number, 
                            BackgroundTransparency = 1, 
                            ref = v49
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
                        RecipientProfile = if v37 and v37.targetId then v2.createElement(v16, {
                            userId = tostring(v37.targetId), 
                            username = v37.targetName, 
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
                                        amount = v30, 
                                        layoutOrder = 1
                                    }), 
                                    AmountTapTarget = v2.createElement("TextButton", {
                                        Size = UDim2.new(1, 0, 1, 0), 
                                        Position = UDim2.new(0, 0, 0, 0), 
                                        Text = "", 
                                        BackgroundTransparency = 1, 
                                        ZIndex = 2, 
                                        [v2.Event.Activated] = function() --[[ Line: 259 ]]
                                            -- upvalues: v38 (copy)
                                            if v38.current then
                                                v38.current:CaptureFocus();
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
                                ValidationErrorText = if v55 then v2.createElement(l_Text_0, {
                                    Text = v55, 
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
                        [v2.Event.Activated] = function() --[[ Line: 289 ]]
                            -- upvalues: v38 (copy)
                            if v38.current then
                                v38.current:CaptureFocus();
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
                        chips = v50, 
                        onChipSelected = v52, 
                        selectedAmount = v30, 
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
                        text = v28.Next, 
                        onActivated = v41, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill, 
                        isDisabled = v56
                    })
                }); 
                Disclaimer = v2.createElement(l_Text_0, {
                    Text = v28.Disclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 2
                })
            })
        })
    });
end;