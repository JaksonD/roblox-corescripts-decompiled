local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(script.Parent.Types);
local v5 = require(script.Parent.staticRules);
local function v9(v6) --[[ Line: 25 ]] --[[ Name: kebabToPascal ]]
    return (v6:gsub("^%-?(.)", function(v7) --[[ Line: 27 ]]
        return v7:upper();
    end):gsub("%-(.)", function(v8) --[[ Line: 32 ]]
        return v8:upper();
    end));
end;
local function _(v10, v11) --[[ Line: 39 ]] --[[ Name: getTextPadding ]]
    local v12 = v10.TextSize / v11 * (v10.LineHeight * v11) - v10.TextSize;
    return (UDim.new(0, v12 / 2));
end;
local function v18(v14, v15) --[[ Line: 48 ]] --[[ Name: DefaultSizeRules ]]
    local v16 = v14.TextSize / v15 * (v14.LineHeight * v15) - v14.TextSize;
    local v17 = UDim.new(0, v16 / 2);
    return {
        {
            tag = "text-size-defaults", 
            priority = -1, 
            properties = {
                TextSize = "$TextSizeBodyLarge", 
                LineHeight = v14.LineHeight
            }, 
            children = {
                {
                    tag = "text-size-defaults", 
                    pseudo = "UIPadding", 
                    priority = -1, 
                    properties = {
                        PaddingTop = "$TextPaddingBodyLarge", 
                        PaddingBottom = "$TextPaddingBodyLarge"
                    }, 
                    attributes = {
                        {
                            name = "TextPaddingBodyLarge", 
                            value = v17
                        }
                    }
                }
            }, 
            attributes = {
                {
                    name = "TextSizeBodyLarge", 
                    value = v14.TextSize
                }
            }
        }
    };
end;
local function v29(v19, v20) --[[ Line: 86 ]] --[[ Name: ListLayoutSpacingRules ]]
    -- upvalues: v9 (copy), v2 (copy)
    local v21 = {};
    for _, v23 in v19 do
        local v24 = v9(v23.name);
        table.insert(v21, {
            tag = ("gap-%*"):format(v23.name), 
            pseudo = "UIListLayout", 
            properties = {
                Padding = ("$Gap%*"):format(v24)
            }, 
            attributes = {
                {
                    name = ("Gap%*"):format(v24), 
                    value = v23.size
                }
            }
        });
    end;
    local v25 = {};
    for _, v27 in v20 do
        local v28 = v9(v27.name);
        table.insert(v25, {
            tag = ("gutter-%*"):format(v27.name), 
            pseudo = "UIListLayout", 
            properties = {
                Padding = ("$Gutter%*"):format(v28)
            }, 
            attributes = {
                {
                    name = ("Gutter%*"):format(v28), 
                    value = v27.size
                }
            }
        });
    end;
    return v2.joinArrays(v21, v25);
end;
local function v35(v30) --[[ Line: 128 ]] --[[ Name: CornerRules ]]
    -- upvalues: v9 (copy)
    local v31 = {};
    for _, v33 in v30 do
        local v34 = v9(v33.name);
        table.insert(v31, {
            tag = ("radius-%*"):format(v33.name), 
            pseudo = "UICorner", 
            properties = {
                CornerRadius = ("$Radius%*"):format(v34)
            }, 
            attributes = {
                {
                    name = ("Radius%*"):format(v34), 
                    value = v33.size
                }
            }
        });
    end;
    return v31;
end;
local function v44(v36) --[[ Line: 151 ]] --[[ Name: SizeRules ]]
    -- upvalues: v9 (copy)
    local v37 = {};
    for _, v39 in v36 do
        local v40 = v9(v39.name);
        table.insert(v37, {
            tag = ("size-%*"):format(v39.name), 
            properties = {
                Size = ("$Size%*"):format(v40)
            }, 
            attributes = {
                {
                    name = ("Size%*"):format(v40), 
                    value = UDim2.new(v39.size, v39.size)
                }
            }
        });
        for _, v42 in v36 do
            local v43 = v9(v42.name);
            table.insert(v37, {
                tag = ("size-%*-%*"):format(v39.name, v42.name), 
                properties = {
                    Size = ("$Size%*_%*"):format(v40, v43)
                }, 
                attributes = {
                    {
                        name = ("Size%*_%*"):format(v40, v43), 
                        value = UDim2.new(v39.size, v42.size)
                    }
                }
            });
        end;
    end;
    return v37;
