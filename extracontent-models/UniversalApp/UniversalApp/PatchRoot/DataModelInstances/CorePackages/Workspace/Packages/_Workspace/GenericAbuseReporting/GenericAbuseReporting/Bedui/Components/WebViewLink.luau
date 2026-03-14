local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.React);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_Button_0 = v5.Button;
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_View_0 = v5.View;
local l_NotificationType_0 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes).NotificationType;
local l_FFlagChangeWebViewReportButtonToText_0 = require(l_Parent_0.SharedFlags).FFlagChangeWebViewReportButtonToText;
return v6.memo(function(v14) --[[ Line: 28 ]]
    -- upvalues: l_FFlagChangeWebViewReportButtonToText_0 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_useAppPolicy_0 (copy), v6 (copy), l_HttpService_0 (copy), l_GuiService_0 (copy), l_NotificationType_0 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy)
    local v15 = nil;
    local v16 = nil;
    if l_FFlagChangeWebViewReportButtonToText_0 then
        v15 = l_useRoactService_0(l_AppLinking_0);
        v16 = l_useAppPolicy_0(function(v17) --[[ Line: 33 ]]
            return v17.getWebViewSupport();
        end);
    else
        v16 = true;
    end;
    local v20 = v6.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: l_FFlagChangeWebViewReportButtonToText_0 (ref), v16 (ref), v15 (ref), v14 (copy), l_HttpService_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref)
        if l_FFlagChangeWebViewReportButtonToText_0 and not v16 then
            v15:openURL(v14.component.link.url);
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 44 ]]
                -- upvalues: l_HttpService_0 (ref), v14 (ref)
                return l_HttpService_0:JSONEncode({
                    title = v14.component.link.label, 
                    presentationStyle = nil, 
                    visible = true, 
                    url = v14.component.link.url
                });
            end);
            if not l_status_0 then
                warn("Failed to encode notification data for bedui webview link");
                return;
            else
                l_GuiService_0:BroadcastNotification(l_result_0, l_NotificationType_0.OpenCustomWebView);
                return;
            end;
        end;
    end, {
        v14.component.link.label, 
        v14.component.link.url
    });
    return v6.createElement(l_View_0, {
        tag = "size-full-0 auto-y", 
        LayoutOrder = v14.layoutOrder
    }, v6.createElement(l_Button_0, {
        text = v14.component.link.linkButtonLabel, 
        variant = l_ButtonVariant_0.Text, 
        onActivated = v20
    }));
end);