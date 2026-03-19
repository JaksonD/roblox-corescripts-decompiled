local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utility.Wrappers);
local v4 = require(l_script_FirstAncestor_0.Utility.isPluginSecurity);
local l_Connection_0 = v3.Connection;
local l_Instance_0 = v3.Instance;
local l_Signal_0 = v3.Signal;
local l_GuiService_0 = v3.Services.GuiService;
local l_UserInputService_0 = v3.Services.UserInputService;
local function v12() --[[ Line: 14 ]] --[[ Name: getGuiInset ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_l_GuiService_0_GuiInset_0, v11 = l_GuiService_0:GetGuiInset();
    return Rect.new(l_l_GuiService_0_GuiInset_0, v11);
end;
return function() --[[ Line: 20 ]] --[[ Name: useGuiInset ]]
    -- upvalues: v2 (copy), v12 (copy), v4 (copy), l_Signal_0 (copy), l_GuiService_0 (copy), l_Instance_0 (copy), l_UserInputService_0 (copy), l_Connection_0 (copy)
    local v13, v14 = v2.useState(function() --[[ Line: 21 ]]
        -- upvalues: v12 (ref)
        return v12();
    end);
    local v15 = v2.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v14 (copy), v12 (ref)
        v14(v12());
    end, {});
    v2.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v4 (ref), l_Signal_0 (ref), l_GuiService_0 (ref), v15 (copy), l_Instance_0 (ref), l_UserInputService_0 (ref), l_Connection_0 (ref)
        local v16 = {};
        if v4() then
            v16 = {
                l_Signal_0.Connect(l_GuiService_0.SafeZoneOffsetsChanged, v15), 
                l_Signal_0.Connect(l_Instance_0.GetPropertyChangedSignal(l_UserInputService_0, "BottomBarSize"), v15), 
                l_Signal_0.Connect(l_Instance_0.GetPropertyChangedSignal(l_UserInputService_0, "RightBarSize"), v15)
            };
        end;
        return function() --[[ Line: 40 ]]
            -- upvalues: v16 (ref), l_Connection_0 (ref)
            for _, v18 in v16 do
                l_Connection_0.Disconnect(v18);
            end;
        end;
    end, {});
    return v13;
end;