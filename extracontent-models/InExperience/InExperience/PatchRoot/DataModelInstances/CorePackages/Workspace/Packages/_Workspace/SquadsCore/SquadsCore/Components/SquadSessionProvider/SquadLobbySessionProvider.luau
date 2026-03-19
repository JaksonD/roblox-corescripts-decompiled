local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SessionService_0 = game:GetService("SessionService");
local v3 = require(l_script_FirstAncestor_0.Logger);
local v4 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v5 = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local v6 = require(l_script_FirstAncestor_0.Enums.SquadRootViewType);
local v7 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadViewFlags);
local v8 = require(l_Parent_0.React);
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local v10 = v8.createContext({
    updateMetadata = function() --[[ Line: 29 ]] --[[ Name: updateMetadata ]]

    end
});
return {
    Context = v10, 
    Provider = function(v11) --[[ Line: 32 ]]
        -- upvalues: v8 (copy), v4 (copy), v5 (copy), l_SessionType_0 (copy), v7 (copy), v6 (copy), l_SessionService_0 (copy), v3 (copy), v10 (copy)
        local v12 = v8.useContext(v4);
        local v13 = v12.useSquadViewFlags();
        local v14 = v12.useSquadRootView();
        local v15 = if v12.squadLocation == v5.InExperience then l_SessionType_0.StructuralIdentifier.SquadLobbyPageInExpSessionInfo else l_SessionType_0.StructuralIdentifier.SquadLobbyPageUASessionInfo;
        local v16 = false;
        if bit32.band(v13, v7.SquadLobby) ~= 0 then
            v16 = v14 ~= v6.None;
        end;
        local v18 = v8.useCallback(function() --[[ Line: 44 ]]
            -- upvalues: l_SessionType_0 (ref), l_SessionService_0 (ref), v15 (copy)
            local l_Level1_0 = l_SessionType_0.StructuralIdentifier.Level1;
            if l_Level1_0 and l_SessionService_0:SessionExists(l_Level1_0) and not l_SessionService_0:SessionExists(v15) then
                l_SessionService_0:SetSession(l_Level1_0, v15, v15);
            end;
        end, {
            v15, 
            v12.squadLocation
        });
        local v19 = v8.useCallback(function() --[[ Line: 52 ]]
            -- upvalues: l_SessionService_0 (ref), v15 (copy)
            if l_SessionService_0:SessionExists(v15) then
                l_SessionService_0:RemoveSession(v15);
            end;
        end, {
            v15
        });
        local v22 = v8.useCallback(function(v20, v21) --[[ Line: 58 ]]
            -- upvalues: l_SessionService_0 (ref), v15 (copy), v3 (ref)
            if l_SessionService_0:SessionExists(v15) then
                l_SessionService_0:SetMetadata(v15, v20, v21);
                return;
            else
                v3:warning("Squad {} session does not exist, cannot update metadata with key {}, value {}", v15, v20, v21);
                return;
            end;
        end, {
            v15
        });
        v8.useEffect(function() --[[ Line: 71 ]]
            -- upvalues: v16 (copy), v18 (copy), v19 (copy)
            if v16 then
                v18();
                return function() --[[ Line: 75 ]]
                    -- upvalues: v19 (ref)
                    v19();
                end;
            else
                return function() --[[ Line: 80 ]]

                end;
            end;
        end, {
            v16, 
            v18, 
            v19
        });
        return v8.createElement(v10.Provider, {
            value = {
                updateMetadata = v22
            }
        }, v11.children);
    end
};