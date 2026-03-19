local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v2 = require(l_script_FirstAncestor_0.Utils.splitByNewlines);
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Foundation);
local l_Text_0 = v6.Text;
local l_View_0 = v6.View;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v11 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
return function(v12) --[[ Line: 41 ]] --[[ Name: createPolicyEducationConfig ]]
    -- upvalues: v11 (copy), v2 (copy), v5 (copy), l_Text_0 (copy), l_View_0 (copy)
    local function v33(v13) --[[ Line: 42 ]] --[[ Name: PolicyEducationConfig ]]
        -- upvalues: v11 (ref), v12 (copy), v2 (ref), v5 (ref), l_Text_0 (ref), l_View_0 (ref)
        local v14 = v11:Format(v12.description);
        local v15 = if v14 then v2(v14) else {};
        local v16 = if v12.descriptionBullets and v12.descriptionBullets ~= "" then v11:Format(v12.descriptionBullets) else nil;
        local v17 = if v16 then v2(v16) else {};
        local v18 = {};
        for v19, v20 in v15 do
            table.insert(v18, v5.createElement(l_Text_0, {
                Text = v20, 
                tag = "auto-xy text-body-large text-align-x-left text-wrap", 
                LayoutOrder = v19
            }));
        end;
        local v21 = {};
        for v22, v23 in v17 do
            table.insert(v21, v5.createElement(l_View_0, {
                tag = "auto-xy row gap-small", 
                LayoutOrder = v22
            }, {
                BulletIcon = v5.createElement(l_Text_0, {
                    Text = "\226\128\162", 
                    tag = "auto-xy text-body-large", 
                    LayoutOrder = 1
                }), 
                BulletText = v5.createElement(l_Text_0, {
                    Text = v23, 
                    tag = "auto-xy text-body-large text-wrap text-align-x-left", 
                    LayoutOrder = 2
                })
            }));
        end;
        local l_createElement_0 = v5.createElement;
        local l_l_View_0_0 = l_View_0;
        local v26 = {
            tag = "col size-full-0 auto-y gap-medium", 
            LayoutOrder = v13.layoutOrder
        };
        local v27 = {
            Title = v5.createElement(l_Text_0, {
                Text = v11:Format(v12.title), 
                tag = "auto-xy text-heading-medium content-emphasis text-align-x-left text-wrap", 
                LayoutOrder = 1
            }), 
            Subtitle = if v12.subtitle then v5.createElement(l_Text_0, {
                Text = v11:Format(v12.subtitle), 
                tag = "auto-xy text-title-large content-emphasis text-align-x-left text-wrap", 
                LayoutOrder = 2
            }) else nil
        };
        local l_createElement_1 = v5.createElement;
        local l_l_View_0_1 = l_View_0;
        local v30 = {
            tag = "col size-full-0 auto-y gap-small", 
            LayoutOrder = 3
        };
        local v31 = {};
        local v32 = false;
        if #v15 > 0 then
            v32 = v5.createElement(l_View_0, {
                tag = "auto-xy col gap-medium", 
                LayoutOrder = 1
            }, unpack(v18));
        end;
        v31.Description = v32;
        v32 = false;
        if #v17 > 0 then
            v32 = v5.createElement(l_View_0, {
                tag = "auto-xy col gap-xsmall padding-x-large", 
                LayoutOrder = 2
            }, unpack(v21));
        end;
        v31.Bullets = v32;
        v27.ContentSection = l_createElement_1(l_l_View_0_1, v30, v31);
        return l_createElement_0(l_l_View_0_0, v26, v27);
    end;
    return {
        getIsVisible = function(_, _) --[[ Line: 125 ]] --[[ Name: getIsVisible ]]
            return true;
        end, 
        renderComponent = v5.memo(v33)
    };
end;