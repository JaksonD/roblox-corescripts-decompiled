local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_describeError_0 = require(script.Parent["ErrorHandling.roblox"]).describeError;
local function v13(v3, _, v5, v6, ...) --[[ Line: 19 ]] --[[ Name: invokeGuardedCallbackProd ]]
    -- upvalues: v1 (copy), l_describeError_0 (copy)
    local v7 = nil;
    local v8 = nil;
    if not v1.__YOLO__ then
        if v6 == nil then
            local v9, v10 = xpcall(v5, l_describeError_0, ...);
            v7 = v9;
            v8 = v10;
        else
            local v11, v12 = xpcall(v5, l_describeError_0, v6, ...);
            v7 = v11;
            v8 = v12;
        end;
    else
        v7 = true;
        if v6 == nil then
            v5(...);
        else
            v5(v6, ...);
        end;
    end;
    if not v7 then
        v3.onError(v8);
    end;
end;
if v1.__DEV__ then

end;
return v13;