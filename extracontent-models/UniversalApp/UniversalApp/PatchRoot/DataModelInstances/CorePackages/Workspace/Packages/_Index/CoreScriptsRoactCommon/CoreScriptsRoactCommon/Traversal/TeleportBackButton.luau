local l_TeleportService_0 = game:GetService("TeleportService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreScriptsRoactCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_View_0 = v4.View;
local l_Text_0 = v4.Text;
local l_Icon_0 = v4.Icon;
local l_IconName_0 = v4.Enums.IconName;
local l_IconSize_0 = v4.Enums.IconSize;
local v10 = require(l_script_FirstAncestor_0.Hooks.useTeleportBack);
local v11 = require(script.Parent.TraversalTelemetry);
return v3.memo(v3.forwardRef(function(v12, v13) --[[ Line: 23 ]] --[[ Name: TeleportBackButton ]]
    -- upvalues: l_TeleportService_0 (copy), v10 (copy), v4 (copy), v3 (copy), l_View_0 (copy), v11 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    local l_l_TeleportService_0_ThirdPartyTeleportInfo_0, v15 = l_TeleportService_0:GetThirdPartyTeleportInfo(false);
    local v16 = v10(v15);
    local v17 = v4.Hooks.useTokens();
    local l_Foreground_0 = v17.Color.ActionStandard.Foreground;
    return v3.createElement(l_View_0, {
        tag = "padding-left-small padding-right-medium align-x-center align-y-center auto-x bg-over-media-0 radius-circle row size-0-1100", 
        onActivated = function() --[[ Line: 32 ]] --[[ Name: onActivated ]]
            -- upvalues: v11 (ref), l_l_TeleportService_0_ThirdPartyTeleportInfo_0 (copy), v16 (copy)
            v11.sendBackButtonActionEvent({
                integration_id = "back_button", 
                destination_universe_id = l_l_TeleportService_0_ThirdPartyTeleportInfo_0, 
                event_type = "click"
            });
            v16();
        end, 
        ref = v13
    }, {
        TeleportBackIcon = v3.createElement(l_Icon_0, {
            name = l_IconName_0.ChevronLargeLeft, 
            style = l_Foreground_0, 
            size = l_IconSize_0.Medium, 
            LayoutOrder = 1
        }), 
        TeleportText = v12.text and v3.createElement(l_Text_0, {
            Text = v12.text, 
            tag = "auto-x size-0-full text-truncate-split text-label-medium", 
            sizeConstraint = v12.textLimitWidth and {
                MaxSize = Vector2.new(v12.textLimitWidth, v17.Size.Size_1100)
            }, 
            textStyle = l_Foreground_0, 
            LayoutOrder = 2
        })
    });
end));