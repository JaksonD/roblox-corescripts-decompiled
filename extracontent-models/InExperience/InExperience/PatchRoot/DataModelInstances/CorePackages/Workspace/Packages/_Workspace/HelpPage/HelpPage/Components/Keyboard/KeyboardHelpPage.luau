local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_0.Hooks.useKeybinds);
local v5 = require(script.Parent.KeyboardGroup);
local _ = require(l_Parent_0.Configs.ConfigTypes);
local l_View_0 = v3.View;
return v2.memo(function() --[[ Line: 18 ]] --[[ Name: KeyboardHelpPage ]]
    -- upvalues: v4 (copy), v2 (copy), l_View_0 (copy), v5 (copy)
    local l_controls_0 = v4().controls;
    local l_groups_0 = v4().groups;
    local v19 = v2.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: l_controls_0 (copy), l_groups_0 (copy), v2 (ref), l_View_0 (ref), v5 (ref)
        if l_controls_0 == nil or l_groups_0 == nil then
            return nil;
        else
            local v10 = {};
            for _, v12 in l_groups_0 do
                v10[v12.id] = {
                    controls = {}, 
                    group = v12
                };
            end;
            for v13, v14 in l_controls_0 do
                if v14.keyboardInput ~= nil then
                    local l_group_0 = v14.keyboardInput.group;
                    if v10[l_group_0.id] ~= nil then
                        v10[l_group_0.id].controls[v13] = v14;
                    end;
                end;
            end;
            local v16 = {};
            for _, v18 in v10 do
                if next(v18.controls) ~= nil then
                    table.insert(v16, v2.createElement(l_View_0, {
                        tag = "auto-y padding-xxsmall", 
                        LayoutOrder = v18.group.layoutOrder, 
                        Size = UDim2.new(0.3333333333333333, -1, 0, 0), 
                        key = v18.group.id
                    }, v2.createElement(v5, v18)));
                end;
            end;
            return v16;
        end;
    end, {
        l_controls_0, 
        l_groups_0
    });
    if v19 == nil then
        return nil;
    else
        return v2.createElement(l_View_0, {
            tag = "row size-full-0 auto-y wrap align-x-left align-y-top"
        }, v19);
    end;
end);