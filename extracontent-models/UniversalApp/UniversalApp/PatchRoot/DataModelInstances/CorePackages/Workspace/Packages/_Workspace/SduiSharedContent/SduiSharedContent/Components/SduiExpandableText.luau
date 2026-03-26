local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.AppBlox);
local v3 = require(l_Parent_0.Foundation);
local l_reportUnifiedLoggingAction_0 = require(l_Parent_0.SduiCoreSystem).reportUnifiedLoggingAction;
local l_ExpandableText_0 = v2.ExpandableText;
local l_View_0 = v3.View;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
return v1.memo(function(v9) --[[ Line: 27 ]] --[[ Name: SduiExpandableText ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), v1 (copy), l_reportUnifiedLoggingAction_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_View_0 (copy), l_ExpandableText_0 (copy)
    local v10 = nil;
    v10 = if l_FFlagSduiServerCompat_0 then v9.layoutOrder else v9.LayoutOrder;
    local v13 = v1.useCallback(function(v11) --[[ Line: 35 ]]
        -- upvalues: v9 (copy), l_reportUnifiedLoggingAction_0 (ref)
        if v9.onExpandChanged then
            v9.onExpandChanged(v11);
        end;
        local v12 = {
            actionType = "ExpandableTextToggle", 
            actionParams = {
                isExpanded = v11
            }
        };
        l_reportUnifiedLoggingAction_0(v9.sduiContext, v12, v9.analyticsContext);
    end, {
        v9.onExpandChanged, 
        v9.analyticsContext, 
        v9.sduiContext
    });
    local v14 = {
        text = v9.text, 
        LayoutOrder = l_FFlagSduiExperienceDetailsSupport_0 and v9.headerComponent and 2 or v10, 
        compactNumberOfLines = v9.compactNumberOfLines, 
        fontStyle = v9.fontStyle, 
        textColor = v9.textColor, 
        expandedInitially = v9.expandedInitially, 
        onExpandChanged = v13
    };
    if l_FFlagSduiExperienceDetailsSupport_0 and v9.headerComponent then
        return v1.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-large", 
            LayoutOrder = v10
        }, {
            Header = v1.cloneElement(v9.headerComponent, if l_FFlagSduiServerCompat_0 then {
                layoutOrder = 1
            } else {
                LayoutOrder = 1
            }), 
            Content = v1.createElement(l_ExpandableText_0, v14)
        });
    else
        return v1.createElement(l_ExpandableText_0, v14);
    end;
end);