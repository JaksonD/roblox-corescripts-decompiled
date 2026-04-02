local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.ReactRoblox);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.Signals);
local v8 = require(l_script_FirstAncestor_0.Components.InExpOverlay);
local v9 = require(l_script_FirstAncestor_0.Constants);
local v10 = require(l_script_FirstAncestor_0.Store.getOverlayStore);
local v11 = nil;
local v12 = nil;
mount = function() --[[ Line: 20 ]] --[[ Name: mount ]]
    -- upvalues: v11 (ref), v12 (ref), l_CoreGui_0 (copy), v5 (copy), l_GuiService_0 (copy), v9 (copy), l_ContextActionService_0 (copy), v6 (copy), v8 (copy)
    if not v11 then
        if not v12 then
            v12 = Instance.new("Folder");
            v12.Name = "Overlay";
            v12.Parent = l_CoreGui_0;
        end;
        v11 = v5.createRoot(v12);
    end;
    l_GuiService_0:SetMenuIsOpen(true, v9.OVERLAY_MENU_NAME);
    l_ContextActionService_0:BindCoreAction(v9.OVERLAY_CORE_ACTION_NAME, function() --[[ Line: 33 ]]

    end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
    v11:render(v6.createElement(v8, {
        gui = v12
    }));
end;
unmount = function() --[[ Line: 43 ]] --[[ Name: unmount ]]
    -- upvalues: v11 (ref), l_ContextActionService_0 (copy), v9 (copy), l_GuiService_0 (copy)
    if v11 then
        v11:unmount();
        l_ContextActionService_0:UnbindCoreAction(v9.OVERLAY_CORE_ACTION_NAME);
        l_GuiService_0:SetMenuIsOpen(false, v9.OVERLAY_MENU_NAME);
    end;
end;
local v13 = nil;
return function() --[[ Line: 52 ]]
    -- upvalues: v10 (copy), v13 (ref), v7 (copy)
    local v14 = v10(false);
    v13 = v7.createEffect(function(v15) --[[ Line: 55 ]]
        -- upvalues: v14 (copy)
        if v14.getCurrentOverlayType(v15) then
            mount();
            return;
        else
            unmount();
            return;
        end;
    end);
end;