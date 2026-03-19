local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.BaseMenu);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v3(v4, v5) --[[ Line: 10 ]] --[[ Name: markSelectedItem ]]
    -- upvalues: v3 (copy)
    if v5 == nil then
        return v4, nil;
    else
        local v6 = {};
        local v7 = nil;
        for _, v9 in v4 do
            if v9.id then
                local l_v9_0 = v9;
                if v9.id == v5 then
                    l_v9_0 = table.clone(v9);
                    l_v9_0.isChecked = true;
                    v7 = l_v9_0;
                end;
                table.insert(v6, l_v9_0);
            elseif v9.items then
                local v11, v12 = v3(v9.items, v5);
                table.insert(v6, {
                    title = v9.title, 
                    items = v11
                });
                v7 = v7 or v12;
            end;
        end;
        return v6, v7;
    end;
end;
return v3;