local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.ChatInputBarConfigurationEnabled);
local v7 = require(l_Actions_0.SetCoreGuiEnabledChanged);
local l_ClientAppLoaded_0 = v2.Actions.ClientAppLoaded;
local v9 = require(l_Actions_0.DevTextBoxEnabledChanged);
local v10 = {
    _propertyEnabled = true, 
    _coreGuiEnabled = true, 
    _devTextBoxEnabled = false, 
    value = true
};
return v3.createReducer(v10, {
    [v6.name] = function(v11, v12) --[[ Line: 28 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v13 = v11._coreGuiEnabled and not v11._devTextBoxEnabled and v12.enabled;
        return l_Dictionary_0.join(v11, {
            _propertyEnabled = v12.enabled, 
            value = v13
        });
    end, 
    [v7.name] = function(v14, v15) --[[ Line: 37 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v16 = v14._propertyEnabled and not v14._devTextBoxEnabled and v15.enabled;
        return l_Dictionary_0.join(v14, {
            _coreGuiEnabled = v15.enabled, 
            value = v16
        });
    end, 
    [v9.name] = function(v17, v18) --[[ Line: 46 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v19 = v17._coreGuiEnabled and v18.enabled;
        return l_Dictionary_0.join(v17, {
            _devTextBoxEnabled = v18.enabled, 
            value = v19
        });
    end, 
    [l_ClientAppLoaded_0.name] = function(v20, v21) --[[ Line: 55 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v22 = (not not v20._propertyEnabled or v20._devTextBoxEnabled) and v21.isChatCoreGuiEnabled;
        return l_Dictionary_0.join(v20, {
            _coreGuiEnabled = v21.isChatCoreGuiEnabled, 
            value = v22
        });
    end
});