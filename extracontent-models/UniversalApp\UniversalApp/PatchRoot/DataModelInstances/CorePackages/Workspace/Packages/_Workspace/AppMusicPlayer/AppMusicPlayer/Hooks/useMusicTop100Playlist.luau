local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppMusicPlayer");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.RoactUtils);
local v4 = require(l_script_FirstAncestor_0.Parent.TopicContentsRodux);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_TopicContentsReducer_0 = v4.TopicContentsReducer;
local l_useMemo_0 = v2.useMemo;
return function() --[[ Line: 13 ]] --[[ Name: useMusicTop100Playlist ]]
    -- upvalues: l_useSelector_0 (copy), l_TopicContentsReducer_0 (copy), l_useMemo_0 (copy), v1 (copy)
    local v12 = l_useSelector_0(function(v8) --[[ Line: 14 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref)
        local l_Personalization_0 = v8.Personalization;
        local v10 = if l_Personalization_0 then l_Personalization_0[l_TopicContentsReducer_0.key] else nil;
        local v11 = if v10 then v10["music-top-100"] else nil;
        if v11 then
            return v11.entries;
        else
            return nil;
        end;
    end);
    return (l_useMemo_0(function() --[[ Line: 21 ]]
        -- upvalues: v12 (copy), v1 (ref)
        if v12 then
            return v1.List.map(v12, function(v13) --[[ Line: 23 ]]
                return (tostring(v13.contentId));
            end);
        else
            return {};
        end;
    end, {
        v12
    }));
end;