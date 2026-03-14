game:DefineFastFlag("EnableHasVerifiedBadgeUserModelValidation", false);
local v0 = require(script.Parent.MockId);
local v1 = {};
v1.new = function(v2) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    assert(v1.isValid(v2));
    v1.__index = v1;
    setmetatable(v2, v1);
    return v2;
end;
v1.mock = function(v3) --[[ Line: 19 ]] --[[ Name: mock ]]
    -- upvalues: v1 (copy), v0 (copy)
    v3 = v3 or {};
    return (v1.new({
        id = v3.id or v0(), 
        username = v3.username or "UN_" .. tostring(math.random(100000, 99999999)), 
        displayName = v3.displayName or "DN_" .. tostring(math.random(100000, 99999999)), 
        hasVerifiedBadge = v3.hasVerifiedBadge or false, 
        created = v3.created or ""
    }));
end;
v1.isValid = function(v4) --[[ Line: 33 ]] --[[ Name: isValid ]]
    if not v4 then
        return false, "Expected user information to be given";
    elseif not v4.id then
        return false, "Expected user's id to be given";
    elseif v4.id ~= "0" and not v4.username then
        return false, "Expected user's username to be given";
    elseif not v4.displayName then
        return false, "Expected user's displayName to be given";
    elseif game:GetFastFlag("EnableHasVerifiedBadgeUserModelValidation") and v4.hasVerifiedBadge == nil then
        return false, "Expected user's hasVerifiedBadge to be given";
    else
        return true, "Valid UserModel";
    end;
end;
v1.isEqual = function(v5, v6) --[[ Line: 52 ]] --[[ Name: isEqual ]]
    if game:GetFastFlag("EnableHasVerifiedBadgeUserModelValidation") then
        local v7 = false;
        if v5.id == v6.id then
            v7 = false;
            if v5.username == v6.username then
                v7 = false;
                if v5.displayName == v6.displayName then
                    v7 = v5.hasVerifiedBadge == v6.hasVerifiedBadge;
                end;
            end;
        end;
        return v7;
    else
        local v8 = false;
        if v5.id == v6.id then
            v8 = false;
            if v5.username == v6.username then
                v8 = v5.displayName == v6.displayName;
            end;
        end;
        return v8;
    end;
end;
return v1;