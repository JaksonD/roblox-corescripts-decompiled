local l_script_FirstAncestor_0 = script:FindFirstAncestor("LandingPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_Enums_0 = v3.Enums;
local v7 = require(l_script_FirstAncestor_0.Components.EditAccountPickerList);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v11 = require(script.Parent.RemoveAccountDialog);
local v12 = require(l_Parent_0.AuthCommon);
local l_updateLoginEntryData_0 = v12.Utils.updateLoginEntryData;
local l_User_0 = v12.Thunks.User;
local l_DeleteAccount_0 = require(l_Parent_0.AccountSwitching).DeleteAccount;
local v16 = require(l_Parent_0.Cryo);
local _ = require(script.Parent.AccountCarouselAvatar);
local l_GetFFlagEnableAccountCarouselEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAccountCarouselEvents;
local v19 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v19.EventStreamConstants;
local l_authButtonClick_0 = v19.Events.authButtonClick;
local l_authPageload_0 = v19.Events.authPageload;
local l_Sheet_0 = v3.Sheet;
local l_DialogSize_0 = v3.Enums.DialogSize;
local l_GetFFlagEnableManageAccountsRedesign_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableManageAccountsRedesign;
local l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAccountSwitcherSignedOutAccounts;
local l_GetFFlagEnableLuaAccountPicker_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableLuaAccountPicker;
local l_GetFIntAccountPickerVariantOverride_0 = require(l_Parent_0.SharedFlags).GetFIntAccountPickerVariantOverride;
local v29 = require(l_Parent_0.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_Parent_0.ExperimentLayers).AppBtidLayers;
local l_AuthLocalStorageKeys_0 = v12.Enums.AuthLocalStorageKeys;
local l_AppStorageService_0 = game:GetService("AppStorageService");
return function(v33) --[[ Line: 46 ]]
    -- upvalues: v2 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useLocalization_0 (copy), l_User_0 (copy), v29 (copy), l_AppBtidLayers_0 (copy), l_GetFIntAccountPickerVariantOverride_0 (copy), l_GetFFlagEnableLuaAccountPicker_0 (copy), l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0 (copy), l_GetFFlagEnableAccountCarouselEvents_0 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), l_updateLoginEntryData_0 (copy), v16 (copy), l_AppStorageService_0 (copy), l_AuthLocalStorageKeys_0 (copy), l_DeleteAccount_0 (copy), l_authPageload_0 (copy), l_GetFFlagEnableManageAccountsRedesign_0 (copy), l_useStyle_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), v11 (copy), v3 (copy), l_Enums_0 (copy), v7 (copy), l_Sheet_0 (copy), l_DialogSize_0 (copy)
    local v34, v35 = v2.useState(v33.accounts);
    local v36, v37 = v2.useState(nil);
    local v38 = l_useRoactService_0(l_RoactNetworking_0);
    local v39 = l_useLocalization_0({
        EditAccounts = "Authentication.AccountPicker.Label.ManageAccounts"
    });
    local v40 = l_User_0.fromLocalStorage();
    local v41 = false;
    if v40.userId ~= nil then
        local v44 = v29.useBrowserTrackerExperiment({
            l_AppBtidLayers_0.LandingLayer
        }, function(v42) --[[ Line: 64 ]]
            -- upvalues: l_AppBtidLayers_0 (ref), l_GetFIntAccountPickerVariantOverride_0 (ref)
            local v43 = v42[l_AppBtidLayers_0.LandingLayer] or {};
            return {
                accountPickerVariantEnabled = v43.accountPickerVariantEnabled and tonumber(v43.accountPickerVariantEnabled) or l_GetFIntAccountPickerVariantOverride_0()
            };
        end);
        local v45 = false;
        if v44.accountPickerVariantEnabled ~= nil then
            v45 = v44.accountPickerVariantEnabled ~= 0;
        end;
        v41 = l_GetFFlagEnableLuaAccountPicker_0() and v45;
    end;
    local v46 = l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0() and v33.enableSignedOutAccounts;
    local function _() --[[ Line: 81 ]]
        -- upvalues: v36 (copy), v40 (copy)
        if v36 == nil then
            return false;
        else
            return tostring(v40.userId) == v36.user_id;
        end;
    end;
    local function v50() --[[ Line: 88 ]]
        -- upvalues: v46 (copy), v36 (copy), v40 (copy), v34 (copy)
        if not v46 then
            return false;
        elseif v36 == nil or not (v36 ~= nil and tostring(v40.userId) == v36.user_id) then
            return false;
        else
            for _, v49 in ipairs(v34) do
                if v49.user_id ~= v36.user_id and v49.has_valid_session then
                    return false;
                end;
            end;
            return true;
        end;
    end;
    local function v60() --[[ Line: 103 ]]
        -- upvalues: v36 (copy), l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_updateLoginEntryData_0 (ref), v16 (ref), v34 (copy), v35 (copy), v33 (copy), v37 (copy), v40 (copy), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), v41 (ref), v50 (copy), v46 (copy), l_DeleteAccount_0 (ref), v38 (copy)
        if v36 == nil then
            return;
        else
            if l_GetFFlagEnableAccountCarouselEvents_0() then
                l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerManageAccountsScreen, l_EventStreamConstants_0.Button.AccountPickerDeleteAccount, v36.user_id, nil);
            end;
            if not v36.has_valid_session then
                l_updateLoginEntryData_0(v36.user_id, {
                    showInAccountPicker = false
                });
                local v52 = v16.List.filter(v34, function(v51) --[[ Line: 119 ]]
                    -- upvalues: v36 (ref)
                    return v51.user_id ~= v36.user_id;
                end);
                v35(v52);
                if v33.onAccountsUpdated then
                    v33.onAccountsUpdated(v52);
                end;
                v37(nil);
                return;
            else
                if v36 ~= nil and tostring(v40.userId) == v36.user_id then
                    if v33.logout then
                        v33.logout();
                    end;
                    l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, "");
                    l_AppStorageService_0:Flush();
                    local v53 = not v41 and v50();
                    if v46 then
                        for _, v55 in ipairs(v34) do
                            if v53 or v55.user_id == v36.user_id then
                                l_updateLoginEntryData_0(v55.user_id, {
                                    showInAccountPicker = false
                                });
                            end;
                        end;
                        return;
                    end;
                else
                    l_DeleteAccount_0(v38, {
                        username = v36.username, 
                        user_id = v36.user_id, 
                        display_name = v36.display_name
                    }):andThen(function(_) --[[ Line: 151 ]]
                        -- upvalues: v16 (ref), v34 (ref), v36 (ref), v35 (ref), v33 (ref), v37 (ref), l_updateLoginEntryData_0 (ref)
                        local v58 = v16.List.filter(v34, function(v57) --[[ Line: 152 ]]
                            -- upvalues: v36 (ref)
                            return v57.user_id ~= v36.user_id;
                        end);
                        v35(v58);
                        if v33.onAccountsUpdated then
                            v33.onAccountsUpdated(v58);
                        end;
                        v37(nil);
                        l_updateLoginEntryData_0(v36.user_id, {
                            showInAccountPicker = false
                        });
                    end):catch(function(v59) --[[ Line: 164 ]]
                        warn(v59);
                    end);
                end;
                return;
            end;
        end;
    end;
    local function v61() --[[ Line: 171 ]]
        -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v37 (copy)
        if l_GetFFlagEnableAccountCarouselEvents_0() then
            l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerManageAccountsScreen, l_EventStreamConstants_0.Button.AccountPickerManageAccountsClosed, nil, nil);
        end;
        v37(nil);
    end;
    v2.useEffect(function() --[[ Line: 183 ]]
        -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
        if l_GetFFlagEnableAccountCarouselEvents_0() then
            l_authPageload_0(l_EventStreamConstants_0.Context.AccountPickerManageAccountsScreen);
        end;
    end, {});
    if not (l_GetFFlagEnableManageAccountsRedesign_0() and v46) then
        local v62 = l_useStyle_0();
        v2.useEffect(function() --[[ Line: 194 ]]
            -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
            if l_GetFFlagEnableAccountCarouselEvents_0() then
                l_authPageload_0(l_EventStreamConstants_0.Context.AccountPickerManageAccountsScreen);
            end;
        end, {});
        return v2.createElement(l_FullscreenPageWithSafeArea_0, {
            includeStatusBar = true, 
            BackgroundColor3 = v62.Theme.BackgroundDefault.Color
        }, {
            RemoveAccountDialog = v36 and v2.createElement(v11, {
                hideAllAccounts = false, 
                isCurrentUser = v36 ~= nil and tostring(v40.userId) == v36.user_id, 
                onRemove = v60, 
                onClose = v61
            }) or nil, 
            OuterContainer = v2.createElement(v3.View, {
                tag = "col auto-xy size-full-0", 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                TopBar = v2.createElement(v3.View, {
                    tag = "row size-full-0 auto-y items-center padding-x-small padding-bottom-large padding-top-medium"
                }, {
                    CloseButtonContainer = v2.createElement(v3.View, {
                        LayoutOrder = 0, 
                        tag = "col size-0 auto-xy padding-x-small", 
                        onActivated = v33.onClose
                    }, {
                        CloseButton = v2.createElement(v3.Icon, {
                            name = l_Enums_0.IconName.X, 
                            size = l_Enums_0.IconSize.Large, 
                            tag = "auto-xy"
                        })
                    }), 
                    Title = v2.createElement(v3.Text, {
                        LayoutOrder = 1, 
                        Text = v39.EditAccounts, 
                        tag = "fill auto-xy text-heading-small content-emphasis padding-right-small"
                    }), 
                    SpaceContainer = v2.createElement(v3.View, {
                        LayoutOrder = 2, 
                        tag = "col size-0 auto-xy padding-x-small"
                    }, {
                        Space = v2.createElement(v3.Icon, {
                            name = l_Enums_0.IconName.X, 
                            size = l_Enums_0.IconSize.Large, 
                            tag = "col size-0 auto-xy", 
                            Visible = false
                        })
                    })
                }), 
                EditAccountPickerList = v2.createElement(v7, {
                    onClose = v33.onClose, 
                    accounts = v34, 
                    setRemoveAccount = v37, 
                    enableSignedOutAccounts = v33.enableSignedOutAccounts
                })
            })
        });
    else
        return v2.createElement(v2.Fragment, nil, {
            Sheet = v2.createElement(l_Sheet_0.Root, {
                preferCenterSheet = true, 
                size = l_DialogSize_0.Medium, 
                onClose = v33.onClose, 
                snapPoints = {
                    1
                }
            }, {
                Header = v2.createElement(l_Sheet_0.Header, {
                    tag = "row size-full-0 auto-y items-center padding-x-small padding-bottom-large padding-top-medium", 
                    hasCloseAffordance = true
                }, {
                    Title = v2.createElement(v3.Text, {
                        LayoutOrder = 1, 
                        Text = v39.EditAccounts, 
                        tag = "fill auto-xy text-heading-small content-emphasis padding-x-small text-align-x-left"
                    })
                }), 
                Content = v2.createElement(l_Sheet_0.Content, nil, {
                    EditAccountPickerList = v2.createElement(v7, {
                        onClose = v33.onClose, 
                        accounts = v34, 
                        setRemoveAccount = v37, 
                        enableSignedOutAccounts = v33.enableSignedOutAccounts
                    })
                })
            }), 
            RemoveAccountDialog = v36 and v2.createElement(v11, {
                hideAllAccounts = not v41 and v50(), 
                isCurrentUser = v36 ~= nil and tostring(v40.userId) == v36.user_id, 
                onRemove = v60, 
                onClose = v61
            }) or nil
        });
    end;
end;