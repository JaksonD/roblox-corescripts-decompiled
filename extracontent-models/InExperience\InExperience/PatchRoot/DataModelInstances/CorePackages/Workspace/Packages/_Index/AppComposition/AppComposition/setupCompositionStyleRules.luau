local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppComposition");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_script_FirstAncestor_0.CompositionConfig);
local v5 = require(l_script_FirstAncestor_0.CompositionTags);
local v6 = require(l_script_FirstAncestor_0.getGlobalViewportBreakpoint);
local l_Header_0 = v5.ContentRegion.Header;
local l_Body_0 = v5.ContentRegion.Body;
local l_Detail_0 = v5.Layout.Detail;
local l_ClipAtMaxWidth_0 = v5.Utility.ClipAtMaxWidth;
local v11 = {
    [(".%*"):format(l_Header_0)] = {
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.fromScale(0.5, 0)
    }, 
    [(".%*::UIPadding"):format(l_Header_0)] = {
        PaddingLeft = "$CompositionMargin", 
        PaddingRight = "$CompositionMargin"
    }, 
    [(".%*::UISizeConstraint"):format(l_Header_0)] = {
        MaxSize = "$CompositionMaxWidthDiscovery"
    }, 
    [(".%*"):format(l_Body_0)] = {
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.fromScale(0.5, 0)
    }, 
    [(".%*::UIPadding"):format(l_Body_0)] = {
        PaddingLeft = "$CompositionMargin", 
        PaddingRight = "$CompositionMargin"
    }, 
    [(".%*::UISizeConstraint"):format(l_Body_0)] = {
        MaxSize = "$CompositionMaxWidthDiscovery"
    }, 
    [(".%* >> .%*::UISizeConstraint"):format(l_Detail_0, l_Header_0)] = {
        MaxSize = "$CompositionMaxWidthDetail"
    }, 
    [(".%* >> .%*::UISizeConstraint"):format(l_Detail_0, l_Body_0)] = {
        MaxSize = "$CompositionMaxWidthDetail"
    }, 
    [(".%*::StyleQuery #CompositionAtMaxWidthDiscovery"):format(l_Body_0)] = {
        MinSize = "$CompositionClipThresholdDiscovery"
    }, 
    [(".%*::StyleQuery #CompositionNotAtMaxWidthDiscovery"):format(l_Body_0)] = {
        MaxSize = "$CompositionMaxWidthDiscovery"
    }, 
    [("@CompositionAtMaxWidthDiscovery >> .%*"):format(l_ClipAtMaxWidth_0)] = {
        ClipsDescendants = true
    }, 
    [("@CompositionNotAtMaxWidthDiscovery >> .%*"):format(l_ClipAtMaxWidth_0)] = {
        ClipsDescendants = false
    }, 
    [(".%* >> .%*::StyleQuery #CompositionAtMaxWidthDetail"):format(l_Detail_0, l_Body_0)] = {
        MinSize = "$CompositionClipThresholdDetail"
    }, 
    [(".%* >> .%*::StyleQuery #CompositionNotAtMaxWidthDetail"):format(l_Detail_0, l_Body_0)] = {
        MaxSize = "$CompositionMaxWidthDetail"
    }, 
    [("@CompositionAtMaxWidthDetail >> .%*"):format(l_ClipAtMaxWidth_0)] = {
        ClipsDescendants = true
    }, 
    [("@CompositionNotAtMaxWidthDetail >> .%*"):format(l_ClipAtMaxWidth_0)] = {
        ClipsDescendants = false
    }
};
local function v17(v12, v13) --[[ Line: 101 ]] --[[ Name: applyRules ]]
    -- upvalues: v11 (copy)
    for v14, v15 in v11 do
        local l_StyleRule_0 = Instance.new("StyleRule");
        l_StyleRule_0.Selector = v14;
        l_StyleRule_0.Name = v14;
        l_StyleRule_0:SetProperties(v15);
        l_StyleRule_0.Parent = v12;
        table.insert(v13, l_StyleRule_0);
    end;
end;
local function v26(v18, v19) --[[ Line: 115 ]] --[[ Name: setupReactiveAttributes ]]
    -- upvalues: v3 (copy), v6 (copy), v4 (copy)
    local v22 = v3.createComputed(function(v20) --[[ Line: 116 ]]
        -- upvalues: v6 (ref), v4 (ref), v19 (copy)
        local v21 = v6(v20);
        return v4.getBaseConfig(v21, v19).margin;
    end);
    return v3.createEffect(function(v23) --[[ Line: 121 ]]
        -- upvalues: v22 (copy), v18 (copy)
        local v24 = v22(v23);
        local v25 = v24 * 2;
        v18:SetAttribute("CompositionMargin", UDim.new(0, v24));
        v18:SetAttribute("CompositionMaxWidthDiscovery", Vector2.new(1920 + v25, 1e999));
        v18:SetAttribute("CompositionClipThresholdDiscovery", Vector2.new(1920 + v25, 0));
        v18:SetAttribute("CompositionMaxWidthDetail", Vector2.new(800 + v25, 1e999));
        v18:SetAttribute("CompositionClipThresholdDetail", Vector2.new(800 + v25, 0));
    end);
end;
return function(v27, v28) --[[ Line: 135 ]] --[[ Name: setupCompositionStyleRules ]]
    -- upvalues: v17 (copy), v26 (copy)
    local v29 = {};
    v17(v27, v29);
    local v30 = v26(v27, v28);
    return function() --[[ Line: 142 ]]
        -- upvalues: v30 (copy), v29 (copy)
        v30();
        for _, v32 in v29 do
            v32:Destroy();
        end;
    end;
end;