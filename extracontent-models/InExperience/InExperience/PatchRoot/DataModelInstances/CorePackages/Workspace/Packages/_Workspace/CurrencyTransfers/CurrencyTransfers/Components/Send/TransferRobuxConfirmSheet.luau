local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.Localization.TransferLocalizationKeys);
local v5 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_Sheet_0 = v5.Sheet;
local l_Button_0 = v5.Button;
local l_View_0 = v5.View;
local l_Text_0 = v5.Text;
local l_FillBehavior_0 = v5.Enums.FillBehavior;
local l_Enums_0 = v5.Enums;
local l_IconVariant_0 = v5.Enums.IconVariant;
local l_getIconRichText_0 = v5.Utility.getIconRichText;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v16 = require(l_script_FirstAncestor_0.Components.Generic.TransferRobuxHeader);
local v17 = require(l_script_FirstAncestor_0.Components.Generic.TransferProfileThumbnail);
local v18 = require(l_script_FirstAncestor_0.Components.Generic.RobuxText);
local v19 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v20 = require(l_script_FirstAncestor_0.Actions.Send.setTransferPromptState);
local v21 = require(l_script_FirstAncestor_0.Actions.Send.processTransfer);
local v22 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v23 = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local v24 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v25 = require(l_script_FirstAncestor_0.Enums.RobuxTransferFlowEventName);
local v26 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
local v27 = require(l_script_FirstAncestor_0.Utils.logRobuxTransferFlowEvent);
local v28 = require(l_script_FirstAncestor_0.Flags.GetFIntCurrencyTransferDeveloperCommissionRate);
local v29 = require(l_script_FirstAncestor_0.Flags.GetFIntCurrencyTransferPlatformFeeRate);
return function(_) --[[ Line: 56 ]] --[[ Name: TransferRobuxConfirmSheet ]]
    -- upvalues: l_useLocalization_0 (copy), v4 (copy), v19 (copy), v2 (copy), v26 (copy), v24 (copy), v3 (copy), v27 (copy), v25 (copy), v23 (copy), v28 (copy), v29 (copy), l_Sheet_0 (copy), v16 (copy), l_View_0 (copy), v17 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy), l_IconVariant_0 (copy), v18 (copy), l_Button_0 (copy), v20 (copy), v22 (copy), v21 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), v5 (copy)
    local v31 = l_useLocalization_0(v4.Presets.TransferRobuxConfirmSheet);
    local v32 = v19();
    v2.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v26 (ref), v32 (copy), v24 (ref), v3 (ref), v27 (ref), v25 (ref)
        v26(v32, v24.CurrencyTransferConfirmSheetShownCounter);
        if v3.FFlagEnableRobuxTransferFlowEventIngest then
            v27(v32, v25.confirm_shown);
        end;
        return nil;
    end, {
        v32
    });
    local v33 = v32.getRobuxBalanceAmount(false);
    local v34 = v32.getSelectedAmount(false);
    local v35 = v32.getUserRelationshipDetail(false);
    local v36 = v32.getRecipient(false);
    local v37 = v32.getTransferOrigination(false) == v23.InExperience;
    local l_triggerOnClose_0 = v32.triggerOnClose;
    local l_year_0 = os.date("*t").year;
    local v40, v41 = v2.useState(v35);
    local v42, v43 = v2.useState(v36);
    v2.useEffect(function() --[[ Line: 81 ]]
        -- upvalues: v35 (copy), v41 (copy)
        if v35 then
            v41(v35);
        end;
    end, {
        v35
    });
    v2.useEffect(function() --[[ Line: 87 ]]
        -- upvalues: v36 (copy), v43 (copy)
        if v36 then
            v43(v36);
        end;
    end, {
        v36
    });
    local v46 = v2.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: v40 (copy), v31 (copy), l_year_0 (copy)
        if not v40 or not v40.friendSinceYear then
            return v31.NewConnection;
        else
            local l_friendSinceYear_0 = v40.friendSinceYear;
            local v45 = l_year_0 - l_friendSinceYear_0;
            if v45 == 0 then
                return v31.NewConnection;
            else
                return string.gsub(v31.ConnectedYear, "{year}", (tostring(v45)));
            end;
        end;
    end, {
        l_year_0, 
        v40
    });
    local v47 = v2.useMemo(function() --[[ Line: 105 ]]
        -- upvalues: v31 (copy), v40 (copy)
        return string.gsub(v31.MutualConnection, "{amount}", (tostring(v40.mutualFriendsCount)));
    end, {
        v40.mutualFriendsCount
    });
    local v48 = v2.useMemo(function() --[[ Line: 113 ]]
        -- upvalues: v31 (copy), v40 (copy)
        return string.gsub(v31.JoinedInYear, "{year}", (tostring(v40.userAccountSinceYear)));
    end, {
        v40.userAccountSinceYear
    });
    local v52 = v2.useMemo(function() --[[ Line: 117 ]]
        -- upvalues: v37 (copy), v34 (copy), v28 (ref), v29 (ref), v31 (copy)
        if not v37 or not v34 then
            return nil;
        else
            local v49 = v28();
            local v50 = v29();
            local v51 = math.floor(v34 * (1 - (v49 + v50) / 100));
            return (string.gsub(v31.RecipientWillGet, "{amount}", (tostring(v51))));
        end;
    end, {
        v37, 
        v34, 
        v31.RecipientWillGet
    });
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        onClose = l_triggerOnClose_0
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v2.createElement(v16, {
                titleText = v31.SendRobux, 
                robuxBalanceAmount = v33
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            SheetContentContainer = v2.createElement(l_View_0, {
                tag = "col gap-large auto-y size-full-0 align-x-center"
            }, {
                ProfileCard = v2.createElement(l_View_0, {
                    Size = UDim2.new(1, 0, 0, 250), 
                    tag = "col gap-xlarge align-x-center bg-shift-100 align-y-center radius-medium padding-large", 
                    LayoutOrder = 1
                }, {
                    RecipientProfile = if v42 and v42.targetId then v2.createElement(v17, {
                        userId = tostring(v42.targetId), 
                        username = v42.targetName, 
                        displayName = v42.targetDisplayName, 
                        showUsername = true, 
                        size = UDim2.fromOffset(60, 60), 
                        layoutOrder = 1, 
                        thumbnailSize = Enum.ThumbnailSize.Size48x48
                    }) else nil, 
                    InfoRow = v2.createElement(l_View_0, {
                        tag = "col gap-medium align-x-center align-y-start auto-y size-full-0", 
                        LayoutOrder = 2
                    }, {
                        FirstRow = v2.createElement(l_View_0, {
                            tag = "row align-x-center align-y-center auto-xy", 
                            LayoutOrder = 1
                        }, {
                            ConnectedDetail = if v40 and v40.areFriends then v2.createElement(l_Text_0, {
                                Text = ("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.Calendar, l_IconVariant_0.Filled), v46), 
                                tag = "auto-xy text-body-medium content-default text-no-wrap", 
                                RichText = true, 
                                LayoutOrder = 1
                            }) else nil, 
                            Spacer = if v40 and v40.areFriends then v2.createElement(l_View_0, {
                                tag = "auto-xy", 
                                Size = UDim2.new(0, 8, 0, 0), 
                                LayoutOrder = 2
                            }) else nil, 
                            MutualDetail = v2.createElement(l_Text_0, {
                                Text = ("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.TwoPeople, l_IconVariant_0.Filled), v47), 
                                tag = "auto-xy text-body-medium content-default text-no-wrap", 
                                RichText = true, 
                                LayoutOrder = 3
                            })
                        }), 
                        JoinedDetail = v2.createElement(l_Text_0, {
                            Text = ("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.CircleI, l_IconVariant_0.Filled), v48), 
                            tag = "auto-xy text-body-medium content-default text-no-wrap padding-y-xsmall", 
                            RichText = true, 
                            LayoutOrder = 2
                        })
                    })
                }), 
                AmountDisplay = v2.createElement(l_View_0, {
                    tag = "col align-x-center align-y-center size-full-2000 radius-medium bg-shift-100", 
                    LayoutOrder = 2
                }, {
                    Amount = v2.createElement(v18, {
                        amount = v34 or 0, 
                        layoutOrder = 1
                    }), 
                    RecipientText = if v52 then v2.createElement(l_Text_0, {
                        Text = v52, 
                        tag = "auto-xy text-caption-small text-align-x-center content-muted", 
                        LayoutOrder = 2
                    }) else nil
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            v2.createElement(l_View_0, {
                tag = "col align-x-center align-y-center gap-medium size-full-1000"
            }, {
                v2.createElement(l_View_0, {
                    tag = "row gap-small size-full-0 auto-y", 
                    LayoutOrder = 1
                }, {
                    SendButton = v2.createElement(l_Button_0, {
                        LayoutOrder = 1, 
                        text = v31.Send, 
                        onActivated = function() --[[ Line: 229 ]] --[[ Name: onActivated ]]
                            -- upvalues: v34 (copy), v33 (copy), v20 (ref), v32 (copy), v22 (ref), v21 (ref)
                            if v34 and v33 < v34 then
                                v20(v32, v22.TransferInsufficientBalance);
                                return;
                            else
                                v21(v32, v34 or 0);
                                return;
                            end;
                        end, 
                        inputDelay = v37 and 2.5 or nil, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    }), 
                    EditButton = if not v37 then v2.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        text = v31.Edit, 
                        onActivated = function() --[[ Line: 244 ]] --[[ Name: onActivated ]]
                            -- upvalues: v20 (ref), v32 (copy), v22 (ref)
                            v20(v32, v22.TransferInput);
                        end, 
                        variant = l_ButtonVariant_0.Standard, 
                        fillBehavior = l_FillBehavior_0.Fill
                    }) else nil
                }); 
                Disclaimer = v2.createElement(v5.Text, {
                    Text = v31.AgeEstimationDisclaimer, 
                    tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left", 
                    LayoutOrder = 2
                })
            })
        })
    });
end;