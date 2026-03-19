local v0 = game:DefineFastFlag("AllowLuobuFreecamGroup", false);
local v1 = game:DefineFastFlag("UseGetCanManageAsync", false) and game:GetEngineFeature("LuaGetCanManageAsync");
local v2 = {
    4358041
};
local v3 = {
    7842878
};
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_PolicyService_0 = game:GetService("PolicyService");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Url;
local v12 = require(l_RobloxGui_0.Modules.Server.ServerUtil);
return function() --[[ Line: 31 ]] --[[ Name: Install ]]
    -- upvalues: v12 (copy), l_RunService_0 (copy), v1 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), v2 (copy), v0 (copy), l_PolicyService_0 (copy), v3 (copy), l_Players_0 (copy)
    local function v16(v13, v14) --[[ Line: 32 ]] --[[ Name: WaitForChildOfClass ]]
        local l_v13_FirstChildOfClass_0 = v13:FindFirstChildOfClass(v14);
        while not l_v13_FirstChildOfClass_0 or l_v13_FirstChildOfClass_0.ClassName ~= v14 do
            l_v13_FirstChildOfClass_0 = v13.ChildAdded:Wait();
        end;
        return l_v13_FirstChildOfClass_0;
    end;
    local function v22(v17) --[[ Line: 40 ]] --[[ Name: AddFreeCamera ]]
        -- upvalues: v16 (copy), v12 (ref)
        local v18 = v16(v17, "PlayerGui");
        local l_FreeCamera_0 = script.Parent:WaitForChild("FreeCamera");
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "Freecam";
        l_ScreenGui_0.ResetOnSpawn = false;
        local l_LocalScript_0 = Instance.new("LocalScript");
        l_LocalScript_0.Name = "FreecamScript";
        if v12.getFFlagServerCoreScriptSourceCode() then
            l_LocalScript_0.Source = v12.getSourceForServerScript(l_FreeCamera_0);
        else
            l_LocalScript_0.Source = l_FreeCamera_0.Source;
        end;
        l_LocalScript_0.Parent = l_ScreenGui_0;
        l_ScreenGui_0.Parent = v18;
    end;
    local function v39(v23) --[[ Line: 61 ]] --[[ Name: ShouldAddFreeCam ]]
        -- upvalues: l_RunService_0 (ref), v1 (ref), l_Url_0 (ref), l_HttpService_0 (ref), l_HttpRbxApiService_0 (ref), v2 (ref), v0 (ref), l_PolicyService_0 (ref), v3 (ref)
        if l_RunService_0:IsStudio() then
            return true;
        elseif v23.UserId <= 0 then
            return false;
        else
            if v1 then
                local l_status_0, l_result_0 = pcall(v23.GetCanManageAsync, v23);
                if l_status_0 and l_result_0 then
                    return true;
                end;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 76 ]]
                    -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v23 (copy), l_HttpRbxApiService_0 (ref)
                    local v26 = string.format(l_Url_0.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions");
                    local v27 = l_HttpService_0:JSONEncode({
                        requests = {
                            {
                                subject = {
                                    subjectType = "User", 
                                    subjectId = v23.UserId
                                }, 
                                action = "Edit", 
                                assetId = game.PlaceId
                            }
                        }
                    });
                    local v28 = l_HttpRbxApiService_0:PostAsyncFullUrl(v26, v27);
                    return l_HttpService_0:JSONDecode(v28);
                end);
                if l_status_1 then
                    l_result_1 = l_result_1.results[1];
                    if l_result_1.value and l_result_1.value.status == "HasPermission" then
                        return true;
                    end;
                end;
            end;
            for _, v32 in ipairs(v2) do
                local l_status_2, l_result_2 = pcall(v23.IsInGroup, v23, v32);
                if l_status_2 and l_result_2 then
                    return true;
                end;
            end;
            if v0 and game:GetEngineFeature("LuobuModerationStatus") and l_PolicyService_0.IsLuobuServer == Enum.TriStateBoolean.True then
                for _, v36 in ipairs(v3) do
                    local l_status_3, l_result_3 = pcall(v23.IsInGroup, v23, v36);
                    if l_status_3 and l_result_3 then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end;
    local function v41(v40) --[[ Line: 127 ]] --[[ Name: PlayerAdded ]]
        -- upvalues: v39 (copy), v22 (copy)
        if v39(v40) then
            v22(v40);
        end;
    end;
    l_Players_0.PlayerAdded:Connect(v41);
    for _, v43 in ipairs(l_Players_0:GetPlayers()) do
        coroutine.wrap(v41)(v43);
    end;
end;