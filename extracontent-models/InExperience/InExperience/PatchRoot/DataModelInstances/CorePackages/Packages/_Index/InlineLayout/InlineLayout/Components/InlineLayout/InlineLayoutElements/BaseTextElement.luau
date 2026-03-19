local l_Parent_0 = script:FindFirstAncestor("Components").Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Dash);
local l_isCli_0 = require(l_Parent_1.MarkdownCore).Utils.isCli;
local v5 = require(l_Parent_0.Enums.TextSplitBy);
local v6 = require(l_Parent_0.Utils.SplitText);
local _ = require(l_Parent_0.Types);
local l_Escape_0 = require(l_Parent_1.MarkdownCore).Utils.Escape;
local v9 = require(l_Parent_0.Utils.InlineElementType);
local v10 = require(l_Parent_0.Utils.getFontFace);
local l_join_0 = v3.join;
local v12 = {};
local function _(v13, v14) --[[ Line: 61 ]] --[[ Name: formatTextWithEngineTag ]]
    -- upvalues: v3 (copy)
    local v19 = v3.reduce(v14.attributes, function(v15, v16, v17) --[[ Line: 62 ]]
        local v18 = string.find(v16, "\"") and "'" or "\"";
        return (("%* %*=%*%*%*"):format(v15, v17, v18, v16, v18));
    end, "");
    return (("<%*%*>%*</%*>"):format(v14.name, v19, v13, v14.name));
end;
local function _(v21, v22) --[[ Line: 70 ]] --[[ Name: getRichText ]]
    -- upvalues: l_Escape_0 (copy), v3 (copy)
    local v23 = l_Escape_0.escapeRichFormatting(v21);
    return (v3.reduce(v22, function(v24, v25) --[[ Line: 72 ]]
        -- upvalues: v3 (ref)
        local v30 = v3.reduce(v25.attributes, function(v26, v27, v28) --[[ Line: 62 ]]
            local v29 = string.find(v27, "\"") and "'" or "\"";
            return (("%* %*=%*%*%*"):format(v26, v28, v29, v27, v29));
        end, "");
        return (("<%*%*>%*</%*>"):format(v25.name, v30, v24, v25.name));
    end, v23));
end;
local v32 = {};
v32.__index = v32;
v32.__type = v9;
v32.new = function(v33, v34, v35) --[[ Line: 82 ]] --[[ Name: new ]]
    -- upvalues: v32 (copy), v3 (copy), v5 (copy), l_Escape_0 (copy)
    local v36 = setmetatable({}, v32);
    v36.props = v34;
    v36.mapProps = v35 or v3.identity;
    v36.Element = v33;
    v36.canForceSplit = v36.splitBy ~= v5.Symbol;
    v36.splitBy = if v36.props.SplitBy then v36.props.SplitBy else v5.Word;
    local v37 = false;
    if v36.props.EngineTags ~= nil then
        v37 = next(v36.props.EngineTags) ~= nil;
    end;
    v36.hasRichText = v37;
    if v36.hasRichText and v36.props.Text then
        v36.props = v3.assign(v36.props, {
            Text = l_Escape_0.unescapeRichFormatting(v36.props.Text)
        });
    end;
    return v36;
end;
v32._clone = function(v38, v39) --[[ Line: 116 ]] --[[ Name: _clone ]]
    -- upvalues: v32 (copy)
    return v32.new(v38.Element, v39 or v38.props, v38.mapProps);
end;
local l_TextService_0 = game:GetService("TextService");
if l_isCli_0() then
    local v41 = {};
    v41.__index = v41;
    l_TextService_0 = setmetatable({}, v41);
    v41.GetTextBoundsAsync = function(_) --[[ Line: 127 ]] --[[ Name: GetTextBoundsAsync ]]
        return {
            X = 100
        };
    end;
end;
v32.getWidth = function(v43) --[[ Line: 132 ]] --[[ Name: getWidth ]]
    return v43:_getWidth(v43.props.Text);
