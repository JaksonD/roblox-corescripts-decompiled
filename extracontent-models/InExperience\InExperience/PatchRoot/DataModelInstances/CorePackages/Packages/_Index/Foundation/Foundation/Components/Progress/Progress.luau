local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.ProgressBar);
local v4 = require(script.Parent.ProgressCircle);
local v5 = require(l_script_FirstAncestor_0.Enums.ProgressShape);
local _ = require(l_script_FirstAncestor_0.Enums.ProgressSize);
local v7 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v9 = {
    testId = "--foundation-progress"
};
return v2.memo(v2.forwardRef(function(v10, v11) --[[ Line: 29 ]] --[[ Name: Progress ]]
    -- upvalues: v7 (copy), v9 (copy), v5 (copy), v2 (copy), v4 (copy), v3 (copy)
    local v12 = v7(v10, v9);
    v12.ref = v11;
    if v12.shape == v5.Circle then
        return v2.createElement(v4, v12);
    else
        return v2.createElement(v3, v12);
    end;
end));