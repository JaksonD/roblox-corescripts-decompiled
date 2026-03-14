local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Packages_0 = l_CorePackages_0.Packages;
local v3 = require(l_Packages_0.React);
local v4 = require(l_Packages_0.LuauPolyfill);
local l_setTimeout_0 = v4.setTimeout;
local l_clearTimeout_0 = v4.clearTimeout;
local function _(v7) --[[ Line: 12 ]] --[[ Name: isClickOrTap ]]
    local v8 = true;
    if v7.UserInputType ~= Enum.UserInputType.MouseButton1 then
        v8 = v7.UserInputType == Enum.UserInputType.Touch;
    end;
    return v8;
end;
return function(v10) --[[ Line: 17 ]]
    -- upvalues: v3 (copy), l_clearTimeout_0 (copy), l_setTimeout_0 (copy), l_UserInputService_0 (copy)
    local v11, v12 = v3.useState("");
    local v13, v14 = v3.useState("");
    local v15, v16 = v3.useState(false);
    local v17 = v3.useRef(nil);
    local v18 = v3.useRef(nil);
    local v19 = v3.useCallback(function() --[[ Line: 23 ]]
        -- upvalues: v18 (copy), l_clearTimeout_0 (ref), v17 (copy)
        if v18.current then
            l_clearTimeout_0(v18.current);
        end;
        if v17.current then
            v17.current:Disconnect();
            v17.current = nil;
        end;
    end, {
        v18, 
        v17
    });
    local v23 = v3.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v19 (copy), v16 (copy), v18 (copy), l_setTimeout_0 (ref), v10 (copy), v17 (copy), l_UserInputService_0 (ref)
        v19();
        v16(true);
        v18.current = l_setTimeout_0(function() --[[ Line: 39 ]]
            -- upvalues: v19 (ref), v16 (ref)
            v19();
            v16(false);
        end, v10);
        v17.current = l_UserInputService_0.InputBegan:Connect(function(v20, _) --[[ Line: 44 ]]
            -- upvalues: v19 (ref), v16 (ref)
            local v22 = true;
            if v20.UserInputType ~= Enum.UserInputType.MouseButton1 then
                v22 = v20.UserInputType == Enum.UserInputType.Touch;
            end;
            if not v22 then
                return;
            else
                v19();
                v16(false);
                return;
            end;
        end);
    end, {
        v18, 
        v17
    });
    v3.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v19 (copy)
        return v19;
    end, {});
    return v11, v13, v15, (v3.useCallback(function(v24, v25) --[[ Line: 58 ]]
        -- upvalues: v12 (copy), v14 (copy), v23 (copy)
        v12(v24);
        v14(v25);
        v23();
    end, {}));
end;