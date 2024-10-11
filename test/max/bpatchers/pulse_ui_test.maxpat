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
		"rect" : [ 34.0, 100.0, 1039.0, 786.0 ],
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
					"id" : "obj-34",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 435.0, 111.0, 29.5, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1578.0, 687.0, 85.0, 22.0 ],
					"text" : "timesig 2 8"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 334.0, 79.0, 29.5, 22.0 ],
					"text" : "3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 260.0, 115.0, 29.5, 22.0 ],
					"text" : "4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1031.5, 79.0, 67.0, 22.0 ],
					"text" : "timesig 2 8"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 298.0, 115.0, 29.5, 22.0 ],
					"text" : "1.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1498.0, 658.0, 81.0, 20.0 ],
					"text" : "Raw tick:"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1498.0, 627.0, 81.0, 20.0 ],
					"text" : "Tick (in beat):"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1498.0, 605.0, 37.0, 20.0 ],
					"text" : "Beat:"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1498.0, 581.0, 27.0, 20.0 ],
					"text" : "Bar"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-166",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1113.0, 79.0, 67.0, 22.0 ],
					"text" : "timesig 4 8"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.6141071916, 0.4755443037, 1.0, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-152",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1199.5, 200.0, 106.0, 22.0 ],
					"text" : "metro 1 @active 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-123",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 958.5, 79.0, 67.0, 22.0 ],
					"text" : "timesig 6 8"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1280.5, 79.0, 59.0, 22.0 ],
					"text" : "tempo $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1280.5, 57.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 60 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "live.numbox[20]",
							"parameter_mmax" : 208.0,
							"parameter_mmin" : 30.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "live.numbox[7]",
							"parameter_type" : 0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "live.numbox[7]"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1199.5, 231.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1199.5, 264.0, 29.5, 22.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 877.5, 39.0, 73.0, 62.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "off", "on" ],
							"parameter_initial" : [ 1.0 ],
							"parameter_longname" : "live.toggle[3]",
							"parameter_mmax" : 1,
							"parameter_modmode" : 0,
							"parameter_shortname" : "live.toggle",
							"parameter_type" : 2
						}

					}
,
					"varname" : "live.toggle[3]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-109",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1068.5, 211.0, 37.0, 20.0 ],
					"text" : "zl reg"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-111",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 993.5, 412.0, 23.0, 20.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-113",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 994.5, 378.0, 46.0, 20.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-119",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1112.0, 110.0, 69.0, 22.0 ],
					"text" : "timesig 4 4"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-120",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1199.5, 79.0, 69.0, 22.0 ],
					"text" : "timesig 7 8"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-121",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 939.5, 344.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-122",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1011.5, 346.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-124",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1027.5, 322.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-125",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1123.5, 274.0, 32.5, 22.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-126",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 1123.5, 250.0, 36.0, 22.0 ],
					"text" : "sel 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-127",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 9,
					"outlettype" : [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
					"patching_rect" : [ 995.5, 298.0, 147.0, 22.0 ],
					"text" : "transport"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-118",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1199.5, 53.0, 73.0, 22.0 ],
					"text" : "timesig 7 16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-117",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1031.5, 50.0, 73.0, 22.0 ],
					"text" : "timesig 2 16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-116",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1110.0, 50.0, 73.0, 22.0 ],
					"text" : "timesig 4 16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-102",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1578.0, 652.0, 99.0, 22.0 ],
					"text" : "0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1568.0, 628.0, 50.0, 22.0 ],
					"text" : "0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1552.0, 604.0, 50.0, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1537.0, 580.0, 50.0, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 388.0, 130.0, 29.5, 22.0 ],
					"text" : "0"
				}

			}
