local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Enums.ColorInputMode);
return {
    createInputConfigs = function(v5, v6, v7, v8, v9, v10, v11, v12, v13) --[[ Line: 24 ]] --[[ Name: createInputConfigs ]]
        -- upvalues: v2 (copy), v4 (copy)
        local v16 = v2.map({
            "R", 
            "G", 
            "B"
        }, function(v14) --[[ Line: 35 ]]
            -- upvalues: v5 (copy), v9 (copy)
            return {
                key = v14, 
                component = v14:lower(), 
                value = v5:map(function(v15) --[[ Line: 39 ]]
                    -- upvalues: v14 (copy)
                    return v15[v14:lower()];
                end), 
                handler = v9, 
                minimum = 0, 
                maximum = 255, 
                step = 1
            };
        end);
        local v17 = table.clone(v16);
        table.insert(v17, {
            key = "A", 
            value = v8, 
            handler = v12, 
            minimum = 0, 
            maximum = 1, 
            step = 0.01, 
            precision = 3
        });
        local v20 = v2.map({
            "H", 
            "S", 
            "V"
        }, function(v18) --[[ Line: 60 ]]
            -- upvalues: v6 (copy), v10 (copy)
            return {
                key = v18, 
                component = v18:lower(), 
                value = v6:map(function(v19) --[[ Line: 64 ]]
                    -- upvalues: v18 (copy)
                    return v19[v18:lower()];
                end), 
                handler = v10, 
                minimum = 0, 
                maximum = v18 == "H" and 360 or nil
            };
        end);
        local v21 = {
            {
                key = tostring(v4.Hex), 
                value = v7, 
                handler = v11, 
                placeholder = "#000000", 
                width = v13.Size and v13.Size.Size_2000 and v13.Size.Size_2000 or nil
            }
        };
        return {
            [v4.RGB] = v16, 
            [v4.RGBA] = v17, 
            [v4.HSV] = v20, 
            [v4.Hex] = v21
        };
    end
};