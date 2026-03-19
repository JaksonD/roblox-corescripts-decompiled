local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.OpenPrompt);
local v3 = require(l_Parent_0.Network.GetOutfitName);
local v4 = require(l_Parent_0.PromptType);
return function(v5, v6, v7) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), l_AvatarEditorService_0 (copy)
    return function(v8) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v5 (copy), v2 (ref), v4 (ref), v6 (copy), v7 (copy), l_AvatarEditorService_0 (ref)
        v3(v5):andThen(function(v9) --[[ Line: 12 ]]
            -- upvalues: v8 (copy), v2 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref)
            v8:dispatch(v2(v4.UpdateOutfit, {
                outfitId = v5, 
                outfitName = v9, 
                humanoidDescription = v6, 
                rigType = v7
            }));
        end, function(_) --[[ Line: 19 ]]
            -- upvalues: l_AvatarEditorService_0 (ref)
            l_AvatarEditorService_0:SignalUpdateOutfitFailed();
        end);
    end;
end;