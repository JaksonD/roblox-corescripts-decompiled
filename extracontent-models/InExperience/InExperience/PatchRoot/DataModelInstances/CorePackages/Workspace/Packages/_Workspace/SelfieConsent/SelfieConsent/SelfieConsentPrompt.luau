local v0 = require(script.Parent.Parent.React);
local v1 = require(script.Parent.Parent.Localization);
local v2 = require(script.Parent.Parent.Foundation);
local v3 = require(script.Parent.Parent.LegallySensitiveContent);
local l_Button_0 = v2.Button;
local l_Dialog_0 = v2.Dialog;
local l_View_0 = v2.View;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_DialogSize_0 = v2.Enums.DialogSize;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_ConsentName_0 = v3.ConsentName;
local l_useLegallySensitiveContentAndActions_0 = v3.useLegallySensitiveContentAndActions;
local l_LinkingProtocol_0 = require(script.Parent.Parent.LinkingProtocol).LinkingProtocol;
local l_AvatarCreationService_0 = game:GetService("AvatarCreationService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_UserInputService_0 = game:GetService("UserInputService");
return function(v16) --[[ Line: 27 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useLegallySensitiveContentAndActions_0 (copy), l_ConsentName_0 (copy), v0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_UserInputService_0 (copy), l_BrowserService_0 (copy), l_LinkingProtocol_0 (copy), l_AvatarCreationService_0 (copy)
    local v17 = l_useLocalization_0({
        title = "AvatarGeneration.SelfieConsent.Title", 
        bodyText = "AvatarGeneration.SelfieConsent.BodyTextLink", 
        privacyLinkText = "AvatarGeneration.SelfieConsent.PrivacyLinkText", 
        agreeButton = "AvatarGeneration.SelfieConsent.AgreeButton", 
        cancelButton = "AvatarGeneration.SelfieConsent.CancelButton"
    });
    local _, v19 = l_useLegallySensitiveContentAndActions_0(l_ConsentName_0.PhotoToAvatar, "in-experience-photo-to-avatar-selfie-consent");
    return v0.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Large
    }, {
        DialogTitle = v0.createElement(l_Dialog_0.Title, {
            text = v17.title
        }), 
        DialogContent = v0.createElement(l_Dialog_0.Content, nil, {
            DialogView = v0.createElement(l_View_0, {
                tag = "col fill auto-xy items-start gap-medium"
            }, {
                DialogContentText = v0.createElement(l_Dialog_0.Text, {
                    Text = v17.bodyText
                }), 
                DialogFooter = v0.createElement(l_Button_0, {
                    text = v17.privacyLinkText, 
                    variant = l_ButtonVariant_0.Link, 
                    onActivated = function() --[[ Line: 55 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_UserInputService_0 (ref), l_BrowserService_0 (ref), l_LinkingProtocol_0 (ref)
                        if l_UserInputService_0:GetPlatform() == Enum.Platform.Android then
                            l_BrowserService_0:OpenBrowserWindow("https://en.help.roblox.com/hc/en-us/articles/115004630823-Roblox-Privacy-and-Cookie-Policy");
                            return;
                        else
                            l_LinkingProtocol_0.default:openURL("https://en.help.roblox.com/hc/en-us/articles/115004630823-Roblox-Privacy-and-Cookie-Policy");
                            return;
                        end;
                    end
                })
            })
        }), 
        DialogActions = v0.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            actions = {
                {
                    text = v17.agreeButton, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = function() --[[ Line: 72 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_AvatarCreationService_0 (ref), v16 (copy), v19 (copy)
                        l_AvatarCreationService_0:HandleSelfieConsentResult(true);
                        v16.displaySelfieConsent(false);
                        v19.grantOneTimeUserConsentWithAuditing(nil, {
                            privacyPolicyLink = "https://en.help.roblox.com/hc/en-us/articles/115004630823-Roblox-Privacy-and-Cookie-Policy"
                        });
                    end
                }, 
                {
                    text = v17.cancelButton, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = function() --[[ Line: 81 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_AvatarCreationService_0 (ref), v16 (copy)
                        l_AvatarCreationService_0:HandleSelfieConsentResult(false);
                        v16.displaySelfieConsent(false);
                    end
                }
            }
        })
    });
end;