local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.elevation);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local v5 = require(l_script_FirstAncestor_0.Enums.ElevationLayer);
local v6 = v2.createContext(nil);
local v7 = v2.createContext(nil);
return {
    ElevationProvider = function(v8) --[[ Line: 26 ]] --[[ Name: ElevationProvider ]]
        -- upvalues: v2 (copy), v5 (copy), v4 (copy), v3 (copy), v6 (copy)
        local v9 = v2.useRef({
            [v5.Popover] = 0, 
            [v5.Drawer] = 0, 
            [v5.Sheet] = 0, 
            [v5.Dialog] = 0, 
            [v5.Notification] = 0
        });
        local v25 = v2.useMemo(function() --[[ Line: 35 ]]
            -- upvalues: v4 (ref), v9 (copy), v3 (ref)
            return {
                acquire = v4.FoundationElevationKeepSiblingZIndex and function(v10, v11) --[[ Line: 38 ]]
                    -- upvalues: v9 (ref), v3 (ref)
                    local v12 = v9.current[v10] or 0;
                    local v13 = v3.ELEVATION_LAYERS[v10];
                    if not v11.reserve then
                        return {
                            layer = v10, 
                            index = -1, 
                            zIndex = v13.start
                        };
                    else
                        local v14 = v13.start + (v12 + 1) * v13.step;
                        if v13.finish < v14 then
                            warn(string.format("Layer '%s' capacity exceeded (%d/%d). Capping zIndex at %d.", tostring(v10), v14, v13.finish, v13.finish));
                        end;
                        v9.current[v10] = v12 + 1;
                        local l_v14_0 = v14;
                        if v13.finish < l_v14_0 then
                            l_v14_0 = v13.finish;
                        end;
                        return {
                            layer = v10, 
                            index = v12, 
                            zIndex = l_v14_0
                        };
                    end;
                end or function(v16) --[[ Line: 70 ]]
                    -- upvalues: v9 (ref), v3 (ref)
                    local v17 = v9.current[v16] or 0;
                    local v18 = v3.ELEVATION_LAYERS[v16];
                    local v19 = math.floor((v18.finish - v18.start) / v18.step) + 1;
                    if v17 == v19 then
                        warn(string.format("Layer '%s' capacity exceeded (%d/%d). Capping zIndex at %d.", tostring(v16), v17 + 1, v19, v18.finish));
                    end;
                    v9.current[v16] = v17 + 1;
                    local v20 = v18.start + v17 * v18.step;
                    if v18.finish < v20 then
                        v20 = v18.finish;
                    end;
                    return {
                        layer = v16, 
                        index = v17, 
                        zIndex = v20
                    };
                end, 
                peek = function(v21) --[[ Line: 98 ]] --[[ Name: peek ]]
                    -- upvalues: v9 (ref)
                    return v9.current[v21] or 0;
                end, 
                releaseIfTop = function(v22, v23) --[[ Line: 101 ]] --[[ Name: releaseIfTop ]]
                    -- upvalues: v9 (ref)
                    local v24 = v9.current[v22] or 0;
                    if v23 ~= nil and v23 >= 0 and v23 == v24 - 1 then
                        v9.current[v22] = v24 - 1;
                    end;
                end
            };
        end, {});
        return v2.createElement(v6.Provider, {
            value = v25
        }, v8.children);
    end, 
    ElevationOwnerScope = function(v26) --[[ Line: 116 ]] --[[ Name: ElevationOwnerScope ]]
        -- upvalues: v2 (copy), v7 (copy)
        return v2.createElement(v7.Provider, {
            value = v26.owner
        }, v26.children);
    end, 
    useElevationManager = function() --[[ Line: 120 ]] --[[ Name: useElevationManager ]]
        -- upvalues: v2 (copy), v6 (copy)
        local v27 = v2.useContext(v6);
        if not v27 then
            error("useElevationManager must be used under <ElevationProvider>");
        end;
        return v27;
    end, 
    useOwnerToken = function() --[[ Line: 130 ]] --[[ Name: useOwnerToken ]]
        -- upvalues: v2 (copy), v7 (copy)
        return (v2.useContext(v7));
    end
};