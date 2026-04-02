local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.util.floatEquals);
return {
    fuzzyEq = function(v2, v3, v4) --[[ Line: 6 ]] --[[ Name: fuzzyEq ]]
        -- upvalues: v1 (copy)
        local l_v2_Components_0, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16 = v2:GetComponents();
        local l_v3_Components_0, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28 = v3:GetComponents();
        return v1(l_v2_Components_0, l_v3_Components_0, v4) and v1(v6, v18, v4) and v1(v7, v19, v4) and v1(v8, v20, v4) and v1(v9, v21, v4) and v1(v10, v22, v4) and v1(v11, v23, v4) and v1(v12, v24, v4) and v1(v13, v25, v4) and v1(v14, v26, v4) and v1(v15, v27, v4) and v1(v16, v28, v4);
    end
};