end;
v32._getWidth = function(v44, v45) --[[ Line: 136 ]] --[[ Name: _getWidth ]]
    -- upvalues: v10 (copy), l_Escape_0 (copy), v3 (copy), l_TextService_0 (ref), v12 (copy)
    local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
    l_GetTextBoundsParams_0.Font = v10(v44.props.fontStyle);
    l_GetTextBoundsParams_0.Size = v44.props.fontStyle.FontSize;
    l_GetTextBoundsParams_0.Text = v45;
    if v44.hasRichText then
        local l_EngineTags_0 = v44.props.EngineTags;
        local v48 = l_Escape_0.escapeRichFormatting(v45);
        l_GetTextBoundsParams_0.Text = v3.reduce(l_EngineTags_0, function(v49, v50) --[[ Line: 72 ]]
            -- upvalues: v3 (ref)
            local v55 = v3.reduce(v50.attributes, function(v51, v52, v53) --[[ Line: 62 ]]
                local v54 = string.find(v52, "\"") and "'" or "\"";
                return (("%* %*=%*%*%*"):format(v51, v53, v54, v52, v54));
            end, "");
            return (("<%*%*>%*</%*>"):format(v50.name, v55, v49, v50.name));
        end, v48);
        l_GetTextBoundsParams_0.RichText = true;
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 148 ]]
        -- upvalues: l_TextService_0 (ref), l_GetTextBoundsParams_0 (copy)
        return l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0).X;
    end);
    if l_status_0 then
        return l_result_0;
    else
        if not v12[l_GetTextBoundsParams_0.Text] then
            v12[l_GetTextBoundsParams_0.Text] = true;
            warn((("Failed to get width for the %* in BaseTextElement"):format(l_GetTextBoundsParams_0.Text)));
        end;
        l_GetTextBoundsParams_0.RichText = false;
        return l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0).X;
    end;
end;
v32.split = function(v58, v59, v60) --[[ Line: 166 ]] --[[ Name: split ]]
    -- upvalues: v6 (copy), v5 (copy), l_join_0 (copy)
    v60 = v58.canForceSplit and v60;
    local v62, v63 = v6(if v60 then v5.Symbol else v58.splitBy, function(v61) --[[ Line: 168 ]]
        -- upvalues: v58 (copy)
        return v58:_getWidth(v61);
    end, v58.props.Text, v59);
    local v64 = v58:_clone(l_join_0(v58.props, {
        Text = v62
    }));
    if v63 then
        return v64, (v58:_clone(l_join_0(v58.props, {
            Text = v63:gsub("^%s*", "")
        })));
    else
        return v64, nil;
    end;
end;
v32.render = function(v65, v66, v67) --[[ Line: 179 ]] --[[ Name: render ]]
    -- upvalues: l_Escape_0 (copy), v3 (copy), v2 (copy), l_join_0 (copy)
    local l_Text_0 = v65.props.Text;
    if v65.hasRichText and v65.props.Text and v65.props.EngineTags then
        local l_Text_1 = v65.props.Text;
        local l_EngineTags_1 = v65.props.EngineTags;
        local v71 = l_Escape_0.escapeRichFormatting(l_Text_1);
        l_Text_0 = v3.reduce(l_EngineTags_1, function(v72, v73) --[[ Line: 72 ]]
            -- upvalues: v3 (ref)
            local v78 = v3.reduce(v73.attributes, function(v74, v75, v76) --[[ Line: 62 ]]
                local v77 = string.find(v75, "\"") and "'" or "\"";
                return (("%* %*=%*%*%*"):format(v74, v76, v77, v75, v77));
            end, "");
            return (("<%*%*>%*</%*>"):format(v73.name, v78, v72, v73.name));
        end, v71);
    end;
    return v2.createElement(v65.Element, v65.mapProps(l_join_0(v65.props, {
        id = v66, 
        Text = l_Text_0, 
        RichText = v65.hasRichText, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v67, 
        key = tostring(v67), 
        EngineTags = v3.None
    })));
end;
return v32;