local l_Parent_0 = script:FindFirstAncestor("GenericChallenges").Parent;
local v1 = require(l_Parent_0.React);
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v6 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v6.Dialog;
local l_DialogSize_0 = v6.Enums.DialogSize;
local l_View_0 = v6.View;
local l_Button_0 = v6.Button;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_InputSize_0 = v6.Enums.InputSize;
local l_FillBehavior_0 = v6.Enums.FillBehavior;
local l_Loading_0 = v6.Loading;
local l_Text_0 = v6.Text;
local v16 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v16.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v16.FocusNavigableSurfaceIdentifierEnum;
return function(v19) --[[ Line: 35 ]] --[[ Name: PersonaLivenessHosted ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppLinking_0 (copy), v1 (copy), l_useLocalization_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), l_Loading_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_FillBehavior_0 (copy)
    local l_webLink_0 = v19.webLink;
    local l_onCancel_0 = v19.onCancel;
    local l_sessionId_0 = v19.sessionId;
    local v23 = l_useRoactService_0(l_AppLinking_0);
    local v24, v25 = v1.useState(false);
    local v26 = v1.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v25 (copy), v23 (copy), l_webLink_0 (copy)
        v25(true);
        v23:openURL(l_webLink_0);
    end, {
        v23, 
        l_webLink_0, 
        l_sessionId_0
    });
    local v27 = v1.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: l_onCancel_0 (copy)
        l_onCancel_0();
    end, {
        l_onCancel_0, 
        l_sessionId_0
    });
    local v28 = l_useLocalization_0({
        title = "Feature.BiometricChallenge.Title.ConfirmHuman", 
        bodyText = "Feature.BiometricChallenge.Content.LivenessHostedPrompt", 
        loadingText = "Feature.BiometricChallenge.Content.Loading", 
        continueButton = "Feature.BiometricChallenge.Action.Continue", 
        cancelButton = "Feature.BiometricChallenge.Action.Cancel"
    });
    return v1.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = 200, 
        IgnoreGuiInset = true
    }, {
        Overlay = v1.createElement(l_FullscreenPageWithSafeArea_0, {
            includeStatusBar = false
        }, {
            FocusNavigableSurface = v1.createElement(l_FocusNavigableSurfaceWrapper_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.ModerationOverlay, 
                isIsolated = true
            }, {
                Dialog = v1.createElement(l_Dialog_0.Root, {
                    size = l_DialogSize_0.Medium, 
                    hasBackdrop = true
                }, {
                    DialogTitle = not v24 and v1.createElement(l_Dialog_0.Title, {
                        text = v28.title, 
                        LayoutOrder = 1
                    }), 
                    DialogContent = v1.createElement(l_Dialog_0.Content, nil, {
                        DialogView = v1.createElement(l_View_0, {
                            tag = "col fill auto-xy items-center gap-medium"
                        }, {
                            Loading = v24 and v1.createElement(l_View_0, {
                                LayoutOrder = 1, 
                                tag = "auto-xy margin-top-medium"
                            }, {
                                v1.createElement(l_Loading_0, {})
                            }), 
                            DialogBody = v24 and v1.createElement(l_Text_0, {
                                Text = v28.loadingText, 
                                LayoutOrder = 2, 
                                tag = "text-wrap auto-y size-full-0 text-body-medium"
                            }) or v1.createElement(l_Dialog_0.Text, {
                                Text = v28.bodyText, 
                                LayoutOrder = 2
                            }), 
                            DialogFooter = v1.createElement(l_View_0, {
                                tag = "row size-full-0 auto-y gap-small", 
                                LayoutOrder = 3
                            }, {
                                CancelButton = v1.createElement(l_Button_0, {
                                    variant = l_ButtonVariant_0.Standard, 
                                    size = l_InputSize_0.Medium, 
                                    text = v28.cancelButton, 
                                    fillBehavior = l_FillBehavior_0.Fill, 
                                    onActivated = v27, 
                                    LayoutOrder = 1
                                }), 
                                ContinueButton = not v24 and v1.createElement(l_Button_0, {
                                    variant = l_ButtonVariant_0.Emphasis, 
                                    size = l_InputSize_0.Medium, 
                                    text = v28.continueButton, 
                                    fillBehavior = l_FillBehavior_0.Fill, 
                                    onActivated = v26, 
                                    icon = "icons/navigation/externallink_medium", 
                                    LayoutOrder = 2
                                })
                            })
                        })
                    })
                })
            })
        })
    });
end;