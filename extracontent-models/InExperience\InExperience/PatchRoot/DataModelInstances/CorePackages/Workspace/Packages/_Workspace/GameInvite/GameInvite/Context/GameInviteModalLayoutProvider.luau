local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.SharedFlags);
local v5 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local v7 = require(l_Context_0.GameInviteModalLayoutContext);
local l_GetFFlagLuaAppEnableTopBanner_0 = v4.GetFFlagLuaAppEnableTopBanner;
local function _(v9) --[[ Line: 23 ]]
    -- upvalues: l_GetFFlagLuaAppEnableTopBanner_0 (copy), l_GuiService_0 (copy)
    local v10 = 0;
    if not l_GetFFlagLuaAppEnableTopBanner_0() or v9 then
        if l_GuiService_0 then
            return l_GuiService_0:GetGuiInset().Y;
        else
            v10 = 50;
        end;
    end;
    return v10;
end;
local function _() --[[ Line: 33 ]]
    return workspace.CurrentCamera.ViewportSize;
end;
local function _(v13) --[[ Line: 38 ]]
    return v13 < 800;
end;
local function _(v15) --[[ Line: 42 ]]
    return v15 < 624;
end;
local function _(v17) --[[ Line: 46 ]]
    return (not not (v17.X < 800) or v17.Y < 624) and v17.X or 800;
end;
local function _(v19, v20) --[[ Line: 50 ]]
    -- upvalues: l_GetFFlagLuaAppEnableTopBanner_0 (copy), l_GuiService_0 (copy)
    local v21 = false;
    local v22;
    if v19.X < 800 or v19.Y < 624 then
        local l_Y_0 = v19.Y;
        local v24 = 0;
        if not l_GetFFlagLuaAppEnableTopBanner_0() or v20 then
            v24 = if l_GuiService_0 then l_GuiService_0:GetGuiInset().Y else 50;
        end;
        v22 = l_Y_0 - v24;
        v21 = v22;
    end;
    if not v21 then
        v22 = 624;
    end;
    v21 = false;
    return v22;
end;
local function v35(v26, v27) --[[ Line: 56 ]]
    -- upvalues: l_GetFFlagLuaAppEnableTopBanner_0 (copy), l_GuiService_0 (copy)
    local v28 = false;
    local v29 = UDim.new(0, (not not (v26.X < 800) or v26.Y < 624) and v26.X or 800);
    local l_new_0 = UDim.new;
    local v31 = 0;
    local v32;
    if v26.X < 800 or v26.Y < 624 then
        local l_Y_1 = v26.Y;
        local v34 = 0;
        if not l_GetFFlagLuaAppEnableTopBanner_0() or v27 then
            v34 = if l_GuiService_0 then l_GuiService_0:GetGuiInset().Y else 50;
        end;
        v32 = l_Y_1 - v34;
        v28 = v32;
    end;
    if not v28 then
        v32 = 624;
    end;
    v28 = false;
    l_new_0 = l_new_0(v31, v32);
    return UDim2.new(v29, l_new_0);
end;
local function _(v36) --[[ Line: 62 ]]
    if v36.X < 800 or v36.Y < 624 then
        return "compact";
    else
        return "default";
    end;
end;
return function(v38) --[[ Line: 66 ]]
    -- upvalues: v5 (copy), v35 (copy), v7 (copy)
    local l_isCoreScript_0 = v38.isCoreScript;
    local v40, v41 = v5.useState(v35(workspace.CurrentCamera.ViewportSize, l_isCoreScript_0));
    local v42, v43 = v5.useState(workspace.CurrentCamera.ViewportSize.Y < 624);
    local v44, v45 = v5.useState(workspace.CurrentCamera.ViewportSize.X < 800);
    local l_useState_0 = v5.useState;
    local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
    local v48;
    l_useState_0, v48 = l_useState_0((not not (l_ViewportSize_0.X < 800) or l_ViewportSize_0.Y < 624) and "compact" or "default");
    l_ViewportSize_0 = function() --[[ Line: 74 ]]
        -- upvalues: v35 (ref), l_isCoreScript_0 (copy), v43 (copy), v45 (copy), v41 (copy), v48 (copy)
        local l_ViewportSize_1 = workspace.CurrentCamera.ViewportSize;
        local v50 = l_ViewportSize_1.Y < 624;
        local v51 = l_ViewportSize_1.X < 800;
        local v52 = v35(l_ViewportSize_1, l_isCoreScript_0);
        v43(v50);
        v45(v51);
        v41(v52);
        v48((not not (l_ViewportSize_1.X < 800) or l_ViewportSize_1.Y < 624) and "compact" or "default");
    end;
    v5.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: l_ViewportSize_0 (copy)
        l_ViewportSize_0();
        local v53 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(l_ViewportSize_0);
        return function() --[[ Line: 92 ]]
            -- upvalues: v53 (copy)
            if v53 then
                v53:Disconnect();
            end;
        end;
    end, {});
    return v5.createElement(v7.Provider, {
        value = {
            isFullHeight = v42, 
            isFullWidth = v44, 
            modalSize = v40, 
            modalMode = l_useState_0
        }
    }, v38.children);
end;