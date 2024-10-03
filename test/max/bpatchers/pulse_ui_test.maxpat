{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 34.0, 87.0, 2087.0, 1258.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "serialist",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 189.0, 153.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 795.0, 520.0, 70.0, 22.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 795.0, 559.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 795.0, 559.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 795.0, 605.0, 121.0, 22.0 ],
					"text" : "gate~ @ramptime 50"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 897.0, 565.0, 101.0, 22.0 ],
					"text" : "*~ 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 897.0, 520.0, 66.0, 22.0 ],
					"text" : "cycle~ 750"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 979.0, 493.0, 52.0, 22.0 ],
					"text" : "1., 0. 50"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 979.0, 520.0, 45.0, 22.0 ],
					"text" : "curve~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 909.0, 446.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 909.0, 410.0, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 559.0, 154.0, 89.0, 22.0 ],
					"text" : "0 0.25 0.5 0.75"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 471.0, 154.0, 69.0, 22.0 ],
					"text" : "0 0.33 0.67"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 425.0, 154.0, 35.0, 22.0 ],
					"text" : "0 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 381.0, 154.0, 29.5, 22.0 ],
					"text" : "0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 309.0, 154.0, 29.5, 22.0 ],
					"text" : "0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 277.0, 154.0, 29.5, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-106",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1042.0, 639.0, 54.0, 22.0 ],
					"text" : "*~ 0.707"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 1036.0, 782.0, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-73",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 2,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1042.0, 674.0, 50.0, 75.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ -12.0 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "live.gain~[2]",
							"parameter_mmax" : 6.0,
							"parameter_mmin" : -70.0,
							"parameter_modmode" : 0,
							"parameter_shortname" : "live.gain~",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4
						}

					}
,
					"varname" : "live.gain~[2]"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1042.0, 511.0, 70.0, 22.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-77",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1042.0, 550.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 785.0, 204.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1042.0, 596.0, 121.0, 22.0 ],
					"text" : "gate~ @ramptime 50"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1144.0, 556.0, 101.0, 22.0 ],
					"text" : "*~ 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-80",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1144.0, 511.0, 73.0, 22.0 ],
					"text" : "cycle~ 1000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1226.0, 484.0, 52.0, 22.0 ],
					"text" : "1., 0. 50"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 1226.0, 511.0, 45.0, 22.0 ],
					"text" : "curve~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1156.0, 437.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 1156.0, 401.0, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 630.0, 565.5, 77.0, 22.0 ],
					"text" : "loadmess 40"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 503.0, 539.5, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 496.0, 573.5, 115.0, 22.0 ],
					"text" : "device \"from Max 1\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 328.0, 535.5, 96.0, 22.0 ],
					"text" : "expr 60 + 2 * $i1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 309.0, 565.5, 51.0, 22.0 ],
					"text" : "zl.group"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 303.0, 498.5, 44.0, 22.0 ],
					"text" : "uzi 0 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 231.0, 437.5, 29.5, 22.0 ],
					"text" : "t l l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 303.0, 467.5, 63.0, 22.0 ],
					"text" : "ser.util len"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 491.0, 397.5, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 412.0, 398.5, 61.0, 49.0 ],
					"text" : "offset 0. 0.25 0.5 0.75"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-13",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "ser.makenote.ui.maxpat",
					"numinlets" : 4,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 239.0, 632.5, 389.0, 79.0 ],
					"varname" : "ser.makenote.ui",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-7",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "ser.pulse.ui.maxpat",
					"numinlets" : 4,
					"numoutlets" : 7,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "", "", "", "", "", "" ],
					"patching_rect" : [ 231.0, 244.5, 140.0, 123.0 ],
					"varname" : "ser.pulse.ui",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1095.0, 212.0, 59.0, 22.0 ],
					"text" : "tempo $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium",
					"fontsize" : 9.5,
					"id" : "obj-53",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 954.0, 188.0, 38.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1315.0, 147.0, 38.0, 18.0 ],
					"text" : "beat:"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium",
					"fontsize" : 9.5,
					"id" : "obj-52",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 955.0, 169.0, 38.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1315.0, 127.0, 38.0, 18.0 ],
					"text" : "bar:"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium",
					"fontsize" : 9.5,
					"id" : "obj-50",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1007.0, 321.0, 19.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1384.0, 147.0, 19.0, 18.0 ],
					"text" : "3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1007.0, 295.0, 41.0, 22.0 ],
					"text" : "set $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium",
					"fontsize" : 9.5,
					"id" : "obj-49",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 956.0, 321.0, 25.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1378.0, 127.0, 25.0, 18.0 ],
					"text" : "249"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 956.0, 295.0, 41.0, 22.0 ],
					"text" : "set $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium",
					"fontsize" : 9.5,
					"id" : "obj-34",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1055.0, 142.0, 38.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1315.0, 168.0, 38.0, 18.0 ],
					"text" : "tempo:"
				}

			}
