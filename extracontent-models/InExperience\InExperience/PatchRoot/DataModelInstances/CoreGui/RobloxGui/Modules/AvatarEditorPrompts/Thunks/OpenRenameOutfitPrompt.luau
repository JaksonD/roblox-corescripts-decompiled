local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.OpenPrompt);
local v3 = require(l_Parent_0.Network.GetOutfitName);
local v4 = require(l_Parent_0.PromptType);
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), l_AvatarEditorService_0 (copy)
    return function(v6) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v5 (copy), v2 (ref), v4 (ref), l_AvatarEditorService_0 (ref)
        v3(v5):andThen(function(v7) --[[ Line: 12 ]]
            -- upvalues: v6 (copy), v2 (ref), v4 (ref), v5 (ref)
            v6:dispatch(v2(v4.RenameOutfit, {
                outfitId = v5, 
                outfitName = v7
            }));
        end, function(_) --[[ Line: 17 ]]
            -- upvalues: l_AvatarEditorService_0 (ref)
            l_AvatarEditorService_0:SignalRenameOutfitFailed();
        end);
    end;
end;