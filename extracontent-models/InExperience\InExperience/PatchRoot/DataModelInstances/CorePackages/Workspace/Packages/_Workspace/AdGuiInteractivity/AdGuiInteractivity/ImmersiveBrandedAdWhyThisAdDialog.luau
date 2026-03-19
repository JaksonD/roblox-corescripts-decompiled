local l_Parent_0 = script:FindFirstAncestor("AdGuiInteractivity").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.LinkingProtocol);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local l_default_0 = v2.LinkingProtocol.default;
local l_Dialog_0 = v3.Dialog;
local l_View_0 = v3.View;
local l_Button_0 = v3.Button;
local l_DialogSize_0 = v3.Enums.DialogSize;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_InputSize_0 = v3.Enums.InputSize;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local v13 = game:DefineFastString("ImmersiveBrandedAdsLearnMoreUrl", "www.roblox.com");
return function(v14) --[[ Line: 25 ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_default_0 (copy), v13 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v15 = v14.advertiserName or "";
    local v16 = l_useLocalization_0({
        WhyThisAdText = "CoreScripts.Ads.Label.WhyThisAd", 
        CloseButtonText = "CoreScripts.Ads.Action.Close", 
        DynamicAdvertiserBodyText = {
            "CoreScripts.Ads.Label.InExperienceDisclosureDynamic"; 
            AdvertiserName = v15
        }, 
        StaticBodyText = "CoreScripts.Ads.Label.InExperienceDisclosureStatic", 
        LearnMoreLinkText = "InGame.CommonUI.Badge.Popup.LearnMoreLink"
    });
    local l_StaticBodyText_0 = v16.StaticBodyText;
    if v15 ~= "" then
        l_StaticBodyText_0 = v16.DynamicAdvertiserBodyText;
    end;
    local v19 = v1.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: l_default_0 (ref), v13 (ref), v14 (copy)
        l_default_0:openURL(v13):catch(function(_) --[[ Line: 45 ]]
            -- upvalues: v14 (ref)
            v14.onDismiss();
        end);
    end, {
        v14.onDismiss
    });
    local v21 = v1.useCallback(function(_) --[[ Line: 50 ]]
        -- upvalues: v14 (copy)
        v14.onDismiss();
    end, {
        v14.onDismiss
    });
    return v1.createElement(v1.Fragment, nil, {
        dialog = v1.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Small, 
            onClose = v21
        }, {
            dialogTitle = v1.createElement(l_Dialog_0.Title, {
                text = v16.WhyThisAdText
            }), 
            dialogContent = v1.createElement(l_Dialog_0.Content, nil, {
                content = v1.createElement(l_View_0, {
                    tag = "col size-full-0 auto-y gap-small"
                }, {
                    dialogText = v1.createElement(l_Dialog_0.Text, {
                        LayoutOrder = 1, 
                        Text = l_StaticBodyText_0
                    }), 
                    link = v1.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        text = v16.LearnMoreLinkText, 
                        variant = l_ButtonVariant_0.Link, 
                        onActivated = v19, 
                        icon = "icons/navigation/externallink", 
                        size = l_InputSize_0.Small
                    })
                })
            }), 
            dialogActions = v1.createElement(l_Dialog_0.Actions, {
                actions = {
                    {
                        text = v16.CloseButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v14.onDismiss
                    }
                }
            })
        }), 
        modal = v1.createElement("TextButton", {
            Text = "", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 0, 0, 0), 
            Modal = true
        })
    });
end;