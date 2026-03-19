local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Common.formatDate);
local v6 = require(l_script_FirstAncestor_0.Common.getVirtualEventDates);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v9 = utf8.char(8226);
return function(v10) --[[ Line: 19 ]] --[[ Name: EventTimer ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v2 (copy), v6 (copy), l_StyledTextLabel_0 (copy), v5 (copy), v9 (copy)
    local v11 = l_useStyle_0();
    local v12 = l_useLocalization_0({
        cancelled = "Feature.VirtualEvents.EventCancelledText"
    });
    local v13 = v10.virtualEvent.eventStatus == "cancelled";
    local v14 = v2.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: v6 (ref), v10 (copy)
        return v6(v10.virtualEvent);
    end, {
        v10.virtualEvent
    });
    return v2.createElement(l_StyledTextLabel_0, {
        text = if v13 then v12.cancelled else ("%s %s %s"):format(v5(v14.startDate), v9, v5(v14.endDate)), 
        automaticSize = Enum.AutomaticSize.XY, 
        fontStyle = v11.Font.CaptionHeader, 
        colorStyle = if v13 then v11.Theme.Alert else v11.Theme.TextMuted
    });
end;