local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Components.ChromeWindow);
local v3 = require(l_script_FirstAncestor_0.Hooks.useCurrentSong);
local v4 = require(l_script_FirstAncestor_0.Analytics.AnalyticActions);
local v5 = require(l_script_FirstAncestor_0.Analytics.sendChromeWindowAnalytics);
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useMemo_0 = v1.useMemo;
local v9 = require(l_script_FirstAncestor_0.Components.ReportAudioPopupContext);
return function(v10) --[[ Line: 25 ]] --[[ Name: ChromeWindowWrapper ]]
    -- upvalues: v3 (copy), v9 (copy), l_useMemo_0 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy), v5 (copy), v4 (copy), v1 (copy), v2 (copy)
    local v11 = v3();
    local v12 = v9.use();
    local v13 = l_useMemo_0(function() --[[ Line: 29 ]]
        -- upvalues: v11 (copy)
        if v11 then
            return (tonumber(v11.metadata.AssetId));
        else
            return nil;
        end;
    end, {
        v11
    });
    l_useEffect_0(function() --[[ Line: 33 ]]
        -- upvalues: v12 (copy), v13 (copy)
        v12.setAssetId(v13);
        return function() --[[ Line: 36 ]]
            -- upvalues: v12 (ref)
            v12.setAssetId(nil);
        end;
    end, {
        v13
    });
    local v14 = l_useCallback_0(function() --[[ Line: 41 ]]
        -- upvalues: v12 (copy), v5 (ref), v13 (copy), v4 (ref), v10 (copy)
        v12.setVisibility(true);
        v5({
            assetId = v13, 
            action = v4.OpenReport
        });
        if v10.onReport then
            v10.onReport();
        end;
    end, {
        v10.onClose, 
        v10.onReport
    });
    local v15 = l_useCallback_0(function() --[[ Line: 50 ]]
        -- upvalues: v11 (copy)
        if v11 then
            v11.toggleFavorite();
        end;
    end, {
        v11
    });
    return v1.createElement(v2, {
        song = if v11 then {
            title = v11.metadata.Title, 
            artists = {
                v11.metadata.Artist
            }, 
            isLiked = v11.isFavorited, 
            meetsCriteria = v11.meetsCriteria
        } else nil, 
        isFocused = v10.isFocused, 
        maxSize = v10.maxSize, 
        onToggleLike = v15, 
        onReport = v14, 
        onClose = v10.onClose, 
        onUnfocus = v10.onUnfocus
    });
end;