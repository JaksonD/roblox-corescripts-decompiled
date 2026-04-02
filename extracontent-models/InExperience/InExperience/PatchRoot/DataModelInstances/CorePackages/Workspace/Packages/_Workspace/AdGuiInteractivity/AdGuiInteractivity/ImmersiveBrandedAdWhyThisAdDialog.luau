local l_HttpService_0 = game:GetService("HttpService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AdGuiInteractivity");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.LinkingProtocol);
local v6 = require(l_Parent_0.Foundation);
local v7 = require(l_Parent_0.Localization);
local v8 = require(l_script_FirstAncestor_0.Flags);
local v9 = require(l_script_FirstAncestor_0.AdsInteractivityTelemetry);
local l_default_0 = v5.LinkingProtocol.default;
local l_Dialog_0 = v6.Dialog;
local l_View_0 = v6.View;
local l_Button_0 = v6.Button;
local l_DialogSize_0 = v6.Enums.DialogSize;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_InputSize_0 = v6.Enums.InputSize;
local l_useLocalization_0 = v7.Hooks.useLocalization;
local v18 = game:DefineFastFlag("UseImmersiveBrandedAdWhyThisAdTranslation", false);
local v19 = game:DefineFastString("ImmersiveBrandedAdsLearnMoreUrl", "www.roblox.com");
return function(v20) --[[ Line: 33 ]]
    -- upvalues: l_useLocalization_0 (copy), v18 (copy), v4 (copy), v8 (copy), l_BrowserService_0 (copy), l_HttpService_0 (copy), v19 (copy), l_default_0 (copy), v9 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v21 = v20.advertiserName or "";
    local v22 = l_useLocalization_0({
        WhyThisAdText = "CoreScripts.Ads.Label.WhyThisAd", 
        CloseButtonText = "CoreScripts.Ads.Action.Close", 
        DynamicAdvertiserBodyText = {
            v18 and "CoreScripts.Ads.ImmersiveBrandedAds.WhyThisAd" or "CoreScripts.Ads.Label.InExperienceDisclosureDynamic"; 
            AdvertiserName = v21
        }, 
        StaticBodyText = "CoreScripts.Ads.Label.InExperienceDisclosureStatic", 
        LearnMoreLinkText = "InGame.CommonUI.Badge.Popup.LearnMoreLink"
    });
    local l_StaticBodyText_0 = v22.StaticBodyText;
    if v21 ~= "" then
        l_StaticBodyText_0 = v22.DynamicAdvertiserBodyText;
    end;
    local v25 = v4.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: v8 (ref), l_BrowserService_0 (ref), l_HttpService_0 (ref), v19 (ref), l_default_0 (ref), v9 (ref), v20 (copy)
        if v8.FFlagUseWebviewsForImmersiveBrandedAdLinks then
            l_BrowserService_0:SendCommand(l_HttpService_0:JSONEncode({
                command = "open", 
                url = v19, 
                visible = true, 
                isGenericWebview = true
            }));
            return;
        else
            l_default_0:openURL(v19):catch(function(_) --[[ Line: 63 ]]
                -- upvalues: v8 (ref), v9 (ref), v20 (ref)
                if v8.FFlagSendImmersiveBrandedAdLinkingFailureTelemetry then
                    v9.logImmersiveBrandedAdLinkingFailedCounter("whyThisAd.learnMore");
                end;
                v20.onDismiss();
            end);
            return;
        end;
    end, {
        v20.onDismiss
    });
    local v27 = v4.useCallback(function(_) --[[ Line: 72 ]]
        -- upvalues: v20 (copy)
        v20.onDismiss();
    end, {
        v20.onDismiss
    });
    return v4.createElement(v4.Fragment, nil, {
        dialog = v4.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Small, 
            onClose = v27
        }, {
            dialogTitle = v4.createElement(l_Dialog_0.Title, {
                text = v22.WhyThisAdText
            }), 
            dialogContent = v4.createElement(l_Dialog_0.Content, nil, {
                content = v4.createElement(l_View_0, {
                    tag = "col size-full-0 auto-y gap-small"
                }, {
                    dialogText = v4.createElement(l_Dialog_0.Text, {
                        LayoutOrder = 1, 
                        Text = l_StaticBodyText_0
                    }), 
                    link = v4.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        text = v22.LearnMoreLinkText, 
                        variant = l_ButtonVariant_0.Link, 
                        onActivated = v25, 
                        icon = "icons/navigation/externallink", 
                        size = l_InputSize_0.Small
                    })
                })
            }), 
            dialogActions = v4.createElement(l_Dialog_0.Actions, {
                actions = {
                    {
                        text = v22.CloseButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v20.onDismiss
                    }
                }
            })
        }), 
        modal = v4.createElement("TextButton", {
            Text = "", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 0, 0, 0), 
            Modal = true
        })
    });
end;