local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(script.Parent.BaseMenuGroup);
local v6 = require(script.Parent.BaseMenuItem);
return v3.memo(function(v7) --[[ Line: 34 ]] --[[ Name: DeclarativeBaseMenuContent ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), v6 (copy)
    local v8 = v3.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: v2 (ref), v7 (copy)
        if v2.get(v7.items, {
            1, 
            "items"
        }) then
            return v7.items;
        else
            return {
                {
                    items = v7.items
                }
            };
        end;
    end, {
        v7.items
    });
    return v3.createElement(v3.Fragment, nil, v2.map(v8, function(v9, v10) --[[ Line: 46 ]]
        -- upvalues: v3 (ref), v5 (ref), v2 (ref), v6 (ref)
        return v3.createElement(v5, {
            key = v10, 
            LayoutOrder = v10, 
            title = v9.title
        }, v2.map(v9.items, function(v11, v12) --[[ Line: 54 ]]
            -- upvalues: v3 (ref), v6 (ref)
            return v3.createElement(v6, {
                LayoutOrder = v12, 
                key = v11.id, 
                icon = v11.icon, 
                isChecked = v11.isChecked, 
                isDisabled = v11.isDisabled, 
                text = v11.text, 
                onActivated = v11.onActivated, 
                id = v11.id, 
                testId = "--foundation-menu-item"
            });
        end));
    end));
end);