local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local _ = require(l_Parent_1.Signals);
local l_useFocusGuiObject_0 = require(l_Parent_1.ReactFocusNavigation).useFocusGuiObject;
local v6 = require(l_Parent_0.Common.FocusNavHelper);
local _ = require(l_Parent_1.LeaderboardStore);
local v8 = require(l_Parent_0.Common.Constants);
return function() --[[ Line: 57 ]] --[[ Name: usePlayerListFocusNavigation ]]
    -- upvalues: l_useFocusGuiObject_0 (copy), v3 (copy), v6 (copy), v8 (copy), l_GuiService_0 (copy)
    local v9 = l_useFocusGuiObject_0();
    local v10 = v3.useRef(nil);
    local v11 = v3.useRef(nil);
    local v12 = v3.useRef({});
    local v16 = v3.useCallback(function(v13, v14) --[[ Line: 66 ]]
        -- upvalues: v6 (ref), v12 (copy), v9 (copy), v10 (copy)
        local v15 = v6.getNextPlayerInstance(v12.current, v13, v14);
        if v15 then
            v9(v15.object);
            return;
        else
            v9(v10.current);
            return;
        end;
    end, {});
    local v22 = v3.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v11 (copy), v8 (ref), v12 (copy), v9 (copy), v10 (copy), v6 (ref)
        if v11.current and v11.current ~= v8.SELECTED_TITLE_PLAYER_ID then
            for _, v18 in v12.current do
                for _, v20 in v18.players do
                    if v20.userId == v11.current then
                        v9(v20.object);
                        return;
                    end;
                end;
            end;
        end;
        if v10.current then
            v9(v10.current);
            return;
        else
            local v21 = v6.getFirstPlayerInstance(v12.current);
            if v21 then
                v9(v21.object);
            end;
            return;
        end;
    end, {});
    local v27 = v3.useCallback(function(v23) --[[ Line: 104 ]]
        -- upvalues: v12 (copy)
        return function(v24, v25, v26) --[[ Line: 105 ]]
            -- upvalues: v12 (ref), v23 (copy)
            if not v25 or not v12.current[v23] then
                return;
            else
                v12.current[v23].players[v24] = {
                    userId = v24, 
                    object = v25, 
                    order = v26
                };
                return;
            end;
        end;
    end, {});
    local v32 = v3.useCallback(function(v28) --[[ Line: 118 ]]
        -- upvalues: v12 (copy), l_GuiService_0 (ref), v16 (copy)
        return function(v29) --[[ Line: 119 ]]
            -- upvalues: v12 (ref), v28 (copy), l_GuiService_0 (ref), v16 (ref)
            local v30 = v12.current[v28];
            if not v30 then
                return;
            else
                local v31 = v30.players[v29];
                if not v31 then
                    return;
                else
                    if l_GuiService_0.SelectedCoreObject == v31.object then
                        v16(v31, v28);
                    end;
                    v12.current[v28].players[v29] = nil;
                    return;
                end;
            end;
        end;
    end, {});
    local v36 = v3.useCallback(function(v33, v34) --[[ Line: 138 ]]
        -- upvalues: v27 (copy), v32 (copy), v12 (copy)
        local v35 = {
            teamId = v33, 
            order = v34, 
            players = {}, 
            registerPlayerInstance = v27(v33), 
            unregisterPlayerInstance = v32(v33)
        };
        v12.current[v33] = v35;
        return v35;
    end, {});
    local v38 = v3.useCallback(function(v37) --[[ Line: 152 ]]
        -- upvalues: v12 (copy)
        v12.current[v37] = nil;
    end, {});
    local v40 = v3.useCallback(function(v39) --[[ Line: 156 ]]
        -- upvalues: v10 (copy)
        v10.current = v39;
    end, {});
    local v42 = v3.useCallback(function(v41) --[[ Line: 160 ]]
        -- upvalues: v11 (copy)
        v11.current = v41;
    end, {});
    local v44 = v3.useCallback(function(v43) --[[ Line: 164 ]]
        -- upvalues: v9 (copy), v10 (copy), v11 (copy), v12 (copy)
        if v43 then
            v9(nil);
        end;
        v10.current = nil;
        v11.current = nil;
        v12.current = {};
    end, {});
    return v3.useMemo(function() --[[ Line: 175 ]]
        -- upvalues: v22 (copy), v36 (copy), v38 (copy), v40 (copy), v42 (copy), v44 (copy)
        return {
            getFocus = v22, 
            registerTeamInstance = v36, 
            unregisterTeamInstance = v38, 
            setTitlePlayerInstance = v40, 
            setSelectedPlayerId = v42, 
            cleanup = v44
        };
    end, {
        v22, 
        v36, 
        v38, 
        v40, 
        v42, 
        v44
    });
end;