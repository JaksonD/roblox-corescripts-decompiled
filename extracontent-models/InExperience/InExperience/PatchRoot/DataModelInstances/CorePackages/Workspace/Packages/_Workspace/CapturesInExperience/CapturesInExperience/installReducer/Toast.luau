local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_0.Enums.CapturesToastType);
local v5 = require(l_Parent_0.Actions.ToastDismissed);
local v6 = require(l_Parent_0.Actions.ToastTriggered);
local v7 = require(l_Parent_0.Actions.ToastVanished);
local _ = require(l_Parent_0.Types);
local v9 = {
    IsDismissed = false, 
    ToastType = v4.None, 
    ToastConfig = nil
};
return v3.createReducer(v9, {
    [v7.name] = function(v10, _) --[[ Line: 26 ]]
        -- upvalues: v4 (copy)
        if v10.ToastType == v4.None then
            return v10;
        else
            return {
                IsDismissed = false, 
                ToastType = v4.None
            };
        end;
    end, 
    [v5.name] = function(v12, _) --[[ Line: 37 ]]
        -- upvalues: v4 (copy), v2 (copy)
        if v12.IsDismissed then
            return v12;
        elseif v12.ToastType == v4.None then
            return v12;
        else
            return v2.join(v12, {
                IsDismissed = true
            });
        end;
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 51 ]]
        -- upvalues: v2 (copy)
        local v16 = v2.shallowEqual(v14.ToastConfig, v15.toastConfig);
        if v14.ToastType == v15.toastType and not v14.IsDismissed and v16 then
            return v14;
        else
            return {
                IsDismissed = false, 
                ToastType = v15.toastType, 
                ToastConfig = v15.toastConfig
            };
        end;
    end
});