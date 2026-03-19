local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Icon_0 = v2.Icon;
local l_Text_0 = v2.Text;
local l_Enums_0 = v2.Enums;
return function(v7) --[[ Line: 24 ]] --[[ Name: ConnectionChannelsTile ]]
    -- upvalues: v1 (copy), l_Enums_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Text_0 (copy)
    local l_layoutOrder_0 = v7.componentUIProps.layoutOrder;
    local l_itemSize_0 = v7.componentUIProps.itemSize;
    local l_icon_0 = v7.icon;
    local l_title_0 = v7.title;
    local l_onMounted_0 = v7.onMounted;
    local l_onActivated_0 = v7.onActivated;
    local v14, v15 = v1.useState(false);
    local v19 = v1.useCallback(function(v16) --[[ Line: 34 ]]
        -- upvalues: v15 (copy), l_Enums_0 (ref)
        local l_v15_0 = v15;
        local v18 = true;
        if v16 ~= l_Enums_0.ControlState.Hover then
            v18 = v16 == l_Enums_0.ControlState.Pressed;
        end;
        l_v15_0(v18);
    end, {});
    v1.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: l_onMounted_0 (copy)
        if l_onMounted_0 then
            l_onMounted_0();
        end;
    end, {});
    return v1.createElement(l_View_0, {
        tag = "auto-none gui-object-defaults", 
        Size = l_itemSize_0, 
        LayoutOrder = l_layoutOrder_0, 
        selection = {
            SelectionOrder = l_layoutOrder_0, 
            Selectable = true
        }, 
        onActivated = l_onActivated_0, 
        onStateChanged = v19, 
        stateLayer = {
            affordance = l_Enums_0.StateLayerAffordance.None
        }
    }, {
        Content = v1.createElement(l_View_0, {
            tag = "size-full col align-x-center gap-small"
        }, {
            View = v1.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = {
                    ["size-full aspect-1-1 radius-circle align-x-center align-y-center row"] = true, 
                    ["bg-shift-300"] = not v14, 
                    ["bg-shift-400"] = v14
                }
            }, {
                Icon = if l_icon_0 then v1.createElement(l_Icon_0, {
                    name = l_icon_0, 
                    size = l_Enums_0.IconSize.Large
                }) else nil
            }), 
            Title = v1.createElement(l_Text_0, {
                LayoutOrder = 2, 
                tag = "text-body-small auto-xy text-align-x-left clip text-truncate-end", 
                Text = l_title_0
            })
        })
    });
end;