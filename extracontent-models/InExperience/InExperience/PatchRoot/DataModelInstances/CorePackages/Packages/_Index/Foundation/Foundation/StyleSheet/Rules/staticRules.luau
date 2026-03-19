local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(script.Parent.Types);
local v5 = {
    Content = {
        "content"
    }, 
    Stroke = {
        "stroke"
    }, 
    Shift = {
        "bg"
    }, 
    Surface = {
        "bg"
    }, 
    OverMedia = {
        "bg"
    }, 
    System = {
        "bg", 
        "content", 
        "stroke"
    }, 
    Extended = {}, 
    Common = {}, 
    Selection = {}, 
    State = {}, 
    None = {}
};
local function v7(v6) --[[ Line: 41 ]] --[[ Name: DefaultRules ]]
    return {
        {
            tag = "gui-object-defaults", 
            priority = -1, 
            properties = {
                BackgroundTransparency = 1
            }
        }, 
        {
            tag = "text-defaults", 
            priority = -1, 
            properties = {
                Font = v6.Typography.BodyLarge.Font
            }
        }
    };
end;
local function v9(v8) --[[ Line: 60 ]] --[[ Name: DefaultSizeRules ]]
    return {
        {
            tag = "text-size-defaults", 
            priority = -1, 
            properties = {
                TextSize = v8.Typography.BodyLarge.FontSize, 
                LineHeight = v8.Typography.BodyLarge.LineHeight
            }
        }
    };
end;
local function v11(v10) --[[ Line: 73 ]] --[[ Name: DefaultColorRules ]]
    return {
        {
            tag = "text-color-defaults", 
            priority = -1, 
            properties = {
                TextColor3 = v10.Color.Content.Default.Color3, 
                TextTransparency = v10.Color.Content.Default.Transparency
            }
        }
    };
end;
local function v12() --[[ Line: 86 ]] --[[ Name: EngineDefaultBypassRules ]]
    return {
        {
            tag = "x-default-transparency", 
            properties = {
                BackgroundTransparency = 0
            }
        }, 
        {
            tag = "x-default-text-size", 
            properties = {
                TextSize = 8
            }
        }
    };
end;
local function v23() --[[ Line: 103 ]] --[[ Name: ListLayoutRules ]]
    -- upvalues: v2 (copy)
    local v13 = {
        {
            tag = "row", 
            pseudo = "UIListLayout", 
            properties = {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }
        }, 
        {
            tag = "col", 
            pseudo = "UIListLayout", 
            properties = {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }
        }
    };
    local v14 = {
        {
            tag = "align-x-left", 
            pseudo = "UIListLayout", 
            properties = {
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }
        }, 
        {
            tag = "align-x-center", 
            pseudo = "UIListLayout", 
            properties = {
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }
        }, 
        {
            tag = "align-x-right", 
            pseudo = "UIListLayout", 
            properties = {
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }
        }, 
        {
            tag = "align-y-top", 
            pseudo = "UIListLayout", 
            properties = {
                VerticalAlignment = Enum.VerticalAlignment.Top
            }
        }, 
        {
            tag = "align-y-center", 
            pseudo = "UIListLayout", 
            properties = {
                VerticalAlignment = Enum.VerticalAlignment.Center
            }
        }, 
        {
            tag = "align-y-bottom", 
            pseudo = "UIListLayout", 
            properties = {
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }
        }
    };
    local v15 = {
        {
            tag = "wrap", 
            pseudo = "UIListLayout", 
            properties = {
                Wraps = true
            }
        }, 
        {
            tag = "no-wrap", 
            pseudo = "UIListLayout", 
            properties = {
                Wraps = false
            }
        }
    };
    local v16 = {};
    for v17, v18 in {
        none = Enum.UIFlexAlignment.None, 
        fill = Enum.UIFlexAlignment.Fill, 
        around = Enum.UIFlexAlignment.SpaceAround, 
        between = Enum.UIFlexAlignment.SpaceBetween, 
        evenly = Enum.UIFlexAlignment.SpaceEvenly
    } do
        table.insert(v16, {
            tag = ("flex-%*"):format(v17), 
            pseudo = "UIListLayout", 
            properties = {
                HorizontalFlex = v18, 
                VerticalFlex = v18
            }
        });
        table.insert(v16, {
            tag = ("flex-x-%*"):format(v17), 
            pseudo = "UIListLayout", 
            properties = {
                HorizontalFlex = v18
            }
        });
        table.insert(v16, {
            tag = ("flex-y-%*"):format(v17), 
            pseudo = "UIListLayout", 
            properties = {
                VerticalFlex = v18
            }
        });
    end;
    local v19 = {
        auto = Enum.ItemLineAlignment.Automatic, 
        start = Enum.ItemLineAlignment.Start, 
        center = Enum.ItemLineAlignment.Center, 
        ["end"] = Enum.ItemLineAlignment.End, 
        stretch = Enum.ItemLineAlignment.Stretch
    };
    local v20 = {};
    for v21, v22 in v19 do
        table.insert(v20, {
            tag = ("items-%*"):format(v21), 
            pseudo = "UIListLayout", 
            properties = {
                ItemLineAlignment = v22
            }
        });
    end;
    return v2.joinArrays(v13, v14, v15, v16, v20);
