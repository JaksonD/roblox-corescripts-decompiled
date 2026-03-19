local l_AdService_0 = game:GetService("AdService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.Roact);
local v5 = require(l_Parent_0.AdsInteractivityControls);
local v6 = game:DefineFastFlag("AdsInteractivityControlsFixStyleLink", false);
return function() --[[ Line: 12 ]] --[[ Name: starterScript ]]
    -- upvalues: l_CoreGui_0 (copy), l_AdService_0 (copy), v4 (copy), v5 (copy), v6 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "AdGuiInteractivityControls";
    l_Folder_0.Parent = l_CoreGui_0;
    local v8 = {};
    l_AdService_0.adGuiRegisterUI:Connect(function(v9) --[[ Line: 20 ]]
        -- upvalues: v8 (copy), v4 (ref), v5 (ref), v6 (ref), l_Folder_0 (copy)
        if not v9:IsA("AdGui") then
            return;
        elseif v8[v9] then
            return;
        else
            local v10 = v4.createElement(v5, {
                adGui = v9
            });
            if v6 then
                v10 = v4.createElement("Folder", nil, v10);
            end;
            v8[v9] = v4.mount(v10, l_Folder_0, "AdsInteractivityControls");
            v9.Destroying:Connect(function() --[[ Line: 36 ]]
                -- upvalues: v4 (ref), v8 (ref), v9 (copy)
                v4.unmount(v8[v9]);
                v8[v9] = nil;
            end);
            return;
        end;
    end);
    l_AdService_0:SetAdGuiInteractivityHandlerInitialized();
end;