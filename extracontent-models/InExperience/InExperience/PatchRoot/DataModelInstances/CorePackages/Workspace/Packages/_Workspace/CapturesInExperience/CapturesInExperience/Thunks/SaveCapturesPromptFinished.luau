local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Actions.PromptDismissed);
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_CaptureService_0 (copy)
    return function(v5) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v3 (copy), l_CaptureService_0 (ref), v4 (copy)
        v5:dispatch(v2(v3));
        l_CaptureService_0:OnSavePromptFinished(v3, v4);
    end;
end;