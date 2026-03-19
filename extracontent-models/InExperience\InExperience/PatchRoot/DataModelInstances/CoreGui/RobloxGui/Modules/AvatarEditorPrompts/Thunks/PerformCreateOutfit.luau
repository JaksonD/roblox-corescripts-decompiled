local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.CloseOpenPrompt);
local v3 = require(l_Parent_0.GetConformedHumanoidDescription);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), l_AvatarEditorService_0 (copy), v2 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: v3 (ref), l_AvatarEditorService_0 (ref), v4 (copy), v2 (ref)
        local l_humanoidDescription_0 = v5:getState().promptInfo.humanoidDescription;
        v3(l_humanoidDescription_0, false):andThen(function(v7) --[[ Line: 13 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v4 (ref)
            l_AvatarEditorService_0:PerformCreateOutfitWithDescription(v7, v4);
        end, function(_) --[[ Line: 15 ]]
            -- upvalues: l_AvatarEditorService_0 (ref)
            l_AvatarEditorService_0:SignalCreateOutfitFailed();
        end);
        v5:dispatch(v2());
    end;
end;