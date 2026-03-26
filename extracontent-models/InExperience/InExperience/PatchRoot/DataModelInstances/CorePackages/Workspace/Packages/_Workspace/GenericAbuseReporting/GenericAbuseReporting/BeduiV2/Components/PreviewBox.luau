local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_Avatar_0 = v2.Avatar;
local l_Image_0 = v2.Image;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local v9 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local function v12(v10) --[[ Line: 25 ]] --[[ Name: UserPreview ]]
    -- upvalues: v3 (copy), l_View_0 (copy), l_Avatar_0 (copy), l_Text_0 (copy)
    local l_preview_0 = v10.preview;
    return v3.createElement(l_View_0, {
        tag = "row size-full-0 auto-y gap-medium radius-medium bg-surface-200 padding-medium align-y-center", 
        layoutOrder = v10.layoutOrder
    }, {
        Avatar = v3.createElement(l_Avatar_0, {
            userId = tonumber(l_preview_0.id), 
            LayoutOrder = 1
        }), 
        TextContainer = (not not l_preview_0.displayName or l_preview_0.username) and v3.createElement(l_View_0, {
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
        })
    });
end;
local function v15(v13) --[[ Line: 56 ]] --[[ Name: ChatPreview ]]
    -- upvalues: v3 (copy), l_View_0 (copy), v9 (copy)
    local l_preview_1 = v13.preview;
    return v3.createElement(l_View_0, {
        tag = "size-full-0 auto-y gap-xsmall radius-medium bg-surface-200 padding-medium", 
        layoutOrder = v13.layoutOrder
    }, {
        Message = v3.createElement(v9, {
            input = l_preview_1.text, 
            tag = "auto-xy text-wrap text-align-x-left"
        })
    });
end;
local function v18(v16) --[[ Line: 70 ]] --[[ Name: ExperiencePreview ]]
    -- upvalues: v3 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy)
    local l_preview_2 = v16.preview;
    return v3.createElement(l_View_0, {
        tag = "row size-full-0 auto-y gap-medium radius-medium bg-surface-200 padding-medium align-y-center", 
        layoutOrder = v16.layoutOrder
    }, {
        ExperienceIcon = v3.createElement(l_Image_0, {
            Image = ("rbxthumb://type=GameIcon&id=%*&w=50&h=50"):format(l_preview_2.id), 
            Size = UDim2.fromOffset(40, 40), 
            tag = "radius-medium"
        }), 
        Name = v3.createElement(l_Text_0, {
            Text = l_preview_2.title, 
            RichText = true, 
            tag = "auto-xy text-wrap text-align-x-left"
        })
    });
end;
return v3.memo(function(v19) --[[ Line: 93 ]] --[[ Name: PreviewBox ]]
    -- upvalues: v3 (copy), v12 (copy), v15 (copy), v18 (copy)
    local l_preview_3 = v19.preview;
    if l_preview_3.type == "user" then
        return v3.createElement(v12, {
            preview = l_preview_3, 
            layoutOrder = v19.layoutOrder
        });
    elseif l_preview_3.type == "chat" then
        return v3.createElement(v15, {
            preview = l_preview_3, 
            layoutOrder = v19.layoutOrder
        });
    elseif l_preview_3.type == "experience" then
        return v3.createElement(v18, {
            preview = l_preview_3, 
            layoutOrder = v19.layoutOrder
        });
    else
        return nil;
    end;
end);