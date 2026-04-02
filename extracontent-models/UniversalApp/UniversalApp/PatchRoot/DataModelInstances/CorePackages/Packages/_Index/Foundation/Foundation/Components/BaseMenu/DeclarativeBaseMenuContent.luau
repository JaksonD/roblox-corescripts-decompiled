local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(script.Parent.BaseMenuGroup);
local v7 = require(script.Parent.BaseMenuItem);
local function v8(v9) --[[ Line: 38 ]] --[[ Name: DeclarativeBaseMenuContent ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v6 (copy), v7 (copy), v8 (copy)
    local v12 = v3.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v2 (ref), v9 (copy), v4 (ref)
        local v10 = v2.get(v9.items, {
            1, 
            "items"
        });
        local v11 = if v4.FoundationBaseMenuSubmenuSupport then v2.get(v9.items, {
            1, 
            "id"
        }) else nil;
        if v10 and not v11 then
            return v9.items;
        else
            return {
                {
                    items = v9.items
                }
            };
        end;
    end, {
        v9.items
    });
    return v3.createElement(v3.Fragment, nil, v2.map(v12, function(v13, v14) --[[ Line: 55 ]]
        -- upvalues: v3 (ref), v6 (ref), v2 (ref), v7 (ref), v4 (ref), v8 (ref)
        return v3.createElement(v6, {
            key = v14, 
            LayoutOrder = v14, 
            title = v13.title
        }, v2.map(v13.items, function(v15, v16) --[[ Line: 63 ]]
            -- upvalues: v3 (ref), v7 (ref), v4 (ref), v8 (ref)
            return v3.createElement(v7, {
                LayoutOrder = v16, 
                key = v15.id, 
                icon = v15.icon, 
                isChecked = v15.isChecked, 
                isDisabled = v15.isDisabled, 
                text = v15.text, 
                onActivated = v15.onActivated, 
                id = v15.id, 
                testId = v15.items and "--foundation-menu-submenu-item" or "--foundation-menu-item", 
                ref = v15.ref
            }, if v4.FoundationBaseMenuSubmenuSupport and v15.items then v3.createElement(v8, {
                items = v15.items
            }) else nil);
        end));
    end));
end;
return v3.memo(v8);