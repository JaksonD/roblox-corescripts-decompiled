local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local l_ExpandableText_0 = require(l_Parent_0.AppBlox).ExpandableText;
local l_reportUnifiedLoggingAction_0 = require(l_Parent_0.SduiCoreSystem).reportUnifiedLoggingAction;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v1.memo(function(v5) --[[ Line: 22 ]] --[[ Name: SduiExpandableText ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v1 (copy), l_reportUnifiedLoggingAction_0 (copy), l_ExpandableText_0 (copy)
    local v6 = nil;
    v6 = if l_FFlagSduiServerCompat_0 then v5.layoutOrder else v5.LayoutOrder;
    local v9 = v1.useCallback(function(v7) --[[ Line: 30 ]]
        -- upvalues: v5 (copy), l_reportUnifiedLoggingAction_0 (ref)
        if v5.onExpandChanged then
            v5.onExpandChanged(v7);
        end;
        local v8 = {
            actionType = "ExpandableTextToggle", 
            actionParams = {
                isExpanded = v7
            }
        };
        l_reportUnifiedLoggingAction_0(v5.sduiContext, v8, v5.analyticsContext);
    end, {
        v5.onExpandChanged, 
        v5.analyticsContext, 
        v5.sduiContext
    });
    local v10 = {
        text = v5.text, 
        LayoutOrder = v6, 
        compactNumberOfLines = v5.compactNumberOfLines, 
        fontStyle = v5.fontStyle, 
        textColor = v5.textColor, 
        expandedInitially = v5.expandedInitially, 
        onExpandChanged = v9
    };
    return v1.createElement(l_ExpandableText_0, v10);
end);