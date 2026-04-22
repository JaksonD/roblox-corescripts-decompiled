local l_script_FirstAncestor_0 = script:FindFirstAncestor("VideoUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_VideoEndReason_0 = require(l_script_FirstAncestor_0.Analytics.Enums).VideoEndReason;
return function(v4) --[[ Line: 14 ]] --[[ Name: VideoHoverPlaybackDetector ]]
    -- upvalues: v2 (copy), l_VideoEndReason_0 (copy)
    v2.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: v4 (copy), l_VideoEndReason_0 (ref)
        if v4.isHovered then
            v4.requestVideoPlayback(false);
            return;
        else
            v4.cancelVideoPlayback(l_VideoEndReason_0.Unhovered);
            return;
        end;
    end, {
        v4.isHovered, 
        v4.requestVideoPlayback, 
        v4.cancelVideoPlayback
    });
    return nil;
end;