, 			{
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
					"patching_rect" : [ 1073.0, 551.0, 52.0, 22.0 ],
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
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 412.0, 398.5, 61.0, 22.0 ],
					"text" : "legato 1."
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
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"order" : 1,
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 1 ],
					"order" : 0,
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 0 ],
					"midpoints" : [ 1003.0, 440.5, 1180.5, 440.5, 1180.5, 190.5, 1078.0, 190.5 ],
					"source" : [ "obj-111", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 1 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 1 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 1 ],
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 1 ],
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 1 ],
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 1 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 1 ],
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 0 ],
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 1 ],
					"source" : [ "obj-127", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"order" : 1,
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"order" : 2,
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"order" : 2,
					"source" : [ "obj-127", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-124", 0 ],
					"order" : 1,
					"source" : [ "obj-127", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 1 ],
					"order" : 0,
					"source" : [ "obj-127", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"order" : 1,
					"source" : [ "obj-127", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"order" : 0,
					"source" : [ "obj-127", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 1 ],
					"order" : 0,
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"order" : 3,
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 1 ],
					"source" : [ "obj-166", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 1 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 1 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-22", 0 ]
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
					"destination" : [ "obj-7", 1 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-3", 0 ]
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
					"destination" : [ "obj-7", 2 ],
					"source" : [ "obj-34", 0 ]
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
					"destination" : [ "obj-7", 2 ],
					"source" : [ "obj-48", 0 ]
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
					"destination" : [ "obj-126", 0 ],
					"order" : 0,
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"order" : 1,
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"source" : [ "obj-68", 0 ]
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
			"obj-13::obj-31::obj-1" : [ "live.numbox[25]", "live.numbox", 0 ],
			"obj-13::obj-31::obj-13" : [ "live.text[106]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-14" : [ "live.text[79]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-15" : [ "live.text[101]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-32" : [ "live.text[80]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-33" : [ "live.text[111]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-34" : [ "live.text[102]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-42" : [ "live.text[77]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-44" : [ "live.text[112]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-46" : [ "live.text[108]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-5" : [ "live.menu[8]", "live.menu", 0 ],
			"obj-13::obj-31::obj-52" : [ "live.text[104]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-55" : [ "live.text[113]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-57" : [ "live.text[75]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-61" : [ "live.text[78]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-62" : [ "live.text[76]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-63" : [ "live.text[81]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-64" : [ "live.text[109]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-65" : [ "live.text[105]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-69" : [ "live.text[74]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-70" : [ "live.text[110]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-71" : [ "live.text[107]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-72" : [ "live.text[103]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-1" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-13::obj-32::obj-13" : [ "live.text[61]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-14" : [ "live.text[64]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-15" : [ "live.text[51]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-32" : [ "live.text[60]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-33" : [ "live.text[54]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-34" : [ "live.text[53]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-42" : [ "live.text[52]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-44" : [ "live.text[65]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-46" : [ "live.text[55]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-5" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-13::obj-32::obj-52" : [ "live.text[47]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-55" : [ "live.text[59]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-57" : [ "live.text[84]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-61" : [ "live.text[63]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-62" : [ "live.text[48]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-63" : [ "live.text[82]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-64" : [ "live.text[56]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-65" : [ "live.text[49]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-69" : [ "live.text[83]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-70" : [ "live.text[57]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-71" : [ "live.text[50]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-72" : [ "live.text[58]", "live.text[15]", 0 ],
			"obj-13::obj-72" : [ "live.text[85]", "live.text", 0 ],
			"obj-13::obj-8" : [ "live.text[86]", "live.text", 0 ],
			"obj-13::obj-82" : [ "live.text[87]", "live.text", 0 ],
			"obj-13::obj-83" : [ "live.numbox[36]", "live.numbox", 0 ],
			"obj-3" : [ "live.numbox[20]", "live.numbox[7]", 0 ],
			"obj-66" : [ "live.toggle[3]", "live.toggle", 0 ],
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
				"obj-13::obj-32::obj-1" : 				{
					"parameter_longname" : "live.numbox[3]"
				}
,
				"obj-13::obj-32::obj-13" : 				{
					"parameter_longname" : "live.text[61]"
				}
,
				"obj-13::obj-32::obj-14" : 				{
					"parameter_longname" : "live.text[64]"
				}
,
				"obj-13::obj-32::obj-15" : 				{
					"parameter_longname" : "live.text[51]"
				}
,
				"obj-13::obj-32::obj-32" : 				{
					"parameter_longname" : "live.text[60]"
				}
,
				"obj-13::obj-32::obj-33" : 				{
					"parameter_longname" : "live.text[54]"
				}
,
				"obj-13::obj-32::obj-34" : 				{
					"parameter_longname" : "live.text[53]"
				}
,
				"obj-13::obj-32::obj-42" : 				{
					"parameter_longname" : "live.text[52]"
				}
,
				"obj-13::obj-32::obj-44" : 				{
					"parameter_longname" : "live.text[65]"
				}
,
				"obj-13::obj-32::obj-46" : 				{
					"parameter_longname" : "live.text[55]"
				}
,
				"obj-13::obj-32::obj-5" : 				{
					"parameter_longname" : "live.menu[3]"
				}
,
				"obj-13::obj-32::obj-52" : 				{
					"parameter_longname" : "live.text[47]"
				}
,
				"obj-13::obj-32::obj-55" : 				{
					"parameter_longname" : "live.text[59]"
				}
,
				"obj-13::obj-32::obj-57" : 				{
					"parameter_longname" : "live.text[84]"
				}
,
				"obj-13::obj-32::obj-61" : 				{
					"parameter_longname" : "live.text[63]"
				}
,
				"obj-13::obj-32::obj-62" : 				{
					"parameter_longname" : "live.text[48]"
				}
,
				"obj-13::obj-32::obj-63" : 				{
					"parameter_longname" : "live.text[82]"
				}
,
				"obj-13::obj-32::obj-64" : 				{
					"parameter_longname" : "live.text[56]"
				}
,
				"obj-13::obj-32::obj-65" : 				{
					"parameter_longname" : "live.text[49]"
				}
,
				"obj-13::obj-32::obj-69" : 				{
					"parameter_longname" : "live.text[83]"
				}
,
				"obj-13::obj-32::obj-70" : 				{
					"parameter_longname" : "live.text[57]"
				}
,
				"obj-13::obj-32::obj-71" : 				{
					"parameter_longname" : "live.text[50]"
				}
,
				"obj-13::obj-32::obj-72" : 				{
					"parameter_longname" : "live.text[58]"
				}
,
				"obj-13::obj-72" : 				{
					"parameter_longname" : "live.text[85]"
				}
,
				"obj-13::obj-8" : 				{
					"parameter_longname" : "live.text[86]"
				}
,
				"obj-13::obj-82" : 				{
					"parameter_longname" : "live.text[87]"
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
 ],
		"autosave" : 0
	}

}
