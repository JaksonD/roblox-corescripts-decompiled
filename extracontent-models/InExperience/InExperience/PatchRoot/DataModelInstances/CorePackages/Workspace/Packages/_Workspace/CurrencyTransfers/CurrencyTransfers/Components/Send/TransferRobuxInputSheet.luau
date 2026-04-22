local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_script_FirstAncestor_0.Localization.TransferLocalizationKeys);
local v4 = require(l_script_FirstAncestor_0.Localization.transferLocaleFormat);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.SharedFlags);
local v7 = require(l_Parent_0.SignalsReact);
local v8 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v8.Enums.ButtonVariant;
local l_Sheet_0 = v8.Sheet;
local l_Button_0 = v8.Button;
local l_View_0 = v8.View;
local l_Text_0 = v8.Text;
local l_FillBehavior_0 = v8.Enums.FillBehavior;
local l_useScaledValue_0 = v8.Hooks.useScaledValue;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v17 = require(l_script_FirstAncestor_0.Components.Generic.RobuxText);
local v18 = require(l_script_FirstAncestor_0.Components.Generic.TransferRobuxHeader);
local v19 = require(l_script_FirstAncestor_0.Components.Generic.TransferAmountOptionChips);
local v20 = require(l_script_FirstAncestor_0.Components.Generic.TransferProfileThumbnail);
local v21 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v22 = require(l_script_FirstAncestor_0.Hooks.useTextBoxOnChangeRef);
local v23 = require(l_script_FirstAncestor_0.Hooks.useAutoFocusTextBoxOnMount);
local v24 = require(l_script_FirstAncestor_0.Actions.Send.proceedToConfirm);
local v25 = require(l_script_FirstAncestor_0.Actions.Send.setTransferPromptState);
local v26 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v27 = require(l_script_FirstAncestor_0.Flags.GetFIntCurrencyTransferMinAmount);
local v28 = require(l_script_FirstAncestor_0.Flags.GetFIntCurrencyTransferMaxAmount);
local v29 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v30 = require(l_script_FirstAncestor_0.Enums.RobuxTransferFlowEventName);
local v31 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
local v32 = require(l_script_FirstAncestor_0.Utils.logRobuxTransferFlowEvent);
local v33 = require(l_script_FirstAncestor_0.Utils.formatNumber);
return function(_) --[[ Line: 58 ]] --[[ Name: TransferRobuxInputSheet ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v21 (copy), v5 (copy), v31 (copy), v29 (copy), v6 (copy), v32 (copy), v30 (copy), v7 (copy), v27 (copy), v28 (copy), v25 (copy), v26 (copy), v24 (copy), v22 (copy), v23 (copy), v33 (copy), l_LocalizationService_0 (copy), v4 (copy), l_useScaledValue_0 (copy), l_Sheet_0 (copy), v18 (copy), l_View_0 (copy), v20 (copy), v17 (copy), l_Text_0 (copy), v19 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v35 = l_useLocalization_0(v3.Presets.TransferRobuxInputSheet);
    local v36 = v21();
    v5.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v31 (ref), v36 (copy), v29 (ref), v6 (ref), v32 (ref), v30 (ref)
        v31(v36, v29.CurrencyTransferInputSheetShownCounter);
        if v6.FFlagEnableRobuxTransferFlowEventIngest then
            v32(v36, v30.input_shown);
        end;
        return nil;
    end, {
        v36
    });
    local v37 = v7.useSignalState(v36.getSelectedAmount) or 0;
    local l_setSelectedAmount_0 = v36.setSelectedAmount;
    local v39, v40 = v5.useState(false);
    local v41 = v36.getRobuxBalanceAmount(false);
    local v42 = v36.getRecipient(false);
    local v43 = v5.useRef(nil);
    local v44 = v27();
    local v45 = v28();
    v5.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: v37 (copy), v44 (copy), v45 (copy), v40 (copy)
        if v37 == 0 or v44 <= v37 and v37 <= v45 then
            v40(false);
        end;
    end, {
        v37, 
        v44, 
        v45
    });
    local v46 = v5.useCallback(function() --[[ Line: 86 ]]
        -- upvalues: v37 (copy), v44 (copy), v45 (copy), v40 (copy), v41 (copy), v25 (ref), v36 (copy), v26 (ref), v24 (ref)
        if v37 and (v37 < v44 or v45 < v37) then
            v40(true);
            return;
        elseif v37 and v41 < v37 then
            v25(v36, v26.TransferInsufficientBalance);
            return;
        else
            v24(v36, v37 or 0);
            return;
        end;
    end, {
        v36, 
        v37, 
        v41, 
        v44, 
        v45
    });
    local v48 = v5.useCallback(function(v47) --[[ Line: 100 ]]
        -- upvalues: l_setSelectedAmount_0 (copy)
        l_setSelectedAmount_0(v47 or 0);
    end, {
        l_setSelectedAmount_0
    });
    local v51 = v5.useCallback(function(v49, v50) --[[ Line: 104 ]]
        -- upvalues: v37 (copy), v44 (copy), v45 (copy), v40 (copy), v46 (copy)
        if not v49 and v50 then
            if v37 and v37 > 0 and (v37 < v44 or v45 < v37) then
                v40(true);
                return;
            else
                v46();
            end;
        end;
    end, {
        v46, 
        v37, 
        v44, 
        v45
    });
    local v52 = v22(v48, v51);
    local l_triggerOnClose_0 = v36.triggerOnClose;
    local v54 = v23(v52, 0.05);
    local v56 = v5.useCallback(function(v55) --[[ Line: 123 ]]
        -- upvalues: v43 (copy), v54 (copy)
        if v55 then
            v43.current = v55;
            v54(v55);
        end;
    end, {
        v54
    });
    local v57 = v5.useMemo(function() --[[ Line: 130 ]]
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
    local v59 = v5.useCallback(function(v58) --[[ Line: 139 ]]
        -- upvalues: l_setSelectedAmount_0 (copy)
        l_setSelectedAmount_0(v58);
    end, {
        l_setSelectedAmount_0
    });
    local v60 = false;
    if v37 > 0 then
        v60 = true;
        if v37 >= v44 then
            v60 = v45 < v37;
        end;
    end;
    local v61 = v39 and v60;
    local v64 = v5.useMemo(function() --[[ Line: 147 ]]
        -- upvalues: v61 (copy), v37 (copy), v44 (copy), v33 (ref), l_LocalizationService_0 (ref), v4 (ref), v35 (copy), v45 (copy)
        if not v61 or not v37 or v37 <= 0 then
            return nil;
        elseif v37 < v44 then
            local v62 = v33(l_LocalizationService_0.RobloxLocaleId, v44);
            return v4.substituteAmount(v35.LowerThanMinAmount or "", (tostring(v62)));
        elseif v45 < v37 then
            local v63 = v33(l_LocalizationService_0.RobloxLocaleId, v45);
            return v4.substituteAmount(v35.GreaterThanMaxAmount or "", (tostring(v63)));
        else
            return nil;
        end;
    end, {
        v61, 
        v37, 
        v44, 
        v45, 
        v35.LowerThanMinAmount, 
        v35.GreaterThanMaxAmount
    });
    local v65 = v5.useMemo(function() --[[ Line: 170 ]]
        -- upvalues: v37 (copy)
        return not v37 or v37 <= 0;
    end, {
        v37
    });
    local v66 = l_useScaledValue_0(500);
    local v67 = v5.useMemo(function() --[[ Line: 180 ]]
        -- upvalues: v66 (copy)
        return {
            v66, 
            0.62
        };
    end, {
        v66
    });
    return v5.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = v67, 
        onClose = l_triggerOnClose_0
    }, {
        Header = v5.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v5.createElement(v18, {
                titleText = v35.SendRobux, 
                robuxBalanceAmount = v41
            })
        }), 
        Content = v5.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            SheetContentContainer = v5.createElement(l_View_0, {
                tag = "col align-x-center items-center gap-large size-full-0 auto-y padding-x-large padding-top-xxlarge"
            }, {
                RobuxInputWrapper = v5.createElement("Frame", {
                    Size = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    LayoutOrder = 0
                }, {
                    RobuxInput = v5.createElement("Frame", {
                        Size = UDim2.new(0, 80, 0, 40), 
                        Position = UDim2.new(0, -10000, 0, 0), 
                        BackgroundTransparency = 1
                    }, {
                        TextBox = v5.createElement("TextBox", {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Text = if v37 and v37 > 0 then tostring(v37) else "0", 
                            PlaceholderText = "", 
                            TextInputType = Enum.TextInputType.Number, 
                            BackgroundTransparency = 1, 
                            ref = v56
                        })
                    })
                }), 
                ThumbnailAndAmountArea = v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    Content = v5.createElement(l_View_0, {
                        tag = "col align-x-center items-center gap-xlarge size-full-0 auto-y padding-top-xlarge"
                    }, {
                        RecipientProfile = if v42 and v42.targetId then v5.createElement(v20, {
                            userId = tostring(v42.targetId), 
                            username = v42.targetName, 
                            showUsername = true, 
                            size = UDim2.fromOffset(60, 60), 
                            layoutOrder = 1, 
                            thumbnailSize = Enum.ThumbnailSize.Size48x48
                        }) else nil, 
                        AmountContainer = v5.createElement(l_View_0, {
                            tag = "col align-x-center gap-large size-full-1600", 
                            LayoutOrder = 2
                        }, {
                            ThumbnailAmountGap = v5.createElement(l_View_0, {
                                tag = "size-full-0", 
                                Size = UDim2.new(1, 0, 0, 20), 
                                LayoutOrder = 1
                            }), 
                            AmountRow = v5.createElement(l_View_0, {
                                tag = "row align-x-center align-y-center", 
                                LayoutOrder = 2
                            }, {
                                AmountWrapper = v5.createElement("Frame", {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    BackgroundTransparency = 1, 
                                    LayoutOrder = 1
                                }, {
                                    SelectedAmountDisplay = v5.createElement(v17, {
                                        amount = v37, 
                                        layoutOrder = 1
                                    }), 
                                    AmountTapTarget = v5.createElement("TextButton", {
                                        Size = UDim2.new(1, 0, 1, 0), 
                                        Position = UDim2.new(0, 0, 0, 0), 
                                        Text = "", 
                                        BackgroundTransparency = 1, 
                                        ZIndex = 2, 
                                        [v5.Event.Activated] = function() --[[ Line: 276 ]]
                                            -- upvalues: v43 (copy)
                                            if v43.current then
                                                v43.current:CaptureFocus();
                                            end;
                                        end
                                    })
                                })
                            }), 
                            ErrorSlot = v5.createElement(l_View_0, {
                                tag = "col align-x-center align-y-center size-full-0 padding-top-medium", 
                                Size = UDim2.new(1, 0, 0, 40), 
                                LayoutOrder = 3
                            }, {
                                ValidationErrorText = if v64 then v5.createElement(l_Text_0, {
                                    Text = v64, 
                                    tag = "auto-xy text-caption-small text-align-x-center content-system-alert", 
                                    LayoutOrder = 1
                                }) else nil
                            })
                        })
                    }), 
                    TapToFocusOverlay = v5.createElement("TextButton", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Text = "", 
                        BackgroundTransparency = 1, 
                        ZIndex = 2, 
                        [v5.Event.Activated] = function() --[[ Line: 306 ]]
                            -- upvalues: v43 (copy)
                            if v43.current then
                                v43.current:CaptureFocus();
                            end;
                        end
                    })
                }), 
                AmountChips = v5.createElement(l_View_0, {
                    tag = "col align-x-center size-full-1600 auto-y", 
                    LayoutOrder = 2, 
                    ZIndex = 3
                }, {
                    Chips = v5.createElement(v19, {
                        chips = v57, 
                        onChipSelected = v59, 
                        selectedAmount = v37, 
                        layoutOrder = 1
                    })
                })
            })
        }), 
        Actions = v5.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            v5.createElement(l_View_0, {
                tag = "col align-x-center align-y-center gap-medium size-full-1000"
            }, {
                v5.createElement(l_View_0, {
                    tag = "row gap-small size-full-0 auto-y", 
                    LayoutOrder = 1
                }, {
                    v5.createElement(l_Button_0, {
                        text = v35.Next, 
                        onActivated = v46, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill, 
                        isDisabled = v65
                    })
                }); 
                Disclaimer = v5.createElement(l_Text_0, {
                    Text = v35.Disclaimer, 
                    tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-center", 
                    LayoutOrder = 2
                })
            })
        })
    });
end;