, 			{
				"box" : 				{
					"appearance" : 2,
					"id" : "obj-32",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1095.0, 144.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1360.0, 170.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 120 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "live.numbox",
							"parameter_mmax" : 208.0,
							"parameter_mmin" : 40.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "tempo"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.6141071916, 0.4755443037, 1.0, 1.0 ],
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1015.0, 216.0, 56.0, 22.0 ],
					"text" : "metro 25"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 956.0, 181.0, 77.666668981313705, 22.0 ],
					"text" : "t i i"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.482352941176471, 0.847058823529412, 0.36078431372549, 1.0 ],
					"fontface" : 1,
					"fontsize" : 18.0,
					"id" : "obj-26",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 956.0, 136.0, 87.666669279336929, 31.000000923871994 ],
					"presentation" : 1,
					"presentation_rect" : [ 1315.0, 94.0, 87.666669279336929, 31.000000923871994 ],
					"saved_attribute_attributes" : 					{
						"activebgoncolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_initial" : [ 0.0 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "transport",
							"parameter_mmax" : 1,
							"parameter_modmode" : 0,
							"parameter_shortname" : "live.text[1]",
							"parameter_type" : 2
						}

					}
,
					"text" : "Transport",
					"texton" : "Transport",
					"varname" : "transport"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 9,
					"outlettype" : [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
					"patching_rect" : [ 956.0, 260.0, 103.0, 22.0 ],
					"text" : "transport"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"order" : 0,
					"source" : [ "obj-18", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"order" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"order" : 1,
					"source" : [ "obj-18", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"order" : 1,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-24", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-25", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-25", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-30", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 2 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 1 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 1 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 1 ],
					"order" : 1,
					"source" : [ "obj-7", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"order" : 0,
					"source" : [ "obj-7", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 1 ],
					"order" : 0,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"order" : 1,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 0 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 1 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 1 ],
					"source" : [ "obj-83", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-13::obj-6" : [ "live.numbox[8]", "live.numbox", 0 ],
			"obj-13::obj-7" : [ "live.numbox[37]", "live.numbox", 0 ],
			"obj-13::obj-72" : [ "live.text[65]", "live.text", 0 ],
			"obj-13::obj-8" : [ "live.text[64]", "live.text", 0 ],
			"obj-13::obj-82" : [ "live.text[63]", "live.text", 0 ],
			"obj-13::obj-83" : [ "live.numbox[36]", "live.numbox", 0 ],
			"obj-26" : [ "transport", "live.text[1]", 0 ],
			"obj-32" : [ "live.numbox", "live.numbox", 0 ],
			"obj-73" : [ "live.gain~[2]", "live.gain~", 0 ],
			"obj-7::obj-10" : [ "live.menu", "live.menu", 0 ],
			"obj-7::obj-11" : [ "live.menu[6]", "live.menu", 0 ],
			"obj-7::obj-2" : [ "live.menu[5]", "live.menu", 0 ],
			"obj-7::obj-20::obj-1" : [ "live.numbox[23]", "live.numbox", 0 ],
			"obj-7::obj-20::obj-13" : [ "live.text[164]", "live.text[36]", 0 ],
			"obj-7::obj-20::obj-14" : [ "live.text[118]", "live.text[36]", 0 ],
			"obj-7::obj-20::obj-15" : [ "live.text[162]", "live.text[36]", 0 ],
			"obj-7::obj-20::obj-32" : [ "live.text[157]", "live.text[36]", 0 ],
			"obj-7::obj-20::obj-33" : [ "live.text[190]", "live.text[36]", 0 ],
			"obj-7::obj-20::obj-34" : [ "live.text[260]", "live.text[36]", 0 ],
			"obj-7::obj-20::obj-42" : [ "live.text[158]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-44" : [ "live.text[159]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-46" : [ "live.text[116]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-5" : [ "live.menu[17]", "live.menu", 0 ],
			"obj-7::obj-20::obj-52" : [ "live.text[156]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-55" : [ "live.text[258]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-57" : [ "live.text[115]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-61" : [ "live.text[160]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-62" : [ "live.text[62]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-63" : [ "live.text[161]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-64" : [ "live.text[117]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-65" : [ "live.text[163]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-69" : [ "live.text[259]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-70" : [ "live.text[165]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-71" : [ "live.text[261]", "live.text[15]", 0 ],
			"obj-7::obj-20::obj-72" : [ "live.text[166]", "live.text[15]", 0 ],
			"obj-7::obj-22" : [ "live.numbox[18]", "live.numbox", 0 ],
			"obj-7::obj-24::obj-1" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-7::obj-24::obj-13" : [ "live.text[24]", "live.text[36]", 0 ],
			"obj-7::obj-24::obj-14" : [ "live.text[31]", "live.text[36]", 0 ],
			"obj-7::obj-24::obj-15" : [ "live.text[36]", "live.text[36]", 0 ],
			"obj-7::obj-24::obj-32" : [ "live.text[25]", "live.text[36]", 0 ],
			"obj-7::obj-24::obj-33" : [ "live.text[32]", "live.text[36]", 0 ],
			"obj-7::obj-24::obj-34" : [ "live.text[37]", "live.text[36]", 0 ],
			"obj-7::obj-24::obj-42" : [ "live.text[26]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-44" : [ "live.text[30]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-46" : [ "live.text[39]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-5" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-7::obj-24::obj-52" : [ "live.text[43]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-55" : [ "live.text[33]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-57" : [ "live.text[38]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-61" : [ "live.text[40]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-62" : [ "live.text[34]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-63" : [ "live.text[27]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-64" : [ "live.text[41]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-65" : [ "live.text[28]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-69" : [ "live.text[42]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-70" : [ "live.text[35]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-71" : [ "live.text[29]", "live.text[15]", 0 ],
			"obj-7::obj-24::obj-72" : [ "live.text[44]", "live.text[15]", 0 ],
			"obj-7::obj-27" : [ "live.text[45]", "live.text", 0 ],
			"obj-7::obj-36" : [ "live.text[46]", "live.text", 0 ],
			"obj-7::obj-5::obj-1" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-7::obj-5::obj-13" : [ "live.text[8]", "live.text[36]", 0 ],
			"obj-7::obj-5::obj-14" : [ "live.text[18]", "live.text[36]", 0 ],
			"obj-7::obj-5::obj-15" : [ "live.text[5]", "live.text[36]", 0 ],
			"obj-7::obj-5::obj-32" : [ "live.text[6]", "live.text[36]", 0 ],
			"obj-7::obj-5::obj-33" : [ "live.text[15]", "live.text[36]", 0 ],
			"obj-7::obj-5::obj-34" : [ "live.text[19]", "live.text[36]", 0 ],
			"obj-7::obj-5::obj-42" : [ "live.text[9]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-44" : [ "live.text[11]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-46" : [ "live.text[22]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-5" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-7::obj-5::obj-52" : [ "live.text[13]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-55" : [ "live.text[3]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-57" : [ "live.text[20]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-61" : [ "live.text[16]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-62" : [ "live.text[7]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-63" : [ "live.text[10]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-64" : [ "live.text[21]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-65" : [ "live.text[12]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-69" : [ "live.text[23]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-70" : [ "live.text[14]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-71" : [ "live.text[4]", "live.text[15]", 0 ],
			"obj-7::obj-5::obj-72" : [ "live.text[17]", "live.text[15]", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"parameter_overrides" : 			{
				"obj-13::obj-72" : 				{
					"parameter_longname" : "live.text[65]"
				}
,
				"obj-13::obj-8" : 				{
					"parameter_longname" : "live.text[64]"
				}
,
				"obj-13::obj-82" : 				{
					"parameter_longname" : "live.text[63]"
				}
,
				"obj-7::obj-20::obj-1" : 				{
					"parameter_longname" : "live.numbox[23]"
				}
,
				"obj-7::obj-20::obj-13" : 				{
					"parameter_longname" : "live.text[164]"
				}
,
				"obj-7::obj-20::obj-14" : 				{
					"parameter_longname" : "live.text[118]"
				}
,
				"obj-7::obj-20::obj-15" : 				{
					"parameter_longname" : "live.text[162]"
				}
,
				"obj-7::obj-20::obj-32" : 				{
					"parameter_longname" : "live.text[157]"
				}
,
				"obj-7::obj-20::obj-33" : 				{
					"parameter_longname" : "live.text[190]"
				}
,
				"obj-7::obj-20::obj-34" : 				{
					"parameter_longname" : "live.text[260]"
				}
,
				"obj-7::obj-20::obj-42" : 				{
					"parameter_longname" : "live.text[158]"
				}
,
				"obj-7::obj-20::obj-44" : 				{
					"parameter_longname" : "live.text[159]"
				}
,
				"obj-7::obj-20::obj-46" : 				{
					"parameter_longname" : "live.text[116]"
				}
,
				"obj-7::obj-20::obj-5" : 				{
					"parameter_longname" : "live.menu[17]"
				}
,
				"obj-7::obj-20::obj-52" : 				{
					"parameter_longname" : "live.text[156]"
				}
,
				"obj-7::obj-20::obj-55" : 				{
					"parameter_longname" : "live.text[258]"
				}
,
				"obj-7::obj-20::obj-57" : 				{
					"parameter_longname" : "live.text[115]"
				}
,
				"obj-7::obj-20::obj-61" : 				{
					"parameter_longname" : "live.text[160]"
				}
,
				"obj-7::obj-20::obj-62" : 				{
					"parameter_longname" : "live.text[62]"
				}
,
				"obj-7::obj-20::obj-63" : 				{
					"parameter_longname" : "live.text[161]"
				}
,
				"obj-7::obj-20::obj-64" : 				{
					"parameter_longname" : "live.text[117]"
				}
,
				"obj-7::obj-20::obj-65" : 				{
					"parameter_longname" : "live.text[163]"
				}
,
				"obj-7::obj-20::obj-69" : 				{
					"parameter_longname" : "live.text[259]"
				}
,
				"obj-7::obj-20::obj-70" : 				{
					"parameter_longname" : "live.text[165]"
				}
,
				"obj-7::obj-20::obj-71" : 				{
					"parameter_longname" : "live.text[261]"
				}
,
				"obj-7::obj-20::obj-72" : 				{
					"parameter_longname" : "live.text[166]"
				}
,
				"obj-7::obj-24::obj-1" : 				{
					"parameter_longname" : "live.numbox[2]"
				}
,
				"obj-7::obj-24::obj-13" : 				{
					"parameter_longname" : "live.text[24]"
				}
,
				"obj-7::obj-24::obj-14" : 				{
					"parameter_longname" : "live.text[31]"
				}
,
				"obj-7::obj-24::obj-15" : 				{
					"parameter_longname" : "live.text[36]"
				}
,
				"obj-7::obj-24::obj-32" : 				{
					"parameter_longname" : "live.text[25]"
				}
,
				"obj-7::obj-24::obj-33" : 				{
					"parameter_longname" : "live.text[32]"
				}
,
				"obj-7::obj-24::obj-34" : 				{
					"parameter_longname" : "live.text[37]"
				}
,
				"obj-7::obj-24::obj-42" : 				{
					"parameter_longname" : "live.text[26]"
				}
,
				"obj-7::obj-24::obj-44" : 				{
					"parameter_longname" : "live.text[30]"
				}
,
				"obj-7::obj-24::obj-46" : 				{
					"parameter_longname" : "live.text[39]"
				}
,
				"obj-7::obj-24::obj-5" : 				{
					"parameter_longname" : "live.menu[2]"
				}
,
				"obj-7::obj-24::obj-52" : 				{
					"parameter_longname" : "live.text[43]"
				}
,
				"obj-7::obj-24::obj-55" : 				{
					"parameter_longname" : "live.text[33]"
				}
,
				"obj-7::obj-24::obj-57" : 				{
					"parameter_longname" : "live.text[38]"
				}
,
				"obj-7::obj-24::obj-61" : 				{
					"parameter_longname" : "live.text[40]"
				}
,
				"obj-7::obj-24::obj-62" : 				{
					"parameter_longname" : "live.text[34]"
				}
,
				"obj-7::obj-24::obj-63" : 				{
					"parameter_longname" : "live.text[27]"
				}
,
				"obj-7::obj-24::obj-64" : 				{
					"parameter_longname" : "live.text[41]"
				}
,
				"obj-7::obj-24::obj-65" : 				{
					"parameter_longname" : "live.text[28]"
				}
,
				"obj-7::obj-24::obj-69" : 				{
					"parameter_longname" : "live.text[42]"
				}
,
				"obj-7::obj-24::obj-70" : 				{
					"parameter_longname" : "live.text[35]"
				}
,
				"obj-7::obj-24::obj-71" : 				{
					"parameter_longname" : "live.text[29]"
				}
,
				"obj-7::obj-24::obj-72" : 				{
					"parameter_longname" : "live.text[44]"
				}
,
				"obj-7::obj-27" : 				{
					"parameter_longname" : "live.text[45]"
				}
,
				"obj-7::obj-36" : 				{
					"parameter_longname" : "live.text[46]"
				}
,
				"obj-7::obj-5::obj-1" : 				{
					"parameter_longname" : "live.numbox[1]"
				}
,
				"obj-7::obj-5::obj-13" : 				{
					"parameter_longname" : "live.text[8]"
				}
,
				"obj-7::obj-5::obj-14" : 				{
					"parameter_longname" : "live.text[18]"
				}
,
				"obj-7::obj-5::obj-15" : 				{
					"parameter_longname" : "live.text[5]"
				}
,
				"obj-7::obj-5::obj-32" : 				{
					"parameter_longname" : "live.text[6]"
				}
,
				"obj-7::obj-5::obj-33" : 				{
					"parameter_longname" : "live.text[15]"
				}
,
				"obj-7::obj-5::obj-34" : 				{
					"parameter_longname" : "live.text[19]"
				}
,
				"obj-7::obj-5::obj-42" : 				{
					"parameter_longname" : "live.text[9]"
				}
,
				"obj-7::obj-5::obj-44" : 				{
					"parameter_longname" : "live.text[11]"
				}
,
				"obj-7::obj-5::obj-46" : 				{
					"parameter_longname" : "live.text[22]"
				}
,
				"obj-7::obj-5::obj-5" : 				{
					"parameter_longname" : "live.menu[1]"
				}
,
				"obj-7::obj-5::obj-52" : 				{
					"parameter_longname" : "live.text[13]"
				}
,
				"obj-7::obj-5::obj-55" : 				{
					"parameter_longname" : "live.text[3]"
				}
,
				"obj-7::obj-5::obj-57" : 				{
					"parameter_longname" : "live.text[20]"
				}
,
				"obj-7::obj-5::obj-61" : 				{
					"parameter_longname" : "live.text[16]"
				}
,
				"obj-7::obj-5::obj-62" : 				{
					"parameter_longname" : "live.text[7]"
				}
,
				"obj-7::obj-5::obj-63" : 				{
					"parameter_longname" : "live.text[10]"
				}
,
				"obj-7::obj-5::obj-64" : 				{
					"parameter_longname" : "live.text[21]"
				}
,
				"obj-7::obj-5::obj-65" : 				{
					"parameter_longname" : "live.text[12]"
				}
,
				"obj-7::obj-5::obj-69" : 				{
					"parameter_longname" : "live.text[23]"
				}
,
				"obj-7::obj-5::obj-70" : 				{
					"parameter_longname" : "live.text[14]"
				}
,
				"obj-7::obj-5::obj-71" : 				{
					"parameter_longname" : "live.text[4]"
				}
,
				"obj-7::obj-5::obj-72" : 				{
					"parameter_longname" : "live.text[17]"
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "bis.awaitpatcherargs.maxpat",
				"bootpath" : "~/MaxProjects/Mabstractions/abstraction",
				"patcherrelativepath" : "../../../../Mabstractions/abstraction",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.corpus.variable.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers",
				"patcherrelativepath" : "../../../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.makenote.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.makenote.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers",
				"patcherrelativepath" : "../../../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.op.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.pulse.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.pulse.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers",
				"patcherrelativepath" : "../../../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.slidermapping.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.util.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser_.multimap.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/private",
				"patcherrelativepath" : "../../../patchers/private",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
