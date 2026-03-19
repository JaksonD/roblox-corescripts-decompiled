local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SharedFlags);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v6 = require(l_Helpers_0.getMessageSettings);
local l_FFlagExpChatAddPaddingAroundARButton_0 = v4.FFlagExpChatAddPaddingAroundARButton;
local v8 = game:DefineFastFlag("ExpChatEnableHiddenMessageCenterLockIcon", false);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v10 = require(l_Flags_0.FIntExpChatDefaultARButtonPadding);
return function(v11) --[[ Line: 19 ]]
    -- upvalues: v6 (copy), v3 (copy), v2 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v10 (copy), v8 (copy)
    local v12 = v6(v11.message, v11.chatWindowSettings);
    local l_bodyTextProperties_0 = v12.bodyTextProperties;
    local l_prefixTextProperties_0 = v12.prefixTextProperties;
    local function _(v15, v16) --[[ Line: 24 ]] --[[ Name: calculateTransparency ]]
        return v15 + v16 * (1 - v15);
    end;
    local function _(v18, v19) --[[ Line: 28 ]] --[[ Name: setTransparency ]]
        return v19:map(function(v20) --[[ Line: 29 ]]
            -- upvalues: v18 (copy)
            if v18 == nil then
                return 1;
            else
                local l_v18_0 = v18;
                return l_v18_0 + v20 * (1 - l_v18_0);
            end;
        end);
    end;
    local v23 = if v11.isSpatialUIEnabled then v11.chatWindowSettings.SpatialPanelTextSize else v11.chatWindowSettings.TextSize;
    local v24 = if v11.isSpatialUIEnabled then v23 else l_bodyTextProperties_0.TextSize;
    local v25 = l_prefixTextProperties_0.TextSize * 0.85714286;
    local l_createElement_0 = v3.createElement;
    local l_View_0 = v2.View;
    local v28 = {
        LayoutOrder = v11.LayoutOrder, 
        tag = "auto-y size-full-0 row align-y-top", 
        padding = if l_FFlagExpChatAddPaddingAroundARButton_0 then {
            right = UDim.new(0, v10)
        } else nil
    };
    local v29 = {};
    local l_createElement_1 = v3.createElement;
    local l_View_1 = v2.View;
    local v32 = {
        LayoutOrder = 1, 
        tag = {
            ["auto-xy row align-x-left"] = true, 
            ["align-y-top"] = not v8, 
            ["align-y-center"] = v8
        }
    };
    local v33 = {};
    local l_createElement_2 = v3.createElement;
    local l_Text_0 = v2.Text;
    local v36 = {
        fontStyle = {
            Font = l_prefixTextProperties_0.FontFace, 
            FontSize = v25
        }
    };
    local v37 = {
        Color3 = l_prefixTextProperties_0.TextColor3
    };
    local l_textTransparency_0 = v11.textTransparency;
    local v39 = 0;
    local l_v39_0 = v39 --[[ copy: 26 -> 27 ]];
    v37.Transparency = l_textTransparency_0:map(function(v41) --[[ Line: 29 ]]
        -- upvalues: l_v39_0 (copy)
        if l_v39_0 == nil then
            return 1;
        else
            local l_l_v39_0_0 = l_v39_0;
            return l_l_v39_0_0 + v41 * (1 - l_l_v39_0_0);
        end;
    end);
    v36.textStyle = v37;
    v36.LayoutOrder = 1;
    v36.Text = "[";
    v36.tag = "auto-xy text-align-y-top";
    v33.LeftBracket = l_createElement_2(l_Text_0, v36);
    l_createElement_2 = v3.createElement;
    l_Text_0 = v2.Icon;
    v36 = {
        LayoutOrder = 2, 
        name = v2.Enums.IconName.LockClosed, 
        size = v25
    };
    v37 = {
        Color3 = l_prefixTextProperties_0.TextColor3
    };
    l_textTransparency_0 = v11.textTransparency;
    v39 = 0;
    local l_v39_1 = v39 --[[ copy: 26 -> 28 ]];
    v37.Transparency = l_textTransparency_0:map(function(v44) --[[ Line: 29 ]]
        -- upvalues: l_v39_1 (copy)
        if l_v39_1 == nil then
            return 1;
        else
            local l_l_v39_1_0 = l_v39_1;
            return l_l_v39_1_0 + v44 * (1 - l_l_v39_1_0);
        end;
    end);
    v36.style = v37;
    v33.Icon = l_createElement_2(l_Text_0, v36);
    l_createElement_2 = v3.createElement;
    l_Text_0 = v2.Text;
    v36 = {
        fontStyle = {
            Font = l_prefixTextProperties_0.FontFace, 
            FontSize = v25
        }
    };
    v37 = {
        Color3 = l_prefixTextProperties_0.TextColor3
    };
    l_textTransparency_0 = v11.textTransparency;
    v39 = 0;
    v37.Transparency = l_textTransparency_0:map(function(v46) --[[ Line: 29 ]]
        -- upvalues: v39 (copy)
        if v39 == nil then
            return 1;
        else
            local l_v39_2 = v39;
            return l_v39_2 + v46 * (1 - l_v39_2);
        end;
    end);
    v36.textStyle = v37;
    v36.LayoutOrder = 3;
    v36.Text = "] : ";
    v36.tag = "auto-xy text-align-y-top";
    v33.RightBracket = l_createElement_2(l_Text_0, v36);
    v29.IconContainer = l_createElement_1(l_View_1, v32, v33);
    l_createElement_1 = v3.createElement;
    l_View_1 = v2.Text;
    v32 = {
        fontStyle = {
            Font = l_bodyTextProperties_0.FontFace, 
            FontSize = v24
        }, 
        LayoutOrder = 2, 
        Text = v11.message.text
    };
    v33 = {
        Color3 = l_bodyTextProperties_0.TextColor3
    };
    l_Text_0 = v11.textTransparency;
    l_textTransparency_0 = 0;
    v33.Transparency = l_Text_0:map(function(v48) --[[ Line: 29 ]]
        -- upvalues: l_textTransparency_0 (copy)
        if l_textTransparency_0 == nil then
            return 1;
        else
            local l_l_textTransparency_0_0 = l_textTransparency_0;
            return l_l_textTransparency_0_0 + v48 * (1 - l_l_textTransparency_0_0);
        end;
    end);
    v32.textStyle = v33;
    v32.tag = "auto-y fill text-align-y-top text-align-x-left text-wrap";
    v29.Dots = l_createElement_1(l_View_1, v32);
    return l_createElement_0(l_View_0, v28, v29);
end;