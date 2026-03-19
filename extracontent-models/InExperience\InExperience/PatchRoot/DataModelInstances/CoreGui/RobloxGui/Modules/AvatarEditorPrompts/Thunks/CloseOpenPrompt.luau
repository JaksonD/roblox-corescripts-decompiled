local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.CloseOpenPrompt);
local v4 = require(l_Parent_0.PromptType);
local l_FFlagAXAvatarTimeoutFlowIE_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE;
return function(v6) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), l_AvatarEditorService_0 (copy), l_FFlagAXAvatarTimeoutFlowIE_0 (copy), v3 (copy)
    local l_promptType_0 = v6:getState().promptInfo.promptType;
    if l_promptType_0 == v4.AllowInventoryReadAccess then
        l_AvatarEditorService_0:SetAllowInventoryReadAccess(false);
    elseif l_promptType_0 == v4.SaveAvatar then
        l_AvatarEditorService_0:SignalSaveAvatarPermissionDenied();
    elseif l_promptType_0 == v4.CreateOutfit then
        l_AvatarEditorService_0:SignalCreateOutfitPermissionDenied();
    elseif l_promptType_0 == v4.EnterOutfitName then
        l_AvatarEditorService_0:SignalCreateOutfitPermissionDenied();
    elseif l_promptType_0 == v4.SetFavorite then
        l_AvatarEditorService_0:SignalSetFavoritePermissionDenied();
    elseif l_promptType_0 == v4.DeleteOutfit then
        l_AvatarEditorService_0:SignalDeleteOutfitPermissionDenied();
    elseif l_promptType_0 == v4.RenameOutfit then
        l_AvatarEditorService_0:SignalRenameOutfitPermissionDenied();
    elseif l_promptType_0 == v4.UpdateOutfit then
        l_AvatarEditorService_0:SignalUpdateOutfitPermissionDenied();
    elseif l_FFlagAXAvatarTimeoutFlowIE_0 and l_promptType_0 == v4.SaveAvatarTimeout then
        l_AvatarEditorService_0:SignalSaveAvatarPermissionDenied();
    elseif l_promptType_0 ~= nil then
        error("CloseOpenPrompt for unhandled prompt type " .. tostring(l_promptType_0));
    end;
    v6:dispatch(v3());
end;