end;
local function v32(v24, v25) --[[ Line: 247 ]] --[[ Name: ListLayoutSpacingRules ]]
    -- upvalues: v2 (copy)
    local v26 = {};
    for _, v28 in v24 do
        table.insert(v26, {
            tag = ("gap-%*"):format(v28.name), 
            pseudo = "UIListLayout", 
            properties = {
                Padding = v28.size
            }
        });
    end;
    local v29 = {};
    for _, v31 in v25 do
        table.insert(v29, {
            tag = ("gutter-%*"):format(v31.name), 
            pseudo = "UIListLayout", 
            properties = {
                Padding = v31.size
            }
        });
    end;
    return v2.joinArrays(v26, v29);
end;
local function v42() --[[ Line: 275 ]] --[[ Name: FlexItemRules ]]
    -- upvalues: v2 (copy)
    local v33 = {
        {
            tag = "grow", 
            pseudo = "UIFlexItem", 
            properties = {
                FlexMode = Enum.UIFlexMode.Grow
            }
        }, 
        {
            tag = "shrink", 
            pseudo = "UIFlexItem", 
            properties = {
                FlexMode = Enum.UIFlexMode.Shrink
            }
        }, 
        {
            tag = "fill", 
            pseudo = "UIFlexItem", 
            properties = {
                FlexMode = Enum.UIFlexMode.Fill
            }
        }, 
        {
            tag = "no-flex", 
            pseudo = "UIFlexItem", 
            properties = {
                FlexMode = Enum.UIFlexMode.None
            }
        }
    };
    local v34 = {
        1, 
        2, 
        3, 
        4, 
        5
    };
    local v35 = {};
    local v36 = {};
    for v37 in v34 do
        table.insert(v35, {
            tag = ("grow-%*"):format(v37), 
            pseudo = "UIFlexItem", 
            properties = {
                FlexMode = Enum.UIFlexMode.Custom, 
                GrowRatio = v37
            }
        });
        table.insert(v36, {
            tag = ("shrink-%*"):format(v37), 
            pseudo = "UIFlexItem", 
            properties = {
                FlexMode = Enum.UIFlexMode.Custom, 
                ShrinkRatio = v37
            }
        });
    end;
    local v38 = {
        auto = Enum.ItemLineAlignment.Automatic, 
        start = Enum.ItemLineAlignment.Start, 
        center = Enum.ItemLineAlignment.Center, 
        ["end"] = Enum.ItemLineAlignment.End, 
        stretch = Enum.ItemLineAlignment.Stretch
    };
    local v39 = {};
    for v40, v41 in v38 do
        table.insert(v39, {
            tag = ("self-%*"):format(v40), 
            pseudo = "UIFlexItem", 
            properties = {
                ItemLineAlignment = v41
            }
        });
    end;
    return v2.joinArrays(v33, v35, v36, v39);
