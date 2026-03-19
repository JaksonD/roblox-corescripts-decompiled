local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local v2 = require(l_script_FirstAncestor_0.Constants);
return function() --[[ Line: 5 ]] --[[ Name: getOrCreateSurfaceGuiContainer ]]
    -- upvalues: l_CoreGui_0 (copy), v2 (copy)
    local l_l_CoreGui_0_FirstChild_0 = l_CoreGui_0:FindFirstChild(v2.SURFACE_GUI_FOLDER_NAME);
    if not l_l_CoreGui_0_FirstChild_0 then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v2.SURFACE_GUI_FOLDER_NAME;
        l_Folder_0.Parent = l_CoreGui_0;
        l_l_CoreGui_0_FirstChild_0 = l_Folder_0;
    end;
    return l_l_CoreGui_0_FirstChild_0;
end;