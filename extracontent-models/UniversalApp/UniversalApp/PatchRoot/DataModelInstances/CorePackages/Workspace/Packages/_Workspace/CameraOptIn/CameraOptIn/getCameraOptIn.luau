local l_Parent_0 = script:FindFirstAncestor("CameraOptIn").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v2 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.LuauPolyfill);
local v4 = nil;
return function(v5, v6) --[[ Line: 16 ]]
    -- upvalues: l_Url_0 (copy), v4 (ref), v2 (copy)
    assert(type(v6) == "boolean", "GetCameraOptIn request expects invalidateCache to be a boolean");
    local v7 = string.format("%s/v1/settings/avatar", l_Url_0.VOICE_URL);
    local v8 = if v4 ~= nil then v4:getStatus() else nil;
    if v6 then
        if v8 == v2.Status.Started then
            return v4;
        end;
    elseif v4 and v8 ~= v2.Status.Cancelled then
        return v4;
    end;
    v4 = v5(v7, "GET"):andThen(function(v9) --[[ Line: 33 ]]
        -- upvalues: v2 (ref)
        local l_responseBody_0 = v9.responseBody;
        if not l_responseBody_0 then
            return v2.reject("Unexpected response fetching cameraOptIn settings");
        else
            return v2.resolve(l_responseBody_0.isAvatarVideoOptIn);
        end;
    end, function(v11) --[[ Line: 40 ]]
        -- upvalues: v2 (ref)
        return v2.reject(v11);
    end);
    return v4;
end;