local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.valueToString);
local v2 = require(l_Parent_0.util.floatEquals);
return {
    fuzzyEq = function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: fuzzyEq ]]
        -- upvalues: v2 (copy)
        local l_v3_Components_0, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17 = v3:GetComponents();
        local l_v4_Components_0, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29 = v4:GetComponents();
        return v2(l_v3_Components_0, l_v4_Components_0, v5) and v2(v7, v19, v5) and v2(v8, v20, v5) and v2(v9, v21, v5) and v2(v10, v22, v5) and v2(v11, v23, v5) and v2(v12, v24, v5) and v2(v13, v25, v5) and v2(v14, v26, v5) and v2(v15, v27, v5) and v2(v16, v28, v5) and v2(v17, v29, v5);
    end, 
    getRotationString = function(v30) --[[ Line: 24 ]] --[[ Name: getRotationString ]]
        -- upvalues: v1 (copy)
        local v31 = Vector3.new(v30:ToOrientation());
        v31 = Vector3.new(math.deg(v31.X), math.deg(v31.Y), (math.deg(v31.Z)));
        return v1(v31);
    end
};