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
					"id" : "obj-55",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 160.0, 74.0, 69.0, 22.0 ],
					"text" : "0.33 0.75 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 92.0, 74.0, 32.0, 22.0 ],
					"text" : "0.33"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 953.0, 652.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"linecount" : 6,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 945.0, 691.5, 107.0, 89.0 ],
					"text" : "mul minimum 0, mul maximum 36, mul initial 12, add minimum 0, add maximum 127, add initial 40"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 702.0, 679.0, 59.0, 22.0 ],
					"text" : "voices $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 556.0, 603.0, 29.5, 22.0 ],
					"text" : "t l l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 626.5, 639.0, 63.0, 22.0 ],
					"text" : "ser.util len"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-28",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "ser.addmul.ui.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "float/listoflists", "", "" ],
					"patching_rect" : [ 834.0, 844.0, 108.0, 48.0 ],
					"varname" : "ser.addmul.ui[1]",
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
					"id" : "obj-27",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "ser.phase.ui.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 805.0, 672.0, 128.0, 128.0 ],
					"varname" : "ser.phase.ui",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 606.5, 466.0, 103.0, 22.0 ],
					"text" : "expr 36 + $i1 * 12"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 606.5, 497.0, 51.0, 22.0 ],
					"text" : "zl.group"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 585.5, 430.0, 40.0, 22.0 ],
					"text" : "uzi"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 531.0, 360.0, 29.5, 22.0 ],
					"text" : "t l l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 585.5, 397.0, 63.0, 22.0 ],
					"text" : "ser.util len"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 514.5, 159.0, 35.0, 22.0 ],
					"text" : "reset"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 650.0, 136.0, 65.0, 22.0 ],
					"text" : "5 3 4 5 6 7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 585.5, 178.0, 31.0, 22.0 ],
					"text" : "3 11"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 283.0, 54.0, 29.5, 22.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 724.0, 304.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"linecount" : 6,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 724.0, 340.0, 107.0, 89.0 ],
					"text" : "mul minimum 0, mul maximum 36, mul initial 12, add minimum 21, add maximum 108, add initial 60"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-2",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "ser.addmul.ui.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "float/listoflists", "", "" ],
					"patching_rect" : [ 531.0, 539.0, 108.0, 48.0 ],
					"varname" : "ser.addmul.ui",
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
					"id" : "obj-1",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "ser.stepper.ui.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 531.0, 222.0, 128.0, 128.0 ],
					"varname" : "ser.stepper.ui",
					"viewvisibility" : 1
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
					"patching_rect" : [ 1006.0, 512.0, 70.0, 22.0 ],
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
					"patching_rect" : [ 1006.0, 551.0, 24.0, 24.0 ],
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
					"patching_rect" : [ 1006.0, 597.0, 121.0, 22.0 ],
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
					"patching_rect" : [ 1108.0, 557.0, 101.0, 22.0 ],
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
					"patching_rect" : [ 1108.0, 512.0, 66.0, 22.0 ],
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
					"patching_rect" : [ 1190.0, 485.0, 52.0, 22.0 ],
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
					"patching_rect" : [ 1190.0, 512.0, 45.0, 22.0 ],
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
					"patching_rect" : [ 1120.0, 438.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 1120.0, 402.0, 48.0, 22.0 ],
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
					"patching_rect" : [ 502.0, 54.0, 89.0, 22.0 ],
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
					"patching_rect" : [ 414.0, 54.0, 69.0, 22.0 ],
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
					"patching_rect" : [ 368.0, 54.0, 35.0, 22.0 ],
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
					"patching_rect" : [ 324.0, 54.0, 29.5, 22.0 ],
					"text" : "0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-106",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1253.0, 631.0, 54.0, 22.0 ],
					"text" : "*~ 0.707"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 1247.0, 774.0, 45.0, 45.0 ]
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
					"patching_rect" : [ 1253.0, 666.0, 50.0, 75.0 ],
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
					"patching_rect" : [ 1253.0, 503.0, 70.0, 22.0 ],
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
					"patching_rect" : [ 1253.0, 542.0, 24.0, 24.0 ],
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
					"patching_rect" : [ 1253.0, 588.0, 121.0, 22.0 ],
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
					"patching_rect" : [ 1355.0, 548.0, 101.0, 22.0 ],
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
					"patching_rect" : [ 1355.0, 503.0, 73.0, 22.0 ],
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
					"patching_rect" : [ 1437.0, 476.0, 52.0, 22.0 ],
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
					"patching_rect" : [ 1437.0, 503.0, 45.0, 22.0 ],
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
					"patching_rect" : [ 1367.0, 429.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 1367.0, 393.0, 48.0, 22.0 ],
					"text" : "change"
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
					"patching_rect" : [ 532.5, 803.0, 58.0, 22.0 ],
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
					"patching_rect" : [ 525.5, 837.0, 118.0, 22.0 ],
					"text" : "device \"IAC IAC1\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 239.0, 407.0, 29.5, 22.0 ],
					"text" : "t l l"
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
					"patching_rect" : [ 116.0, 446.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 37.0, 447.0, 61.0, 22.0 ],
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
					"patching_rect" : [ 268.5, 896.0, 389.0, 79.0 ],
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
					"patching_rect" : [ 239.0, 136.0, 140.0, 123.0 ],
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
					"patching_rect" : [ 1306.0, 204.0, 59.0, 22.0 ],
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
					"patching_rect" : [ 1165.0, 180.0, 38.0, 18.0 ],
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
					"patching_rect" : [ 1166.0, 161.0, 38.0, 18.0 ],
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
					"patching_rect" : [ 1218.0, 313.0, 19.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1384.0, 147.0, 19.0, 18.0 ],
					"text" : "2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1218.0, 287.0, 41.0, 22.0 ],
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
					"patching_rect" : [ 1167.0, 313.0, 25.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1378.0, 127.0, 25.0, 18.0 ],
					"text" : "169"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1167.0, 287.0, 41.0, 22.0 ],
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
					"patching_rect" : [ 1266.0, 134.0, 38.0, 18.0 ],
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
					"patching_rect" : [ 1306.0, 136.0, 44.0, 15.0 ],
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
					"patching_rect" : [ 1226.0, 208.0, 56.0, 22.0 ],
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
					"patching_rect" : [ 1167.0, 173.0, 77.666668981313705, 22.0 ],
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
					"patching_rect" : [ 1167.0, 128.0, 87.666669279336929, 31.000000923871994 ],
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
					"patching_rect" : [ 1167.0, 252.0, 103.0, 22.0 ],
					"text" : "transport"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 1 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 1 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-17", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-17", 0 ]
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
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-21", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-21", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 2 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
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
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 2 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"source" : [ "obj-3", 0 ]
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
					"destination" : [ "obj-39", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-38", 1 ]
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
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-42", 0 ]
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
					"destination" : [ "obj-7", 1 ],
					"source" : [ "obj-45", 0 ]
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
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-5", 0 ]
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
					"destination" : [ "obj-7", 1 ],
					"source" : [ "obj-55", 0 ]
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
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-7", 4 ]
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
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-8", 0 ]
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
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-13::obj-31::obj-1" : [ "live.numbox[24]", "live.numbox", 0 ],
			"obj-13::obj-31::obj-13" : [ "live.text[209]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-14" : [ "live.text[219]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-15" : [ "live.text[239]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-32" : [ "live.text[210]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-33" : [ "live.text[212]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-34" : [ "live.text[240]", "live.text[36]", 0 ],
			"obj-13::obj-31::obj-42" : [ "live.text[238]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-44" : [ "live.text[244]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-46" : [ "live.text[243]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-5" : [ "live.menu[13]", "live.menu", 0 ],
			"obj-13::obj-31::obj-52" : [ "live.text[207]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-55" : [ "live.text[215]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-57" : [ "live.text[217]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-61" : [ "live.text[206]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-62" : [ "live.text[218]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-63" : [ "live.text[262]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-64" : [ "live.text[272]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-65" : [ "live.text[241]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-69" : [ "live.text[211]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-70" : [ "live.text[242]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-71" : [ "live.text[216]", "live.text[15]", 0 ],
			"obj-13::obj-31::obj-72" : [ "live.text[263]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-1" : [ "live.numbox[39]", "live.numbox", 0 ],
			"obj-13::obj-32::obj-13" : [ "live.text[222]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-14" : [ "live.text[220]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-15" : [ "live.text[221]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-32" : [ "live.text[236]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-33" : [ "live.text[237]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-34" : [ "live.text[252]", "live.text[36]", 0 ],
			"obj-13::obj-32::obj-42" : [ "live.text[273]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-44" : [ "live.text[223]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-46" : [ "live.text[253]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-5" : [ "live.menu[14]", "live.menu", 0 ],
			"obj-13::obj-32::obj-52" : [ "live.text[251]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-55" : [ "live.text[250]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-57" : [ "live.text[213]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-61" : [ "live.text[249]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-62" : [ "live.text[248]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-63" : [ "live.text[234]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-64" : [ "live.text[247]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-65" : [ "live.text[233]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-69" : [ "live.text[246]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-70" : [ "live.text[235]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-71" : [ "live.text[214]", "live.text[15]", 0 ],
			"obj-13::obj-32::obj-72" : [ "live.text[245]", "live.text[15]", 0 ],
			"obj-13::obj-72" : [ "live.text[65]", "live.text", 0 ],
			"obj-13::obj-8" : [ "live.text[64]", "live.text", 0 ],
			"obj-13::obj-82" : [ "live.text[63]", "live.text", 0 ],
			"obj-13::obj-83" : [ "live.numbox[36]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-1" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-13" : [ "live.text[78]", "live.text[36]", 0 ],
			"obj-1::obj-1::obj-14" : [ "live.text[72]", "live.text[36]", 0 ],
			"obj-1::obj-1::obj-15" : [ "live.text[50]", "live.text[36]", 0 ],
			"obj-1::obj-1::obj-32" : [ "live.text[75]", "live.text[36]", 0 ],
			"obj-1::obj-1::obj-33" : [ "live.text[47]", "live.text[36]", 0 ],
			"obj-1::obj-1::obj-34" : [ "live.text[71]", "live.text[36]", 0 ],
			"obj-1::obj-1::obj-42" : [ "live.text[73]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-44" : [ "live.text[49]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-46" : [ "live.text[51]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-5" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-1::obj-1::obj-52" : [ "live.text[67]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-55" : [ "live.text[52]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-57" : [ "live.text[66]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-61" : [ "live.text[54]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-62" : [ "live.text[48]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-63" : [ "live.text[77]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-64" : [ "live.text[76]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-65" : [ "live.text[68]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-69" : [ "live.text[53]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-70" : [ "live.text[70]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-71" : [ "live.text[74]", "live.text[15]", 0 ],
			"obj-1::obj-1::obj-72" : [ "live.text[69]", "live.text[15]", 0 ],
			"obj-1::obj-22" : [ "live.text[269]", "live.text[189]", 0 ],
			"obj-1::obj-24" : [ "live.menu[24]", "live.menu", 0 ],
			"obj-1::obj-39::obj-1" : [ "live.numbox[9]", "live.numbox", 0 ],
			"obj-1::obj-39::obj-13" : [ "live.text[83]", "live.text[36]", 0 ],
			"obj-1::obj-39::obj-14" : [ "live.text[85]", "live.text[36]", 0 ],
			"obj-1::obj-39::obj-15" : [ "live.text[91]", "live.text[36]", 0 ],
			"obj-1::obj-39::obj-32" : [ "live.text[57]", "live.text[36]", 0 ],
			"obj-1::obj-39::obj-33" : [ "live.text[89]", "live.text[36]", 0 ],
			"obj-1::obj-39::obj-34" : [ "live.text[55]", "live.text[36]", 0 ],
			"obj-1::obj-39::obj-42" : [ "live.text[86]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-44" : [ "live.text[79]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-46" : [ "live.text[87]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-5" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-1::obj-39::obj-52" : [ "live.text[61]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-55" : [ "live.text[56]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-57" : [ "live.text[60]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-61" : [ "live.text[80]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-62" : [ "live.text[81]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-63" : [ "live.text[88]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-64" : [ "live.text[58]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-65" : [ "live.text[90]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-69" : [ "live.text[84]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-70" : [ "live.text[59]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-71" : [ "live.text[92]", "live.text[15]", 0 ],
			"obj-1::obj-39::obj-72" : [ "live.text[82]", "live.text[15]", 0 ],
			"obj-1::obj-72" : [ "live.text[270]", "live.text", 0 ],
			"obj-1::obj-82" : [ "live.text[271]", "live.text", 0 ],
			"obj-1::obj-83" : [ "live.numbox[42]", "live.numbox", 0 ],
			"obj-26" : [ "transport", "live.text[1]", 0 ],
			"obj-27::obj-2" : [ "live.menu[46]", "live.menu", 0 ],
			"obj-27::obj-24" : [ "live.numbox[95]", "live.numbox", 0 ],
			"obj-27::obj-5" : [ "live.numbox[93]", "live.numbox", 0 ],
			"obj-27::obj-6" : [ "live.numbox[94]", "live.numbox", 0 ],
			"obj-27::obj-72" : [ "live.text[231]", "live.text", 0 ],
			"obj-27::obj-8" : [ "live.text[143]", "live.text[36]", 0 ],
			"obj-27::obj-82" : [ "live.text[232]", "live.text", 0 ],
			"obj-27::obj-83" : [ "live.numbox[92]", "live.numbox", 0 ],
			"obj-28::obj-16::obj-1" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-28::obj-16::obj-13" : [ "live.text[194]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-14" : [ "live.text[111]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-15" : [ "live.text[185]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-32" : [ "live.text[184]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-33" : [ "live.text[191]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-34" : [ "live.text[198]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-42" : [ "live.text[199]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-44" : [ "live.text[113]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-46" : [ "live.text[200]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-5" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-28::obj-16::obj-52" : [ "live.text[192]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-55" : [ "live.text[114]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-57" : [ "live.text[188]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-61" : [ "live.text[183]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-62" : [ "live.text[193]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-63" : [ "live.text[186]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-64" : [ "live.text[112]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-65" : [ "live.text[195]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-69" : [ "live.text[187]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-70" : [ "live.text[196]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-71" : [ "live.text[197]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-72" : [ "live.text[189]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-1" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-28::obj-1::obj-13" : [ "live.text[147]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-14" : [ "live.text[178]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-15" : [ "live.text[145]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-32" : [ "live.text[181]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-33" : [ "live.text[149]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-34" : [ "live.text[180]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-42" : [ "live.text[144]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-44" : [ "live.text[146]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-46" : [ "live.text[179]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-5" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-28::obj-1::obj-52" : [ "live.text[148]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-55" : [ "live.text[107]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-57" : [ "live.text[177]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-61" : [ "live.text[150]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-62" : [ "live.text[108]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-63" : [ "live.text[152]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-64" : [ "live.text[182]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-65" : [ "live.text[151]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-69" : [ "live.text[109]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-70" : [ "live.text[153]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-71" : [ "live.text[110]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-72" : [ "live.text[176]", "live.text[15]", 0 ],
			"obj-28::obj-24" : [ "live.menu[18]", "live.menu", 0 ],
			"obj-28::obj-30" : [ "live.text[201]", "live.text[36]", 0 ],
			"obj-28::obj-32" : [ "live.text[202]", "live.text[36]", 0 ],
			"obj-28::obj-33" : [ "live.text[203]", "live.text[36]", 0 ],
			"obj-28::obj-34" : [ "live.text[205]", "live.text[36]", 0 ],
			"obj-28::obj-36" : [ "live.text[204]", "live.text[36]", 0 ],
			"obj-2::obj-16::obj-1" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-2::obj-16::obj-13" : [ "live.text[167]", "live.text[36]", 0 ],
			"obj-2::obj-16::obj-14" : [ "live.text[127]", "live.text[36]", 0 ],
			"obj-2::obj-16::obj-15" : [ "live.text[130]", "live.text[36]", 0 ],
			"obj-2::obj-16::obj-32" : [ "live.text[139]", "live.text[36]", 0 ],
			"obj-2::obj-16::obj-33" : [ "live.text[136]", "live.text[36]", 0 ],
			"obj-2::obj-16::obj-34" : [ "live.text[133]", "live.text[36]", 0 ],
			"obj-2::obj-16::obj-42" : [ "live.text[137]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-44" : [ "live.text[140]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-46" : [ "live.text[138]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-5" : [ "live.menu[9]", "live.menu", 0 ],
			"obj-2::obj-16::obj-52" : [ "live.text[135]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-55" : [ "live.text[141]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-57" : [ "live.text[169]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-61" : [ "live.text[170]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-62" : [ "live.text[131]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-63" : [ "live.text[126]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-64" : [ "live.text[142]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-65" : [ "live.text[132]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-69" : [ "live.text[128]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-70" : [ "live.text[168]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-71" : [ "live.text[134]", "live.text[15]", 0 ],
			"obj-2::obj-16::obj-72" : [ "live.text[129]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-1" : [ "live.numbox[38]", "live.numbox", 0 ],
			"obj-2::obj-1::obj-13" : [ "live.text[105]", "live.text[36]", 0 ],
			"obj-2::obj-1::obj-14" : [ "live.text[93]", "live.text[36]", 0 ],
			"obj-2::obj-1::obj-15" : [ "live.text[103]", "live.text[36]", 0 ],
			"obj-2::obj-1::obj-32" : [ "live.text[97]", "live.text[36]", 0 ],
			"obj-2::obj-1::obj-33" : [ "live.text[119]", "live.text[36]", 0 ],
			"obj-2::obj-1::obj-34" : [ "live.text[95]", "live.text[36]", 0 ],
			"obj-2::obj-1::obj-42" : [ "live.text[101]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-44" : [ "live.text[104]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-46" : [ "live.text[94]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-5" : [ "live.menu[8]", "live.menu", 0 ],
			"obj-2::obj-1::obj-52" : [ "live.text[106]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-55" : [ "live.text[96]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-57" : [ "live.text[124]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-61" : [ "live.text[120]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-62" : [ "live.text[98]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-63" : [ "live.text[121]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-64" : [ "live.text[99]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-65" : [ "live.text[122]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-69" : [ "live.text[100]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-70" : [ "live.text[123]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-71" : [ "live.text[102]", "live.text[15]", 0 ],
			"obj-2::obj-1::obj-72" : [ "live.text[125]", "live.text[15]", 0 ],
			"obj-2::obj-24" : [ "live.menu[15]", "live.menu", 0 ],
			"obj-2::obj-30" : [ "live.text[173]", "live.text[36]", 0 ],
			"obj-2::obj-32" : [ "live.text[174]", "live.text[36]", 0 ],
			"obj-2::obj-33" : [ "live.text[175]", "live.text[36]", 0 ],
			"obj-2::obj-34" : [ "live.text[172]", "live.text[36]", 0 ],
			"obj-2::obj-36" : [ "live.text[171]", "live.text[36]", 0 ],
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
				"obj-13::obj-31::obj-1" : 				{
					"parameter_longname" : "live.numbox[24]"
				}
,
				"obj-13::obj-31::obj-13" : 				{
					"parameter_longname" : "live.text[209]"
				}
,
				"obj-13::obj-31::obj-14" : 				{
					"parameter_longname" : "live.text[219]"
				}
,
				"obj-13::obj-31::obj-15" : 				{
					"parameter_longname" : "live.text[239]"
				}
,
				"obj-13::obj-31::obj-32" : 				{
					"parameter_longname" : "live.text[210]"
				}
,
				"obj-13::obj-31::obj-33" : 				{
					"parameter_longname" : "live.text[212]"
				}
,
				"obj-13::obj-31::obj-34" : 				{
					"parameter_longname" : "live.text[240]"
				}
,
				"obj-13::obj-31::obj-42" : 				{
					"parameter_longname" : "live.text[238]"
				}
,
				"obj-13::obj-31::obj-44" : 				{
					"parameter_longname" : "live.text[244]"
				}
,
				"obj-13::obj-31::obj-46" : 				{
					"parameter_longname" : "live.text[243]"
				}
,
				"obj-13::obj-31::obj-5" : 				{
					"parameter_longname" : "live.menu[13]"
				}
,
				"obj-13::obj-31::obj-52" : 				{
					"parameter_longname" : "live.text[207]"
				}
,
				"obj-13::obj-31::obj-55" : 				{
					"parameter_longname" : "live.text[215]"
				}
,
				"obj-13::obj-31::obj-57" : 				{
					"parameter_longname" : "live.text[217]"
				}
,
				"obj-13::obj-31::obj-61" : 				{
					"parameter_longname" : "live.text[206]"
				}
,
				"obj-13::obj-31::obj-62" : 				{
					"parameter_longname" : "live.text[218]"
				}
,
				"obj-13::obj-31::obj-63" : 				{
					"parameter_longname" : "live.text[262]"
				}
,
				"obj-13::obj-31::obj-64" : 				{
					"parameter_longname" : "live.text[272]"
				}
,
				"obj-13::obj-31::obj-65" : 				{
					"parameter_longname" : "live.text[241]"
				}
,
				"obj-13::obj-31::obj-69" : 				{
					"parameter_longname" : "live.text[211]"
				}
,
				"obj-13::obj-31::obj-70" : 				{
					"parameter_longname" : "live.text[242]"
				}
,
				"obj-13::obj-31::obj-71" : 				{
					"parameter_longname" : "live.text[216]"
				}
,
				"obj-13::obj-31::obj-72" : 				{
					"parameter_longname" : "live.text[263]"
				}
,
				"obj-13::obj-32::obj-1" : 				{
					"parameter_longname" : "live.numbox[39]"
				}
,
				"obj-13::obj-32::obj-13" : 				{
					"parameter_longname" : "live.text[222]"
				}
,
				"obj-13::obj-32::obj-14" : 				{
					"parameter_longname" : "live.text[220]"
				}
,
				"obj-13::obj-32::obj-15" : 				{
					"parameter_longname" : "live.text[221]"
				}
,
				"obj-13::obj-32::obj-32" : 				{
					"parameter_longname" : "live.text[236]"
				}
,
				"obj-13::obj-32::obj-33" : 				{
					"parameter_longname" : "live.text[237]"
				}
,
				"obj-13::obj-32::obj-34" : 				{
					"parameter_longname" : "live.text[252]"
				}
,
				"obj-13::obj-32::obj-42" : 				{
					"parameter_longname" : "live.text[273]"
				}
,
				"obj-13::obj-32::obj-44" : 				{
					"parameter_longname" : "live.text[223]"
				}
,
				"obj-13::obj-32::obj-46" : 				{
					"parameter_longname" : "live.text[253]"
				}
,
				"obj-13::obj-32::obj-5" : 				{
					"parameter_longname" : "live.menu[14]"
				}
,
				"obj-13::obj-32::obj-52" : 				{
					"parameter_longname" : "live.text[251]"
				}
,
				"obj-13::obj-32::obj-55" : 				{
					"parameter_longname" : "live.text[250]"
				}
,
				"obj-13::obj-32::obj-57" : 				{
					"parameter_longname" : "live.text[213]"
				}
,
				"obj-13::obj-32::obj-61" : 				{
					"parameter_longname" : "live.text[249]"
				}
,
				"obj-13::obj-32::obj-62" : 				{
					"parameter_longname" : "live.text[248]"
				}
,
				"obj-13::obj-32::obj-63" : 				{
					"parameter_longname" : "live.text[234]"
				}
,
				"obj-13::obj-32::obj-64" : 				{
					"parameter_longname" : "live.text[247]"
				}
,
				"obj-13::obj-32::obj-65" : 				{
					"parameter_longname" : "live.text[233]"
				}
,
				"obj-13::obj-32::obj-69" : 				{
					"parameter_longname" : "live.text[246]"
				}
,
				"obj-13::obj-32::obj-70" : 				{
					"parameter_longname" : "live.text[235]"
				}
,
				"obj-13::obj-32::obj-71" : 				{
					"parameter_longname" : "live.text[214]"
				}
,
				"obj-13::obj-32::obj-72" : 				{
					"parameter_longname" : "live.text[245]"
				}
,
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
				"obj-1::obj-1::obj-1" : 				{
					"parameter_longname" : "live.numbox[3]"
				}
,
				"obj-1::obj-1::obj-13" : 				{
					"parameter_longname" : "live.text[78]"
				}
,
				"obj-1::obj-1::obj-14" : 				{
					"parameter_longname" : "live.text[72]"
				}
,
				"obj-1::obj-1::obj-15" : 				{
					"parameter_longname" : "live.text[50]"
				}
,
				"obj-1::obj-1::obj-32" : 				{
					"parameter_longname" : "live.text[75]"
				}
,
				"obj-1::obj-1::obj-33" : 				{
					"parameter_longname" : "live.text[47]"
				}
,
				"obj-1::obj-1::obj-34" : 				{
					"parameter_longname" : "live.text[71]"
				}
,
				"obj-1::obj-1::obj-42" : 				{
					"parameter_longname" : "live.text[73]"
				}
,
				"obj-1::obj-1::obj-44" : 				{
					"parameter_longname" : "live.text[49]"
				}
,
				"obj-1::obj-1::obj-46" : 				{
					"parameter_longname" : "live.text[51]"
				}
,
				"obj-1::obj-1::obj-5" : 				{
					"parameter_longname" : "live.menu[7]"
				}
,
				"obj-1::obj-1::obj-52" : 				{
					"parameter_longname" : "live.text[67]"
				}
,
				"obj-1::obj-1::obj-55" : 				{
					"parameter_longname" : "live.text[52]"
				}
,
				"obj-1::obj-1::obj-57" : 				{
					"parameter_longname" : "live.text[66]"
				}
,
				"obj-1::obj-1::obj-61" : 				{
					"parameter_longname" : "live.text[54]"
				}
,
				"obj-1::obj-1::obj-62" : 				{
					"parameter_longname" : "live.text[48]"
				}
,
				"obj-1::obj-1::obj-63" : 				{
					"parameter_longname" : "live.text[77]"
				}
,
				"obj-1::obj-1::obj-64" : 				{
					"parameter_longname" : "live.text[76]"
				}
,
				"obj-1::obj-1::obj-65" : 				{
					"parameter_longname" : "live.text[68]"
				}
,
				"obj-1::obj-1::obj-69" : 				{
					"parameter_longname" : "live.text[53]"
				}
,
				"obj-1::obj-1::obj-70" : 				{
					"parameter_longname" : "live.text[70]"
				}
,
				"obj-1::obj-1::obj-71" : 				{
					"parameter_longname" : "live.text[74]"
				}
,
				"obj-1::obj-1::obj-72" : 				{
					"parameter_longname" : "live.text[69]"
				}
,
				"obj-1::obj-39::obj-1" : 				{
					"parameter_longname" : "live.numbox[9]"
				}
,
				"obj-1::obj-39::obj-13" : 				{
					"parameter_longname" : "live.text[83]"
				}
,
				"obj-1::obj-39::obj-14" : 				{
					"parameter_longname" : "live.text[85]"
				}
,
				"obj-1::obj-39::obj-15" : 				{
					"parameter_longname" : "live.text[91]"
				}
,
				"obj-1::obj-39::obj-32" : 				{
					"parameter_longname" : "live.text[57]"
				}
,
				"obj-1::obj-39::obj-33" : 				{
					"parameter_longname" : "live.text[89]"
				}
,
				"obj-1::obj-39::obj-34" : 				{
					"parameter_longname" : "live.text[55]"
				}
,
				"obj-1::obj-39::obj-42" : 				{
					"parameter_longname" : "live.text[86]"
				}
,
				"obj-1::obj-39::obj-44" : 				{
					"parameter_longname" : "live.text[79]"
				}
,
				"obj-1::obj-39::obj-46" : 				{
					"parameter_longname" : "live.text[87]"
				}
,
				"obj-1::obj-39::obj-5" : 				{
					"parameter_longname" : "live.menu[3]"
				}
,
				"obj-1::obj-39::obj-52" : 				{
					"parameter_longname" : "live.text[61]"
				}
,
				"obj-1::obj-39::obj-55" : 				{
					"parameter_longname" : "live.text[56]"
				}
,
				"obj-1::obj-39::obj-57" : 				{
					"parameter_longname" : "live.text[60]"
				}
,
				"obj-1::obj-39::obj-61" : 				{
					"parameter_longname" : "live.text[80]"
				}
,
				"obj-1::obj-39::obj-62" : 				{
					"parameter_longname" : "live.text[81]"
				}
,
				"obj-1::obj-39::obj-63" : 				{
					"parameter_longname" : "live.text[88]"
				}
,
				"obj-1::obj-39::obj-64" : 				{
					"parameter_longname" : "live.text[58]"
				}
,
				"obj-1::obj-39::obj-65" : 				{
					"parameter_longname" : "live.text[90]"
				}
,
				"obj-1::obj-39::obj-69" : 				{
					"parameter_longname" : "live.text[84]"
				}
,
				"obj-1::obj-39::obj-70" : 				{
					"parameter_longname" : "live.text[59]"
				}
,
				"obj-1::obj-39::obj-71" : 				{
					"parameter_longname" : "live.text[92]"
				}
,
				"obj-1::obj-39::obj-72" : 				{
					"parameter_longname" : "live.text[82]"
				}
,
				"obj-27::obj-8" : 				{
					"parameter_longname" : "live.text[143]"
				}
,
				"obj-28::obj-16::obj-1" : 				{
					"parameter_longname" : "live.numbox[6]"
				}
,
				"obj-28::obj-16::obj-13" : 				{
					"parameter_longname" : "live.text[194]"
				}
,
				"obj-28::obj-16::obj-14" : 				{
					"parameter_longname" : "live.text[111]"
				}
,
				"obj-28::obj-16::obj-15" : 				{
					"parameter_longname" : "live.text[185]"
				}
,
				"obj-28::obj-16::obj-32" : 				{
					"parameter_longname" : "live.text[184]"
				}
,
				"obj-28::obj-16::obj-33" : 				{
					"parameter_longname" : "live.text[191]"
				}
,
				"obj-28::obj-16::obj-34" : 				{
					"parameter_longname" : "live.text[198]"
				}
,
				"obj-28::obj-16::obj-42" : 				{
					"parameter_longname" : "live.text[199]"
				}
,
				"obj-28::obj-16::obj-44" : 				{
					"parameter_longname" : "live.text[113]"
				}
,
				"obj-28::obj-16::obj-46" : 				{
					"parameter_longname" : "live.text[200]"
				}
,
				"obj-28::obj-16::obj-5" : 				{
					"parameter_longname" : "live.menu[11]"
				}
,
				"obj-28::obj-16::obj-52" : 				{
					"parameter_longname" : "live.text[192]"
				}
,
				"obj-28::obj-16::obj-55" : 				{
					"parameter_longname" : "live.text[114]"
				}
,
				"obj-28::obj-16::obj-57" : 				{
					"parameter_longname" : "live.text[188]"
				}
,
				"obj-28::obj-16::obj-61" : 				{
					"parameter_longname" : "live.text[183]"
				}
,
				"obj-28::obj-16::obj-62" : 				{
					"parameter_longname" : "live.text[193]"
				}
,
				"obj-28::obj-16::obj-63" : 				{
					"parameter_longname" : "live.text[186]"
				}
,
				"obj-28::obj-16::obj-64" : 				{
					"parameter_longname" : "live.text[112]"
				}
,
				"obj-28::obj-16::obj-65" : 				{
					"parameter_longname" : "live.text[195]"
				}
,
				"obj-28::obj-16::obj-69" : 				{
					"parameter_longname" : "live.text[187]"
				}
,
				"obj-28::obj-16::obj-70" : 				{
					"parameter_longname" : "live.text[196]"
				}
,
				"obj-28::obj-16::obj-71" : 				{
					"parameter_longname" : "live.text[197]"
				}
,
				"obj-28::obj-16::obj-72" : 				{
					"parameter_longname" : "live.text[189]"
				}
,
				"obj-28::obj-1::obj-1" : 				{
					"parameter_longname" : "live.numbox[5]"
				}
,
				"obj-28::obj-1::obj-13" : 				{
					"parameter_longname" : "live.text[147]"
				}
,
				"obj-28::obj-1::obj-14" : 				{
					"parameter_longname" : "live.text[178]"
				}
,
				"obj-28::obj-1::obj-15" : 				{
					"parameter_longname" : "live.text[145]"
				}
,
				"obj-28::obj-1::obj-32" : 				{
					"parameter_longname" : "live.text[181]"
				}
,
				"obj-28::obj-1::obj-33" : 				{
					"parameter_longname" : "live.text[149]"
				}
,
				"obj-28::obj-1::obj-34" : 				{
					"parameter_longname" : "live.text[180]"
				}
,
				"obj-28::obj-1::obj-42" : 				{
					"parameter_longname" : "live.text[144]"
				}
,
				"obj-28::obj-1::obj-44" : 				{
					"parameter_longname" : "live.text[146]"
				}
,
				"obj-28::obj-1::obj-46" : 				{
					"parameter_longname" : "live.text[179]"
				}
,
				"obj-28::obj-1::obj-5" : 				{
					"parameter_longname" : "live.menu[10]"
				}
,
				"obj-28::obj-1::obj-52" : 				{
					"parameter_longname" : "live.text[148]"
				}
,
				"obj-28::obj-1::obj-55" : 				{
					"parameter_longname" : "live.text[107]"
				}
,
				"obj-28::obj-1::obj-57" : 				{
					"parameter_longname" : "live.text[177]"
				}
,
				"obj-28::obj-1::obj-61" : 				{
					"parameter_longname" : "live.text[150]"
				}
,
				"obj-28::obj-1::obj-62" : 				{
					"parameter_longname" : "live.text[108]"
				}
,
				"obj-28::obj-1::obj-63" : 				{
					"parameter_longname" : "live.text[152]"
				}
,
				"obj-28::obj-1::obj-64" : 				{
					"parameter_longname" : "live.text[182]"
				}
,
				"obj-28::obj-1::obj-65" : 				{
					"parameter_longname" : "live.text[151]"
				}
,
				"obj-28::obj-1::obj-69" : 				{
					"parameter_longname" : "live.text[109]"
				}
,
				"obj-28::obj-1::obj-70" : 				{
					"parameter_longname" : "live.text[153]"
				}
,
				"obj-28::obj-1::obj-71" : 				{
					"parameter_longname" : "live.text[110]"
				}
,
				"obj-28::obj-1::obj-72" : 				{
					"parameter_longname" : "live.text[176]"
				}
,
				"obj-28::obj-24" : 				{
					"parameter_longname" : "live.menu[18]"
				}
,
				"obj-28::obj-30" : 				{
					"parameter_longname" : "live.text[201]"
				}
,
				"obj-28::obj-32" : 				{
					"parameter_longname" : "live.text[202]"
				}
,
				"obj-28::obj-33" : 				{
					"parameter_longname" : "live.text[203]"
				}
,
				"obj-28::obj-34" : 				{
					"parameter_longname" : "live.text[205]"
				}
,
				"obj-28::obj-36" : 				{
					"parameter_longname" : "live.text[204]"
				}
,
				"obj-2::obj-16::obj-1" : 				{
					"parameter_longname" : "live.numbox[4]"
				}
,
				"obj-2::obj-16::obj-13" : 				{
					"parameter_longname" : "live.text[167]"
				}
,
				"obj-2::obj-16::obj-14" : 				{
					"parameter_longname" : "live.text[127]"
				}
,
				"obj-2::obj-16::obj-15" : 				{
					"parameter_longname" : "live.text[130]"
				}
,
				"obj-2::obj-16::obj-32" : 				{
					"parameter_longname" : "live.text[139]"
				}
,
				"obj-2::obj-16::obj-33" : 				{
					"parameter_longname" : "live.text[136]"
				}
,
				"obj-2::obj-16::obj-34" : 				{
					"parameter_longname" : "live.text[133]"
				}
,
				"obj-2::obj-16::obj-42" : 				{
					"parameter_longname" : "live.text[137]"
				}
,
				"obj-2::obj-16::obj-44" : 				{
					"parameter_longname" : "live.text[140]"
				}
,
				"obj-2::obj-16::obj-46" : 				{
					"parameter_longname" : "live.text[138]"
				}
,
				"obj-2::obj-16::obj-5" : 				{
					"parameter_longname" : "live.menu[9]"
				}
,
				"obj-2::obj-16::obj-52" : 				{
					"parameter_longname" : "live.text[135]"
				}
,
				"obj-2::obj-16::obj-55" : 				{
					"parameter_longname" : "live.text[141]"
				}
,
				"obj-2::obj-16::obj-57" : 				{
					"parameter_longname" : "live.text[169]"
				}
,
				"obj-2::obj-16::obj-61" : 				{
					"parameter_longname" : "live.text[170]"
				}
,
				"obj-2::obj-16::obj-62" : 				{
					"parameter_longname" : "live.text[131]"
				}
,
				"obj-2::obj-16::obj-63" : 				{
					"parameter_longname" : "live.text[126]"
				}
,
				"obj-2::obj-16::obj-64" : 				{
					"parameter_longname" : "live.text[142]"
				}
,
				"obj-2::obj-16::obj-65" : 				{
					"parameter_longname" : "live.text[132]"
				}
,
				"obj-2::obj-16::obj-69" : 				{
					"parameter_longname" : "live.text[128]"
				}
,
				"obj-2::obj-16::obj-70" : 				{
					"parameter_longname" : "live.text[168]"
				}
,
				"obj-2::obj-16::obj-71" : 				{
					"parameter_longname" : "live.text[134]"
				}
,
				"obj-2::obj-16::obj-72" : 				{
					"parameter_longname" : "live.text[129]"
				}
,
				"obj-2::obj-1::obj-1" : 				{
					"parameter_longname" : "live.numbox[38]"
				}
,
				"obj-2::obj-1::obj-13" : 				{
					"parameter_longname" : "live.text[105]"
				}
,
				"obj-2::obj-1::obj-14" : 				{
					"parameter_longname" : "live.text[93]"
				}
,
				"obj-2::obj-1::obj-15" : 				{
					"parameter_longname" : "live.text[103]"
				}
,
				"obj-2::obj-1::obj-32" : 				{
					"parameter_longname" : "live.text[97]"
				}
,
				"obj-2::obj-1::obj-33" : 				{
					"parameter_longname" : "live.text[119]"
				}
,
				"obj-2::obj-1::obj-34" : 				{
					"parameter_longname" : "live.text[95]"
				}
,
				"obj-2::obj-1::obj-42" : 				{
					"parameter_longname" : "live.text[101]"
				}
,
				"obj-2::obj-1::obj-44" : 				{
					"parameter_longname" : "live.text[104]"
				}
,
				"obj-2::obj-1::obj-46" : 				{
					"parameter_longname" : "live.text[94]"
				}
,
				"obj-2::obj-1::obj-5" : 				{
					"parameter_longname" : "live.menu[8]"
				}
,
				"obj-2::obj-1::obj-52" : 				{
					"parameter_longname" : "live.text[106]"
				}
,
				"obj-2::obj-1::obj-55" : 				{
					"parameter_longname" : "live.text[96]"
				}
,
				"obj-2::obj-1::obj-57" : 				{
					"parameter_longname" : "live.text[124]"
				}
,
				"obj-2::obj-1::obj-61" : 				{
					"parameter_longname" : "live.text[120]"
				}
,
				"obj-2::obj-1::obj-62" : 				{
					"parameter_longname" : "live.text[98]"
				}
,
				"obj-2::obj-1::obj-63" : 				{
					"parameter_longname" : "live.text[121]"
				}
,
				"obj-2::obj-1::obj-64" : 				{
					"parameter_longname" : "live.text[99]"
				}
,
				"obj-2::obj-1::obj-65" : 				{
					"parameter_longname" : "live.text[122]"
				}
,
				"obj-2::obj-1::obj-69" : 				{
					"parameter_longname" : "live.text[100]"
				}
,
				"obj-2::obj-1::obj-70" : 				{
					"parameter_longname" : "live.text[123]"
				}
,
				"obj-2::obj-1::obj-71" : 				{
					"parameter_longname" : "live.text[102]"
				}
,
				"obj-2::obj-1::obj-72" : 				{
					"parameter_longname" : "live.text[125]"
				}
,
				"obj-2::obj-24" : 				{
					"parameter_invisible" : 2,
					"parameter_longname" : "live.menu[15]",
					"parameter_modmode" : 0,
					"parameter_range" : [ "float", "int" ],
					"parameter_type" : 2,
					"parameter_unitstyle" : 10
				}
,
				"obj-2::obj-30" : 				{
					"parameter_longname" : "live.text[173]"
				}
,
				"obj-2::obj-32" : 				{
					"parameter_longname" : "live.text[174]"
				}
,
				"obj-2::obj-33" : 				{
					"parameter_longname" : "live.text[175]"
				}
,
				"obj-2::obj-34" : 				{
					"parameter_longname" : "live.text[172]"
				}
,
				"obj-2::obj-36" : 				{
					"parameter_longname" : "live.text[171]"
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
				"name" : "pyosc.awaitpatcherargs.maxpat",
				"bootpath" : "~/MaxProjects/Mabstractions/abstraction",
				"patcherrelativepath" : "../../../../Mabstractions/abstraction",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.addmul.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers",
				"patcherrelativepath" : "../../../patchers",
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
				"name" : "ser.phase.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.phase.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers",
				"patcherrelativepath" : "../../../patchers",
				"type" : "JSON",
				"implicit" : 1
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
				"name" : "ser.stepper.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers",
				"patcherrelativepath" : "../../../patchers",
				"type" : "JSON",
				"implicit" : 1
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
