local l_script_FirstAncestor_0 = script:FindFirstAncestor("MediaPlayback");
local v1 = require(l_script_FirstAncestor_0.Parent.Signals);
local _ = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore.types);
local l_createSignal_0 = v1.createSignal;
return function() --[[ Line: 9 ]] --[[ Name: createPlaylistStore ]]
    -- upvalues: l_createSignal_0 (copy)
    local v4, v5 = l_createSignal_0({});
    local v6, v7 = l_createSignal_0({});
    local function _(v8, v9) --[[ Line: 13 ]] --[[ Name: getRelativeIndex ]]
        -- upvalues: v6 (copy), v4 (copy)
        local v10 = v6(false)[tostring(v8)];
        if v10 then
            return v4(false)[v10 + v9];
        else
            return nil;
        end;
    end;
    return {
        get = v4, 
        set = function(v12) --[[ Line: 22 ]] --[[ Name: set ]]
            -- upvalues: v5 (copy), v7 (copy)
            v5(v12);
            local v13 = {};
            for v14, v15 in v12 do
                v13[tostring(v15)] = v14;
            end;
            v7(v13);
        end, 
        getNext = function(v16) --[[ Line: 32 ]] --[[ Name: getNext ]]
            -- upvalues: v6 (copy), v4 (copy)
            local v17 = v6(false)[tostring(v16)];
            if v17 then
                return v4(false)[v17 + 1];
            else
                return nil;
            end;
        end, 
        getPrev = function(v18) --[[ Line: 36 ]] --[[ Name: getPrev ]]
            -- upvalues: v6 (copy), v4 (copy)
            local v19 = v6(false)[tostring(v18)];
            if v19 then
                return v4(false)[v19 + -1];
            else
                return nil;
            end;
        end
    };
end;