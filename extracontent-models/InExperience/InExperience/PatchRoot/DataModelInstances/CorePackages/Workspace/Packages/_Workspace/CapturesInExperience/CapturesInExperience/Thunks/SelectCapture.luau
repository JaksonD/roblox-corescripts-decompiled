local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.UpdateSelectedCaptures);
local v2 = require(l_Parent_0.Utils.getUpdatedSelectedCapturesArray);
local v3 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.Types);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return function(v6) --[[ Line: 10 ]]
        -- upvalues: v3 (ref), v1 (ref), v2 (ref), v5 (copy)
        local l_SelectedCaptures_0 = v6:getState()[v3.RoduxKey].CaptureManager.SelectedCaptures;
        v6:dispatch(v1(v2(l_SelectedCaptures_0, v5)));
    end;
end;