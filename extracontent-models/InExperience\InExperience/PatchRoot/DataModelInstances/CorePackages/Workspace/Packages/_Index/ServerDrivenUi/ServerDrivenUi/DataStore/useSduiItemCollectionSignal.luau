local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.RobloxAppEnums);
local _ = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.SignalsReact);
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.DataStore.getSduiFeedStore);
local v7 = require(l_script_FirstAncestor_0.DataStore.getItemCollectionKey);
local _ = require(l_script_FirstAncestor_0.DataStore.SduiFeedStoreTypes);
local l_FFlagLuaAppFixInlineSignalsReactPattern_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixInlineSignalsReactPattern;
return function(v10, v11, v12, v13) --[[ Line: 15 ]] --[[ Name: useSduiItemCollectionSignal ]]
    -- upvalues: v7 (copy), l_FFlagLuaAppFixInlineSignalsReactPattern_0 (copy), v5 (copy), v6 (copy), v4 (copy)
    local v14 = v7(v11, v12);
    local v15 = v13 or v10;
    local _ = nil;
    if l_FFlagLuaAppFixInlineSignalsReactPattern_0 then
        local v18 = v5.useCallback(function(v17) --[[ Line: 27 ]]
            -- upvalues: v6 (ref), v15 (copy), v14 (copy)
            return v6(v15).getItemCollection(v14, true)(v17);
        end, {
            v14, 
            v15
        });
        return (v4.useSignalState(v18));
    else
        return (v4.useSignalState(function(v19) --[[ Line: 40 ]]
            -- upvalues: v6 (ref), v15 (copy), v14 (copy)
            return v6(v15).getItemCollection(v14, true)(v19);
        end));
    end;
end;