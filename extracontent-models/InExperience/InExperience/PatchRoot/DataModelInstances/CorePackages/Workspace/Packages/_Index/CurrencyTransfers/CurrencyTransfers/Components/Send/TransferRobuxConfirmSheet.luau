local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Sheet_0 = v3.Sheet;
local l_Button_0 = v3.Button;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_useScaledValue_0 = v3.Hooks.useScaledValue;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_Enums_0 = v3.Enums;
local l_IconVariant_0 = v3.Enums.IconVariant;
local l_getIconRichText_0 = v3.Utility.getIconRichText;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v15 = require(l_script_FirstAncestor_0.Components.Generic.TransferRobuxHeader);
local v16 = require(l_script_FirstAncestor_0.Components.Generic.TransferProfileThumbnail);
local v17 = require(l_script_FirstAncestor_0.Components.Generic.RobuxText);
local v18 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v19 = require(l_script_FirstAncestor_0.Actions.Send.setTransferPromptState);
local v20 = require(l_script_FirstAncestor_0.Actions.Send.processTransfer);
local v21 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v22 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v23 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
return function(_) --[[ Line: 43 ]] --[[ Name: TransferRobuxConfirmSheet ]]
    -- upvalues: l_useLocalization_0 (copy), v18 (copy), v2 (copy), v23 (copy), v22 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v15 (copy), l_View_0 (copy), v16 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy), l_IconVariant_0 (copy), v17 (copy), l_Button_0 (copy), v20 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), v19 (copy), v21 (copy), v3 (copy)
    local v25 = l_useLocalization_0({
        SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux", 
        NewConnection = "Features.Transfers.RobuxTransfer.Label.NewConnection", 
        JoinedInYear = "Features.Transfers.RobuxTransfer.Label.JoinedInYear", 
        ConnectedYear = "Features.Transfers.Label.ConnectedSince", 
        MutualConnection = "Features.Transfers.RobuxTransfer.Label.MutualConnection", 
        AgeEstimationDisclaimer = "Features.Transfers.RobuxTransfer.Disclaimer.AgeEstimationTransfer", 
        Send = "Features.Transfers.RobuxTransfer.Action.Send", 
        Edit = "Features.Transfers.RobuxTransfer.Action.Edit"
    });
    local v26 = v18();
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v23 (ref), v26 (copy), v22 (ref)
        v23(v26, v22.CurrencyTransferConfirmSheetShownCounter);
        return nil;
    end, {});
    local v27 = v26.getRobuxBalanceAmount(false);
    local v28 = v26.getSelectedAmount(false);
    local v29 = v26.getUserRelationshipDetail(false);
    local v30 = v26.getRecipient(false);
    local l_triggerOnClose_0 = v26.triggerOnClose;
    local l_year_0 = os.date("*t").year;
    local v33, v34 = v2.useState(v29);
    local v35, v36 = v2.useState(v30);
    v2.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v29 (copy), v34 (copy)
        if v29 then
            v34(v29);
        end;
    end, {
        v29
    });
    v2.useEffect(function() --[[ Line: 78 ]]
        -- upvalues: v30 (copy), v36 (copy)
        if v30 then
            v36(v30);
        end;
    end, {
        v30
    });
    local v39 = v2.useMemo(function() --[[ Line: 84 ]]
        -- upvalues: v33 (copy), v25 (copy), l_year_0 (copy)
        if not v33 or not v33.friendSinceYear then
            return v25.NewConnection;
        else
            local l_friendSinceYear_0 = v33.friendSinceYear;
            local v38 = l_year_0 - l_friendSinceYear_0;
            if v38 == 0 then
                return v25.NewConnection;
            else
                return string.gsub(v25.ConnectedYear, "{year}", (tostring(v38)));
            end;
        end;
    end, {
        l_year_0, 
        v33
    });
    local v40 = v2.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v25 (copy), v33 (copy)
        return string.gsub(v25.MutualConnection, "{amount}", (tostring(v33.mutualFriendsCount)));
    end, {
        v33.mutualFriendsCount
    });
    local v41 = v2.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: v25 (copy), v33 (copy)
        return string.gsub(v25.JoinedInYear, "{year}", (tostring(v33.userAccountSinceYear)));
    end, {
        v33.userAccountSinceYear
    });
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(523), 
            0.8
        }, 
        onClose = l_triggerOnClose_0
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v2.createElement(v15, {
                titleText = v25.SendRobux, 
                robuxBalanceAmount = v27
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
                    RecipientProfile = if v35 and v35.targetId then v2.createElement(v16, {
                        userId = tostring(v35.targetId), 
                        username = v35.targetName, 
                        displayName = v35.targetDisplayName, 
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
                            ConnectedDetail = if v33 and v33.areFriends then v2.createElement(l_Text_0, {
                                Text = ("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.Calendar, l_IconVariant_0.Filled), v39), 
                                tag = "auto-xy text-body-medium content-default text-no-wrap", 
                                RichText = true, 
                                LayoutOrder = 1
                            }) else nil, 
                            Spacer = if v33 and v33.areFriends then v2.createElement(l_View_0, {
                                tag = "auto-xy", 
                                Size = UDim2.new(0, 8, 0, 0), 
                                LayoutOrder = 2
                            }) else nil, 
                            MutualDetail = v2.createElement(l_Text_0, {
                                Text = ("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.TwoPeople, l_IconVariant_0.Filled), v40), 
                                tag = "auto-xy text-body-medium content-default text-no-wrap", 
                                RichText = true, 
                                LayoutOrder = 3
                            })
                        }), 
                        JoinedDetail = v2.createElement(l_Text_0, {
                            Text = ("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.CircleI, l_IconVariant_0.Filled), v41), 
                            tag = "auto-xy text-body-medium content-default text-no-wrap padding-y-xsmall", 
                            RichText = true, 
                            LayoutOrder = 2
                        })
                    })
                }), 
                AmountDisplay = v2.createElement(l_View_0, {
                    tag = "row align-x-center align-y-center size-full-1600 bg-shift-100 radius-medium", 
                    LayoutOrder = 2
                }, {
                    Amount = v2.createElement(v17, {
                        amount = v28 or 0, 
                        layoutOrder = 1
                    })
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            v2.createElement(l_View_0, {
                tag = "col align-y-center align-x-center size-full-1000 gap-medium padding-top-large"
            }, {
                v2.createElement(l_View_0, {
                    tag = "row auto-y size-full-0 gap-small", 
                    LayoutOrder = 1
                }, {
                    v2.createElement(l_Button_0, {
                        LayoutOrder = 1, 
                        text = v25.Send, 
                        onActivated = function() --[[ Line: 204 ]] --[[ Name: onActivated ]]
                            -- upvalues: v20 (ref), v26 (copy), v28 (copy)
                            v20(v26, v28 or 0);
                        end, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    }), 
                    v2.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        text = v25.Edit, 
                        onActivated = function() --[[ Line: 213 ]] --[[ Name: onActivated ]]
                            -- upvalues: v19 (ref), v26 (copy), v21 (ref)
                            v19(v26, v21.TransferInput);
                        end, 
                        variant = l_ButtonVariant_0.Standard, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                }); 
                Disclaimer = v2.createElement(v3.Text, {
                    Text = v25.AgeEstimationDisclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 2
                })
            })
        })
    });
end;