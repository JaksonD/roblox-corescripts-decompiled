local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.ChatInputBarConfigurationEnabled);
local v7 = require(l_Actions_0.ChatTopBarButtonActivated);
local v8 = require(l_Actions_0.SetCoreGuiEnabledChanged);
local l_ClientAppLoaded_0 = v2.Actions.ClientAppLoaded;
local v10 = require(l_Actions_0.DevTextBoxEnabledChanged);
local v11 = {
    _propertyEnabled = true, 
    _coreGuiEnabled = true, 
    _topBarVisibility = true, 
    _devTextBoxEnabled = false, 
    value = true
};
return v3.createReducer(v11, {
    [v6.name] = function(v12, v13) --[[ Line: 31 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v14 = v12._topBarVisibility and v12._coreGuiEnabled and not v12._devTextBoxEnabled and v13.enabled;
        return l_Dictionary_0.join(v12, {
            _propertyEnabled = v13.enabled, 
            value = v14
        });
    end, 
    [v7.name] = function(v15, v16) --[[ Line: 43 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v17 = v15._propertyEnabled and v15._coreGuiEnabled and not v15._devTextBoxEnabled and v16.isVisible;
        return l_Dictionary_0.join(v15, {
            _topBarVisibility = v16.isVisible, 
            value = v17
        });
    end, 
    [v8.name] = function(v18, v19) --[[ Line: 55 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v20 = v18._propertyEnabled and v18._topBarVisibility and not v18._devTextBoxEnabled and v19.enabled;
        return l_Dictionary_0.join(v18, {
            _coreGuiEnabled = v19.enabled, 
            value = v20
        });
    end, 
    [v10.name] = function(v21, v22) --[[ Line: 67 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v21, {
            _devTextBoxEnabled = v22.enabled, 
            value = v21._propertyEnabled and v21._topBarVisibility and v21._coreGuiEnabled and not v22.enabled
        });
    end, 
    [l_ClientAppLoaded_0.name] = function(v23, v24) --[[ Line: 74 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v25 = v23._propertyEnabled and v23._topBarVisibility and not v23._devTextBoxEnabled and v24.isChatCoreGuiEnabled;
        return l_Dictionary_0.join(v23, {
            _coreGuiEnabled = v24.isChatCoreGuiEnabled, 
            value = v25
        });
    end
});