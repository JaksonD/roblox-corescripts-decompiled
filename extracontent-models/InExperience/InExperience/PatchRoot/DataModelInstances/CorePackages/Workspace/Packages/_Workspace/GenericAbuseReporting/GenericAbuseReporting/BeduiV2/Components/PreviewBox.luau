local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_Avatar_0 = v2.Avatar;
local l_Image_0 = v2.Image;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local v9 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.useExperienceDetails);
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local function v18(v11) --[[ Line: 26 ]] --[[ Name: UserPreview ]]
    -- upvalues: v3 (copy), l_View_0 (copy), l_Avatar_0 (copy), l_Text_0 (copy)
    local l_preview_0 = v11.preview;
    if not l_preview_0 then
        return nil;
    else
        local l_createElement_0 = v3.createElement;
        local l_l_View_0_0 = l_View_0;
        local v15 = {
            tag = "row size-full-0 auto-y gap-medium radius-medium bg-surface-200 padding-medium align-y-center", 
            LayoutOrder = v11.layoutOrder
        };
        local v16 = {};
        local v17 = false;
        if l_preview_0.id ~= nil then
            v17 = v3.createElement(l_Avatar_0, {
                userId = tonumber(l_preview_0.id), 
                LayoutOrder = 1
            });
        end;
        v16.Avatar = v17;
        v16.TextContainer = (not not l_preview_0.displayName or l_preview_0.username) and v3.createElement(l_View_0, {
            tag = "col auto-xy fill", 
            LayoutOrder = 2
        }, {
            DisplayName = l_preview_0.displayName and v3.createElement(l_Text_0, {
                Text = l_preview_0.displayName, 
                RichText = true, 
                tag = "auto-xy content-emphasis text-wrap text-align-x-left", 
                LayoutOrder = 1
            }), 
            Username = l_preview_0.username and v3.createElement(l_Text_0, {
                Text = "@" .. l_preview_0.username, 
                RichText = true, 
                tag = "auto-xy text-wrap text-align-x-left", 
                LayoutOrder = 2
            })
        });
        return l_createElement_0(l_l_View_0_0, v15, v16);
    end;
end;
local function v21(v19) --[[ Line: 60 ]] --[[ Name: ChatPreview ]]
    -- upvalues: v3 (copy), l_View_0 (copy), v10 (copy)
    local l_preview_1 = v19.preview;
    if not l_preview_1 then
        return nil;
    else
        return v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y gap-xsmall radius-medium bg-surface-200 padding-medium", 
            LayoutOrder = v19.layoutOrder
        }, {
            Message = v3.createElement(v10, {
                input = l_preview_1.text, 
                tag = "auto-xy text-wrap text-align-x-left"
            })
        });
    end;
end;
local function v25(v22) --[[ Line: 77 ]] --[[ Name: ExperiencePreview ]]
    -- upvalues: v9 (copy), v3 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy)
    local l_preview_2 = v22.preview;
    local v24 = v9(l_preview_2.id);
    if not l_preview_2 then
        return nil;
    else
        return v3.createElement(l_View_0, {
            tag = "row size-full-0 auto-y gap-medium radius-medium bg-surface-200 padding-medium align-y-center", 
            LayoutOrder = v22.layoutOrder
        }, {
            ExperienceIcon = v3.createElement(l_Image_0, {
                Image = ("rbxthumb://type=GameIcon&id=%*&w=50&h=50"):format(l_preview_2.id), 
                Size = UDim2.fromOffset(40, 40), 
                tag = "radius-medium"
            }), 
            Name = v3.createElement(l_Text_0, {
                Text = v24 and v24.name or l_preview_2.title or "", 
                RichText = true, 
                tag = "auto-xy text-wrap text-align-x-left"
            })
        });
    end;
end;
return v3.memo(function(v26) --[[ Line: 104 ]] --[[ Name: PreviewBox ]]
    -- upvalues: v3 (copy), v18 (copy), v21 (copy), v25 (copy)
    local l_preview_3 = v26.preview;
    if l_preview_3.type == "user" then
        return v3.createElement(v18, {
            preview = l_preview_3, 
            layoutOrder = v26.layoutOrder
        });
    elseif l_preview_3.type == "chat" then
        return v3.createElement(v21, {
            preview = l_preview_3, 
            layoutOrder = v26.layoutOrder
        });
    elseif l_preview_3.type == "experience" then
        return v3.createElement(v25, {
            preview = l_preview_3, 
            layoutOrder = v26.layoutOrder
        });
    else
        return nil;
    end;
end);