local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Components.EventHostName);
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
local v7 = require(l_script_FirstAncestor_0.Parent.Foundation);
local l_useCursor_0 = v7.Hooks.useCursor;
local l_Cell_0 = v3.App.Table.Cell;
local l_CellHeadDetail_0 = v3.App.Table.CellHeadDetail;
local l_CellTailDescription_0 = v3.App.Table.CellTailDescription;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v13 = {
    size = UDim2.new(1, 0, 0, 52)
};
return function(v14) --[[ Line: 29 ]] --[[ Name: EventHostedBy ]]
    -- upvalues: v1 (copy), v13 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_useCursor_0 (copy), v7 (copy), v2 (copy), l_Cell_0 (copy), l_CellHeadDetail_0 (copy), l_CellTailDescription_0 (copy), v5 (copy)
    v14 = v1.Dictionary.join(v13, v14);
    local v15 = l_useStyle_0();
    local v16 = l_useLocalization_0({
        hostedBy = "Feature.VirtualEvents.HostedByLabel"
    });
    local v17 = l_useCursor_0(v7.Enums.CursorType.RoundedRect);
    local v18 = v2.useCallback(function() --[[ Line: 38 ]]
        -- upvalues: v14 (ref)
        if v14.onActivated then
            v14.onActivated(v14.host);
        end;
    end, {
        v14
    });
    return v2.createElement(l_Cell_0, {
        selectionCursor = v17, 
        size = v14.size, 
        userInteractionEnabled = true, 
        horizontalPadding = 0, 
        onActivated = v18, 
        head = v2.createElement(l_CellHeadDetail_0, {
            labelText = v16.hostedBy, 
            labelTextColor = v15.Theme.TextDefault, 
            labelTextFont = v15.Font.Body
        }), 
        tail = v2.createElement(l_CellTailDescription_0, {
            text = "", 
            renderTextOverride = function() --[[ Line: 57 ]] --[[ Name: renderTextOverride ]]
                -- upvalues: v2 (ref), v5 (ref), v14 (ref)
                return v2.createElement(v5, {
                    host = v14.host
                });
            end, 
            showArrow = true
        }), 
        layoutWraps = true
    });
end;