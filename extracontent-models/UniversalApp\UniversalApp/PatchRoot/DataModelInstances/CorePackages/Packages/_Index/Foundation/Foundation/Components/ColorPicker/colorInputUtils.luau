local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Enums.ColorInputMode);
local v5 = require(l_script_FirstAncestor_0.Utility.Flags);
return {
    createInputConfigs = function(v6, v7, v8, v9, v10, v11, v12, v13, v14) --[[ Line: 26 ]] --[[ Name: createInputConfigs ]]
        -- upvalues: v2 (copy), v4 (copy), v5 (copy)
        local v17 = v2.map({
            "R", 
            "G", 
            "B"
        }, function(v15) --[[ Line: 37 ]]
            -- upvalues: v6 (copy), v10 (copy)
            return {
                key = v15, 
                component = v15:lower(), 
                value = v6:map(function(v16) --[[ Line: 41 ]]
                    -- upvalues: v15 (copy)
                    return v16[v15:lower()];
                end), 
                handler = v10, 
                minimum = 0, 
                maximum = 255, 
                step = 1
            };
        end);
        local v18 = table.clone(v17);
        table.insert(v18, {
            key = "A", 
            value = v9, 
            handler = v13, 
            minimum = 0, 
            maximum = 1, 
            step = 0.01, 
            precision = 3
        });
        local v21 = v2.map({
            "H", 
            "S", 
            "V"
        }, function(v19) --[[ Line: 62 ]]
            -- upvalues: v7 (copy), v11 (copy)
            return {
                key = v19, 
                component = v19:lower(), 
                value = v7:map(function(v20) --[[ Line: 66 ]]
                    -- upvalues: v19 (copy)
                    return v20[v19:lower()];
                end), 
                handler = v11, 
                minimum = 0, 
                maximum = v19 == "H" and 360 or nil
            };
        end);
        local v22 = {
            {
                key = tostring(v4.Hex), 
                value = v8, 
                handler = v12, 
                placeholder = "#000000", 
                width = if v5.FoundationColorPickerDesignUpdate then UDim.new(1, 0) else v14.Size and v14.Size.Size_2000 and v14.Size.Size_2000 or nil
            }
        };
        return {
            [v4.RGB] = v17, 
            [v4.RGBA] = v18, 
            [v4.HSV] = v21, 
            [v4.Hex] = v22
        };
    end
};