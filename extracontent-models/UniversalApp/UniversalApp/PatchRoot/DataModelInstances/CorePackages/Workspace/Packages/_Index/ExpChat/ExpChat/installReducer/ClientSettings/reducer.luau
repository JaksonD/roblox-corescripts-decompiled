local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.ClientSettingsLoaded);
local v6 = require(l_Actions_0.ClientSettingsChanged);
local v7 = {
    preferredTransparency = 1
};
return v2.createReducer(v7, {
    [v5.name] = function(v8, v9) --[[ Line: 18 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v8, v9.value);
    end, 
    [v6.name] = function(v10, v11) --[[ Line: 22 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v10, {
            [v11.property] = v11.value
        });
    end
});