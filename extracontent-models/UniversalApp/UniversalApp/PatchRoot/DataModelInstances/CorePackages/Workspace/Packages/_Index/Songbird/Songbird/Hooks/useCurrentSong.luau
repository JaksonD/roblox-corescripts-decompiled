local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.AssetFavorites);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactSceneUnderstanding);
local v5 = require(l_script_FirstAncestor_0.Hooks.useAudioMetadata);
local v6 = require(l_script_FirstAncestor_0.Common.getAssetIdForAudioSource);
local _ = require(l_script_FirstAncestor_0.types);
local v8 = require(l_script_FirstAncestor_0.logger);
local v9 = require(l_script_FirstAncestor_0.Analytics.AnalyticActions);
local v10 = require(l_script_FirstAncestor_0.Analytics.sendChromeWindowAnalytics);
local l_useMemo_0 = v3.useMemo;
local l_useAudibleSounds_0 = v4.useAudibleSounds;
local l_useAssetFavoriting_0 = v1.useAssetFavoriting;
return function() --[[ Line: 21 ]] --[[ Name: useCurrentSong ]]
    -- upvalues: l_useAudibleSounds_0 (copy), l_useMemo_0 (copy), v2 (copy), v6 (copy), v5 (copy), l_useAssetFavoriting_0 (copy), v8 (copy), v10 (copy), v9 (copy)
    local v14 = l_useAudibleSounds_0();
    local v16 = l_useMemo_0(function() --[[ Line: 30 ]]
        -- upvalues: v2 (ref), v14 (copy), v6 (ref)
        return v2.List.filter(v14, function(v15) --[[ Line: 31 ]]
            -- upvalues: v6 (ref)
            return v6(v15) ~= nil;
        end);
    end, {
        v14
    });
    local v18 = l_useMemo_0(function() --[[ Line: 36 ]]
        -- upvalues: v2 (ref), v16 (copy), v6 (ref)
        return v2.List.map(v16, function(v17) --[[ Line: 37 ]]
            -- upvalues: v6 (ref)
            return v6(v17);
        end);
    end, {
        v16
    });
    local v19 = v5(v18);
    local v20 = l_useAssetFavoriting_0(v18);
    return (l_useMemo_0(function() --[[ Line: 47 ]]
        -- upvalues: v8 (ref), v16 (copy), v6 (ref), v19 (copy), v20 (copy), v10 (ref), v9 (ref)
        v8:info((("determining currently playing song from %* audio sources..."):format(#v16)));
        for _, v22 in v16 do
            local v23 = v6(v22);
            if v23 then
                local v24 = v19.getByAssetId(v23);
                local v25 = true;
                v8:info((("processing audio source: %* (AssetId: %*, Path: %*)"):format(v22, v23, (v22:GetFullName()))));
                if not v24 then
                    v8:warning("no metadata found. skipping...");
                elseif v24.AudioType then
                    if v24.AudioType == Enum.AudioSubType.Music then
                        v8:debug((("%* is classified as music. checking if it meets criteria..."):format(v24.Title)));
                        if not v24.RecordingCode or v24.RecordingCode == "" then
                            v8:debug((("%* does not meet criteria (no recording code found)"):format(v24.Title)));
                            v25 = false;
                        end;
                        if v25 then
                            v8:info((("%* meets criteria"):format(v24.Title)));
                        end;
                        local function v28() --[[ Line: 93 ]] --[[ Name: toggleFavorite ]]
                            -- upvalues: v20 (ref), v23 (copy), v10 (ref), v9 (ref), v8 (ref)
                            return v20.toggleFavorite(v23):andThen(function(v26) --[[ Line: 96 ]]
                                -- upvalues: v10 (ref), v23 (ref), v9 (ref)
                                if v26 then
                                    v10({
                                        assetId = v23, 
                                        action = v9.Like
                                    });
                                    return;
                                else
                                    v10({
                                        assetId = v23, 
                                        action = v9.Unlike
                                    });
                                    return;
                                end;
                            end):catch(function(v27) --[[ Line: 103 ]]
                                -- upvalues: v8 (ref)
                                v8:warning(v27);
                            end);
                        end;
                        return {
                            sound = v22, 
                            metadata = v24, 
                            meetsCriteria = v25, 
                            isFavorited = v20.getByAssetId(v23), 
                            toggleFavorite = v28
                        };
                    else
                        v8:debug((("%* is not classified as music. instead classified as: %*. skipping..."):format(v24.Title, v24.AudioType.Name)));
                    end;
                else
                    v8:debug((("%* has no AudioSubType classification. skipping..."):format(v24.Title)));
                end;
            end;
        end;
        return nil;
    end, {
        v19.getByAssetId, 
        v16, 
        v20.getByAssetId, 
        v20.toggleFavorite
    }));
end;