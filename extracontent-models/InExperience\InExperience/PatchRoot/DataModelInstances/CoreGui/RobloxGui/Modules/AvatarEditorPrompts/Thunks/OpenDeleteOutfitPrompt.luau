local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local _ = game:GetService("CorePackages");
local _ = game:GetService("HttpRbxApiService");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.OpenPrompt);
local v5 = require(l_Parent_0.Network.GetOutfitName);
local v6 = require(l_Parent_0.PromptType);
return function(v7) --[[ Line: 16 ]]
    -- upvalues: v5 (copy), v4 (copy), v6 (copy), l_AvatarEditorService_0 (copy)
    return function(v8) --[[ Line: 17 ]]
        -- upvalues: v5 (ref), v7 (copy), v4 (ref), v6 (ref), l_AvatarEditorService_0 (ref)
        v5(v7):andThen(function(v9) --[[ Line: 18 ]]
            -- upvalues: v8 (copy), v4 (ref), v6 (ref), v7 (ref)
            v8:dispatch(v4(v6.DeleteOutfit, {
                outfitId = v7, 
                outfitName = v9
            }));
        end, function(_) --[[ Line: 23 ]]
            -- upvalues: l_AvatarEditorService_0 (ref)
            l_AvatarEditorService_0:SignalDeleteOutfitFailed();
        end);
    end;
end;