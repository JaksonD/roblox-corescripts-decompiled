local v0 = game:DefineFastFlag("ServerCoreScriptSourceCode", false);
local v1 = {
    getFFlagServerCoreScriptSourceCode = function() --[[ Line: 6 ]] --[[ Name: getFFlagServerCoreScriptSourceCode ]]
        -- upvalues: v0 (copy)
        return v0;
    end
};
if v0 then
    local l_InsertService_0 = game:GetService("InsertService");
    local l_Modules_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui", 1e999).Modules;
    local function v7(v4, v5) --[[ Line: 15 ]] --[[ Name: getRelativePathArray ]]
        local v6 = {};
        while true do
            if v5 ~= v4 then
                if v5 == nil then
                    return nil;
                else
                    table.insert(v6, 1, v5.Name);
                    v5 = v5.Parent;
                end;
            else
                return v6;
            end;
        end;
    end;
    v1.getSourceForServerScript = function(v8) --[[ Line: 27 ]] --[[ Name: getSourceForServerScript ]]
        -- upvalues: l_Modules_0 (copy), v7 (copy)
        if v8.Source ~= "" then
            return v8.Source;
        else
            local l_l_Modules_0_0 = l_Modules_0;
            local l_SourceCode_0 = l_Modules_0.SourceCode;
            local v11 = v7(l_l_Modules_0_0, v8);
            if v11 == nil then
                error("Instance is not a descendant of the byte code root");
            end;
            local l_l_SourceCode_0_0 = l_SourceCode_0;
            for v13 = 1, #v11 do
                l_l_SourceCode_0_0 = l_l_SourceCode_0_0:FindFirstChild(v11[v13]);
            end;
            if l_l_SourceCode_0_0 == nil then
                error("No source found for instance");
            end;
            return l_l_SourceCode_0_0.Source;
        end;
    end;
    local function _() --[[ Line: 52 ]] --[[ Name: isByteCodeMode ]]
        return script.Source == "";
    end;
    v1.initSourceCodeFolder = function() --[[ Line: 56 ]] --[[ Name: initSourceCodeFolder ]]
        -- upvalues: l_InsertService_0 (copy), l_Modules_0 (copy)
        if not (script.Source == "") then
            return;
        else
            local v15 = l_InsertService_0:LoadLocalAsset("rbxasset://models/ServerCoreScripts.rbxm");
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "SourceCode";
            l_Folder_0.Parent = l_Modules_0;
            local l_Server_0 = v15.Server;
            local l_Common_0 = v15.Common;
            l_Server_0.Parent = l_Folder_0;
            l_Common_0.Parent = l_Folder_0;
            return;
        end;
    end;
end;
return v1;