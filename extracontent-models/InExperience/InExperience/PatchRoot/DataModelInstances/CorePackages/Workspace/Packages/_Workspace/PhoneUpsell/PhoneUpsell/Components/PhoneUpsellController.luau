local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactRoblox);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_Images_0 = v10.App.ImageSet.Images;
local l_Toast_0 = v10.App.Dialog.Toast;
local l_GetFFlagNotificationModalSetMenuIsOpen_0 = require(l_Parent_0.SharedFlags).GetFFlagNotificationModalSetMenuIsOpen;
local l_OpenModal_0 = require(l_Parent_0.NotificationModalsManager).OpenModal;
local l_CloseModal_0 = require(l_Parent_0.NotificationModalsManager).CloseModal;
local l_InExperienceProviderContainer_0 = require(l_Parent_0.InExperienceContainer).InExperienceProviderContainer;
local v18 = require(l_script_FirstAncestor_0.Components.InGame.InGameUpsellContainer);
local v19 = nil;
local function v23(v20) --[[ Line: 29 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), v4 (copy), l_Toast_0 (copy), l_Images_0 (copy)
    local v21 = l_useLocalization_0({
        titleKey = "Feature.VerificationUpsell.Heading.PhoneNumberVerified"
    });
    local v22 = l_useStyle_0();
    return v4.createElement(v4.Fragment, {}, {
        PhoneToast = v4.createElement(l_Toast_0, {
            toastContent = {
                iconColorStyle = {
                    Color = v22.Tokens.Global.Color.Green.Color3, 
                    Transparency = 0
                }, 
                iconImage = l_Images_0["icons/status/success_large"], 
                toastTitle = v21.titleKey, 
                onDismissed = v20.onDismissed
            }, 
            duration = 3
        })
    });
end;
return {
    openPhoneUpsell = function(v24) --[[ Line: 54 ]]
        -- upvalues: v19 (ref), v5 (copy), l_OpenModal_0 (copy), l_InExperienceProviderContainer_0 (copy), v4 (copy), v18 (copy), v3 (copy), l_CloseModal_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v23 (copy), l_GetFFlagNotificationModalSetMenuIsOpen_0 (copy)
        if v19 == nil then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "PhoneUpsellToasts";
            l_Folder_0.Parent = game:GetService("CoreGui");
            v19 = v5.createRoot(l_Folder_0);
        end;
        l_OpenModal_0("PHONE_UPSELL_KEY", l_InExperienceProviderContainer_0, {
            Props = {
                children = v4.createElement(v18, v3.Dictionary.join(v24, {
                    closeUpsell = function() --[[ Line: 66 ]] --[[ Name: closeUpsell ]]
                        -- upvalues: l_CloseModal_0 (ref), v24 (copy)
                        l_CloseModal_0("PHONE_UPSELL_KEY");
                        if v24.closeUpsell then
                            v24.closeUpsell();
                        end;
                    end, 
                    onSuccess = function() --[[ Line: 72 ]] --[[ Name: onSuccess ]]
                        -- upvalues: l_CloseModal_0 (ref), v24 (copy), v19 (ref), v4 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), l_LocalizationService_0 (ref), l_StyleProviderWithDefaultTheme_0 (ref), v23 (ref)
                        l_CloseModal_0("PHONE_UPSELL_KEY");
                        if v24.onSuccessBeforeToast then
                            v24.onSuccessBeforeToast();
                        end;
                        v19:render(v4.createElement("ScreenGui", {
                            IgnoreGuiInset = true, 
                            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                            ResetOnSpawn = false, 
                            DisplayOrder = 0, 
                            Enabled = true
                        }, {
                            ContainerFrame = v4.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, 0, 1, 0)
                            }, {
                                LocalizationProvider = v4.createElement(l_LocalizationProvider_0, {
                                    localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
                                }, {
                                    StyleProvider = v4.createElement(l_StyleProviderWithDefaultTheme_0, {}, {
                                        Frame = v4.createElement("Frame", {
                                            BackgroundTransparency = 1, 
                                            Size = UDim2.new(1, 0, 1, 0)
                                        }, {
                                            Toast = v4.createElement(v23, {
                                                onDismissed = function() --[[ Line: 97 ]] --[[ Name: onDismissed ]]
                                                    -- upvalues: v24 (ref), v19 (ref)
                                                    if v24.onSuccess then
                                                        v24.onSuccess();
                                                    end;
                                                    v19:unmount();
                                                end
                                            }, {})
                                        })
                                    })
                                })
                            })
                        }));
                    end
                }))
            }, 
            DisableBackgroundDismiss = true, 
            BlockNonCoreUserInput = l_GetFFlagNotificationModalSetMenuIsOpen_0()
        });
    end
};