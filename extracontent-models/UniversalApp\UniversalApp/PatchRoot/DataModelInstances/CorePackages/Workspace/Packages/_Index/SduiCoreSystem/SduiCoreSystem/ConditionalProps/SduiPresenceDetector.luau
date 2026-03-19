local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.ConditionalProps.SduiConditionalPropTypes);
local v6 = require(l_script_FirstAncestor_0.ConditionalProps.checkPresenceConditions);
return v2.memo(function(v7) --[[ Line: 13 ]] --[[ Name: SduiPresenceDetector ]]
    -- upvalues: v2 (copy), v6 (copy), v3 (copy)
    local l_allConditionalProps_0 = v7.allConditionalProps;
    local l_setFailedPresencePropIndexes_0 = v7.setFailedPresencePropIndexes;
    local l_getInGameFriendsByGame_0 = v7.sduiContext.dataStore.social.getInGameFriendsByGame;
    v2.useLayoutEffect(function() --[[ Line: 24 ]]
        -- upvalues: v6 (ref), l_allConditionalProps_0 (copy), l_setFailedPresencePropIndexes_0 (copy), l_getInGameFriendsByGame_0 (copy), v3 (ref)
        local v11 = {};
        local function v19(v12) --[[ Line: 27 ]] --[[ Name: checkConditions ]]
            -- upvalues: v6 (ref), l_allConditionalProps_0 (ref), v11 (ref), l_setFailedPresencePropIndexes_0 (ref)
            local v13 = v6(l_allConditionalProps_0, v12);
            local v14 = nil;
            for v15, v16 in v13 do
                if not not v11[v15] ~= not not v16 then
                    v14 = true;
                    break;
                end;
            end;
            if not v14 then
                for v17, v18 in v11 do
                    if not not v13[v17] ~= not not v18 then
                        v14 = true;
                        break;
                    end;
                end;
            end;
            if v14 then
                v11 = v13;
                l_setFailedPresencePropIndexes_0(v13);
            end;
        end;
        v19(l_getInGameFriendsByGame_0(false));
        return v3.createEffect(function(v20) --[[ Line: 54 ]]
            -- upvalues: v19 (copy), l_getInGameFriendsByGame_0 (ref)
            v19(l_getInGameFriendsByGame_0(v20));
        end);
    end, {
        l_getInGameFriendsByGame_0, 
        l_allConditionalProps_0, 
        l_setFailedPresencePropIndexes_0
    });
    return nil;
end);