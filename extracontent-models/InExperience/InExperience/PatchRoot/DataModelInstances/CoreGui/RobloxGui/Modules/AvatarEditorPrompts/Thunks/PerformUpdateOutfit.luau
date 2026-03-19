local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.CloseOpenPrompt);
local v3 = require(l_Parent_0.GetConformedHumanoidDescription);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), l_AvatarEditorService_0 (copy), v2 (copy)
    local l_humanoidDescription_0 = v4:getState().promptInfo.humanoidDescription;
    v3(l_humanoidDescription_0, false):andThen(function(v6) --[[ Line: 12 ]]
        -- upvalues: l_AvatarEditorService_0 (ref)
        l_AvatarEditorService_0:PerformUpdateOutfit(v6);
    end, function(_) --[[ Line: 14 ]]
        -- upvalues: l_AvatarEditorService_0 (ref)
        l_AvatarEditorService_0:SignalUpdateOutfitFailed();
    end);
    v4:dispatch(v2());
end;