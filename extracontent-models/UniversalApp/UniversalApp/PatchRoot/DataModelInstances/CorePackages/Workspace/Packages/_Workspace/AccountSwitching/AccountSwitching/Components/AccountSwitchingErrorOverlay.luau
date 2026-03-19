local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_React_0 = v2.React;
local l_useEffect_0 = l_React_0.useEffect;
local l_RoactRodux_0 = v2.RoactRodux;
local l_useLocalization_0 = v2.Localization.Hooks.useLocalization;
local l_CloseCentralOverlay_0 = v2.CentralOverlay.Thunks.CloseCentralOverlay;
local l_UIBlox_0 = v2.UIBlox;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Constants_0 = l_UIBlox_0.App.Style.Constants;
local v13 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v14 = require(l_Parent_0.Analytics.EventConstants);
local l_Foundation_0 = v2.Foundation;
local l_Dialog_0 = l_Foundation_0.Dialog;
local l_DialogSize_0 = l_Foundation_0.Enums.DialogSize;
local l_ButtonVariant_0 = l_Foundation_0.Enums.ButtonVariant;
local l_Orientation_0 = l_Foundation_0.Enums.Orientation;
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign;
local l_UiModeStyleProvider_0 = require(l_Parent_1.Style).UiModeStyleProvider;
local v22 = require(l_Parent_1.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_Parent_1.ExperimentLayers).AppBtidLayers;
local l_GetFFlagEnableAccountSwitcherRedesignIXP_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableAccountSwitcherRedesignIXP;
local v25 = game:DefineFastFlag("AccountSwitchingErrorOverlayForceDarkTheme2", false);
return (l_RoactRodux_0.connect(nil, function(v26) --[[ Line: 207 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 209 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v26 (copy), l_CloseCentralOverlay_0 (ref)
            return v26(l_CloseCentralOverlay_0());
        end
    };
end)(function(v27) --[[ Line: 47 ]]
    -- upvalues: l_GetFFlagEnableAccountSwitcherRedesignIXP_0 (copy), v22 (copy), l_AppBtidLayers_0 (copy), v13 (copy), v14 (copy), l_useLocalization_0 (copy), l_ButtonType_0 (copy), l_useEffect_0 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), l_React_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_Foundation_0 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy), l_withStyle_0 (copy), l_InteractiveAlert_0 (copy), v25 (copy), l_UiModeStyleProvider_0 (copy), l_Constants_0 (copy)
    local v29 = not l_GetFFlagEnableAccountSwitcherRedesignIXP_0() or v22.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AccountSwitcherLayer
    }, function(v28) --[[ Line: 51 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return (v28[l_AppBtidLayers_0.AccountSwitcherLayer] or {}).enableAccountSwitcherFoundationDesign == true;
    end);
    local v30 = false;
    if v27.primaryButtonTextKey ~= nil then
        v30 = false;
        if v27.primaryButtonTextKey ~= "" then
            v30 = v27.primaryButtonCallback ~= nil;
        end;
    end;
    local v31 = nil;
    if v30 then
        v31 = function() --[[ Line: 63 ]]
            -- upvalues: v13 (ref), v14 (ref), v27 (copy)
            v13.sendButtonClickEvent(v14.ctx.accountSwitcherConfirmation, v14.btn.primaryButton, v27.errorType);
            v27.primaryButtonCallback();
        end;
    end;
    local v32 = false;
    if v27.secondaryButtonTextKey ~= nil then
        v32 = false;
        if v27.secondaryButtonTextKey ~= "" then
            v32 = v27.secondaryButtonCallback ~= nil;
        end;
    end;
    local v33 = nil;
    if v32 then
        v33 = function() --[[ Line: 79 ]]
            -- upvalues: v13 (ref), v14 (ref), v27 (copy)
            v13.sendButtonClickEvent(v14.ctx.accountSwitcherConfirmation, v14.btn.secondaryButton, v27.errorType);
            v27.secondaryButtonCallback();
        end;
    end;
    local v34 = l_useLocalization_0({
        titleText = v27.titleTextKey, 
        bodyTextKey = v27.bodyTextKey, 
        primaryButtonTextKey = v27.primaryButtonTextKey, 
        secondaryButtonTextKey = v27.secondaryButtonTextKey
    });
    local l_bodyTextKey_0 = v34.bodyTextKey;
    if v27.bodyUsername then
        l_bodyTextKey_0 = string.gsub(l_bodyTextKey_0, "{username}", v27.bodyUsername);
    end;
    local v36 = {};
    if v32 then
        table.insert(v36, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                text = v34.secondaryButtonTextKey, 
                onActivated = v33
            }
        });
    end;
    if v30 then
        table.insert(v36, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                text = v34.primaryButtonTextKey, 
                onActivated = v31
            }
        });
    end;
    l_useEffect_0(function() --[[ Line: 122 ]]
        -- upvalues: v13 (ref), v14 (ref), v27 (copy)
        v13.sendModalShownEvent(v14.ctx.accountSwitcherConfirmation, v27.errorType);
    end, {});
    local v37 = nil;
    v37 = if l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and v29 then l_React_0.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small, 
        hasBackdrop = true, 
        closeOnClickOutside = true, 
        onClose = function() --[[ Line: 132 ]] --[[ Name: onClose ]]
            -- upvalues: v27 (copy)
            v27.closeCentralOverlay();
        end
    }, {
        DialogTitle = l_React_0.createElement(l_Dialog_0.Title, {
            text = v34.titleText
        }), 
        DialogContent = l_React_0.createElement(l_Dialog_0.Content, nil, {
            DialogView = l_React_0.createElement(l_Foundation_0.View, {
                tag = "col fill auto-xy items-start"
            }, {
                DialogText = l_React_0.createElement(l_Dialog_0.Text, {
                    Text = l_bodyTextKey_0, 
                    LayoutOrder = 1
                })
            })
        }), 
        DialogActions = l_React_0.createElement(l_Dialog_0.Actions, {
            orientation = l_Orientation_0.Vertical, 
            actions = {
                v30 and {
                    text = v34.primaryButtonTextKey, 
                    variant = l_ButtonVariant_0.Alert, 
                    onActivated = v31
                } or nil, 
                v32 and {
                    text = v34.secondaryButtonTextKey, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v33
                } or nil
            }
        })
    }) else l_withStyle_0(function(v38) --[[ Line: 166 ]]
        -- upvalues: l_React_0 (ref), v27 (copy), l_InteractiveAlert_0 (ref), v34 (copy), v36 (copy)
        return l_React_0.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = v38.Theme.Overlay.Color, 
            AutoButtonColor = false, 
            BackgroundTransparency = v38.Theme.Overlay.Transparency, 
            Visible = true, 
            [l_React_0.Event.Activated] = function() --[[ Line: 174 ]]
                -- upvalues: v27 (ref)
                v27.closeCentralOverlay();
            end
        }, {
            Alert = l_React_0.createElement(l_InteractiveAlert_0, {
                title = v34.titleText, 
                bodyText = v34.bodyTextKey, 
                buttonStackInfo = {
                    buttons = v36
                }, 
                position = UDim2.fromScale(0.5, 0.5), 
                screenSize = Vector2.new(400, nil)
            })
        });
    end);
    if v25 and v27.forceDarkTheme then
        return l_React_0.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }, {
            Child = v37
        });
    else
        return v37;
    end;
end));