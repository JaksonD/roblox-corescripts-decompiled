local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceNavigation").Parent;
local v1 = require(l_Parent_0.t);
local v2 = require(script.Parent.RouteInfo);
local _ = require(script.Parent.Types);
local v4 = {};
v4.__index = v4;
v4.maxPreviousCount = 2;
v4.Interface = v1.strictInterface({
    current = v2.Interface, 
    previousPages = v1.optional(v1.array(v2.Interface)), 
    opaque = v2.Interface, 
    isVisible = v1.boolean, 
    isOverlayVisible = v1.boolean
});
v4.new = function(v5) --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v6 = {
        current = v5.current or v2.EMPTY, 
        previousPages = v5.previousPages or {}, 
        opaque = v5.opaque or v2.EMPTY, 
        isVisible = v5.isVisible or false, 
        isOverlayVisible = v5.isOverlayVisible or false
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.__tostring = function(v7) --[[ Line: 52 ]] --[[ Name: __tostring ]]
    local l_current_0 = v7.current;
    local l_opaque_0 = v7.opaque;
    local v10 = (("AvatarRoute[" .. (v7.isVisible and "Visible" or "Not Visible")) .. (v7.isOverlayVisible and " *Overlay" or "")) .. ", " .. tostring(l_current_0);
    if l_current_0.name ~= l_opaque_0.name then
        v10 = v10 .. ", opaque: " .. tostring(l_opaque_0);
    end;
    return v10 .. "]";
end;
v4.__eq = function(v11, v12) --[[ Line: 67 ]] --[[ Name: __eq ]]
    if not v11 or not v12 then
        return false;
    elseif rawequal(v11, v12) then
        return true;
    else
        local v13 = false;
        if v11.isVisible == v12.isVisible then
            v13 = false;
            if v11.isOverlayVisible == v12.isOverlayVisible then
                v13 = false;
                if v11.current == v12.current then
                    v13 = v11.opaque == v12.opaque;
                end;
            end;
        end;
        return v13;
    end;
end;
return v4;