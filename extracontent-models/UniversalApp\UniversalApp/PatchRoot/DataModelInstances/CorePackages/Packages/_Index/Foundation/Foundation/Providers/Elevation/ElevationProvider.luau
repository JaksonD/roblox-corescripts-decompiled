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
        local v26 = v2.useMemo(function() --[[ Line: 35 ]]
            -- upvalues: v4 (ref), v3 (ref), v9 (copy)
            return {
                acquire = v4.FoundationElevationKeepSiblingZIndex and function(v10, v11) --[[ Line: 38 ]]
                    -- upvalues: v3 (ref), v9 (ref)
                    local v12 = v3.ELEVATION_LAYERS[v10];
                    local v13 = -1;
                    local v14 = nil;
                    local v15 = true;
                    if v11.owner then
                        v14 = v11.owner.zIndex + 1;
                        v15 = v11.owner.zIndex <= v12.finish;
                    elseif v11.reserve then
                        local v16 = v9.current[v10] or 0;
                        v14 = v12.start + (v16 + 1) * v12.step;
                        v9.current[v10] = v16 + 1;
                        v13 = v16;
                    else
                        v14 = v12.start;
                    end;
                    if v15 and v12.finish < v14 then
                        warn(string.format("Layer '%s' capacity exceeded (%d/%d). Capping zIndex at %d.", tostring(v10), v14, v12.finish, v12.finish));
                        v14 = v12.finish;
                    end;
                    return {
                        layer = v10, 
                        index = v13, 
                        zIndex = v14
                    };
                end or function(v17) --[[ Line: 71 ]]
                    -- upvalues: v9 (ref), v3 (ref)
                    local v18 = v9.current[v17] or 0;
                    local v19 = v3.ELEVATION_LAYERS[v17];
                    local v20 = math.floor((v19.finish - v19.start) / v19.step) + 1;
                    if v18 == v20 then
                        warn(string.format("Layer '%s' capacity exceeded (%d/%d). Capping zIndex at %d.", tostring(v17), v18 + 1, v20, v19.finish));
                    end;
                    v9.current[v17] = v18 + 1;
                    local v21 = v19.start + v18 * v19.step;
                    if v19.finish < v21 then
                        v21 = v19.finish;
                    end;
                    return {
                        layer = v17, 
                        index = v18, 
                        zIndex = v21
                    };
                end, 
                peek = function(v22) --[[ Line: 99 ]] --[[ Name: peek ]]
                    -- upvalues: v9 (ref)
                    return v9.current[v22] or 0;
                end, 
                releaseIfTop = function(v23, v24) --[[ Line: 102 ]] --[[ Name: releaseIfTop ]]
                    -- upvalues: v9 (ref)
                    local v25 = v9.current[v23] or 0;
                    if v24 ~= nil and v24 >= 0 and v24 == v25 - 1 then
                        v9.current[v23] = v25 - 1;
                    end;
                end
            };
        end, {});
        return v2.createElement(v6.Provider, {
            value = v26
        }, v8.children);
    end, 
    ElevationOwnerScope = function(v27) --[[ Line: 117 ]] --[[ Name: ElevationOwnerScope ]]
        -- upvalues: v2 (copy), v7 (copy)
        return v2.createElement(v7.Provider, {
            value = v27.owner
        }, v27.children);
    end, 
    useElevationManager = function() --[[ Line: 121 ]] --[[ Name: useElevationManager ]]
        -- upvalues: v2 (copy), v6 (copy)
        local v28 = v2.useContext(v6);
        if not v28 then
            error("useElevationManager must be used under <ElevationProvider>");
        end;
        return v28;
    end, 
    useOwnerToken = function() --[[ Line: 131 ]] --[[ Name: useOwnerToken ]]
        -- upvalues: v2 (copy), v7 (copy)
        return (v2.useContext(v7));
    end
};