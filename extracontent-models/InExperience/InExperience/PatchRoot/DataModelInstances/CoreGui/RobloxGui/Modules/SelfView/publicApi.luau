local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.SelfView.selfViewVisibilityUpdatedSignal);
local v2 = false;
return {
    getSelfViewIsOpenAndVisible = function() --[[ Line: 8 ]] --[[ Name: getSelfViewIsOpenAndVisible ]]
        -- upvalues: v2 (ref)
        return v2;
    end, 
    setSelfViewIsOpenAndVisible = function(v3) --[[ Line: 14 ]] --[[ Name: setSelfViewIsOpenAndVisible ]]
        -- upvalues: v2 (ref), v1 (copy)
        v2 = v3;
        v1:fire();
    end
};