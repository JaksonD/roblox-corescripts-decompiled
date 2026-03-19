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
local l_FFlagEnableSocialUpsellFocusFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableSocialUpsellFocusFixes;
local v11 = require(l_script_FirstAncestor_0.Store.getOverlayStore);
local v12 = nil;
local v13 = nil;
mount = function() --[[ Line: 21 ]] --[[ Name: mount ]]
    -- upvalues: v12 (ref), v13 (ref), l_CoreGui_0 (copy), v5 (copy), l_FFlagEnableSocialUpsellFocusFixes_0 (copy), l_GuiService_0 (copy), v9 (copy), l_ContextActionService_0 (copy), v6 (copy), v8 (copy)
    if not v12 then
        if not v13 then
            v13 = Instance.new("Folder");
            v13.Name = "Overlay";
            v13.Parent = l_CoreGui_0;
        end;
        v12 = v5.createRoot(v13);
    end;
    if l_FFlagEnableSocialUpsellFocusFixes_0 then
        l_GuiService_0:SetMenuIsOpen(true, v9.OVERLAY_MENU_NAME);
        l_ContextActionService_0:BindCoreAction(v9.OVERLAY_CORE_ACTION_NAME, function() --[[ Line: 36 ]]

        end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
    end;
    v12:render(v6.createElement(v8, {
        gui = v13
    }));
end;
unmount = function() --[[ Line: 47 ]] --[[ Name: unmount ]]
    -- upvalues: v12 (ref), l_FFlagEnableSocialUpsellFocusFixes_0 (copy), l_ContextActionService_0 (copy), v9 (copy), l_GuiService_0 (copy)
    if v12 then
        v12:unmount();
        if l_FFlagEnableSocialUpsellFocusFixes_0 then
            l_ContextActionService_0:UnbindCoreAction(v9.OVERLAY_CORE_ACTION_NAME);
            l_GuiService_0:SetMenuIsOpen(false, v9.OVERLAY_MENU_NAME);
        end;
    end;
end;
local v14 = nil;
return function() --[[ Line: 58 ]]
    -- upvalues: v11 (copy), v14 (ref), v7 (copy)
    local v15 = v11(false);
    v14 = v7.createEffect(function(v16) --[[ Line: 61 ]]
        -- upvalues: v15 (copy)
        if v15.getCurrentOverlayType(v16) then
            mount();
            return;
        else
            unmount();
            return;
        end;
    end);
end;