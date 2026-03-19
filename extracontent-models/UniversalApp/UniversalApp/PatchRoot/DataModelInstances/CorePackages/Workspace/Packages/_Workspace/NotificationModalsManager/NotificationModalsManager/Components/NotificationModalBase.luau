local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactRoblox);
local v6 = require(l_Parent_0.ReactOtter);
local l_useState_0 = v4.useState;
local l_useEffect_0 = v4.useEffect;
local l_useMemo_0 = v4.useMemo;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_SettingsShowSignal_0 = require(l_Parent_0.CoreScriptsCommon).SettingsShowSignal;
local v14 = require(script.Parent.Parent.Flags.GetFFlagManagerAddDisplayOrderAndBackgroundDismiss);
local l_GetFFlagEnablePushNotificationsUpsellModal_0 = require(l_Parent_0.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal;
local l_GetFFlagNotificationModalSetMenuIsOpen_0 = require(l_Parent_0.SharedFlags).GetFFlagNotificationModalSetMenuIsOpen;
local v17 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1
};
return function(v18) --[[ Line: 46 ]]
    -- upvalues: l_useState_0 (copy), l_GuiService_0 (copy), l_useEffect_0 (copy), l_GetFFlagNotificationModalSetMenuIsOpen_0 (copy), l_SettingsShowSignal_0 (copy), v6 (copy), l_UserInputService_0 (copy), l_useMemo_0 (copy), v17 (copy), v4 (copy), v14 (copy), v5 (copy), l_LocalizationProvider_0 (copy), l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy)
    local v19, v20 = l_useState_0({});
    local v21, v22 = l_useState_0(l_GuiService_0.MenuIsOpen);
    l_useEffect_0(function() --[[ Line: 54 ]]
        -- upvalues: l_GetFFlagNotificationModalSetMenuIsOpen_0 (ref), l_SettingsShowSignal_0 (ref), v18 (copy), v22 (copy), l_GuiService_0 (ref)
        local v23 = nil;
        v23 = if l_GetFFlagNotificationModalSetMenuIsOpen_0() then l_SettingsShowSignal_0:connect(function(v24) --[[ Line: 57 ]]
            -- upvalues: v18 (ref), v22 (ref)
            if v24 then
                if v18.CloseModal then
                    v18.CloseModal();
                end;
                v22(true);
                return;
            else
                v22(false);
                return;
            end;
        end) else l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 68 ]]
            -- upvalues: v18 (ref), v22 (ref)
            if v18.CloseModal then
                v18.CloseModal();
            end;
            v22(true);
        end);
        local v25 = if l_GetFFlagNotificationModalSetMenuIsOpen_0() then nil else l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 77 ]]
            -- upvalues: v22 (ref)
            v22(false);
        end);
        return function() --[[ Line: 81 ]]
            -- upvalues: l_GetFFlagNotificationModalSetMenuIsOpen_0 (ref), v23 (ref), v25 (copy)
            if l_GetFFlagNotificationModalSetMenuIsOpen_0() then
                v23:disconnect();
                return;
            else
                v23:Disconnect();
                if v25 ~= nil then
                    v25:Disconnect();
                end;
                return;
            end;
        end;
    end, {});
    local v26, v27 = v6.useAnimatedBinding(0, function() --[[ Line: 93 ]]
        -- upvalues: v19 (copy), v18 (copy), v20 (copy)
        if v19 ~= v18 then
            v20(v18);
        end;
    end);
    l_useEffect_0(function() --[[ Line: 102 ]]
        -- upvalues: v18 (copy), v20 (copy), l_UserInputService_0 (ref)
        local v28 = nil;
        if v18.ModalKey then
            v20(v18);
            v28 = l_UserInputService_0.InputBegan:Connect(function(v29) --[[ Line: 112 ]]
                -- upvalues: l_UserInputService_0 (ref), v18 (ref)
                if (v29.KeyCode == Enum.KeyCode.Backspace or v29.KeyCode == Enum.KeyCode.ButtonB) and l_UserInputService_0:GetFocusedTextBox() == nil and v18.CloseModal then
                    v18.CloseModal();
                end;
            end);
        end;
        return function() --[[ Line: 123 ]]
            -- upvalues: v28 (ref)
            if v28 then
                v28:Disconnect();
            end;
        end;
    end, {
        v18
    });
    local v30 = l_useMemo_0(function() --[[ Line: 130 ]]
        -- upvalues: v18 (copy), v21 (copy)
        if v18.ModalKey ~= nil and not v21 then
            return 1;
        else
            return 0;
        end;
    end, {
        v18.ModalKey, 
        v21
    });
    l_useEffect_0(function() --[[ Line: 134 ]]
        -- upvalues: v27 (copy), v6 (ref), v30 (copy), v17 (ref), l_GetFFlagNotificationModalSetMenuIsOpen_0 (ref), v18 (copy), l_GuiService_0 (ref)
        v27(v6.spring(v30, v17));
        if l_GetFFlagNotificationModalSetMenuIsOpen_0() then
            if v18.Params and v18.Params.BlockNonCoreUserInput and v30 == 1 then
                l_GuiService_0:SetMenuIsOpen(true, "NotificationModal");
                return;
            else
                l_GuiService_0:SetMenuIsOpen(false, "NotificationModal");
            end;
        end;
    end, {
        v30
    });
    return v4.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        ResetOnSpawn = false, 
        DisplayOrder = if v14() then v19.Params and v19.Params.DisplayOrder or 0 else 0, 
        Enabled = v26:map(function(v31) --[[ Line: 152 ]]
            return v31 > 0;
        end)
    }, {
        Background = v4.createElement("Frame", {
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 1, 
            BackgroundTransparency = v26:map(function(v32) --[[ Line: 160 ]]
                return 1 - v32 * 0.5;
            end), 
            ZIndex = 0
        }), 
        Container = v4.createElement("TextButton", {
            ZIndex = 1, 
            Text = "", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Modal = true, 
            Selectable = false, 
            Position = v26:map(function(v33) --[[ Line: 173 ]]
                return UDim2.new(0, 0, 1 - v33, 0);
            end), 
            [v5.Event.Activated] = function() --[[ Line: 178 ]]
                -- upvalues: v14 (ref), v19 (copy), v18 (copy)
                local v34 = if v14() then v19.Params and v19.Params.DisableBackgroundDismiss else nil;
                if v18.CloseModal and not v34 then
                    v18.CloseModal();
                end;
            end
        }, {
            LocalizationProvider = v4.createElement(l_LocalizationProvider_0, {
                localization = if l_GetFFlagEnablePushNotificationsUpsellModal_0() then v19.Params and v19.Params.Localization or l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId) else l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                StyleProvider = v4.createElement(l_StyleProviderWithDefaultTheme_0, {}, {
                    ModalComponent = if v19.Component then v4.createElement(v19.Component, v19.Params and v19.Params.Props or {}) else nil
                })
            })
        })
    });
end;