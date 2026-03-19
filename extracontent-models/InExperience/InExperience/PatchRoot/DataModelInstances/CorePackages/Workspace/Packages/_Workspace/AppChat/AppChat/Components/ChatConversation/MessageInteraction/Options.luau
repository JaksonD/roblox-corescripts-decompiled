local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.BuilderIcons);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(script.Parent.OptionsEnum);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableMessageContextMenu);
local v11 = {
    LayoutOrder = 1, 
    isIncoming = false, 
    handleEvent = function(_, _, _) --[[ Line: 22 ]] --[[ Name: handleEvent ]]

    end, 
    emitImpressionTelemetryEvent = function() --[[ Line: 23 ]] --[[ Name: emitImpressionTelemetryEvent ]]

    end
};
Options = function(v12) --[[ Line: 35 ]] --[[ Name: Options ]]
    -- upvalues: v5 (copy), v11 (copy), v2 (copy), v6 (copy), v3 (copy), v4 (copy), v7 (copy)
    local v13 = v5.Dictionary.union(v11, v12);
    v2.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v13 (copy)
        v13.emitImpressionTelemetryEvent();
    end, {});
    local v14 = v2.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v13 (copy), v2 (ref), v6 (ref)
        v13.handleEvent(v2.Event.Activated, nil, v6.Reply);
    end, {
        v13.handleEvent
    });
    local v15 = v2.useCallback(function() --[[ Line: 46 ]]
        -- upvalues: v13 (copy), v2 (ref), v6 (ref)
        v13.handleEvent(v2.Event.Activated, nil, v6.MessageContextMenu);
    end, {
        v13.handleEvent
    });
    return v2.createElement(v3.View, {
        tag = "row auto-xy gap-xxsmall", 
        LayoutOrder = v13.LayoutOrder
    }, {
        Reply = v2.createElement(v3.IconButton, {
            onActivated = v14, 
            icon = v4.Icon.ArrowThickToRight, 
            variant = v3.Enums.ButtonVariant.Standard, 
            size = v3.Enums.InputSize.Medium, 
            isCircular = true, 
            LayoutOrder = v13.isIncoming and 1 or -1
        }), 
        MessageContextMenu = if v7 then v2.createElement(v3.IconButton, {
            onActivated = v15, 
            icon = v4.Icon.ThreeDotsHorizontal, 
            variant = v3.Enums.ButtonVariant.Standard, 
            size = v3.Enums.InputSize.Medium, 
            isCircular = true, 
            LayoutOrder = v13.isIncoming and 2 or -2
        }) else nil
    });
end;
return v2.memo(Options);