end;
local function v53(v45, v46) --[[ Line: 189 ]] --[[ Name: TypographyRules ]]
    -- upvalues: v9 (copy)
    local v47 = {};
    for v48, v49 in v45 do
        local v50 = v9(v48);
        local v51 = v49.TextSize / v46 * (v49.LineHeight * v46) - v49.TextSize;
        local v52 = UDim.new(0, v51 / 2);
        table.insert(v47, {
            tag = ("text-%*"):format(v48), 
            properties = {
                Font = v49.Font, 
                TextSize = ("$TextSize%*"):format(v50), 
                LineHeight = v49.LineHeight
            }, 
            attributes = {
                {
                    name = ("TextSize%*"):format(v50), 
                    value = v49.TextSize
                }
            }, 
            children = {
                {
                    tag = ("text-%*"):format(v48), 
                    pseudo = "UIPadding", 
                    priority = 0, 
                    properties = {
                        PaddingTop = ("$TextPadding%*"):format(v50), 
                        PaddingBottom = ("$TextPadding%*"):format(v50)
                    }, 
                    attributes = {
                        {
                            name = ("TextPadding%*"):format(v50), 
                            value = v52
                        }
                    }
                }
            }
        });
    end;
    return v47;
end;
local function v78(v54, v55) --[[ Line: 232 ]] --[[ Name: PaddingRules ]]
    -- upvalues: v9 (copy)
    local v56 = {};
    local v57 = {
        x = {
            "PaddingLeft", 
            "PaddingRight"
        }, 
        y = {
            "PaddingTop", 
            "PaddingBottom"
        }, 
        top = {
            "PaddingTop"
        }, 
        bottom = {
            "PaddingBottom"
        }, 
        left = {
            "PaddingLeft"
        }, 
        right = {
            "PaddingRight"
        }
    };
    for _, v59 in v54 do
        local v60 = v9(v59.name);
        table.insert(v56, {
            tag = ("padding-%*"):format(v59.name), 
            pseudo = "UIPadding", 
            properties = {
                PaddingTop = ("$Padding%*"):format(v60), 
                PaddingBottom = ("$Padding%*"):format(v60), 
                PaddingLeft = ("$Padding%*"):format(v60), 
                PaddingRight = ("$Padding%*"):format(v60)
            }, 
            attributes = {
                {
                    name = ("Padding%*"):format(v60), 
                    value = v59.size
                }
            }
        });
    end;
    for _, v62 in v55 do
        local v63 = v9(v62.name);
        table.insert(v56, {
            tag = ("margin-%*"):format(v62.name), 
            pseudo = "UIPadding", 
            properties = {
                PaddingTop = ("$Margin%*"):format(v63), 
                PaddingBottom = ("$Margin%*"):format(v63), 
                PaddingLeft = ("$Margin%*"):format(v63), 
                PaddingRight = ("$Margin%*"):format(v63)
            }, 
            attributes = {
                {
                    name = ("Margin%*"):format(v63), 
                    value = v62.size
                }
            }
        });
    end;
    for v64, v65 in v57 do
        for _, v67 in v54 do
            local v68 = v9(v67.name);
            local v69 = {};
            for _, v71 in v65 do
                v69[v71] = ("$Padding%*"):format(v68);
            end;
            table.insert(v56, {
                tag = ("padding-%*-%*"):format(v64, v67.name), 
                pseudo = "UIPadding", 
                properties = v69, 
                attributes = {
                    {
                        name = ("Padding%*"):format(v68), 
                        value = v67.size
                    }
                }
            });
        end;
        for _, v73 in v55 do
            local v74 = v9(v73.name);
            local v75 = {};
            for _, v77 in v65 do
                v75[v77] = ("$Margin%*"):format(v74);
            end;
            table.insert(v56, {
                tag = ("margin-%*-%*"):format(v64, v73.name), 
                pseudo = "UIPadding", 
                properties = v75, 
                attributes = {
                    {
                        name = ("Margin%*"):format(v74), 
                        value = v73.size
                    }
                }
            });
        end;
    end;
    return v56;
end;
return {
    rulesGenerator = function(v79, v80) --[[ Line: 327 ]] --[[ Name: rulesGenerator ]]
        -- upvalues: v5 (copy), v2 (copy), v18 (copy), v35 (copy), v44 (copy), v53 (copy), v78 (copy)
        local l_gaps_0 = v80.gaps;
        local l_gutters_0 = v80.gutters;
        local l_radii_0 = v80.radii;
        local l_sizes_0 = v80.sizes;
        local l_strokes_0 = v80.strokes;
        local l_typography_0 = v80.typography;
        local l_paddings_0 = v80.paddings;
        local l_margins_0 = v80.margins;
        local v89, _, v91 = v5.rulesGenerator(v79, v80);
        return v89, v2.joinArrays(v18(l_typography_0["body-large"], v79.Config.Text.NominalScale), v5.rules.ListLayoutRules(), v5.rules.ListLayoutSpacingRules(l_gaps_0, l_gutters_0), v35(l_radii_0), v44(l_sizes_0), v5.rules.StrokeSizeRules(l_strokes_0), v53(l_typography_0, v79.Config.Text.NominalScale), (v78(l_paddings_0, l_margins_0))), v91;
    end, 
    rules = {
        DefaultSizeRules = v18, 
        ListLayoutSpacingRules = v29, 
        CornerRules = v35, 
        SizeRules = v44, 
        TypographyRules = v53, 
        PaddingRules = v78
    }
};