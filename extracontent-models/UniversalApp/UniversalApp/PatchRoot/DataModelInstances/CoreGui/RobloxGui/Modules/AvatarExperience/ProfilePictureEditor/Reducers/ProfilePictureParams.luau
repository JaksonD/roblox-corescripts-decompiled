local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v5 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetEmoteAssetId);
local v6 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetFieldOfViewDeg);
local v7 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetLastSuccessfulPoseEmoteAssetId);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.CompletePPEEmoteLoading);
local v9 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.StartPPEEmoteLoading);
local v10 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.IncrementPPEVersion);
local v11 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v12 = require(l_Modules_0.LuaApp.mutedError);
return v2.createReducer({
    lastSuccessfulPoseEmoteAssetId = nil, 
    emoteAssetId = nil, 
    fieldOfViewDeg = nil, 
    ppeVersion = {
        [v11.Closeup] = 0, 
        [v11.FullBody] = 0
    }, 
    ppeEmoteLoadingCount = 0
}, {
    [v9.name] = function(v13, _) --[[ Line: 47 ]]
        -- upvalues: v3 (copy)
        local v15 = v13.ppeEmoteLoadingCount + 1;
        return v3.Dictionary.join(v13, {
            ppeEmoteLoadingCount = v15
        });
    end, 
    [v8.name] = function(v16, _) --[[ Line: 54 ]]
        -- upvalues: v12 (copy), v3 (copy)
        local v18 = v16.ppeEmoteLoadingCount - 1;
        if v18 < 0 then
            v12("newPPEEmoteLoadingCount is less than 0");
        end;
        return v3.Dictionary.join(v16, {
            ppeEmoteLoadingCount = v18
        });
    end, 
    [v7.name] = function(v19, v20) --[[ Line: 64 ]]
        -- upvalues: v3 (copy)
        local v21 = v20.lastSuccessfulPoseEmoteAssetId or v3.None;
        return v3.Dictionary.join(v19, {
            lastSuccessfulPoseEmoteAssetId = v21
        });
    end, 
    [v5.name] = function(v22, v23) --[[ Line: 73 ]]
        -- upvalues: v3 (copy)
        local v24 = v23.emoteAssetId or v3.None;
        return v3.Dictionary.join(v22, {
            emoteAssetId = v24
        });
    end, 
    [v6.name] = function(v25, v26) --[[ Line: 79 ]]
        -- upvalues: v3 (copy)
        local v27 = v26.fieldOfViewDeg or v3.None;
        return v3.Dictionary.join(v25, {
            fieldOfViewDeg = v27
        });
    end, 
    [v10.name] = function(v28, v29) --[[ Line: 85 ]]
        -- upvalues: v3 (copy)
        local v30 = v3.Dictionary.join(v28.ppeVersion, {
            [v29.thumbnailType] = v28.ppeVersion[v29.thumbnailType] + 1
        });
        return v3.Dictionary.join(v28, {
            ppeVersion = v30
        });
    end
});