end;
local function v47(v43) --[[ Line: 354 ]] --[[ Name: CornerRules ]]
    local v44 = {};
    for _, v46 in v43 do
        table.insert(v44, {
            tag = ("radius-%*"):format(v46.name), 
            pseudo = "UICorner", 
            properties = {
                CornerRadius = v46.size
            }
        });
    end;
    return v44;
end;
local function v54(v48) --[[ Line: 370 ]] --[[ Name: SizeRules ]]
    local v49 = {};
    for _, v51 in v48 do
        table.insert(v49, {
            tag = ("size-%*"):format(v51.name), 
            properties = {
                Size = UDim2.new(v51.size, v51.size)
            }
        });
        for _, v53 in v48 do
            table.insert(v49, {
                tag = ("size-%*-%*"):format(v51.name, v53.name), 
                properties = {
                    Size = UDim2.new(v51.size, v53.size)
                }
            });
        end;
    end;
    return v49;
end;
local function v64(v55, v56) --[[ Line: 393 ]] --[[ Name: BackgroundRules ]]
    -- upvalues: v5 (copy)
    local v57 = {};
    for v58, v59 in v55 do
        if table.find(v5[v58], "bg") then
            for v60, v61 in v59 do
                table.insert(v57, {
                    tag = ("bg-%*"):format(v60), 
                    properties = {
                        BackgroundColor3 = v61.Color3, 
                        BackgroundTransparency = v61.Transparency
                    }
                });
            end;
        end;
    end;
    for v62, v63 in v56 do
        table.insert(v57, {
            tag = ("bg-%*"):format(v62), 
            properties = {
                BackgroundColor3 = v63.Background.Color3, 
                BackgroundTransparency = v63.Background.Transparency
            }
        });
    end;
    return v57;
end;
local function v69(v65) --[[ Line: 423 ]] --[[ Name: StrokeSizeRules ]]
    local v66 = {};
    for _, v68 in v65 do
        if v68.name ~= "none" then
            table.insert(v66, {
                tag = ("stroke-%*"):format(v68.name), 
                pseudo = "UIStroke", 
                properties = {
                    Thickness = v68.size
                }
            });
        end;
    end;
    return v66;
end;
local function v81(v70, v71) --[[ Line: 444 ]] --[[ Name: StrokeRules ]]
    -- upvalues: v5 (copy)
    local v72 = {};
    for v73, v74 in v70 do
        if table.find(v5[v73], "stroke") then
            for v75, v76 in v74 do
                table.insert(v72, {
                    tag = ("stroke-%*"):format(v75), 
                    pseudo = "UIStroke", 
                    properties = {
                        Color = v76.Color3, 
                        Transparency = v76.Transparency
                    }
                });
            end;
        end;
    end;
    for v77, v78 in v71 do
        table.insert(v72, {
            tag = ("stroke-%*"):format(v77), 
            pseudo = "UIStroke", 
            properties = {
                Color = v78.Border.Color3, 
                Transparency = v78.Border.Transparency
            }
        });
    end;
    for v79, v80 in {
        center = Enum.BorderStrokePosition.Center, 
        inner = Enum.BorderStrokePosition.Inner, 
        outer = Enum.BorderStrokePosition.Outer
    } do
        table.insert(v72, {
            tag = ("stroke-position-%*"):format(v79), 
            pseudo = "UIStroke", 
            properties = {
                BorderStrokePosition = v80
            }
        });
    end;
    return v72;
