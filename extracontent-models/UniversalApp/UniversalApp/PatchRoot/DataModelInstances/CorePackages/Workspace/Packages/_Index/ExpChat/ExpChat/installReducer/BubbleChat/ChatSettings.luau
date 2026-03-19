local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v6 = require(l_Actions_0.BubbleChatSettingsChanged);
local v7 = require(l_Actions_0.BubbleChatChildSettingChanged);
local v8 = require(l_Actions_0.BubbleChatChildRemoved);
local v9 = require(script.Parent.DefaultSettings);
return v2.createReducer(v9, {
    [v5.name] = function(v10, v11) --[[ Line: 16 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v10, v11.bubbleChatSettings);
    end, 
    [v6.name] = function(v12, v13) --[[ Line: 20 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v12, {
            [v13.property] = v13.value
        });
    end, 
    [v7.name] = function(v14, v15) --[[ Line: 26 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v14, {
            [v15.childName] = l_Dictionary_0.join(v14[v15.childName], {
                [v15.property] = v15.value
            })
        });
    end, 
    [v8.name] = function(v16, v17) --[[ Line: 34 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.removeKey(v16, v17.childName);
    end
});