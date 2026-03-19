local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_script_FirstAncestor_0.Hooks.useSemanticTokens);
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
local v7 = require(l_script_FirstAncestor_0.Components.Buttons.IconTextButton);
local v8 = require(l_script_FirstAncestor_0.Components.Buttons.ColorTextButton);
local v9 = game:DefineFastFlag("AXDisableControlBarMenuAnimation", false);
local v10 = {
    dampingRatio = 1, 
    frequency = 5
};
return function(v11) --[[ Line: 30 ]] --[[ Name: IconTextMenu ]]
    -- upvalues: v5 (copy), v2 (copy), v4 (copy), v10 (copy), v7 (copy), v8 (copy), v3 (copy), v9 (copy)
    local v12 = v5();
    local v13, v14 = v2.useBinding(0);
    local v15, v16 = v4.useAnimatedBinding(0);
    local v17 = #v11.items > 0;
    local v18 = v2.useRef(nil);
    local v19 = v11.radius or v12.defaultIconTextMenuRadius;
    local v22 = v2.useCallback(function(v20) --[[ Line: 41 ]]
        -- upvalues: v14 (copy), v16 (copy), v4 (ref), v17 (copy), v10 (ref)
        local l_AbsoluteSize_0 = v20.AbsoluteSize;
        v14(l_AbsoluteSize_0.X);
        v16(v4.spring(if v17 then l_AbsoluteSize_0.Y else 0, v10));
    end, {
        v17
    });
    local v26 = v2.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: v11 (copy), v2 (ref), v7 (ref), v8 (ref)
        local v23 = {};
        for v24, v25 in v11.items do
            if v25.type == "icon" then
                v23[("IconTextMenuItem-%*"):format(v25.id)] = v2.createElement(v7, {
                    icon = v25.icon, 
                    text = v25.text, 
                    iconSize = v25.iconSize, 
                    disabled = v25.disabled, 
                    onActivated = function() --[[ Line: 56 ]] --[[ Name: onActivated ]]
                        -- upvalues: v11 (ref), v25 (copy)
                        if v11.onItemActivated then
                            v11.onItemActivated(v25.id);
                        end;
                        if v25.onActivated then
                            v25.onActivated();
                        end;
                    end, 
                    Visible = v25.visible, 
                    LayoutOrder = v24
                });
            elseif v25.type == "color" then
                v23[("IconTextMenuItem-%*"):format(v25.id)] = v2.createElement(v8, {
                    colors = v25.colors, 
                    colorSize = v25.colorSize, 
                    size = v25.size, 
                    text = v25.text, 
                    disabled = v25.disabled, 
                    onActivated = function() --[[ Line: 74 ]] --[[ Name: onActivated ]]
                        -- upvalues: v11 (ref), v25 (copy)
                        if v11.onItemActivated then
                            v11.onItemActivated(v25.id);
                        end;
                        if v25.onActivated then
                            v25.onActivated();
                        end;
                    end, 
                    Visible = v25.visible, 
                    LayoutOrder = v24
                });
            end;
        end;
        return v23;
    end, {
        v11.items, 
        v11.onItemActivated
    });
    return v2.createElement(v3.View, {
        tag = "clip", 
        Name = "IconTextMenu-Animation-Container", 
        Size = if v9 then nil else v2.joinBindings({
            X = v13, 
            Y = v15
        }):map(function(v27) --[[ Line: 95 ]]
            return UDim2.fromOffset(v27.X, (math.round(v27.Y)));
        end), 
        AutomaticSize = if v9 then Enum.AutomaticSize.XY else nil, 
        Position = v11.Position, 
        AnchorPoint = v11.AnchorPoint, 
        LayoutOrder = v11.LayoutOrder
    }, {
        MenuContent = if #v11.items > 0 then v2.createElement(v3.View, {
            tag = "auto-xy clip col clip padding-xsmall gap-xsmall", 
            backgroundStyle = v12.menuBackgroundStyle, 
            cornerRadius = UDim.new(0, v19), 
            ref = v18, 
            onAbsoluteSizeChanged = v22
        }, v26) else nil
    });
end;