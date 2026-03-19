local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageFinished);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v9 = require(l_Modules_0.AvatarExperience.Flags.FFlagAEGetEditableOutfitsType);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfits);
return function() --[[ Line: 20 ]]
    -- upvalues: v7 (copy), v3 (copy), v8 (copy), v4 (copy), v5 (copy), v2 (copy), v10 (copy), v9 (copy), v6 (copy)
    return function(v11) --[[ Line: 21 ]]
        -- upvalues: v7 (ref), v3 (ref), v8 (ref), v4 (ref), v5 (ref), v2 (ref), v10 (ref), v9 (ref), v6 (ref)
        local v12 = v11:getState();
        if v12.AvatarExperience.AvatarEditor.PageFinished[v7.CharacterKey] then
            local l_OutfitInfos_0 = v12.AvatarExperience.AvatarEditor.OutfitInfos;
            local v14 = v12.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[v7.CharacterKey];
            local v15 = true;
            v14 = v3.List.filter(v14, function(v16) --[[ Line: 35 ]]
                -- upvalues: l_OutfitInfos_0 (copy), v8 (ref), v15 (ref)
                local v17 = l_OutfitInfos_0[tostring(v16)];
                if v17 then
                    return not v8.isPresetOutfit(v17);
                else
                    v15 = false;
                    return false;
                end;
            end);
            if v15 then
                v11:dispatch(v4(v7.EditableCharacterKey, v14));
                v11:dispatch(v5(v7.EditableCharacterKey, true));
                return v2.resolve();
            else
                --[[ close >= 6 ]]
            end;
        end;
        return v11:dispatch(v10(v7.EditableCharacterKey, true, nil, if v9 then v6.OutfitTypes.Avatar else nil));
    end;
end;