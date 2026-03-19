local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Players_0 = game:GetService("Players");
local v3 = game:DefineFastFlag("FFlagLogFirstGuacRead", false);
local v4 = game:DefineFastFlag("FFlagLogAllGuacRead", false);
local v5 = game:DefineFastFlag("CacheReadParsePolicy", false);
local v6 = nil;
local v7 = nil;
if v3 then
    v6 = game:GetService("CorePackages");
    v7 = require(v6.Workspace.Packages.LoggingProtocol).default;
end;
return function(v8) --[[ Line: 16 ]]
    -- upvalues: l_HttpService_0 (copy), l_MemStorageService_0 (copy), l_Players_0 (copy), v5 (copy), v4 (copy), v7 (ref), v3 (copy)
    v8 = v8 or {};
    v8.HttpService = v8.HttpService or l_HttpService_0;
    v8.MemStorageService = v8.MemStorageService or l_MemStorageService_0;
    v8.PlayersService = v8.PlayersService or l_Players_0;
    assert(v8.HttpService, "expected dependencies.HttpService");
    assert(v8.MemStorageService, "expected dependencies.MemStorageService");
    assert(v8.PlayersService, "expected dependencies.PlayersService");
    local l_HttpService_1 = v8.HttpService;
    local l_MemStorageService_1 = v8.MemStorageService;
    local l_PlayersService_0 = v8.PlayersService;
    local v12 = false;
    return function(v13) --[[ Line: 31 ]]
        -- upvalues: l_PlayersService_0 (copy), v5 (ref), l_HttpService_1 (copy), l_MemStorageService_1 (copy), v4 (ref), v7 (ref), v3 (ref), v12 (ref)
        assert(v13, "expected behavior");
        local function _() --[[ Line: 34 ]] --[[ Name: getStoreKey ]]
            -- upvalues: l_PlayersService_0 (ref), v13 (copy)
            local v14 = -1;
            local l_LocalPlayer_0 = l_PlayersService_0.LocalPlayer;
            if l_LocalPlayer_0 and l_LocalPlayer_0.UserId > 0 then
                v14 = l_LocalPlayer_0.UserId;
            end;
            return "GUAC:" .. v14 .. ":" .. v13;
        end;
        local v17 = nil;
        local v18 = nil;
        local v19 = nil;
        local v20 = nil;
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        if v5 then
            local v22 = nil;
            do
                local l_v22_0 = v22;
                local function v24() --[[ Line: 54 ]] --[[ Name: localPlayerChanged ]]
                    -- upvalues: l_v22_0 (ref), l_PlayersService_0 (ref), v20 (ref)
                    if l_v22_0 then
                        l_v22_0:Disconnect();
                        l_v22_0 = nil;
                    end;
                    if l_PlayersService_0.LocalPlayer then
                        l_v22_0 = l_PlayersService_0.LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(function() --[[ Line: 60 ]]
                            -- upvalues: v20 (ref)
                            v20 = nil;
                        end);
                    end;
                    v20 = nil;
                end;
                l_PlayersService_0:GetPropertyChangedSignal("LocalPlayer"):Connect(v24);
                v24();
            end;
        end;
        local function v28(v25) --[[ Line: 70 ]] --[[ Name: onPolicyUpdated ]]
            -- upvalues: v19 (ref), l_HttpService_1 (ref), v20 (ref), l_BindableEvent_0 (copy)
            if v25 ~= v19 and v25 and #v25 > 0 then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 74 ]]
                    -- upvalues: l_HttpService_1 (ref), v25 (copy)
                    return l_HttpService_1:JSONDecode(v25);
                end);
                if l_status_0 then
                    v19 = v25;
                    v20 = l_result_0;
                    l_BindableEvent_0:Fire(l_result_0);
                end;
            end;
        end;
        return {
            read = function() --[[ Line: 88 ]] --[[ Name: read ]]
                -- upvalues: v5 (ref), v20 (ref), l_PlayersService_0 (ref), v13 (copy), l_MemStorageService_1 (ref), l_HttpService_1 (ref), v4 (ref), v7 (ref), v3 (ref), v12 (ref), v19 (ref)
                if v5 and v20 then
                    return v20;
                else
                    local v29 = -1;
                    local l_LocalPlayer_1 = l_PlayersService_0.LocalPlayer;
                    if l_LocalPlayer_1 and l_LocalPlayer_1.UserId > 0 then
                        v29 = l_LocalPlayer_1.UserId;
                    end;
                    local v31 = "GUAC:" .. v29 .. ":" .. v13;
                    v29 = l_MemStorageService_1:GetItem(v31);
                    if v29 and #v29 > 0 then
                        local v32;
                        l_LocalPlayer_1, v32 = pcall(function() --[[ Line: 95 ]]
                            -- upvalues: l_HttpService_1 (ref), v29 (copy)
                            return l_HttpService_1:JSONDecode(v29);
                        end);
                        if l_LocalPlayer_1 then
                            if v4 then
                                v7:logEvent("lua_policy_read_success");
                            elseif v3 and not v12 then
                                v7:logEvent("lua_policy_read_success");
                                v12 = true;
                            end;
                            v20 = v32;
                            v19 = v29;
                            return v32;
                        end;
                    end;
                    return nil;
                end;
            end, 
            onPolicyChanged = function(v33) --[[ Line: 117 ]] --[[ Name: onPolicyChanged ]]
                -- upvalues: l_PlayersService_0 (ref), v13 (copy), l_BindableEvent_0 (copy), v18 (ref), v17 (ref), v20 (ref), l_MemStorageService_1 (ref), v28 (copy)
                local v34 = -1;
                local l_LocalPlayer_2 = l_PlayersService_0.LocalPlayer;
                if l_LocalPlayer_2 and l_LocalPlayer_2.UserId > 0 then
                    v34 = l_LocalPlayer_2.UserId;
                end;
                local v36 = "GUAC:" .. v34 .. ":" .. v13;
                v34 = l_BindableEvent_0.Event:Connect(v33);
                if v18 and v17 == v36 then
                    if v20 then
                        v33(v20);
                        return v34;
                    end;
                else
                    if v18 then
                        v18:Disconnect();
                    end;
                    v17 = v36;
                    v18 = l_MemStorageService_1:BindAndFire(v36, v28);
                end;
                return v34;
            end
        };
    end;
end;