end;
local function v91(v82, v83) --[[ Line: 492 ]] --[[ Name: ContentRules ]]
    -- upvalues: v5 (copy)
    local v84 = {};
    for v85, v86 in v82 do
        if table.find(v5[v85], "content") then
            for v87, v88 in v86 do
                table.insert(v84, {
                    tag = ("content-%*"):format(v87), 
                    properties = {
                        ImageColor3 = v88.Color3, 
                        ImageTransparency = v88.Transparency, 
                        TextColor3 = v88.Color3, 
                        TextTransparency = v88.Transparency
                    }
                });
            end;
        end;
    end;
    for v89, v90 in v83 do
        table.insert(v84, {
            tag = ("content-%*"):format(v89), 
            properties = {
                ImageColor3 = v90.Foreground.Color3, 
                ImageTransparency = v90.Foreground.Transparency, 
                TextColor3 = v90.Foreground.Color3, 
                TextTransparency = v90.Foreground.Transparency
            }
        });
    end;
    return v84;
end;
local function v99(v92, v93) --[[ Line: 526 ]] --[[ Name: TypographyRules ]]
    local v94 = {};
    for v95, v96 in v92 do
        local v97 = v96.TextSize / v93 * (v96.LineHeight * v93) - v96.TextSize;
        local v98 = UDim.new(0, v97 / 2);
        table.insert(v94, {
            tag = ("text-%*"):format(v95), 
            properties = v96, 
            children = {
                {
                    tag = ("text-%*"):format(v95), 
                    pseudo = "UIPadding", 
                    properties = {
                        PaddingTop = v98, 
                        PaddingBottom = v98
                    }
                }
            }
        });
    end;
    return v94;
end;
local function v107() --[[ Line: 554 ]] --[[ Name: TextRules ]]
    local v100 = {};
    for v101, v102 in {
        left = Enum.TextXAlignment.Left, 
        center = Enum.TextXAlignment.Center, 
        right = Enum.TextXAlignment.Right
    } do
        table.insert(v100, {
            tag = ("text-align-x-%*"):format(v101), 
            properties = {
                TextXAlignment = v102
            }
        });
    end;
    for v103, v104 in {
        top = Enum.TextYAlignment.Top, 
        center = Enum.TextYAlignment.Center, 
        bottom = Enum.TextYAlignment.Bottom
    } do
        table.insert(v100, {
            tag = ("text-align-y-%*"):format(v103), 
            properties = {
                TextYAlignment = v104
            }
        });
    end;
    for v105, v106 in {
        none = Enum.TextTruncate.None, 
        ["end"] = Enum.TextTruncate.AtEnd, 
        split = Enum.TextTruncate.SplitWord
    } do
        table.insert(v100, {
            tag = ("text-truncate-%*"):format(v105), 
            properties = {
                TextTruncate = v106
            }
        });
    end;
    table.insert(v100, {
        tag = "text-wrap", 
        properties = {
            TextWrapped = true
        }
    });
    table.insert(v100, {
        tag = "text-no-wrap", 
        properties = {
            TextWrapped = false
        }
    });
    return v100;
