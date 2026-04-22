local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_script_FirstAncestor_0.BeduiV2.Components.SlideTransitionContext);
local l_View_0 = v2.View;
local v7 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1, 
    restingPositionLimit = 0.5, 
    restingVelocityLimit = 0.1
};
local v8 = {
    inExpChatSelection = true, 
    inExpSceneSelection = true
};
return v3.memo(function(v9) --[[ Line: 60 ]] --[[ Name: SlideTransition ]]
    -- upvalues: v8 (copy), v3 (copy), v4 (copy), v7 (copy), l_View_0 (copy), v5 (copy)
    local v10 = v8[v9.nodeType] or false;
    local v11, v12 = v3.useState(false);
    local v13, v14 = v3.useBinding(false);
    local v15 = v3.useRef({
        prevNodeId = nil, 
        prevContent = nil, 
        outgoing = nil, 
        direction = "forward", 
        needsAnimationStart = false
    });
    local v16 = v3.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v15 (copy), v12 (copy), v14 (copy)
        v15.current.outgoing = nil;
        v12(false);
        v14(false);
    end, {});
    local v17, v18 = v4.useAnimatedBinding(1, v16);
    local l_current_0 = v15.current;
    if l_current_0.prevNodeId ~= nil and l_current_0.prevNodeId ~= v9.nodeId and not (v10 and true) and l_current_0.prevContent then
        l_current_0.outgoing = {
            nodeId = l_current_0.prevNodeId, 
            content = l_current_0.prevContent
        };
        l_current_0.direction = v9.direction or "forward";
        l_current_0.needsAnimationStart = true;
    end;
    if not v10 then
        l_current_0.prevNodeId = v9.nodeId;
        l_current_0.prevContent = v9.nodeContent;
    end;
    v3.useLayoutEffect(function() --[[ Line: 104 ]]
        -- upvalues: v15 (copy), v12 (copy), v14 (copy), v7 (ref), v18 (copy), v4 (ref)
        if v15.current.needsAnimationStart then
            v15.current.needsAnimationStart = false;
            v12(true);
            v14(true);
            local v20 = table.clone(v7);
            v20.startingValue = 0;
            v18(v4.spring(1, v20));
        end;
    end, {
        v9.nodeId
    });
    local v21 = {};
    if l_current_0.outgoing then
        v21[l_current_0.outgoing.nodeId] = v3.createElement(l_View_0, {
            tag = "col size-full", 
            Position = if v11 then v17:map(function(v22) --[[ Line: 121 ]]
                -- upvalues: v15 (copy)
                local v23 = v15.current.direction == "forward" and -1 or 1;
                return UDim2.new(v22 * v23, 0, 0, 0);
            end) else nil
        }, {
            Content = l_current_0.outgoing.content
        });
    end;
    v21[v9.nodeId] = v3.createElement(l_View_0, {
        tag = "col size-full", 
        Position = if v11 then v17:map(function(v24) --[[ Line: 132 ]]
            -- upvalues: v15 (copy)
            local v25 = v15.current.direction == "forward" and 1 or -1;
            return UDim2.new((1 - v24) * v25, 0, 0, 0);
        end) else nil
    }, {
        Content = v9.nodeContent
    });
    return v3.createElement(v5.Provider, {
        value = v13
    }, v3.createElement(l_View_0, {
        tag = "fill size-full-0", 
        ClipsDescendants = true
    }, v21));
end);