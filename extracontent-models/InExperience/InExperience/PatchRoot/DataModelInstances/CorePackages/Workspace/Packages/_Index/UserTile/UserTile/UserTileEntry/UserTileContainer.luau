local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.DataHydration);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v7 = require(l_Parent_0.Signals);
local v8 = require(l_script_FirstAncestor_0.Components.UserTile);
local _ = require(script.Parent.Parent.Enums.LayoutMode);
local v10 = game:DefineFastFlag("TCIndicatorHydration", false);
local v11 = if v10 then v5.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v12) --[[ Line: 47 ]] --[[ Name: UserTileContainer ]]
    -- upvalues: v10 (copy), v2 (copy), v7 (copy), v11 (copy), l_useSignalState_0 (copy), v4 (copy), v8 (copy)
    local v13 = nil;
    if v10 then
        local v15 = v2.useMemo(function() --[[ Line: 50 ]]
            -- upvalues: v7 (ref), v12 (copy), v11 (ref)
            return v7.createComputed(function(v14) --[[ Line: 51 ]]
                -- upvalues: v12 (ref), v11 (ref)
                if v12.userId and v12.userId ~= "" then
                    return (v11.getIsTrustedConnection(v12.userId).data(v14));
                else
                    return nil;
                end;
            end);
        end, {
            v12.userId
        });
        v13 = l_useSignalState_0(v15);
    end;
    local v16 = if v10 then v2.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v4 (ref), v12 (copy), v13 (ref)
        return v4.Dictionary.join(v12 or {}, {
            isTrustedConnection = v13
        });
    end, {
        v12, 
        v13
    }) else table.clone(v12);
    return v2.createElement(v8, v16);
end;