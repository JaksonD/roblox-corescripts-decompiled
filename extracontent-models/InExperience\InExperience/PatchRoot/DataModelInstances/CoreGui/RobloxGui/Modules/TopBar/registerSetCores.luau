local l_StarterGui_0 = game:GetService("StarterGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagTopBarSignalizeSetCores_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarSignalizeSetCores;
local l_Parent_0 = script.Parent;
local v4 = require(l_Parent_0.Actions.SetTopBarEnabled);
local function v7(v5) --[[ Line: 12 ]] --[[ Name: registerSetCores ]]
    -- upvalues: l_StarterGui_0 (copy), v4 (copy)
    l_StarterGui_0:RegisterSetCore("TopbarEnabled", function(v6) --[[ Line: 13 ]]
        -- upvalues: v5 (copy), v4 (ref)
        if type(v6) == "boolean" then
            v5:dispatch(v4(v6));
            return;
        else
            error("SetCore TopbarEnabled argument must be a boolean", 2);
            return;
        end;
    end);
    l_StarterGui_0:RegisterGetCore("TopbarEnabled", function() --[[ Line: 21 ]]
        -- upvalues: v5 (copy)
        return v5:getState().displayOptions.topbarEnabled;
    end);
end;
if l_FFlagTopBarSignalizeSetCores_0 then
    return nil;
else
    return v7;
end;