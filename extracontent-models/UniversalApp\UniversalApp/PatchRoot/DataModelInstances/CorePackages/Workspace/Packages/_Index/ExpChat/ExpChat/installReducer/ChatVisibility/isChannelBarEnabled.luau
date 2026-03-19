local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.ChannelTabsConfigurationEnabled);
local v7 = require(l_Actions_0.ChatTopBarButtonActivated);
local v8 = require(l_Actions_0.SetCoreGuiEnabledChanged);
local l_ClientAppLoaded_0 = v2.Actions.ClientAppLoaded;
local v10 = {
    _propertyEnabled = false, 
    _coreGuiEnabled = true, 
    _topBarVisibility = true, 
    value = false
};
return v3.createReducer(v10, {
    [v6.name] = function(v11, v12) --[[ Line: 29 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v11, {
            _propertyEnabled = v12.enabled, 
            value = v11._topBarVisibility and v11._coreGuiEnabled and v12.enabled
        });
    end, 
    [v7.name] = function(v13, v14) --[[ Line: 36 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v13, {
            _topBarVisibility = v14.isVisible, 
            value = v13._propertyEnabled and v13._coreGuiEnabled and v14.isVisible
        });
    end, 
    [v8.name] = function(v15, v16) --[[ Line: 43 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v15, {
            _coreGuiEnabled = v16.enabled, 
            value = v15._propertyEnabled and v15._topBarVisibility and v16.enabled
        });
    end, 
    [l_ClientAppLoaded_0.name] = function(v17, v18) --[[ Line: 50 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v17, {
            _coreGuiEnabled = v18.isChatCoreGuiEnabled, 
            value = v17._propertyEnabled and v17._topBarVisibility and v18.isChatCoreGuiEnabled
        });
    end
});