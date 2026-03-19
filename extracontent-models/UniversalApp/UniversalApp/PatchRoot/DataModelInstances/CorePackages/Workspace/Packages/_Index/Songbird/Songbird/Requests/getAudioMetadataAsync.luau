local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_AssetService_0 = game:GetService("AssetService");
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local _ = require(l_script_FirstAncestor_0.types);
return function(v4) --[[ Line: 12 ]] --[[ Name: getAudioMetadataAsync ]]
    -- upvalues: l_AssetService_0 (copy), v2 (copy)
    local l_l_AssetService_0_AudioMetadataAsync_0 = l_AssetService_0:GetAudioMetadataAsync(v4);
    return v2.List.map(l_l_AssetService_0_AudioMetadataAsync_0, function(v6) --[[ Line: 15 ]]
        local v7 = table.clone(v6);
        v7.AlbumArt = "rbxassetid://11204867732";
        return v7;
    end);
end;