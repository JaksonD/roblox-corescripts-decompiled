local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.React);
local l_Button_0 = v4.Button;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local v10 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local v11 = require(l_script_FirstAncestor_0.Bedui.Utils.createTextWithLinks);
local l_NotificationType_0 = v10.NotificationType;
local v13 = require(l_script_FirstAncestor_0.Bedui.Components.WebViewLink);
local l_FFlagChangeWebViewReportButtonToText_0 = require(l_Parent_0.SharedFlags).FFlagChangeWebViewReportButtonToText;
return v5.memo(function(v15) --[[ Line: 28 ]] --[[ Name: Paragraph ]]
    -- upvalues: v5 (copy), v11 (copy), l_FFlagChangeWebViewReportButtonToText_0 (copy), v13 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_HttpService_0 (copy), l_GuiService_0 (copy), l_NotificationType_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v16 = v5.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v11 (ref), v15 (copy)
        return v11(v15.component.paragraph.text, v15.component.paragraph.links);
    end, {
        v15.component.paragraph.text, 
        v15.component.paragraph.links
    });
    local v22 = v5.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: v15 (copy), l_FFlagChangeWebViewReportButtonToText_0 (ref), v5 (ref), v13 (ref), l_Button_0 (ref), l_ButtonVariant_0 (ref), l_HttpService_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref)
        if not v15.component.paragraph.links then
            return {};
        else
            local v17 = {};
            for _, v19 in v15.component.paragraph.links do
                if l_FFlagChangeWebViewReportButtonToText_0 then
                    table.insert(v17, v5.createElement(v13, {
                        component = {
                            componentType = "link", 
                            isOptional = true, 
                            formDataKey = nil, 
                            link = v19
                        }
                    }));
                else
                    table.insert(v17, v5.createElement(l_Button_0, {
                        text = v19.linkButtonLabel, 
                        variant = l_ButtonVariant_0.Text, 
                        onActivated = function() --[[ Line: 62 ]] --[[ Name: onActivated ]]
                            -- upvalues: l_HttpService_0 (ref), v19 (copy), l_GuiService_0 (ref), l_NotificationType_0 (ref)
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 63 ]]
                                -- upvalues: l_HttpService_0 (ref), v19 (ref)
                                return l_HttpService_0:JSONEncode({
                                    title = v19.label, 
                                    presentationStyle = nil, 
                                    visible = true, 
                                    url = v19.url
                                });
                            end);
                            if not l_status_0 then
                                warn("Failed to encode notification data for bedui paragraph");
                                return;
                            else
                                l_GuiService_0:BroadcastNotification(l_result_0, l_NotificationType_0.OpenCustomWebView);
                                return;
                            end;
                        end
                    }));
                end;
            end;
            return v17;
        end;
    end, {
        v15.component
    });
    return v5.createElement(l_View_0, {
        tag = "size-full-0 auto-y col", 
        LayoutOrder = v15.layoutOrder
    }, {
        Text = v5.createElement(l_Text_0, {
            Text = v16, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            tag = "auto-xy padding-bottom-small", 
            LayoutOrder = 0
        }), 
        Links = v5.createElement(l_View_0, {
            tag = "size-full-0 auto-y col wraps", 
            LayoutOrder = 1
        }, v22)
    });
end);