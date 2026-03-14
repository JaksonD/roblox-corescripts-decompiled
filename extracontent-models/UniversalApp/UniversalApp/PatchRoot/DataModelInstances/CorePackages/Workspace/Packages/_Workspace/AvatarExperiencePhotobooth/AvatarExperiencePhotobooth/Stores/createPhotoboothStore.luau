local l_Parent_0 = script:FindFirstAncestor("AvatarExperiencePhotobooth").Parent;
local v1 = require(l_Parent_0.Signals);
return function() --[[ Line: 19 ]] --[[ Name: createPhotoboothStore ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.createSignal("");
    return {
        getSelectedSceneId = v2, 
        selectScene = function(v4) --[[ Line: 22 ]] --[[ Name: selectScene ]]
            -- upvalues: v3 (copy)
            v3(v4);
        end, 
        clearSelection = function() --[[ Line: 26 ]] --[[ Name: clearSelection ]]
            -- upvalues: v3 (copy)
            v3("");
        end
    };
end;