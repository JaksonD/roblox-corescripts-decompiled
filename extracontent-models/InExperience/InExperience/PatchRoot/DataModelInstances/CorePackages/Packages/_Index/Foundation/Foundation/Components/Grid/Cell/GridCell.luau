local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.View);
local v6 = require(l_script_FirstAncestor_0.Utility.getGridSizeTag);
local v7 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v8 = {
    size = 1, 
    testId = "--foundation-grid--cell"
};
return v3.memo(v3.forwardRef(function(v9, v10) --[[ Line: 26 ]] --[[ Name: GridCell ]]
    -- upvalues: v7 (copy), v8 (copy), v2 (copy), v3 (copy), v6 (copy), v5 (copy)
    local v11 = v7(v9, v8);
    local v12 = v2.omit(v11, {
        "size"
    });
    local v13 = v3.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: v6 (ref), v11 (copy)
        return v6(v11.size);
    end, {
        v11.size
    });
    return v3.createElement(v5, v2.assign(v12, {
        tag = table.concat({
            v13, 
            v11.tag
        }, " "), 
        ref = v10
    }), v11.children);
end));