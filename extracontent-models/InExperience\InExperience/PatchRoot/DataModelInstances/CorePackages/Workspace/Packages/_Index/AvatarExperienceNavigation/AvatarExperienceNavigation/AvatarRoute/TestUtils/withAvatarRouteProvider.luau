local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceNavigation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.AvatarRoute.Types);
local v4 = require(l_script_FirstAncestor_0.Enums.AvatarScreen);
local v5 = require(l_script_FirstAncestor_0.AvatarRoute.Context.AvatarRouteContext);
local v6 = require(l_script_FirstAncestor_0.AvatarRoute.AvatarRoute);
local function v9(v7) --[[ Line: 17 ]] --[[ Name: avatarRouteFromString ]]
    -- upvalues: v6 (copy)
    local v8 = {
        name = v7, 
        key = v7, 
        params = {}
    };
    return v6.new({
        current = v8, 
        previousPages = {
            v8
        }, 
        opaque = v8, 
        isVisible = true, 
        isOverlayVisible = false
    });
end;
local function v17(v10) --[[ Line: 32 ]] --[[ Name: avatarRouteFromTable ]]
    -- upvalues: v4 (copy), v6 (copy)
    v10 = v10 or {};
    local v11 = v10.current or {};
    local v12 = v10.previous or {};
    local v13 = v10.opaque or {};
    local v14 = v11.name or v4.None;
    local v15 = v12.name or v4.None;
    local v16 = v13.name or v4.None;
    return v6.new({
        current = {
            name = v14, 
            key = v11.key or v14, 
            params = v11.params or {}
        }, 
        previousPages = {
            {
                name = v15, 
                key = v12.key or v15, 
                params = v12.params or {}
            }
        }, 
        opaque = {
            name = v16, 
            key = v13.key or v16, 
            params = v13.params or {}
        }, 
        isVisible = v10.isVisible ~= false, 
        isOverlayVisible = v10.isOverlayVisible == true
    });
end;
return function(v18, v19) --[[ Line: 72 ]]
    -- upvalues: v9 (copy), v17 (copy), v2 (copy), v5 (copy)
    local v20 = if type(v19) == "string" then v9(v19) else v17(v19);
    return v2.forwardRef(function(v21, v22) --[[ Line: 77 ]]
        -- upvalues: v2 (ref), v5 (ref), v20 (copy), v18 (copy)
        local v23 = table.clone(v21);
        v23.ref = v22;
        return v2.createElement(v5.Provider, {
            value = v20
        }, {
            component = v2.createElement(v18, v23)
        });
    end);
end;