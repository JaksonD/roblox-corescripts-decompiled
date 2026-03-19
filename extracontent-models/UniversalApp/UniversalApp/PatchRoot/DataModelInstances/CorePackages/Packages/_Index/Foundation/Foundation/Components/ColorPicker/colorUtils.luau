local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return {
    calculateSVFromPosition = function(v3, v4, v5) --[[ Line: 26 ]] --[[ Name: calculateSVFromPosition ]]
        local v6 = math.clamp(v3.X - v4.X, 0, v5.X);
        local v7 = math.clamp(v3.Y - v4.Y, 0, v5.Y);
        return v6 / v5.X, 1 - v7 / v5.Y;
    end, 
    createHSVUpdateHandler = function(v8, v9, v10, v11, v12) --[[ Line: 40 ]] --[[ Name: createHSVUpdateHandler ]]
        return function(v13, v14, v15) --[[ Line: 47 ]]
            -- upvalues: v12 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
            v12.current = true;
            v8(v13);
            v9(v14);
            v10(v15);
            local v16 = Color3.fromHSV(v13, v14, v15);
            v11(v16);
            v12.current = false;
        end;
    end, 
    createColorInputChangeHandler = function(v17, v18, v19, v20, v21) --[[ Line: 61 ]] --[[ Name: createColorInputChangeHandler ]]
        return function(v22) --[[ Line: 68 ]]
            -- upvalues: v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy)
            v17(v22);
            if not v18.current then
                local v23, v24, v25 = v22:ToHSV();
                v19(v23);
                v20(v24);
                v21(v25);
            end;
        end;
    end, 
    isPartialHSV = function(v26) --[[ Line: 18 ]] --[[ Name: isPartialHSV ]]
        -- upvalues: v1 (copy)
        if not v1.FoundationColorPickerPartialHSV or typeof(v26) == "Color3" then
            return false;
        else
            local v27 = true;
            if v26.S ~= nil then
                v27 = v26.V == nil;
            end;
            return v27;
        end;
    end, 
    toColor3 = function(v28) --[[ Line: 7 ]] --[[ Name: toColor3 ]]
        -- upvalues: v1 (copy)
        if not v1.FoundationColorPickerPartialHSV or typeof(v28) == "Color3" then
            return v28;
        else
            return Color3.fromHSV(v28.H / 360, (v28.S or 100) / 100, (v28.V or 100) / 100);
        end;
    end
};