local l_Parent_0 = script:FindFirstAncestor("DsaIllegalContentReporting").Parent;
local v1 = require(l_Parent_0.Foundation);
local l_default_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol.default;
local v3 = require(l_Parent_0.Localization);
local v4 = require(l_Parent_0.React);
local l_ControlState_0 = v1.Enums.ControlState;
local l_getIconRichText_0 = v1.Utility.getIconRichText;
local l_IconName_0 = v1.Enums.IconName;
local l_Text_0 = v1.Text;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_View_0 = v1.View;
local v11 = game:DefineFastString("GenericReportLink", "https://www.roblox.com/illegal-content-reporting");
local v12 = game:DefineFastFlag("ImproveIllegalContentReportingLinkLook", false);
GenericReportLink = function() --[[ Line: 22 ]] --[[ Name: GenericReportLink ]]
    -- upvalues: v12 (copy), v4 (copy), l_useLocalization_0 (copy), l_getIconRichText_0 (copy), l_IconName_0 (copy), l_default_0 (copy), v11 (copy), l_ControlState_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v13 = nil;
    local v14 = nil;
    if v12 then
        local v15, v16 = v4.useState(false);
        v13 = v15;
        v14 = v16;
    end;
    local v17 = l_useLocalization_0({
        GenericReportLinkText = "Feature.ReportAbuse.Label.GenericReportIllegalContentMessage"
    });
    local v18 = nil;
    if v12 then
        v18 = ("<b>%*</b> %*"):format(v17.GenericReportLinkText, (l_getIconRichText_0(l_IconName_0.ArrowUpRightFromSquare)));
    end;
    local v19 = v4.useCallback(function() --[[ Line: 39 ]]
        -- upvalues: l_default_0 (ref), v11 (ref)
        l_default_0:openURL(v11);
    end, {});
    local v20 = nil;
    if v12 then
        v20 = v4.useCallback(function(v21) --[[ Line: 45 ]]
            -- upvalues: v14 (ref), l_ControlState_0 (ref)
            v14(v21 == l_ControlState_0.Hover);
        end, {});
    end;
    return v4.createElement(l_View_0, {
        tag = "auto-xy col gap-small"
    }, {
        v4.createElement(l_Text_0, {
            Text = if v12 then if v13 then ("<u>%*</u>"):format(v18) else v18 else ("<b>%*</b>"):format(v17.GenericReportLinkText), 
            RichText = true, 
            onActivated = v19, 
            onStateChanged = if v12 then v20 else nil, 
            tag = "auto-xy radius-small padding-xsmall text-wrap text-body-small"
        })
    });
end;
return v4.memo(GenericReportLink);