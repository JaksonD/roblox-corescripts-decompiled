local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local v1 = require(l_script_FirstAncestor_0.Constants);
return function() --[[ Line: 4 ]] --[[ Name: getOrCreateWorkSpaceContainer ]]
    -- upvalues: v1 (copy)
    local l_workspace_FirstChild_0 = workspace:FindFirstChild(v1.WORKSPACE_FOLDER_NAME);
    if not l_workspace_FirstChild_0 then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v1.WORKSPACE_FOLDER_NAME;
        l_Folder_0.Parent = workspace;
        l_workspace_FirstChild_0 = l_Folder_0;
    end;
    return l_workspace_FirstChild_0;
end;