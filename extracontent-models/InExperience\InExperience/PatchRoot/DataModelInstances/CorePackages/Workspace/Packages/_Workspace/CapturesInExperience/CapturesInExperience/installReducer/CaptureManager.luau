local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.Cryo);
local _ = require(l_Parent_0.Types);
local v5 = require(l_Parent_0.Actions.CapturesRetrieved);
local v6 = require(l_Parent_0.Actions.CaptureManagerClosed);
local v7 = require(l_Parent_0.Actions.CaptureManagerOpened);
local v8 = require(l_Parent_0.Actions.UpdateSelectedCaptures);
local v9 = {
    IsOpen = false, 
    SelectedCaptures = {}
};
return v2.createReducer(v9, {
    [v6.name] = function(v10, _) --[[ Line: 24 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v10, {
            IsOpen = false, 
            SelectedCaptures = {}
        });
    end, 
    [v7.name] = function(v12, _) --[[ Line: 31 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v12, {
            IsOpen = true
        });
    end, 
    [v5.name] = function(v14, v15) --[[ Line: 37 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v14, {
            IsOpen = v14.IsOpen and #v15.captures > 0, 
            SelectedCaptures = {}
        });
    end, 
    [v8.name] = function(v16, v17) --[[ Line: 44 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v16, {
            SelectedCaptures = v17.selectedCaptures
        });
    end
});