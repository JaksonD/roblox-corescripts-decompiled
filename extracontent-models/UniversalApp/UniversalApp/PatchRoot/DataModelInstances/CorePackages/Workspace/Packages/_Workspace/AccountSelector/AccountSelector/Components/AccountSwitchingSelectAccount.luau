local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_Foundation_0 = v1.Foundation;
local l_Sheet_0 = l_Foundation_0.Sheet;
local l_View_0 = l_Foundation_0.View;
local l_Text_0 = l_Foundation_0.Text;
local l_Avatar_0 = l_Foundation_0.Avatar;
local l_InputSize_0 = l_Foundation_0.Enums.InputSize;
local l_ButtonVariant_0 = l_Foundation_0.Enums.ButtonVariant;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_EditAccountPicker_0 = v1.LandingPage.Components.EditAccountPicker;
local v13 = require(script.Parent.AccountSwitchingAddAccount);
local l_GetFFlagEnableAccountSwitcherManageAccounts_0 = v1.SharedFlags.GetFFlagEnableAccountSwitcherManageAccounts;
local l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0 = v1.SharedFlags.GetFFlagEnableAccountSwitcherSignedOutAccounts;
local l_GetFIntAccountSwitcherAccountLimit_0 = v1.SharedFlags.GetFIntAccountSwitcherAccountLimit;
local v17 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v18 = require(l_Parent_0.Analytics.EventConstants);
return l_React_0.memo(function(v19) --[[ Line: 48 ]] --[[ Name: AccountSwitchingSelectAccount ]]
    -- upvalues: l_useLocalization_0 (copy), l_useTokens_0 (copy), l_React_0 (copy), l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0 (copy), v17 (copy), v18 (copy), l_GetFIntAccountSwitcherAccountLimit_0 (copy), l_View_0 (copy), l_Avatar_0 (copy), l_InputSize_0 (copy), l_Text_0 (copy), l_Foundation_0 (copy), l_Sheet_0 (copy), l_ButtonVariant_0 (copy), l_GetFFlagEnableAccountSwitcherManageAccounts_0 (copy), v13 (copy), l_EditAccountPicker_0 (copy)
    local v20 = l_useLocalization_0({
        titleText = "Authentication.AccountSwitch.Header.SwitchAccountSentenceCase", 
        manageAccountsText = "Authentication.AccountPicker.Label.ManageAccounts", 
        addAccountText = "Authentication.AccountSwitch.Action.AddAnAccount", 
        signedOutText = "Authentication.AccountPicker.Label.SignedOut", 
        maxAccountsReachedText = "Authentication.AccountSwitch.Description.AccountLimit.2", 
        signedOut = "Authentication.AccountPicker.Label.SignedOut"
    });
    local v21 = l_useTokens_0();
    local v22, v23 = l_React_0.useState(true);
    local v24, v25 = l_React_0.useState(false);
    local v26, v27 = l_React_0.useState(false);
    local v28, v29 = l_React_0.useState(v19.isMaxAccountsReached);
    local v30 = l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0() and v19.enableSignedOutAccounts;
    l_React_0.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v19 (copy), v17 (ref)
        local v31 = {};
        for _, v33 in v19.users do
            table.insert(v31, (tostring(v33.id)));
        end;
        if v19.context and v19.origin then
            v17.sendPageLoadEvent(v19.context, v19.origin, table.concat(v31, ","));
        end;
    end, {});
    local function v34() --[[ Line: 76 ]]
        -- upvalues: v23 (copy), v19 (copy)
        v23(false);
        if v19.onAccountSelectionAbandoned then
            v19.onAccountSelectionAbandoned();
        end;
        if v19.onClose then
            v19.onClose();
        end;
    end;
    local function v35() --[[ Line: 86 ]]
        -- upvalues: v19 (copy), v17 (ref), v18 (ref), v23 (copy), v25 (copy)
        if v19.context and v19.origin then
            v17.sendButtonClickEvent(v19.context, v19.origin, v18.btn.addAccount);
        end;
        v23(false);
        v25(true);
    end;
    local function v37(v36) --[[ Line: 94 ]]
        -- upvalues: v25 (copy), v23 (copy), v19 (copy)
        v36 = v36 or false;
        v25(false);
        if v36 then
            v23(true);
            return;
        else
            if v19.onClose then
                v19.onClose();
            end;
            return;
        end;
    end;
    local function v38() --[[ Line: 104 ]]
        -- upvalues: v19 (copy), v17 (ref), v18 (ref), v23 (copy), v27 (copy)
        if v19.context and v19.origin then
            v17.sendButtonClickEvent(v19.context, v19.origin, v18.btn.manageAccounts);
        end;
        v23(false);
        v27(true);
    end;
    local function v39() --[[ Line: 112 ]]
        -- upvalues: v27 (copy), v23 (copy)
        v27(false);
        v23(true);
    end;
    local v40, v41 = l_React_0.useState(v19.users);
    local function v47() --[[ Line: 120 ]]
        -- upvalues: v40 (copy)
        local v42 = {};
        local l_ipairs_0 = ipairs;
        local v44 = v40 or {};
        for _, v46 in l_ipairs_0(v44) do
            table.insert(v42, {
                user_id = tostring(v46.id), 
                username = v46.name, 
                display_name = v46.displayName, 
                has_valid_session = v46.hasValidSession, 
                is_current_user = v46.isUnselectable
            });
        end;
        return v42;
    end;
    local function v52(v48) --[[ Line: 134 ]]
        -- upvalues: v41 (copy), v28 (copy), l_GetFIntAccountSwitcherAccountLimit_0 (ref), v29 (copy)
        local v49 = {};
        for _, v51 in ipairs(v48) do
            table.insert(v49, {
                id = tonumber(v51.user_id), 
                name = v51.username, 
                displayName = v51.display_name, 
                hasValidSession = v51.has_valid_session, 
                isUnselectable = v51.is_current_user
            });
        end;
        v41(v49);
        if v28 and #v49 < l_GetFIntAccountSwitcherAccountLimit_0() then
            v29(false);
        end;
    end;
    local v53 = {};
    for v54, v55 in v40 do
        local v56 = v55.name or "";
        v53[("Row_%*"):format(v54)] = l_React_0.createElement(l_View_0, {
            tag = "col size-full-0 auto-y items-center padding-y-medium", 
            LayoutOrder = v54
        }, {
            AccountCard = l_React_0.createElement(l_View_0, {
                tag = "row size-full-0 auto-y wrap gap-small radius-medium align-y-center", 
                onActivated = function() --[[ Line: 161 ]] --[[ Name: onActivated ]]
                    -- upvalues: v55 (copy), v19 (copy), v17 (ref)
                    if not v55.isUnselectable then
                        if v19.context and v19.origin then
                            v17.sendSelectEvent(v19.context, v19.origin, (tostring(v55.id)));
                        end;
                        v19.onAccountSelection(v55.id);
                    end;
                end
            }, {
                Avatar = l_React_0.createElement(l_Avatar_0, {
                    LayoutOrder = 0, 
                    userId = v55.id, 
                    size = l_InputSize_0.Large, 
                    backgroundStyle = {
                        Color3 = v21.Color.Shift.Shift_300.Color3, 
                        Transparency = v21.Color.Shift.Shift_300.Transparency
                    }, 
                    tag = "auto-y"
                }), 
                AccountInfo = l_React_0.createElement(l_View_0, {
                    tag = "col fill auto-y items-start", 
                    LayoutOrder = 1
                }, {
                    DisplayName = l_React_0.createElement(l_Text_0, {
                        Text = v55.displayName or v56, 
                        tag = "auto-y size-full-0 text-title-large text-align-x-left", 
                        LayoutOrder = 0, 
                        TextTruncate = Enum.TextTruncate.SplitWord
                    }), 
                    Username = l_React_0.createElement(l_Text_0, {
                        Text = "@" .. v56, 
                        tag = "auto-y size-full-0 text-body-small text-align-x-left", 
                        LayoutOrder = 1, 
                        TextTruncate = Enum.TextTruncate.SplitWord
                    })
                }), 
                RightStatus = l_React_0.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "col auto-xy size-full-0 items-end"
                }, {
                    Status = if not not v55.iconKey or v55.isUnselectable then l_React_0.createElement(l_Foundation_0.Icon, {
                        name = l_Foundation_0.Enums.IconName.CircleCheck, 
                        size = l_Foundation_0.Enums.IconSize.Large, 
                        variant = l_Foundation_0.Enums.IconVariant.Filled
                    }) else if v55.hasValidSession then nil else l_React_0.createElement(l_Foundation_0.View, {
                        tag = "col auto-xy padding-x-small padding-y-xsmall radius-small bg-action-alert", 
                        LayoutOrder = 2
                    }, {
                        PillText = l_React_0.createElement(l_Foundation_0.Text, {
                            Text = v20.signedOut, 
                            tag = "auto-xy text-caption-large text-align-x-center text-title-medium"
                        })
                    })
                })
            })
        });
    end;
    return l_React_0.createElement(l_React_0.Fragment, nil, {
        SelectAccountSheet = v22 and l_React_0.createElement(l_Sheet_0.Root, {
            onClose = v34, 
            preferCenterSheet = true, 
            tag = "col auto-y size-full"
        }, {
            Header = l_React_0.createElement(l_Sheet_0.Header, {
                hasCloseAffordance = true
            }, {
                Title = l_React_0.createElement(l_Text_0, {
                    Text = v20.titleText, 
                    tag = "auto-xy text-heading-small content-emphasis"
                })
            }), 
            Content = l_React_0.createElement(l_Sheet_0.Content, nil, {
                Accounts = l_React_0.createElement(l_View_0, {
                    tag = "col padding-right-small size-full-0 auto-y"
                }, v53)
            }), 
            Actions = l_React_0.createElement(l_Sheet_0.Actions, nil, {
                ActionList = l_React_0.createElement(l_View_0, {
                    tag = "col auto-y gap-small size-full-0"
                }, {
                    LimitReached = v28 and l_React_0.createElement(l_View_0, {
                        tag = "col size-full-0 padding-bottom-small auto-y", 
                        LayoutOrder = 0
                    }, {
                        AccountLimitReachedText = l_React_0.createElement(l_Foundation_0.Text, {
                            Text = v20.maxAccountsReachedText, 
                            RichText = true, 
                            tag = "size-full-0 text-wrap auto-y text-caption-medium content-default text-align-x-left"
                        })
                    }), 
                    AddAccountButton = l_React_0.createElement(l_Foundation_0.Button, {
                        text = v20.addAccountText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v35, 
                        onClose = v19.onClose, 
                        isDisabled = v28, 
                        width = UDim.new(1, 0), 
                        LayoutOrder = 1
                    }), 
                    ManageAccountsButton = l_GetFFlagEnableAccountSwitcherManageAccounts_0() and v30 and l_React_0.createElement(l_Foundation_0.Button, {
                        text = v20.manageAccountsText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v38, 
                        tag = "col size-full-0", 
                        width = UDim.new(1, 0), 
                        LayoutOrder = 2
                    }) or nil
                })
            })
        }), 
        AddAccountModal = v24 and l_React_0.createElement(v13, {
            onClose = v37, 
            origin = v19.origin
        }) or nil, 
        ManageAccountsModal = v26 and l_React_0.createElement(l_EditAccountPicker_0, {
            accounts = v47(), 
            onClose = v39, 
            onAccountsUpdated = v52, 
            logout = v19.logout, 
            enableSignedOutAccounts = v19.enableSignedOutAccounts
        }) or nil
    });
end);