end;
local function v128(v108, v109) --[[ Line: 619 ]] --[[ Name: PaddingRules ]]
    local v110 = {};
    local v111 = {
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
    for _, v113 in v108 do
        table.insert(v110, {
            tag = ("padding-%*"):format(v113.name), 
            pseudo = "UIPadding", 
            properties = {
                PaddingTop = v113.size, 
                PaddingBottom = v113.size, 
                PaddingLeft = v113.size, 
                PaddingRight = v113.size
            }
        });
    end;
    for _, v115 in v109 do
        table.insert(v110, {
            tag = ("margin-%*"):format(v115.name), 
            pseudo = "UIPadding", 
            properties = {
                PaddingTop = v115.size, 
                PaddingBottom = v115.size, 
                PaddingLeft = v115.size, 
                PaddingRight = v115.size
            }
        });
    end;
    for v116, v117 in v111 do
        for _, v119 in v108 do
            local v120 = {};
            for _, v122 in v117 do
                v120[v122] = v119.size;
            end;
            table.insert(v110, {
                tag = ("padding-%*-%*"):format(v116, v119.name), 
                pseudo = "UIPadding", 
                properties = v120
            });
        end;
        for _, v124 in v109 do
            local v125 = {};
            for _, v127 in v117 do
                v125[v127] = v124.size;
            end;
            table.insert(v110, {
                tag = ("margin-%*-%*"):format(v116, v124.name), 
                pseudo = "UIPadding", 
                properties = v125
            });
        end;
    end;
    return v110;
end;
local function v133() --[[ Line: 686 ]] --[[ Name: AutomaticSizeRules ]]
    local v129 = {
        none = Enum.AutomaticSize.None, 
        x = Enum.AutomaticSize.X, 
        y = Enum.AutomaticSize.Y, 
        xy = Enum.AutomaticSize.XY
    };
    local v130 = {};
    for v131, v132 in v129 do
        table.insert(v130, {
            tag = ("auto-%*"):format(v131), 
            properties = {
                AutomaticSize = v132
            }
        });
    end;
    return v130;
end;
local function v141() --[[ Line: 708 ]] --[[ Name: PositionRules ]]
    local v134 = {};
    local v135 = {
        left = 0, 
        center = 0.5, 
        right = 1
    };
    local v136 = {
        top = 0, 
        center = 0.5, 
        bottom = 1
    };
    for v137, v138 in v135 do
        for v139, v140 in v136 do
            table.insert(v134, {
                tag = ("position-%*-%*"):format(v139, v137), 
                properties = {
                    Position = UDim2.fromScale(v138, v140)
                }
            });
        end;
    end;
    return v134;
end;
local function v149() --[[ Line: 726 ]] --[[ Name: AnchorPointRules ]]
    local v142 = {};
    local v143 = {
        left = 0, 
        center = 0.5, 
        right = 1
    };
    local v144 = {
        top = 0, 
        center = 0.5, 
        bottom = 1
    };
    for v145, v146 in v143 do
        for v147, v148 in v144 do
            table.insert(v142, {
                tag = ("anchor-%*-%*"):format(v147, v145), 
                properties = {
                    AnchorPoint = Vector2.new(v146, v148)
                }
            });
        end;
    end;
    return v142;
end;
local function v150() --[[ Line: 744 ]] --[[ Name: ClipsDescendantRules ]]
    return {
        {
            tag = "clip", 
            properties = {
                ClipsDescendants = true
            }
        }, 
        {
            tag = "no-clip", 
            properties = {
                ClipsDescendants = false
            }
        }
    };
end;
local function _(v151, v152) --[[ Line: 761 ]] --[[ Name: roundDecimals ]]
    local v153 = 10 ^ v152;
    return math.round(v151 * v153) / v153;
end;
local function v158() --[[ Line: 766 ]] --[[ Name: AspectRatioRules ]]
    local v155 = {};
    for _, v157 in {
        {
            1, 
            1
        }, 
        {
            5, 
            4
        }, 
        {
            4, 
            3
        }, 
        {
            3, 
            2
        }, 
        {
            16, 
            9
        }, 
        {
            2, 
            1
        }
    } do
        table.insert(v155, {
            tag = ("aspect-%*-%*"):format(v157[1], v157[2]), 
            pseudo = "UIAspectRatioConstraint", 
            properties = {
                AspectRatio = math.round(v157[1] / v157[2] * 1000) / 1000
            }
        });
        if v157[1] ~= v157[2] then
            table.insert(v155, {
                tag = ("aspect-%*-%*"):format(v157[2], v157[1]), 
                pseudo = "UIAspectRatioConstraint", 
                properties = {
                    AspectRatio = math.round(v157[2] / v157[1] * 1000) / 1000
                }
            });
        end;
    end;
    return v155;
end;
local function v164(v159) --[[ Line: 794 ]] --[[ Name: DeprecatedColorRules ]]
    local v160 = {};
    for v161, v162 in v159.System do
        local v163 = v161:sub(8);
        table.insert(v160, {
            tag = ("bg-%*"):format(v163), 
            properties = {
                BackgroundColor3 = v162.Color3, 
                BackgroundTransparency = v162.Transparency
            }, 
            deprecatedFor = ("bg-%*"):format(v161)
        });
        if v163 ~= "emphasis" then
            table.insert(v160, {
                tag = ("content-%*"):format(v163), 
                properties = {
                    ImageColor3 = v162.Color3, 
                    ImageTransparency = v162.Transparency, 
                    TextColor3 = v162.Color3, 
                    TextTransparency = v162.Transparency
                }, 
                deprecatedFor = ("content-%*"):format(v161)
            });
            table.insert(v160, {
                tag = ("stroke-%*"):format(v163), 
                pseudo = "UIStroke", 
                properties = {
                    Color = v162.Color3, 
                    Transparency = v162.Transparency
                }, 
                deprecatedFor = ("stroke-%*"):format(v161)
            });
        end;
    end;
    return v160;
end;
local _ = function(v165) --[[ Line: 841 ]] --[[ Name: _addModifiers ]]
    local v166 = {};
    for _, v168 in v165 do
        local v169 = table.clone(v168);
        v169.tag = ("hover-%*"):format(v168.tag);
        v169.modifier = "hover";
        table.insert(v166, v168);
        table.insert(v166, v169);
    end;
    return v166;
end;
return {
    rulesGenerator = function(v171, v172) --[[ Line: 861 ]] --[[ Name: rulesGenerator ]]
        -- upvalues: v2 (copy), v7 (copy), v12 (copy), v42 (copy), v107 (copy), v133 (copy), v141 (copy), v149 (copy), v150 (copy), v158 (copy), v9 (copy), v23 (copy), v32 (copy), v47 (copy), v54 (copy), v69 (copy), v99 (copy), v128 (copy), v11 (copy), v164 (copy), v64 (copy), v81 (copy), v91 (copy)
        local l_colors_0 = v172.colors;
        local l_variants_0 = v172.variants;
        local l_gaps_0 = v172.gaps;
        local l_gutters_0 = v172.gutters;
        local l_radii_0 = v172.radii;
        local l_sizes_0 = v172.sizes;
        local l_strokes_0 = v172.strokes;
        local l_typography_0 = v172.typography;
        local l_paddings_0 = v172.paddings;
        local l_margins_0 = v172.margins;
        return v2.joinArrays(v7(v171), v12(), v42(), v107(), v133(), v141(), v149(), v150(), (v158())), v2.joinArrays(v9(v171), v23(), v32(l_gaps_0, l_gutters_0), v47(l_radii_0), v54(l_sizes_0), v69(l_strokes_0), v99(l_typography_0, v171.Config.Text.NominalScale), (v128(l_paddings_0, l_margins_0))), (v2.joinArrays(v11(v171), v164(l_colors_0), v64(l_colors_0, l_variants_0), v81(l_colors_0, l_variants_0), (v91(l_colors_0, l_variants_0))));
    end, 
    rules = {
        DefaultRules = v7, 
        EngineDefaultBypassRules = v12, 
        FlexItemRules = v42, 
        TextRules = v107, 
        AutomaticSizeRules = v133, 
        PositionRules = v141, 
        AnchorPointRules = v149, 
        ClipsDescendantRules = v150, 
        AspectRatioRules = v158, 
        DefaultSizeRules = v9, 
        ListLayoutRules = v23, 
        ListLayoutSpacingRules = v32, 
        CornerRules = v47, 
        SizeRules = v54, 
        StrokeSizeRules = v69, 
        TypographyRules = v99, 
        PaddingRules = v128, 
        DefaultColorRules = v11, 
        DeprecatedColorRules = v164, 
        BackgroundRules = v64, 
        StrokeRules = v81, 
        ContentRules = v91
    }
};