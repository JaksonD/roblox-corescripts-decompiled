local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(l_script_FirstAncestor_0.RoduxSquads);
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local v5 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v6 = require(l_script_FirstAncestor_0.Thunks.fetchActiveSquad);
local v7 = require(l_script_FirstAncestor_0.Hooks.useCurrentSquadId);
local v8 = require(l_script_FirstAncestor_0.Common.validateSquadId);
local v9 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v9.useEffect;
return function() --[[ Line: 18 ]]
    -- upvalues: l_useDispatch_0 (copy), v7 (copy), v9 (copy), v5 (copy), l_AppStorageService_0 (copy), v4 (copy), l_useEffect_0 (copy), v8 (copy), v6 (copy), v3 (copy)
    local v12 = l_useDispatch_0();
    local v13 = v7() or "";
    local v14, v15 = v9.useState(false);
    local v16 = v9.useContext(v5).useIsChatEnabled();
    v9.useEffect(function() --[[ Line: 27 ]]
        -- upvalues: v14 (copy), l_AppStorageService_0 (ref), v4 (ref), v13 (copy)
        if v14 then
            l_AppStorageService_0:SetItem(v4.ACTIVE_SQUAD_APP_STORAGE_KEY, v13);
            l_AppStorageService_0:Flush();
        end;
    end, {
        v13, 
        v14
    });
    l_useEffect_0(function() --[[ Line: 35 ]]
        -- upvalues: v16 (copy), l_AppStorageService_0 (ref), v4 (ref), v8 (ref), v13 (copy), v12 (copy), v6 (ref), v3 (ref), v15 (copy)
        if not v16 then
            return;
        else
            local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v4.ACTIVE_SQUAD_APP_STORAGE_KEY);
            local v18 = v8(l_l_AppStorageService_0_Item_0);
            if v18 and v13 == "" then
                v12(v6());
            elseif l_l_AppStorageService_0_Item_0 ~= "" and not v18 or v13 ~= "" and v13 ~= l_l_AppStorageService_0_Item_0 then
                v12(v3.Actions.CurrentSquadUpdated(nil));
                l_AppStorageService_0:SetItem(v4.ACTIVE_SQUAD_APP_STORAGE_KEY, "");
                l_AppStorageService_0:Flush();
            end;
            v15(true);
            return;
        end;
    end, {
        v16
    });
    return nil;
end;