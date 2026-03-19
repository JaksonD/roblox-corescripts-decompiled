local l_Parent_0 = script:FindFirstAncestor("CameraOptIn").Parent;
local v1 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.LuauPolyfill);
local l_default_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol.default;
local v4 = nil;
return function() --[[ Line: 16 ]]
    -- upvalues: v4 (ref), v1 (copy), l_default_0 (copy)
    local v5 = if v4 ~= nil then v4:getStatus() else nil;
    if v4 and v5 ~= v1.Status.Cancelled then
        return v4;
    else
        v4 = l_default_0:hasPermissions({
            l_default_0.Permissions.CAMERA_ACCESS
        }):andThen(function(v6) --[[ Line: 23 ]]
            -- upvalues: l_default_0 (ref), v1 (ref)
            if v6.status == l_default_0.Status.AUTHORIZED then
                return v1.resolve(true);
            else
                return l_default_0:requestPermissions({
                    l_default_0.Permissions.CAMERA_ACCESS
                }):andThen(function(v7) --[[ Line: 31 ]]
                    -- upvalues: v1 (ref), l_default_0 (ref)
                    return v1.resolve(v7.status == l_default_0.Status.AUTHORIZED);
                end, function(v8) --[[ Line: 34 ]]
                    -- upvalues: v1 (ref)
                    return v1.reject(v8);
                end);
            end;
        end);
        return v4;
    end;
end;