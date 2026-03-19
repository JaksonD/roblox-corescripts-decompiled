local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Players_0 = game:GetService("Players");
return function(v2, v3) --[[ Line: 10 ]] --[[ Name: applyOutfit ]]
    -- upvalues: l_Players_0 (copy), l_AvatarEditorService_0 (copy)
    local v4 = nil;
    v4 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:GetHumanoidDescriptionFromOutfitIdAsync(v2) else l_Players_0:GetHumanoidDescriptionFromOutfitId(v2);
    local v5 = {
        BodyColors = true, 
        AvatarType = true, 
        Scales = true, 
        Assets = true
    };
    l_AvatarEditorService_0:NoPromptSaveAvatar(v4, v3, v5);
    l_AvatarEditorService_0.PromptSaveAvatarCompleted:Wait();
end;