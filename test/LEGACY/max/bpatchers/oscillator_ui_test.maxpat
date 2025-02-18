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
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1607.0, 737.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1607.0, 769.0, 141.0, 22.0 ],
					"text" : "thispatcher offset -5 -120"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 435.0, 175.0, 52.0, 22.0 ],
					"text" : "period 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 381.0, 175.0, 52.0, 22.0 ],
					"text" : "period 1"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@period", 1, "@periodtype", 2 ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-44",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "ser.oscillator.ui.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"offset" : [ -5.0, -120.0 ],
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 1607.0, 804.0, 111.0, 42.0 ],
					"varname" : "ser.oscillator.ui[1]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 326.0, 503.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1505.0, 121.0, 67.0, 22.0 ],
					"text" : "timesig 2 8"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-166",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1586.0, 121.0, 67.0, 22.0 ],
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
					"patching_rect" : [ 1673.0, 242.0, 106.0, 22.0 ],
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
					"patching_rect" : [ 1432.0, 121.0, 67.0, 22.0 ],
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
					"patching_rect" : [ 1754.0, 121.0, 59.0, 22.0 ],
					"text" : "tempo $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1754.0, 99.0, 44.0, 15.0 ],
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
					"patching_rect" : [ 1673.0, 273.0, 58.0, 22.0 ],
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
					"patching_rect" : [ 1673.0, 306.0, 29.5, 22.0 ],
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
					"patching_rect" : [ 1351.0, 81.0, 73.0, 62.0 ],
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
					"patching_rect" : [ 1542.0, 253.0, 37.0, 20.0 ],
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
					"patching_rect" : [ 1467.0, 454.0, 23.0, 20.0 ],
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
					"patching_rect" : [ 1468.0, 420.0, 46.0, 20.0 ],
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
					"patching_rect" : [ 1585.0, 152.0, 69.0, 22.0 ],
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
					"patching_rect" : [ 1673.0, 121.0, 69.0, 22.0 ],
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
					"patching_rect" : [ 1413.0, 386.0, 50.0, 22.0 ]
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
					"patching_rect" : [ 1485.0, 388.0, 50.0, 22.0 ]
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
					"patching_rect" : [ 1501.0, 364.0, 50.0, 22.0 ]
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
					"patching_rect" : [ 1597.0, 316.0, 32.5, 22.0 ],
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
					"patching_rect" : [ 1597.0, 292.0, 36.0, 22.0 ],
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
					"patching_rect" : [ 1469.0, 340.0, 147.0, 22.0 ],
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
					"patching_rect" : [ 1673.0, 95.0, 73.0, 22.0 ],
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
					"patching_rect" : [ 1505.0, 92.0, 73.0, 22.0 ],
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
					"patching_rect" : [ 1583.0, 92.0, 73.0, 22.0 ],
					"text" : "timesig 4 16"
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
					"patching_rect" : [ 1268.0, 562.0, 70.0, 22.0 ],
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
					"patching_rect" : [ 1268.0, 601.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 810.0, 574.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1268.0, 647.0, 121.0, 22.0 ],
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
					"patching_rect" : [ 1370.0, 607.0, 101.0, 22.0 ],
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
					"patching_rect" : [ 1370.0, 562.0, 66.0, 22.0 ],
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
					"patching_rect" : [ 1452.0, 535.0, 52.0, 22.0 ],
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
					"patching_rect" : [ 1452.0, 562.0, 45.0, 22.0 ],
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
					"patching_rect" : [ 1382.0, 488.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 1382.0, 452.0, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-106",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1515.0, 681.0, 54.0, 22.0 ],
					"text" : "*~ 0.707"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 1509.0, 824.0, 45.0, 45.0 ]
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
					"patching_rect" : [ 1515.0, 716.0, 50.0, 75.0 ],
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
					"patching_rect" : [ 1515.0, 553.0, 70.0, 22.0 ],
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
					"patching_rect" : [ 1515.0, 592.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 800.0, 219.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1515.0, 638.0, 121.0, 22.0 ],
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
					"patching_rect" : [ 1617.0, 598.0, 101.0, 22.0 ],
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
					"patching_rect" : [ 1617.0, 553.0, 73.0, 22.0 ],
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
					"patching_rect" : [ 1546.0, 593.0, 52.0, 22.0 ],
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
					"patching_rect" : [ 1699.0, 553.0, 45.0, 22.0 ],
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
					"patching_rect" : [ 1629.0, 479.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 1629.0, 443.0, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 384.0, 572.0, 49.0, 22.0 ],
					"text" : "noteout"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 384.0, 528.0, 81.0, 22.0 ],
					"text" : "ser.makenote"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 381.0, 448.0, 89.0, 22.0 ],
					"text" : "ser.phasepulse"
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
					"name" : "ser.oscillator.ui.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 381.0, 222.0, 138.0, 166.0 ],
					"varname" : "ser.oscillator.ui",
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-1", 0 ]
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
					"destination" : [ "obj-127", 0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 0 ],
					"midpoints" : [ 1476.5, 482.5, 1653.5, 482.5, 1653.5, 232.5, 1551.5, 232.5 ],
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
					"destination" : [ "obj-44", 0 ],
					"source" : [ "obj-12", 0 ]
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
					"destination" : [ "obj-113", 0 ],
					"order" : 0,
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"order" : 1,
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"order" : 1,
					"source" : [ "obj-127", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-124", 0 ],
					"source" : [ "obj-127", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"order" : 0,
					"source" : [ "obj-127", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"order" : 2,
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
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
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"order" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"order" : 1,
					"source" : [ "obj-3", 0 ]
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
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-5", 0 ]
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
					"destination" : [ "obj-1", 0 ],
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
			"obj-1::obj-2" : [ "live.menu[46]", "live.menu", 0 ],
			"obj-1::obj-28" : [ "live.menu[9]", "live.menu", 0 ],
			"obj-1::obj-29" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-1::obj-32::obj-1" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-1::obj-32::obj-13" : [ "live.text[22]", "live.text[36]", 0 ],
			"obj-1::obj-32::obj-14" : [ "live.text[41]", "live.text[36]", 0 ],
			"obj-1::obj-32::obj-15" : [ "live.text[32]", "live.text[36]", 0 ],
			"obj-1::obj-32::obj-32" : [ "live.text[28]", "live.text[36]", 0 ],
			"obj-1::obj-32::obj-33" : [ "live.text[36]", "live.text[36]", 0 ],
			"obj-1::obj-32::obj-34" : [ "live.text[25]", "live.text[36]", 0 ],
			"obj-1::obj-32::obj-42" : [ "live.text[34]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-44" : [ "live.text[38]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-46" : [ "live.text[23]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-5" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-1::obj-32::obj-52" : [ "live.text[37]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-55" : [ "live.text[30]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-57" : [ "live.text[29]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-61" : [ "live.text[39]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-62" : [ "live.text[33]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-63" : [ "live.text[42]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-64" : [ "live.text[24]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-65" : [ "live.text[26]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-69" : [ "live.text[40]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-70" : [ "live.text[31]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-71" : [ "live.text[35]", "live.text[15]", 0 ],
			"obj-1::obj-32::obj-72" : [ "live.text[27]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-1::obj-5::obj-13" : [ "live.text[79]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-14" : [ "live.text[67]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-15" : [ "live.text[66]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-32" : [ "live.text[75]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-33" : [ "live.text[83]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-34" : [ "live.text[71]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-42" : [ "live.text[80]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-44" : [ "live.text[81]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-46" : [ "live.text[73]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-5" : [ "live.menu[4]", "live.menu", 0 ],
			"obj-1::obj-5::obj-52" : [ "live.text[82]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-55" : [ "live.text[74]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-57" : [ "live.text[72]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-61" : [ "live.text[84]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-62" : [ "live.text[76]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-63" : [ "live.text[64]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-64" : [ "live.text[77]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-65" : [ "live.text[68]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-69" : [ "live.text[65]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-70" : [ "live.text[70]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-71" : [ "live.text[69]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-72" : [ "live.text[78]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-1" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-1::obj-6::obj-13" : [ "live.text[52]", "live.text[36]", 0 ],
			"obj-1::obj-6::obj-14" : [ "live.text[53]", "live.text[36]", 0 ],
			"obj-1::obj-6::obj-15" : [ "live.text[60]", "live.text[36]", 0 ],
			"obj-1::obj-6::obj-32" : [ "live.text[57]", "live.text[36]", 0 ],
			"obj-1::obj-6::obj-33" : [ "live.text[61]", "live.text[36]", 0 ],
			"obj-1::obj-6::obj-34" : [ "live.text[47]", "live.text[36]", 0 ],
			"obj-1::obj-6::obj-42" : [ "live.text[44]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-44" : [ "live.text[62]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-46" : [ "live.text[54]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-5" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-1::obj-6::obj-52" : [ "live.text[48]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-55" : [ "live.text[43]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-57" : [ "live.text[59]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-61" : [ "live.text[56]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-62" : [ "live.text[50]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-63" : [ "live.text[45]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-64" : [ "live.text[63]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-65" : [ "live.text[55]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-69" : [ "live.text[49]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-70" : [ "live.text[58]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-71" : [ "live.text[51]", "live.text[15]", 0 ],
			"obj-1::obj-6::obj-72" : [ "live.text[46]", "live.text[15]", 0 ],
			"obj-1::obj-72" : [ "live.text[231]", "live.text", 0 ],
			"obj-1::obj-8" : [ "live.text[85]", "live.text[36]", 0 ],
			"obj-1::obj-82" : [ "live.text[232]", "live.text", 0 ],
			"obj-1::obj-83" : [ "live.numbox[92]", "live.numbox", 0 ],
			"obj-41" : [ "live.numbox[20]", "live.numbox[7]", 0 ],
			"obj-44::obj-2" : [ "live.menu[5]", "live.menu", 0 ],
			"obj-44::obj-28" : [ "live.menu[17]", "live.menu", 0 ],
			"obj-44::obj-29" : [ "live.menu[16]", "live.menu", 0 ],
			"obj-44::obj-32::obj-1" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-44::obj-32::obj-13" : [ "live.text[150]", "live.text[36]", 0 ],
			"obj-44::obj-32::obj-14" : [ "live.text[139]", "live.text[36]", 0 ],
			"obj-44::obj-32::obj-15" : [ "live.text[149]", "live.text[36]", 0 ],
			"obj-44::obj-32::obj-32" : [ "live.text[143]", "live.text[36]", 0 ],
			"obj-44::obj-32::obj-33" : [ "live.text[130]", "live.text[36]", 0 ],
			"obj-44::obj-32::obj-34" : [ "live.text[141]", "live.text[36]", 0 ],
			"obj-44::obj-32::obj-42" : [ "live.text[148]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-44" : [ "live.text[142]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-46" : [ "live.text[132]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-5" : [ "live.menu[13]", "live.menu", 0 ],
			"obj-44::obj-32::obj-52" : [ "live.text[137]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-55" : [ "live.text[135]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-57" : [ "live.text[134]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-61" : [ "live.text[140]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-62" : [ "live.text[133]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-63" : [ "live.text[146]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-64" : [ "live.text[138]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-65" : [ "live.text[147]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-69" : [ "live.text[136]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-70" : [ "live.text[144]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-71" : [ "live.text[131]", "live.text[15]", 0 ],
			"obj-44::obj-32::obj-72" : [ "live.text[145]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-1" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-44::obj-5::obj-13" : [ "live.text[101]", "live.text[36]", 0 ],
			"obj-44::obj-5::obj-14" : [ "live.text[88]", "live.text[36]", 0 ],
			"obj-44::obj-5::obj-15" : [ "live.text[99]", "live.text[36]", 0 ],
			"obj-44::obj-5::obj-32" : [ "live.text[92]", "live.text[36]", 0 ],
			"obj-44::obj-5::obj-33" : [ "live.text[105]", "live.text[36]", 0 ],
			"obj-44::obj-5::obj-34" : [ "live.text[90]", "live.text[36]", 0 ],
			"obj-44::obj-5::obj-42" : [ "live.text[96]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-44" : [ "live.text[100]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-46" : [ "live.text[89]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-5" : [ "live.menu[15]", "live.menu", 0 ],
			"obj-44::obj-5::obj-52" : [ "live.text[102]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-55" : [ "live.text[103]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-57" : [ "live.text[86]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-61" : [ "live.text[95]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-62" : [ "live.text[97]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-63" : [ "live.text[93]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-64" : [ "live.text[104]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-65" : [ "live.text[91]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-69" : [ "live.text[106]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-70" : [ "live.text[94]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-71" : [ "live.text[98]", "live.text[15]", 0 ],
			"obj-44::obj-5::obj-72" : [ "live.text[87]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-1" : [ "live.numbox[7]", "live.numbox", 0 ],
			"obj-44::obj-6::obj-13" : [ "live.text[171]", "live.text[36]", 0 ],
			"obj-44::obj-6::obj-14" : [ "live.text[159]", "live.text[36]", 0 ],
			"obj-44::obj-6::obj-15" : [ "live.text[151]", "live.text[36]", 0 ],
			"obj-44::obj-6::obj-32" : [ "live.text[153]", "live.text[36]", 0 ],
			"obj-44::obj-6::obj-33" : [ "live.text[168]", "live.text[36]", 0 ],
			"obj-44::obj-6::obj-34" : [ "live.text[167]", "live.text[36]", 0 ],
			"obj-44::obj-6::obj-42" : [ "live.text[169]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-44" : [ "live.text[166]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-46" : [ "live.text[163]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-5" : [ "live.menu[14]", "live.menu", 0 ],
			"obj-44::obj-6::obj-52" : [ "live.text[158]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-55" : [ "live.text[152]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-57" : [ "live.text[160]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-61" : [ "live.text[170]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-62" : [ "live.text[161]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-63" : [ "live.text[154]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-64" : [ "live.text[164]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-65" : [ "live.text[162]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-69" : [ "live.text[155]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-70" : [ "live.text[165]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-71" : [ "live.text[157]", "live.text[15]", 0 ],
			"obj-44::obj-6::obj-72" : [ "live.text[156]", "live.text[15]", 0 ],
			"obj-44::obj-72" : [ "live.text[172]", "live.text", 0 ],
			"obj-44::obj-8" : [ "live.text[173]", "live.text[36]", 0 ],
			"obj-44::obj-82" : [ "live.text[107]", "live.text", 0 ],
			"obj-44::obj-83" : [ "live.numbox[8]", "live.numbox", 0 ],
			"obj-66" : [ "live.toggle[3]", "live.toggle", 0 ],
			"obj-73" : [ "live.gain~[2]", "live.gain~", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"parameter_overrides" : 			{
				"obj-1::obj-2" : 				{
					"parameter_initial" : 0,
					"parameter_longname" : "live.menu[46]"
				}
,
				"obj-1::obj-28" : 				{
					"parameter_longname" : "live.menu[9]"
				}
,
				"obj-1::obj-29" : 				{
					"parameter_longname" : "live.menu[11]"
				}
,
				"obj-1::obj-32::obj-1" : 				{
					"parameter_longname" : "live.numbox[2]"
				}
,
				"obj-1::obj-32::obj-13" : 				{
					"parameter_longname" : "live.text[22]"
				}
,
				"obj-1::obj-32::obj-14" : 				{
					"parameter_longname" : "live.text[41]"
				}
,
				"obj-1::obj-32::obj-15" : 				{
					"parameter_longname" : "live.text[32]"
				}
,
				"obj-1::obj-32::obj-32" : 				{
					"parameter_longname" : "live.text[28]"
				}
,
				"obj-1::obj-32::obj-33" : 				{
					"parameter_longname" : "live.text[36]"
				}
,
				"obj-1::obj-32::obj-34" : 				{
					"parameter_longname" : "live.text[25]"
				}
,
				"obj-1::obj-32::obj-42" : 				{
					"parameter_longname" : "live.text[34]"
				}
,
				"obj-1::obj-32::obj-44" : 				{
					"parameter_longname" : "live.text[38]"
				}
,
				"obj-1::obj-32::obj-46" : 				{
					"parameter_longname" : "live.text[23]"
				}
,
				"obj-1::obj-32::obj-5" : 				{
					"parameter_longname" : "live.menu[2]"
				}
,
				"obj-1::obj-32::obj-52" : 				{
					"parameter_longname" : "live.text[37]"
				}
,
				"obj-1::obj-32::obj-55" : 				{
					"parameter_longname" : "live.text[30]"
				}
,
				"obj-1::obj-32::obj-57" : 				{
					"parameter_longname" : "live.text[29]"
				}
,
				"obj-1::obj-32::obj-61" : 				{
					"parameter_longname" : "live.text[39]"
				}
,
				"obj-1::obj-32::obj-62" : 				{
					"parameter_longname" : "live.text[33]"
				}
,
				"obj-1::obj-32::obj-63" : 				{
					"parameter_longname" : "live.text[42]"
				}
,
				"obj-1::obj-32::obj-64" : 				{
					"parameter_longname" : "live.text[24]"
				}
,
				"obj-1::obj-32::obj-65" : 				{
					"parameter_longname" : "live.text[26]"
				}
,
				"obj-1::obj-32::obj-69" : 				{
					"parameter_longname" : "live.text[40]"
				}
,
				"obj-1::obj-32::obj-70" : 				{
					"parameter_longname" : "live.text[31]"
				}
,
				"obj-1::obj-32::obj-71" : 				{
					"parameter_longname" : "live.text[35]"
				}
,
				"obj-1::obj-32::obj-72" : 				{
					"parameter_longname" : "live.text[27]"
				}
,
				"obj-1::obj-5::obj-1" : 				{
					"parameter_longname" : "live.numbox[4]"
				}
,
				"obj-1::obj-5::obj-13" : 				{
					"parameter_longname" : "live.text[79]"
				}
,
				"obj-1::obj-5::obj-14" : 				{
					"parameter_longname" : "live.text[67]"
				}
,
				"obj-1::obj-5::obj-15" : 				{
					"parameter_longname" : "live.text[66]"
				}
,
				"obj-1::obj-5::obj-32" : 				{
					"parameter_longname" : "live.text[75]"
				}
,
				"obj-1::obj-5::obj-33" : 				{
					"parameter_longname" : "live.text[83]"
				}
,
				"obj-1::obj-5::obj-34" : 				{
					"parameter_longname" : "live.text[71]"
				}
,
				"obj-1::obj-5::obj-42" : 				{
					"parameter_longname" : "live.text[80]"
				}
,
				"obj-1::obj-5::obj-44" : 				{
					"parameter_longname" : "live.text[81]"
				}
,
				"obj-1::obj-5::obj-46" : 				{
					"parameter_longname" : "live.text[73]"
				}
,
				"obj-1::obj-5::obj-5" : 				{
					"parameter_longname" : "live.menu[4]"
				}
,
				"obj-1::obj-5::obj-52" : 				{
					"parameter_longname" : "live.text[82]"
				}
,
				"obj-1::obj-5::obj-55" : 				{
					"parameter_longname" : "live.text[74]"
				}
,
				"obj-1::obj-5::obj-57" : 				{
					"parameter_longname" : "live.text[72]"
				}
,
				"obj-1::obj-5::obj-61" : 				{
					"parameter_longname" : "live.text[84]"
				}
,
				"obj-1::obj-5::obj-62" : 				{
					"parameter_longname" : "live.text[76]"
				}
,
				"obj-1::obj-5::obj-63" : 				{
					"parameter_longname" : "live.text[64]"
				}
,
				"obj-1::obj-5::obj-64" : 				{
					"parameter_longname" : "live.text[77]"
				}
,
				"obj-1::obj-5::obj-65" : 				{
					"parameter_longname" : "live.text[68]"
				}
,
				"obj-1::obj-5::obj-69" : 				{
					"parameter_longname" : "live.text[65]"
				}
,
				"obj-1::obj-5::obj-70" : 				{
					"parameter_longname" : "live.text[70]"
				}
,
				"obj-1::obj-5::obj-71" : 				{
					"parameter_longname" : "live.text[69]"
				}
,
				"obj-1::obj-5::obj-72" : 				{
					"parameter_longname" : "live.text[78]"
				}
,
				"obj-1::obj-6::obj-1" : 				{
					"parameter_longname" : "live.numbox[3]"
				}
,
				"obj-1::obj-6::obj-13" : 				{
					"parameter_longname" : "live.text[52]"
				}
,
				"obj-1::obj-6::obj-14" : 				{
					"parameter_longname" : "live.text[53]"
				}
,
				"obj-1::obj-6::obj-15" : 				{
					"parameter_longname" : "live.text[60]"
				}
,
				"obj-1::obj-6::obj-32" : 				{
					"parameter_longname" : "live.text[57]"
				}
,
				"obj-1::obj-6::obj-33" : 				{
					"parameter_longname" : "live.text[61]"
				}
,
				"obj-1::obj-6::obj-34" : 				{
					"parameter_longname" : "live.text[47]"
				}
,
				"obj-1::obj-6::obj-42" : 				{
					"parameter_longname" : "live.text[44]"
				}
,
				"obj-1::obj-6::obj-44" : 				{
					"parameter_longname" : "live.text[62]"
				}
,
				"obj-1::obj-6::obj-46" : 				{
					"parameter_longname" : "live.text[54]"
				}
,
				"obj-1::obj-6::obj-5" : 				{
					"parameter_longname" : "live.menu[3]"
				}
,
				"obj-1::obj-6::obj-52" : 				{
					"parameter_longname" : "live.text[48]"
				}
,
				"obj-1::obj-6::obj-55" : 				{
					"parameter_longname" : "live.text[43]"
				}
,
				"obj-1::obj-6::obj-57" : 				{
					"parameter_longname" : "live.text[59]"
				}
,
				"obj-1::obj-6::obj-61" : 				{
					"parameter_longname" : "live.text[56]"
				}
,
				"obj-1::obj-6::obj-62" : 				{
					"parameter_longname" : "live.text[50]"
				}
,
				"obj-1::obj-6::obj-63" : 				{
					"parameter_longname" : "live.text[45]"
				}
,
				"obj-1::obj-6::obj-64" : 				{
					"parameter_longname" : "live.text[63]"
				}
,
				"obj-1::obj-6::obj-65" : 				{
					"parameter_longname" : "live.text[55]"
				}
,
				"obj-1::obj-6::obj-69" : 				{
					"parameter_longname" : "live.text[49]"
				}
,
				"obj-1::obj-6::obj-70" : 				{
					"parameter_longname" : "live.text[58]"
				}
,
				"obj-1::obj-6::obj-71" : 				{
					"parameter_longname" : "live.text[51]"
				}
,
				"obj-1::obj-6::obj-72" : 				{
					"parameter_longname" : "live.text[46]"
				}
,
				"obj-1::obj-72" : 				{
					"parameter_longname" : "live.text[231]"
				}
,
				"obj-1::obj-8" : 				{
					"parameter_longname" : "live.text[85]"
				}
,
				"obj-1::obj-82" : 				{
					"parameter_longname" : "live.text[232]"
				}
,
				"obj-1::obj-83" : 				{
					"parameter_longname" : "live.numbox[92]"
				}
,
				"obj-44::obj-2" : 				{
					"parameter_longname" : "live.menu[5]"
				}
,
				"obj-44::obj-28" : 				{
					"parameter_longname" : "live.menu[17]"
				}
,
				"obj-44::obj-29" : 				{
					"parameter_longname" : "live.menu[16]"
				}
,
				"obj-44::obj-32::obj-1" : 				{
					"parameter_longname" : "live.numbox[6]"
				}
,
				"obj-44::obj-32::obj-13" : 				{
					"parameter_longname" : "live.text[150]"
				}
,
				"obj-44::obj-32::obj-14" : 				{
					"parameter_longname" : "live.text[139]"
				}
,
				"obj-44::obj-32::obj-15" : 				{
					"parameter_longname" : "live.text[149]"
				}
,
				"obj-44::obj-32::obj-32" : 				{
					"parameter_longname" : "live.text[143]"
				}
,
				"obj-44::obj-32::obj-33" : 				{
					"parameter_longname" : "live.text[130]"
				}
,
				"obj-44::obj-32::obj-34" : 				{
					"parameter_longname" : "live.text[141]"
				}
,
				"obj-44::obj-32::obj-42" : 				{
					"parameter_longname" : "live.text[148]"
				}
,
				"obj-44::obj-32::obj-44" : 				{
					"parameter_longname" : "live.text[142]"
				}
,
				"obj-44::obj-32::obj-46" : 				{
					"parameter_longname" : "live.text[132]"
				}
,
				"obj-44::obj-32::obj-5" : 				{
					"parameter_longname" : "live.menu[13]"
				}
,
				"obj-44::obj-32::obj-52" : 				{
					"parameter_longname" : "live.text[137]"
				}
,
				"obj-44::obj-32::obj-55" : 				{
					"parameter_longname" : "live.text[135]"
				}
,
				"obj-44::obj-32::obj-57" : 				{
					"parameter_longname" : "live.text[134]"
				}
,
				"obj-44::obj-32::obj-61" : 				{
					"parameter_longname" : "live.text[140]"
				}
,
				"obj-44::obj-32::obj-62" : 				{
					"parameter_longname" : "live.text[133]"
				}
,
				"obj-44::obj-32::obj-63" : 				{
					"parameter_longname" : "live.text[146]"
				}
,
				"obj-44::obj-32::obj-64" : 				{
					"parameter_longname" : "live.text[138]"
				}
,
				"obj-44::obj-32::obj-65" : 				{
					"parameter_longname" : "live.text[147]"
				}
,
				"obj-44::obj-32::obj-69" : 				{
					"parameter_longname" : "live.text[136]"
				}
,
				"obj-44::obj-32::obj-70" : 				{
					"parameter_longname" : "live.text[144]"
				}
,
				"obj-44::obj-32::obj-71" : 				{
					"parameter_longname" : "live.text[131]"
				}
,
				"obj-44::obj-32::obj-72" : 				{
					"parameter_longname" : "live.text[145]"
				}
,
				"obj-44::obj-5::obj-1" : 				{
					"parameter_longname" : "live.numbox[5]"
				}
,
				"obj-44::obj-5::obj-13" : 				{
					"parameter_longname" : "live.text[101]"
				}
,
				"obj-44::obj-5::obj-14" : 				{
					"parameter_longname" : "live.text[88]"
				}
,
				"obj-44::obj-5::obj-15" : 				{
					"parameter_longname" : "live.text[99]"
				}
,
				"obj-44::obj-5::obj-32" : 				{
					"parameter_longname" : "live.text[92]"
				}
,
				"obj-44::obj-5::obj-33" : 				{
					"parameter_longname" : "live.text[105]"
				}
,
				"obj-44::obj-5::obj-34" : 				{
					"parameter_longname" : "live.text[90]"
				}
,
				"obj-44::obj-5::obj-42" : 				{
					"parameter_longname" : "live.text[96]"
				}
,
				"obj-44::obj-5::obj-44" : 				{
					"parameter_longname" : "live.text[100]"
				}
,
				"obj-44::obj-5::obj-46" : 				{
					"parameter_longname" : "live.text[89]"
				}
,
				"obj-44::obj-5::obj-5" : 				{
					"parameter_longname" : "live.menu[15]"
				}
,
				"obj-44::obj-5::obj-52" : 				{
					"parameter_longname" : "live.text[102]"
				}
,
				"obj-44::obj-5::obj-55" : 				{
					"parameter_longname" : "live.text[103]"
				}
,
				"obj-44::obj-5::obj-57" : 				{
					"parameter_longname" : "live.text[86]"
				}
,
				"obj-44::obj-5::obj-61" : 				{
					"parameter_longname" : "live.text[95]"
				}
,
				"obj-44::obj-5::obj-62" : 				{
					"parameter_longname" : "live.text[97]"
				}
,
				"obj-44::obj-5::obj-63" : 				{
					"parameter_longname" : "live.text[93]"
				}
,
				"obj-44::obj-5::obj-64" : 				{
					"parameter_longname" : "live.text[104]"
				}
,
				"obj-44::obj-5::obj-65" : 				{
					"parameter_longname" : "live.text[91]"
				}
,
				"obj-44::obj-5::obj-69" : 				{
					"parameter_longname" : "live.text[106]"
				}
,
				"obj-44::obj-5::obj-70" : 				{
					"parameter_longname" : "live.text[94]"
				}
,
				"obj-44::obj-5::obj-71" : 				{
					"parameter_longname" : "live.text[98]"
				}
,
				"obj-44::obj-5::obj-72" : 				{
					"parameter_longname" : "live.text[87]"
				}
,
				"obj-44::obj-6::obj-1" : 				{
					"parameter_longname" : "live.numbox[7]"
				}
,
				"obj-44::obj-6::obj-13" : 				{
					"parameter_longname" : "live.text[171]"
				}
,
				"obj-44::obj-6::obj-14" : 				{
					"parameter_longname" : "live.text[159]"
				}
,
				"obj-44::obj-6::obj-15" : 				{
					"parameter_longname" : "live.text[151]"
				}
,
				"obj-44::obj-6::obj-32" : 				{
					"parameter_longname" : "live.text[153]"
				}
,
				"obj-44::obj-6::obj-33" : 				{
					"parameter_longname" : "live.text[168]"
				}
,
				"obj-44::obj-6::obj-34" : 				{
					"parameter_longname" : "live.text[167]"
				}
,
				"obj-44::obj-6::obj-42" : 				{
					"parameter_longname" : "live.text[169]"
				}
,
				"obj-44::obj-6::obj-44" : 				{
					"parameter_longname" : "live.text[166]"
				}
,
				"obj-44::obj-6::obj-46" : 				{
					"parameter_longname" : "live.text[163]"
				}
,
				"obj-44::obj-6::obj-5" : 				{
					"parameter_longname" : "live.menu[14]"
				}
,
				"obj-44::obj-6::obj-52" : 				{
					"parameter_longname" : "live.text[158]"
				}
,
				"obj-44::obj-6::obj-55" : 				{
					"parameter_longname" : "live.text[152]"
				}
,
				"obj-44::obj-6::obj-57" : 				{
					"parameter_longname" : "live.text[160]"
				}
,
				"obj-44::obj-6::obj-61" : 				{
					"parameter_longname" : "live.text[170]"
				}
,
				"obj-44::obj-6::obj-62" : 				{
					"parameter_longname" : "live.text[161]"
				}
,
				"obj-44::obj-6::obj-63" : 				{
					"parameter_longname" : "live.text[154]"
				}
,
				"obj-44::obj-6::obj-64" : 				{
					"parameter_longname" : "live.text[164]"
				}
,
				"obj-44::obj-6::obj-65" : 				{
					"parameter_longname" : "live.text[162]"
				}
,
				"obj-44::obj-6::obj-69" : 				{
					"parameter_longname" : "live.text[155]"
				}
,
				"obj-44::obj-6::obj-70" : 				{
					"parameter_longname" : "live.text[165]"
				}
,
				"obj-44::obj-6::obj-71" : 				{
					"parameter_longname" : "live.text[157]"
				}
,
				"obj-44::obj-6::obj-72" : 				{
					"parameter_longname" : "live.text[156]"
				}
,
				"obj-44::obj-72" : 				{
					"parameter_longname" : "live.text[172]"
				}
,
				"obj-44::obj-8" : 				{
					"parameter_longname" : "live.text[173]"
				}
,
				"obj-44::obj-82" : 				{
					"parameter_longname" : "live.text[107]"
				}
,
				"obj-44::obj-83" : 				{
					"parameter_longname" : "live.numbox[8]"
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
				"name" : "ser.oscillator.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.oscillator.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers",
				"patcherrelativepath" : "../../../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.phasepulse.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.slidermapping.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
