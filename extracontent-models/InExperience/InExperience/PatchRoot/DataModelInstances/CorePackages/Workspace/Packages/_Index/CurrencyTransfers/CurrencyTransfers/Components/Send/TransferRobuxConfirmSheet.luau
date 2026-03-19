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
return function(_) --[[ Line: 41 ]] --[[ Name: TransferRobuxConfirmSheet ]]
    -- upvalues: l_useLocalization_0 (copy), v18 (copy), v2 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v15 (copy), l_View_0 (copy), v16 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy), l_IconVariant_0 (copy), v17 (copy), l_Button_0 (copy), v20 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), v19 (copy), v21 (copy), v3 (copy)
    local v23 = l_useLocalization_0({
        SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux", 
        NewConnection = "Features.Transfers.RobuxTransfer.Label.NewConnection", 
        JoinedInYear = "Features.Transfers.RobuxTransfer.Label.JoinedInYear", 
        MutualConnection = "Features.Transfers.RobuxTransfer.Label.MutualConnection", 
        AgeEstimationDisclaimer = "Features.Transfers.RobuxTransfer.Disclaimer.AgeEstimationTransfer", 
        Send = "Features.Transfers.RobuxTransfer.Action.Send", 
        Edit = "Features.Transfers.RobuxTransfer.Action.Edit"
    });
    local v24 = v18();
    local v25 = v24.getRobuxBalanceAmount(false);
    local v26 = v24.getSelectedAmount(false);
    local v27 = v24.getUserRelationshipDetail(false);
    local v28 = v24.getRecipient(false);
    local l_triggerOnClose_0 = v24.triggerOnClose;
    local l_year_0 = os.date("*t").year;
    local v31, v32 = v2.useState(v27);
    local v33, v34 = v2.useState(v28);
    v2.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v27 (copy), v32 (copy)
        if v27 then
            v32(v27);
        end;
    end, {
        v27
    });
    v2.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v28 (copy), v34 (copy)
        if v28 then
            v34(v28);
        end;
    end, {
        v28
    });
    local v37 = v2.useMemo(function() --[[ Line: 75 ]]
        -- upvalues: v31 (copy), v23 (copy), l_year_0 (copy)
        if not v31 or not v31.friendSinceYear then
            return v23.NewConnection;
        else
            local l_friendSinceYear_0 = v31.friendSinceYear;
            local v36 = l_year_0 - l_friendSinceYear_0;
            if v36 == 0 then
                return v23.NewConnection;
            else
                return string.gsub(v23.JoinedInYear, "{year}", (tostring(v36)));
            end;
        end;
    end, {
        l_year_0, 
        v31
    });
    local v38 = v2.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v23 (copy), v31 (copy)
        return string.gsub(v23.MutualConnection, "{amount}", (tostring(v31.mutualFriendsCount)));
    end, {
        v31.mutualFriendsCount
    });
    local v39 = v2.useMemo(function() --[[ Line: 95 ]]
        -- upvalues: v23 (copy), v31 (copy)
        return string.gsub(v23.JoinedInYear, "{year}", (tostring(v31.userAccountSinceYear)));
    end, {
        v31.userAccountSinceYear
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
                titleText = v23.SendRobux, 
                robuxBalanceAmount = v25
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
                    RecipientProfile = if v33 and v33.targetId then v2.createElement(v16, {
                        userId = tostring(v33.targetId), 
                        username = v33.targetName, 
                        displayName = v33.targetDisplayName, 
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
                            ConnectedDetail = if v31 and v31.areFriends then v2.createElement(l_Text_0, {
                                Text = ("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.Calendar, l_IconVariant_0.Filled), v37), 
                                tag = "auto-xy text-body-medium content-default text-no-wrap", 
                                RichText = true, 
                                LayoutOrder = 1
                            }) else nil, 
                            Spacer = if v31 and v31.areFriends then v2.createElement(l_View_0, {
                                tag = "auto-xy", 
                                Size = UDim2.new(0, 8, 0, 0), 
                                LayoutOrder = 2
                            }) else nil, 
                            MutualDetail = v2.createElement(l_Text_0, {
                                Text = ("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.TwoPeople, l_IconVariant_0.Filled), v38), 
                                tag = "auto-xy text-body-medium content-default text-no-wrap", 
                                RichText = true, 
                                LayoutOrder = 3
                            })
                        }), 
                        JoinedDetail = v2.createElement(l_Text_0, {
                            Text = ("%* %*"):format(l_getIconRichText_0(l_Enums_0.IconName.CircleI, l_IconVariant_0.Filled), v39), 
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
                        amount = v26 or 0, 
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
                        LayoutOrder = 1, 
                        text = v23.Send, 
                        onActivated = function() --[[ Line: 195 ]] --[[ Name: onActivated ]]
                            -- upvalues: v20 (ref), v24 (copy), v26 (copy)
                            v20(v24, v26 or 0);
                        end, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    }), 
                    v2.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        text = v23.Edit, 
                        onActivated = function() --[[ Line: 204 ]] --[[ Name: onActivated ]]
                            -- upvalues: v19 (ref), v24 (copy), v21 (ref)
                            v19(v24, v21.TransferInput);
                        end, 
                        variant = l_ButtonVariant_0.Standard, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                }); 
                Disclaimer = v2.createElement(v3.Text, {
                    Text = v23.AgeEstimationDisclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 2
                })
            })
        })
    });
end;