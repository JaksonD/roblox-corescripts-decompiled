local l_WebViewService_0 = game:GetService("WebViewService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.Foundation);
local v7 = require(l_Parent_1.Localization);
local l_Dialog_0 = v6.Dialog;
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_useTokens_0 = v6.Hooks.useTokens;
local v12 = require(l_Parent_0.AdDisclosureTelemetry);
local l_FStringLuaAppAdPreferencesUrl_0 = require(l_Parent_1.SharedFlags).FStringLuaAppAdPreferencesUrl;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_useLocalization_0 = v7.Hooks.useLocalization;
return v5.memo(function(v16) --[[ Line: 26 ]] --[[ Name: WhyThisAdModal ]]
    -- upvalues: l_useLocalization_0 (copy), l_useTokens_0 (copy), v5 (copy), l_Dialog_0 (copy), l_View_0 (copy), l_Text_0 (copy), v12 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_WebViewService_0 (copy), l_FStringLuaAppAdPreferencesUrl_0 (copy), l_HttpService_0 (copy), l_BrowserService_0 (copy)
    local v17 = l_useLocalization_0({
        whyThisAd = "Feature.GameDetails.Label.WhyThisAd", 
        adPreferences = "Feature.GameDetails.Message.AdPreferences"
    });
    local v18 = l_useTokens_0();
    return v5.createElement(l_Dialog_0.Root, {
        onClose = v16.onClose, 
        hasBackdrop = true, 
        disablePortal = false
    }, {
        DialogTitle = v5.createElement(l_Dialog_0.Title, {
            text = v17.whyThisAd
        }), 
        DialogContent = v5.createElement(l_Dialog_0.Content, {}, {
            ContentView = v5.createElement(l_View_0, {
                tag = "col auto-xy gap-small"
            }, {
                DialogText = v5.createElement(l_Dialog_0.Text, {
                    Text = v16.adDisclosureBody, 
                    LayoutOrder = 1
                }), 
                AdPreferences = if v16.showAdPreferencesUrl then v5.createElement(l_Text_0, {
                    Text = v17.adPreferences, 
                    textStyle = v18.Color.Content.Link, 
                    fontStyle = v18.Typography.BodyMedium, 
                    tag = "auto-xy", 
                    onActivated = function() --[[ Line: 57 ]] --[[ Name: onActivated ]]
                        -- upvalues: v12 (ref), l_GetFFlagEnableUnifiedWebViews_0 (ref), l_WebViewService_0 (ref), l_FStringLuaAppAdPreferencesUrl_0 (ref), v17 (copy), l_HttpService_0 (ref), l_BrowserService_0 (ref)
                        v12.logAdPreferencesLinkClicked();
                        if l_GetFFlagEnableUnifiedWebViews_0() then
                            local v19 = nil;
                            v19 = l_WebViewService_0.OnWindowClosed:Connect(function() --[[ Line: 62 ]]
                                -- upvalues: l_WebViewService_0 (ref), v19 (ref)
                                l_WebViewService_0:CloseWindow();
                                if v19 then
                                    v19:Disconnect();
                                    v19 = nil;
                                end;
                            end);
                            l_WebViewService_0:OpenWindow(l_FStringLuaAppAdPreferencesUrl_0, v17.adPreferences, true);
                            return;
                        else
                            local v20 = l_HttpService_0:JSONEncode({
                                command = "open", 
                                url = l_FStringLuaAppAdPreferencesUrl_0, 
                                title = v17.adPreferences, 
                                visible = true, 
                                isGenericWebview = true
                            });
                            l_BrowserService_0:SendCommand(v20);
                            return;
                        end;
                    end, 
                    LayoutOrder = 2
                }) else nil
            })
        })
    });
end);