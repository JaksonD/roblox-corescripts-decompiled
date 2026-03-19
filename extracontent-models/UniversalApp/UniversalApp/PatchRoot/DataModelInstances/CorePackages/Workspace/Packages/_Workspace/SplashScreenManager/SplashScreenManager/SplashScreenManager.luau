local l_Parent_0 = script:FindFirstAncestor("SplashScreenManager").Parent;
local l_RunService_0 = game:GetService("RunService");
l_RunService_0 = require(l_Parent_0.MockableProxyServices).RunService;
local v2 = nil;
local function _() --[[ Line: 19 ]] --[[ Name: obfuscateEnvironment ]]
    -- upvalues: v2 (ref)
    v2 = Instance.new("ColorCorrectionEffect");
    if v2 then
        v2.Name = "__SplashScreenManager_Fader__";
        v2.Parent = game:GetService("Lighting");
        v2.TintColor = Color3.new(0, 0, 0);
        v2.Enabled = true;
    end;
end;
local function _() --[[ Line: 30 ]] --[[ Name: unobfuscateEnvironment ]]
    -- upvalues: v2 (ref)
    if v2 then
        v2:Destroy();
        v2 = nil;
    end;
end;
local v5 = false;
local v6 = true;
local v7 = false;
local v8 = {};
local _ = function() --[[ Line: 43 ]] --[[ Name: callCallbacks ]]
    -- upvalues: v8 (copy), v6 (ref)
    for _, v10 in v8 do
        v10(v6);
    end;
end;
return {
    initialize = function(v12, v13, v14) --[[ Line: 50 ]] --[[ Name: initialize ]]
        -- upvalues: v7 (ref), v5 (ref), v6 (ref), v2 (ref), v8 (copy), l_RunService_0 (ref)
        if not v7 and not v5 then
            v6 = false;
            v2 = Instance.new("ColorCorrectionEffect");
            if v2 then
                v2.Name = "__SplashScreenManager_Fader__";
                v2.Parent = game:GetService("Lighting");
                v2.TintColor = Color3.new(0, 0, 0);
                v2.Enabled = true;
            end;
            for _, v16 in v8 do
                v16(v6);
            end;
            local v17 = {};
            local v18 = 0;
            local v19 = 1 / v12;
            local v20 = v14 or v12;
            local v21 = tick();
            local v22 = 0;
            local v23 = nil;
            do
                local l_v18_0, l_v22_0, l_v23_0 = v18, v22, v23;
                local function _() --[[ Line: 65 ]]
                    -- upvalues: l_v23_0 (ref), v2 (ref), v6 (ref), v7 (ref)
                    if l_v23_0 then
                        l_v23_0:Disconnect();
                    end;
                    if v2 then
                        v2:Destroy();
                        v2 = nil;
                    end;
                    v6 = true;
                    v7 = false;
                end;
                l_v23_0 = l_RunService_0.RenderStepped:Connect(function(v28) --[[ Line: 74 ]]
                    -- upvalues: l_v22_0 (ref), v21 (copy), v17 (copy), l_v18_0 (ref), v20 (copy), v13 (copy), v19 (copy), v6 (ref), v8 (ref), l_v23_0 (ref), v2 (ref), v7 (ref)
                    l_v22_0 = tick() - v21;
                    table.insert(v17, v28);
                    l_v18_0 = l_v18_0 + v28;
                    if #v17 > v20 then
                        local v29 = table.remove(v17, 1);
                        if v29 ~= nil then
                            l_v18_0 = l_v18_0 - v29;
                        end;
                    end;
                    local v30 = l_v18_0 / #v17;
                    if v13 and v13 < l_v22_0 or #v17 >= v20 and math.floor(v30 * 100) <= math.floor(v19 * 100) then
                        v6 = true;
                        for _, v32 in v8 do
                            v32(v6);
                        end;
                        if l_v23_0 then
                            l_v23_0:Disconnect();
                        end;
                        if v2 then
                            v2:Destroy();
                            v2 = nil;
                        end;
                        v6 = true;
                        v7 = false;
                    end;
                end);
                v7 = true;
            end;
        end;
    end, 
    addStatusChangeListener = function(v33) --[[ Line: 106 ]] --[[ Name: addStatusChangeListener ]]
        -- upvalues: v8 (copy)
        table.insert(v8, v33);
        return v33;
    end, 
    removeStatusChangeListener = function(v34) --[[ Line: 111 ]] --[[ Name: removeStatusChangeListener ]]
        -- upvalues: v8 (copy)
        for v35, v36 in v8 do
            if v36 == v34 then
                table.remove(v8, v35);
            end;
        end;
    end, 
    isFPSAtTarget = function() --[[ Line: 119 ]] --[[ Name: isFPSAtTarget ]]
        -- upvalues: v6 (ref)
        return v6;
    end, 
    __setTestMode = function() --[[ Line: 123 ]] --[[ Name: __setTestMode ]]
        -- upvalues: v5 (ref)
        v5 = true;
    end
};