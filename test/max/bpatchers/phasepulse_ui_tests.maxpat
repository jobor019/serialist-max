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
					"args" : [ "@minimum", 0, "@maximum", 127, "@minimum", 0, "@maximum", 127, "@add", "initial", 40, "@mul", "initial", 30 ],
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
					"patching_rect" : [ 641.0, 546.0, 111.0, 51.0 ],
					"varname" : "ser.addmul.ui",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@waveform", 4, "@tau", 0.02 ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-27",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "ser.oscillator.ui.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 641.0, 380.0, 138.0, 145.0 ],
					"varname" : "ser.oscillator.ui[1]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 597.0, 326.0, 29.5, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 457.0, 214.0, 38.0, 22.0 ],
					"text" : "zl.reg"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 461.5, 406.0, 51.0, 22.0 ],
					"text" : "zl.group"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 586.0, 306.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 2 ],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "live.numbox",
							"parameter_mmax" : 11.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "live.numbox"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 478.0, 365.0, 106.0, 22.0 ],
					"text" : "expr $i1 * $i2 + 60"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 467.0, 297.0, 44.0, 22.0 ],
					"text" : "uzi 0 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 411.0, 182.0, 65.0, 22.0 ],
					"text" : "t l l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 457.0, 258.0, 63.0, 22.0 ],
					"text" : "ser.util len"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@size", 1, "@type", 2 ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-7",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "ser.corpus.multislider.maxpat",
					"numinlets" : 1,
					"numoutlets" : 4,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 410.0, 102.0, 101.0, 57.0 ],
					"varname" : "ser.corpus.multislider",
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
					"id" : "obj-3",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "ser.makenote.ui.maxpat",
					"numinlets" : 4,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 286.0, 613.0, 383.0, 76.0 ],
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
					"id" : "obj-2",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "ser.oscillator.ui.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 286.0, 219.0, 146.0, 147.0 ],
					"varname" : "ser.oscillator.ui",
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
					"name" : "ser.phasepulse.ui.maxpat",
					"numinlets" : 3,
					"numoutlets" : 7,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "", "", "", "", "", "" ],
					"patching_rect" : [ 286.0, 380.0, 100.0, 122.0 ],
					"varname" : "ser.phasepulse.ui",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2036.0, 714.0, 85.0, 22.0 ],
					"text" : "timesig 4 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1490.0, 106.0, 67.0, 22.0 ],
					"text" : "timesig 2 8"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1956.0, 685.0, 81.0, 20.0 ],
					"text" : "Raw tick:"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1956.0, 654.0, 81.0, 20.0 ],
					"text" : "Tick (in beat):"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1956.0, 632.0, 37.0, 20.0 ],
					"text" : "Beat:"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1956.0, 608.0, 27.0, 20.0 ],
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
					"patching_rect" : [ 1571.0, 106.0, 67.0, 22.0 ],
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
					"patching_rect" : [ 1658.0, 227.0, 106.0, 22.0 ],
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
					"patching_rect" : [ 1417.0, 106.0, 67.0, 22.0 ],
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
					"patching_rect" : [ 1739.0, 106.0, 59.0, 22.0 ],
					"text" : "tempo $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1739.0, 84.0, 44.0, 15.0 ],
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
					"patching_rect" : [ 1658.0, 258.0, 58.0, 22.0 ],
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
					"patching_rect" : [ 1658.0, 291.0, 29.5, 22.0 ],
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
					"patching_rect" : [ 1336.0, 66.0, 73.0, 62.0 ],
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
					"patching_rect" : [ 1527.0, 238.0, 37.0, 20.0 ],
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
					"patching_rect" : [ 1452.0, 439.0, 23.0, 20.0 ],
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
					"patching_rect" : [ 1453.0, 405.0, 46.0, 20.0 ],
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
					"patching_rect" : [ 1570.0, 137.0, 69.0, 22.0 ],
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
					"patching_rect" : [ 1658.0, 106.0, 69.0, 22.0 ],
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
					"patching_rect" : [ 1398.0, 371.0, 50.0, 22.0 ]
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
					"patching_rect" : [ 1470.0, 373.0, 50.0, 22.0 ]
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
					"patching_rect" : [ 1486.0, 349.0, 50.0, 22.0 ]
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
					"patching_rect" : [ 1582.0, 301.0, 32.5, 22.0 ],
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
					"patching_rect" : [ 1582.0, 277.0, 36.0, 22.0 ],
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
					"patching_rect" : [ 1454.0, 325.0, 147.0, 22.0 ],
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
					"patching_rect" : [ 1658.0, 80.0, 73.0, 22.0 ],
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
					"patching_rect" : [ 1490.0, 77.0, 73.0, 22.0 ],
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
					"patching_rect" : [ 1568.0, 77.0, 73.0, 22.0 ],
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
					"patching_rect" : [ 2036.0, 679.0, 99.0, 22.0 ],
					"text" : "51131.52874"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2026.0, 655.0, 50.0, 35.0 ],
					"text" : "251.52874"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2010.0, 631.0, 50.0, 22.0 ],
					"text" : "3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1995.0, 607.0, 50.0, 22.0 ],
					"text" : "27"
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
					"patching_rect" : [ 1253.0, 547.0, 70.0, 22.0 ],
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
					"patching_rect" : [ 1253.0, 586.0, 24.0, 24.0 ],
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
					"patching_rect" : [ 1253.0, 632.0, 121.0, 22.0 ],
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
					"patching_rect" : [ 1355.0, 592.0, 101.0, 22.0 ],
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
					"patching_rect" : [ 1355.0, 547.0, 66.0, 22.0 ],
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
					"patching_rect" : [ 1437.0, 520.0, 52.0, 22.0 ],
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
					"patching_rect" : [ 1437.0, 547.0, 45.0, 22.0 ],
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
					"patching_rect" : [ 1367.0, 473.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 1367.0, 437.0, 48.0, 22.0 ],
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
					"patching_rect" : [ 1500.0, 666.0, 54.0, 22.0 ],
					"text" : "*~ 0.707"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 1494.0, 809.0, 45.0, 45.0 ]
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
					"patching_rect" : [ 1500.0, 701.0, 50.0, 75.0 ],
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
					"patching_rect" : [ 1500.0, 538.0, 70.0, 22.0 ],
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
					"patching_rect" : [ 1500.0, 577.0, 24.0, 24.0 ],
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
					"patching_rect" : [ 1500.0, 623.0, 121.0, 22.0 ],
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
					"patching_rect" : [ 1602.0, 583.0, 101.0, 22.0 ],
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
					"patching_rect" : [ 1602.0, 538.0, 73.0, 22.0 ],
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
					"patching_rect" : [ 1531.0, 578.0, 52.0, 22.0 ],
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
					"patching_rect" : [ 1684.0, 538.0, 45.0, 22.0 ],
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
					"patching_rect" : [ 1614.0, 464.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 1614.0, 428.0, 48.0, 22.0 ],
					"text" : "change"
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
					"midpoints" : [ 1461.5, 467.5, 1638.5, 467.5, 1638.5, 217.5, 1536.5, 217.5 ],
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
					"destination" : [ "obj-16", 0 ],
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
					"destination" : [ "obj-5", 1 ],
					"order" : 0,
					"source" : [ "obj-127", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 1 ],
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
					"destination" : [ "obj-2", 2 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-13", 1 ]
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
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-16", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-16", 1 ]
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
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-18", 0 ]
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
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
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
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 1 ],
					"source" : [ "obj-26", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
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
					"destination" : [ "obj-3", 1 ],
					"source" : [ "obj-28", 0 ]
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
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-4", 0 ]
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
					"destination" : [ "obj-13", 0 ],
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
			"obj-1::obj-72" : [ "live.text[231]", "live.text", 0 ],
			"obj-1::obj-7::obj-1" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-1::obj-7::obj-13" : [ "live.text[52]", "live.text[36]", 0 ],
			"obj-1::obj-7::obj-14" : [ "live.text[53]", "live.text[36]", 0 ],
			"obj-1::obj-7::obj-15" : [ "live.text[60]", "live.text[36]", 0 ],
			"obj-1::obj-7::obj-32" : [ "live.text[57]", "live.text[36]", 0 ],
			"obj-1::obj-7::obj-33" : [ "live.text[61]", "live.text[36]", 0 ],
			"obj-1::obj-7::obj-34" : [ "live.text[47]", "live.text[36]", 0 ],
			"obj-1::obj-7::obj-42" : [ "live.text[44]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-44" : [ "live.text[62]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-46" : [ "live.text[54]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-5" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-1::obj-7::obj-52" : [ "live.text[48]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-55" : [ "live.text[43]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-57" : [ "live.text[59]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-61" : [ "live.text[56]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-62" : [ "live.text[50]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-63" : [ "live.text[45]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-64" : [ "live.text[63]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-65" : [ "live.text[55]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-69" : [ "live.text[49]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-70" : [ "live.text[58]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-71" : [ "live.text[51]", "live.text[15]", 0 ],
			"obj-1::obj-7::obj-72" : [ "live.text[46]", "live.text[15]", 0 ],
			"obj-1::obj-82" : [ "live.text[232]", "live.text", 0 ],
			"obj-1::obj-83" : [ "live.numbox[92]", "live.numbox", 0 ],
			"obj-1::obj-8::obj-13" : [ "live.text[172]", "live.text[36]", 0 ],
			"obj-1::obj-8::obj-14" : [ "live.text[179]", "live.text[36]", 0 ],
			"obj-1::obj-8::obj-15" : [ "live.text[188]", "live.text[36]", 0 ],
			"obj-1::obj-8::obj-32" : [ "live.text[173]", "live.text[36]", 0 ],
			"obj-1::obj-8::obj-33" : [ "live.text[184]", "live.text[36]", 0 ],
			"obj-1::obj-8::obj-34" : [ "live.text[168]", "live.text[36]", 0 ],
			"obj-1::obj-8::obj-45" : [ "live.text[175]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-57" : [ "live.text[174]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-59" : [ "live.text[180]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-61" : [ "live.text[182]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-63" : [ "live.text[183]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-64" : [ "live.numbox[22]", "live.numbox", 0 ],
			"obj-1::obj-8::obj-65" : [ "live.text[170]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-66" : [ "live.text[181]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-67" : [ "live.text[185]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-68" : [ "live.text[186]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-69" : [ "live.text[176]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-70" : [ "live.text[169]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-71" : [ "live.text[187]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-72" : [ "live.text[178]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-74" : [ "live.text[171]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-75" : [ "live.text[177]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-95" : [ "live.menu[14]", "live.menu", 0 ],
			"obj-20" : [ "live.numbox", "live.numbox", 0 ],
			"obj-27::obj-2" : [ "live.menu[8]", "live.menu", 0 ],
			"obj-27::obj-28" : [ "live.menu[18]", "live.menu", 0 ],
			"obj-27::obj-29" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-27::obj-32::obj-1" : [ "live.numbox[9]", "live.numbox", 0 ],
			"obj-27::obj-32::obj-13" : [ "live.text[210]", "live.text[36]", 0 ],
			"obj-27::obj-32::obj-14" : [ "live.text[220]", "live.text[36]", 0 ],
			"obj-27::obj-32::obj-15" : [ "live.text[222]", "live.text[36]", 0 ],
			"obj-27::obj-32::obj-32" : [ "live.text[223]", "live.text[36]", 0 ],
			"obj-27::obj-32::obj-33" : [ "live.text[211]", "live.text[36]", 0 ],
			"obj-27::obj-32::obj-34" : [ "live.text[221]", "live.text[36]", 0 ],
			"obj-27::obj-32::obj-42" : [ "live.text[166]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-44" : [ "live.text[164]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-46" : [ "live.text[213]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-5" : [ "live.menu[16]", "live.menu", 0 ],
			"obj-27::obj-32::obj-52" : [ "live.text[208]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-55" : [ "live.text[215]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-57" : [ "live.text[217]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-61" : [ "live.text[167]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-62" : [ "live.text[218]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-63" : [ "live.text[212]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-64" : [ "live.text[165]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-65" : [ "live.text[214]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-69" : [ "live.text[216]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-70" : [ "live.text[207]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-71" : [ "live.text[219]", "live.text[15]", 0 ],
			"obj-27::obj-32::obj-72" : [ "live.text[209]", "live.text[15]", 0 ],
			"obj-27::obj-41" : [ "live.text[270]", "live.text[15]", 0 ],
			"obj-27::obj-43" : [ "live.text[275]", "live.text[15]", 0 ],
			"obj-27::obj-44" : [ "live.text[269]", "live.text[15]", 0 ],
			"obj-27::obj-45" : [ "live.text[271]", "live.text[15]", 0 ],
			"obj-27::obj-46" : [ "live.text[283]", "live.text[15]", 0 ],
			"obj-27::obj-47" : [ "live.text[279]", "live.text[15]", 0 ],
			"obj-27::obj-48" : [ "live.text[285]", "live.text[15]", 0 ],
			"obj-27::obj-50" : [ "live.text[280]", "live.text[15]", 0 ],
			"obj-27::obj-51" : [ "live.text[277]", "live.text[15]", 0 ],
			"obj-27::obj-52" : [ "live.text[276]", "live.text[15]", 0 ],
			"obj-27::obj-53" : [ "live.text[281]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-1" : [ "live.numbox[11]", "live.numbox", 0 ],
			"obj-27::obj-5::obj-13" : [ "live.text[253]", "live.text[36]", 0 ],
			"obj-27::obj-5::obj-14" : [ "live.text[259]", "live.text[36]", 0 ],
			"obj-27::obj-5::obj-15" : [ "live.text[267]", "live.text[36]", 0 ],
			"obj-27::obj-5::obj-32" : [ "live.text[254]", "live.text[36]", 0 ],
			"obj-27::obj-5::obj-33" : [ "live.text[261]", "live.text[36]", 0 ],
			"obj-27::obj-5::obj-34" : [ "live.text[248]", "live.text[36]", 0 ],
			"obj-27::obj-5::obj-42" : [ "live.text[263]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-44" : [ "live.text[250]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-46" : [ "live.text[266]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-5" : [ "live.menu[17]", "live.menu", 0 ],
			"obj-27::obj-5::obj-52" : [ "live.text[258]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-55" : [ "live.text[252]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-57" : [ "live.text[256]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-61" : [ "live.text[268]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-62" : [ "live.text[260]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-63" : [ "live.text[264]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-64" : [ "live.text[257]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-65" : [ "live.text[251]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-69" : [ "live.text[262]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-70" : [ "live.text[255]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-71" : [ "live.text[249]", "live.text[15]", 0 ],
			"obj-27::obj-5::obj-72" : [ "live.text[265]", "live.text[15]", 0 ],
			"obj-27::obj-61" : [ "live.text[284]", "live.text[15]", 0 ],
			"obj-27::obj-63" : [ "live.text[273]", "live.text[15]", 0 ],
			"obj-27::obj-69" : [ "live.text[274]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-1" : [ "live.numbox[10]", "live.numbox", 0 ],
			"obj-27::obj-6::obj-13" : [ "live.text[233]", "live.text[36]", 0 ],
			"obj-27::obj-6::obj-14" : [ "live.text[242]", "live.text[36]", 0 ],
			"obj-27::obj-6::obj-15" : [ "live.text[226]", "live.text[36]", 0 ],
			"obj-27::obj-6::obj-32" : [ "live.text[246]", "live.text[36]", 0 ],
			"obj-27::obj-6::obj-33" : [ "live.text[235]", "live.text[36]", 0 ],
			"obj-27::obj-6::obj-34" : [ "live.text[244]", "live.text[36]", 0 ],
			"obj-27::obj-6::obj-42" : [ "live.text[224]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-44" : [ "live.text[227]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-46" : [ "live.text[243]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-5" : [ "live.menu[12]", "live.menu", 0 ],
			"obj-27::obj-6::obj-52" : [ "live.text[234]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-55" : [ "live.text[245]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-57" : [ "live.text[240]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-61" : [ "live.text[236]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-62" : [ "live.text[228]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-63" : [ "live.text[237]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-64" : [ "live.text[229]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-65" : [ "live.text[238]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-69" : [ "live.text[247]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-70" : [ "live.text[239]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-71" : [ "live.text[225]", "live.text[15]", 0 ],
			"obj-27::obj-6::obj-72" : [ "live.text[241]", "live.text[15]", 0 ],
			"obj-27::obj-70" : [ "live.text[230]", "live.text[15]", 0 ],
			"obj-27::obj-72" : [ "live.text[278]", "live.text", 0 ],
			"obj-27::obj-8" : [ "live.text[282]", "live.text[36]", 0 ],
			"obj-27::obj-82" : [ "live.text[272]", "live.text", 0 ],
			"obj-27::obj-83" : [ "live.numbox[12]", "live.numbox", 0 ],
			"obj-28::obj-16::obj-1" : [ "live.numbox[14]", "live.numbox", 0 ],
			"obj-28::obj-16::obj-13" : [ "live.text[311]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-14" : [ "live.text[317]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-15" : [ "live.text[324]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-32" : [ "live.text[312]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-33" : [ "live.text[319]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-34" : [ "live.text[327]", "live.text[36]", 0 ],
			"obj-28::obj-16::obj-42" : [ "live.text[320]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-44" : [ "live.text[307]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-46" : [ "live.text[322]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-5" : [ "live.menu[20]", "live.menu", 0 ],
			"obj-28::obj-16::obj-52" : [ "live.text[315]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-55" : [ "live.text[310]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-57" : [ "live.text[313]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-61" : [ "live.text[325]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-62" : [ "live.text[318]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-63" : [ "live.text[326]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-64" : [ "live.text[308]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-65" : [ "live.text[321]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-69" : [ "live.text[314]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-70" : [ "live.text[309]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-71" : [ "live.text[323]", "live.text[15]", 0 ],
			"obj-28::obj-16::obj-72" : [ "live.text[316]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-1" : [ "live.numbox[13]", "live.numbox", 0 ],
			"obj-28::obj-1::obj-13" : [ "live.text[291]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-14" : [ "live.text[286]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-15" : [ "live.text[297]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-32" : [ "live.text[296]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-33" : [ "live.text[306]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-34" : [ "live.text[303]", "live.text[36]", 0 ],
			"obj-28::obj-1::obj-42" : [ "live.text[299]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-44" : [ "live.text[301]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-46" : [ "live.text[292]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-5" : [ "live.menu[19]", "live.menu", 0 ],
			"obj-28::obj-1::obj-52" : [ "live.text[304]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-55" : [ "live.text[294]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-57" : [ "live.text[289]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-61" : [ "live.text[287]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-62" : [ "live.text[300]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-63" : [ "live.text[290]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-64" : [ "live.text[302]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-65" : [ "live.text[293]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-69" : [ "live.text[305]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-70" : [ "live.text[295]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-71" : [ "live.text[298]", "live.text[15]", 0 ],
			"obj-28::obj-1::obj-72" : [ "live.text[288]", "live.text[15]", 0 ],
			"obj-28::obj-24" : [ "live.menu[21]", "live.menu", 0 ],
			"obj-28::obj-30" : [ "live.text[328]", "live.text[36]", 0 ],
			"obj-28::obj-32" : [ "live.text[330]", "live.text[36]", 0 ],
			"obj-28::obj-33" : [ "live.text[329]", "live.text[36]", 0 ],
			"obj-28::obj-34" : [ "live.text[332]", "live.text[36]", 0 ],
			"obj-28::obj-36" : [ "live.text[331]", "live.text[36]", 0 ],
			"obj-2::obj-2" : [ "live.menu[46]", "live.menu", 0 ],
			"obj-2::obj-28" : [ "live.menu[9]", "live.menu", 0 ],
			"obj-2::obj-29" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-2::obj-32::obj-1" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-2::obj-32::obj-13" : [ "live.text[3]", "live.text[36]", 0 ],
			"obj-2::obj-32::obj-14" : [ "live.text[12]", "live.text[36]", 0 ],
			"obj-2::obj-32::obj-15" : [ "live.text[4]", "live.text[36]", 0 ],
			"obj-2::obj-32::obj-32" : [ "live.text[15]", "live.text[36]", 0 ],
			"obj-2::obj-32::obj-33" : [ "live.text[5]", "live.text[36]", 0 ],
			"obj-2::obj-32::obj-34" : [ "live.text[13]", "live.text[36]", 0 ],
			"obj-2::obj-32::obj-42" : [ "live.text[16]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-44" : [ "live.text[17]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-46" : [ "live.text[14]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-5" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-2::obj-32::obj-52" : [ "live.text[6]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-55" : [ "live.text[18]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-57" : [ "live.text[7]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-61" : [ "live.text[8]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-62" : [ "live.text[20]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-63" : [ "live.text[19]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-64" : [ "live.text[9]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-65" : [ "live.text[1]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-69" : [ "live.text[11]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-70" : [ "live.text[21]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-71" : [ "live.text[10]", "live.text[15]", 0 ],
			"obj-2::obj-32::obj-72" : [ "live.text[2]", "live.text[15]", 0 ],
			"obj-2::obj-41" : [ "live.text[105]", "live.text[15]", 0 ],
			"obj-2::obj-43" : [ "live.text[99]", "live.text[15]", 0 ],
			"obj-2::obj-44" : [ "live.text[104]", "live.text[15]", 0 ],
			"obj-2::obj-45" : [ "live.text[106]", "live.text[15]", 0 ],
			"obj-2::obj-46" : [ "live.text[101]", "live.text[15]", 0 ],
			"obj-2::obj-47" : [ "live.text[107]", "live.text[15]", 0 ],
			"obj-2::obj-48" : [ "live.text[100]", "live.text[15]", 0 ],
			"obj-2::obj-50" : [ "live.text[189]", "live.text[15]", 0 ],
			"obj-2::obj-51" : [ "live.text[192]", "live.text[15]", 0 ],
			"obj-2::obj-52" : [ "live.text[109]", "live.text[15]", 0 ],
			"obj-2::obj-53" : [ "live.text[193]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-1" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-2::obj-5::obj-13" : [ "live.text[86]", "live.text[36]", 0 ],
			"obj-2::obj-5::obj-14" : [ "live.text[91]", "live.text[36]", 0 ],
			"obj-2::obj-5::obj-15" : [ "live.text[80]", "live.text[36]", 0 ],
			"obj-2::obj-5::obj-32" : [ "live.text[89]", "live.text[36]", 0 ],
			"obj-2::obj-5::obj-33" : [ "live.text[95]", "live.text[36]", 0 ],
			"obj-2::obj-5::obj-34" : [ "live.text[79]", "live.text[36]", 0 ],
			"obj-2::obj-5::obj-42" : [ "live.text[93]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-44" : [ "live.text[92]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-46" : [ "live.text[83]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-5" : [ "live.menu[5]", "live.menu", 0 ],
			"obj-2::obj-5::obj-52" : [ "live.text[77]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-55" : [ "live.text[78]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-57" : [ "live.text[87]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-61" : [ "live.text[94]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-62" : [ "live.text[81]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-63" : [ "live.text[85]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-64" : [ "live.text[96]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-65" : [ "live.text[88]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-69" : [ "live.text[82]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-70" : [ "live.text[97]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-71" : [ "live.text[90]", "live.text[15]", 0 ],
			"obj-2::obj-5::obj-72" : [ "live.text[84]", "live.text[15]", 0 ],
			"obj-2::obj-61" : [ "live.text[102]", "live.text[15]", 0 ],
			"obj-2::obj-63" : [ "live.text[103]", "live.text[15]", 0 ],
			"obj-2::obj-69" : [ "live.text[190]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-1" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-2::obj-6::obj-13" : [ "live.text[70]", "live.text[36]", 0 ],
			"obj-2::obj-6::obj-14" : [ "live.text[24]", "live.text[36]", 0 ],
			"obj-2::obj-6::obj-15" : [ "live.text[68]", "live.text[36]", 0 ],
			"obj-2::obj-6::obj-32" : [ "live.text[28]", "live.text[36]", 0 ],
			"obj-2::obj-6::obj-33" : [ "live.text[72]", "live.text[36]", 0 ],
			"obj-2::obj-6::obj-34" : [ "live.text[26]", "live.text[36]", 0 ],
			"obj-2::obj-6::obj-42" : [ "live.text[66]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-44" : [ "live.text[69]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-46" : [ "live.text[25]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-5" : [ "live.menu[4]", "live.menu", 0 ],
			"obj-2::obj-6::obj-52" : [ "live.text[71]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-55" : [ "live.text[27]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-57" : [ "live.text[22]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-61" : [ "live.text[73]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-62" : [ "live.text[29]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-63" : [ "live.text[74]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-64" : [ "live.text[64]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-65" : [ "live.text[75]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-69" : [ "live.text[65]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-70" : [ "live.text[76]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-71" : [ "live.text[67]", "live.text[15]", 0 ],
			"obj-2::obj-6::obj-72" : [ "live.text[23]", "live.text[15]", 0 ],
			"obj-2::obj-70" : [ "live.text[191]", "live.text[15]", 0 ],
			"obj-2::obj-72" : [ "live.text[98]", "live.text", 0 ],
			"obj-2::obj-8" : [ "live.text[110]", "live.text[36]", 0 ],
			"obj-2::obj-82" : [ "live.text[108]", "live.text", 0 ],
			"obj-2::obj-83" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-3::obj-31::obj-1" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-3::obj-31::obj-13" : [ "live.text[130]", "live.text[36]", 0 ],
			"obj-3::obj-31::obj-14" : [ "live.text[117]", "live.text[36]", 0 ],
			"obj-3::obj-31::obj-15" : [ "live.text[128]", "live.text[36]", 0 ],
			"obj-3::obj-31::obj-32" : [ "live.text[121]", "live.text[36]", 0 ],
			"obj-3::obj-31::obj-33" : [ "live.text[111]", "live.text[36]", 0 ],
			"obj-3::obj-31::obj-34" : [ "live.text[119]", "live.text[36]", 0 ],
			"obj-3::obj-31::obj-42" : [ "live.text[127]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-44" : [ "live.text[129]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-46" : [ "live.text[118]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-5" : [ "live.menu[6]", "live.menu", 0 ],
			"obj-3::obj-31::obj-52" : [ "live.text[131]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-55" : [ "live.text[120]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-57" : [ "live.text[116]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-61" : [ "live.text[112]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-62" : [ "live.text[122]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-63" : [ "live.text[123]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-64" : [ "live.text[113]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-65" : [ "live.text[124]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-69" : [ "live.text[114]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-70" : [ "live.text[125]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-71" : [ "live.text[115]", "live.text[15]", 0 ],
			"obj-3::obj-31::obj-72" : [ "live.text[126]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-1" : [ "live.numbox[7]", "live.numbox", 0 ],
			"obj-3::obj-32::obj-13" : [ "live.text[132]", "live.text[36]", 0 ],
			"obj-3::obj-32::obj-14" : [ "live.text[137]", "live.text[36]", 0 ],
			"obj-3::obj-32::obj-15" : [ "live.text[145]", "live.text[36]", 0 ],
			"obj-3::obj-32::obj-32" : [ "live.text[148]", "live.text[36]", 0 ],
			"obj-3::obj-32::obj-33" : [ "live.text[139]", "live.text[36]", 0 ],
			"obj-3::obj-32::obj-34" : [ "live.text[147]", "live.text[36]", 0 ],
			"obj-3::obj-32::obj-42" : [ "live.text[134]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-44" : [ "live.text[142]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-46" : [ "live.text[140]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-5" : [ "live.menu[47]", "live.menu", 0 ],
			"obj-3::obj-32::obj-52" : [ "live.text[141]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-55" : [ "live.text[150]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-57" : [ "live.text[149]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-61" : [ "live.text[143]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-62" : [ "live.text[135]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-63" : [ "live.text[151]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-64" : [ "live.text[146]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-65" : [ "live.text[138]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-69" : [ "live.text[133]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-70" : [ "live.text[144]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-71" : [ "live.text[136]", "live.text[15]", 0 ],
			"obj-3::obj-32::obj-72" : [ "live.text[152]", "live.text[15]", 0 ],
			"obj-3::obj-72" : [ "live.text[194]", "live.text", 0 ],
			"obj-3::obj-8" : [ "live.text[195]", "live.text", 0 ],
			"obj-3::obj-82" : [ "live.text[196]", "live.text", 0 ],
			"obj-3::obj-83" : [ "live.numbox[36]", "live.numbox", 0 ],
			"obj-4" : [ "live.numbox[20]", "live.numbox[7]", 0 ],
			"obj-66" : [ "live.toggle[3]", "live.toggle", 0 ],
			"obj-73" : [ "live.gain~[2]", "live.gain~", 0 ],
			"obj-7::obj-13" : [ "live.text[156]", "live.text[36]", 0 ],
			"obj-7::obj-14" : [ "live.text[161]", "live.text[36]", 0 ],
			"obj-7::obj-15" : [ "live.text[199]", "live.text[36]", 0 ],
			"obj-7::obj-32" : [ "live.text[205]", "live.text[36]", 0 ],
			"obj-7::obj-33" : [ "live.text[162]", "live.text[36]", 0 ],
			"obj-7::obj-34" : [ "live.text[201]", "live.text[36]", 0 ],
			"obj-7::obj-45" : [ "live.text[204]", "live.text[15]", 0 ],
			"obj-7::obj-57" : [ "live.text[203]", "live.text[15]", 0 ],
			"obj-7::obj-59" : [ "live.text[197]", "live.text[15]", 0 ],
			"obj-7::obj-61" : [ "live.text[159]", "live.text[15]", 0 ],
			"obj-7::obj-63" : [ "live.text[154]", "live.text[15]", 0 ],
			"obj-7::obj-64" : [ "live.numbox[8]", "live.numbox", 0 ],
			"obj-7::obj-65" : [ "live.text[206]", "live.text[15]", 0 ],
			"obj-7::obj-66" : [ "live.text[157]", "live.text[15]", 0 ],
			"obj-7::obj-67" : [ "live.text[202]", "live.text[15]", 0 ],
			"obj-7::obj-68" : [ "live.text[163]", "live.text[15]", 0 ],
			"obj-7::obj-69" : [ "live.text[158]", "live.text[15]", 0 ],
			"obj-7::obj-70" : [ "live.text[153]", "live.text[15]", 0 ],
			"obj-7::obj-71" : [ "live.text[198]", "live.text[15]", 0 ],
			"obj-7::obj-72" : [ "live.text[160]", "live.text[15]", 0 ],
			"obj-7::obj-74" : [ "live.text[155]", "live.text[15]", 0 ],
			"obj-7::obj-75" : [ "live.text[200]", "live.text[15]", 0 ],
			"obj-7::obj-95" : [ "live.menu[15]", "live.menu", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"parameter_overrides" : 			{
				"obj-1::obj-8::obj-13" : 				{
					"parameter_longname" : "live.text[172]"
				}
,
				"obj-1::obj-8::obj-14" : 				{
					"parameter_longname" : "live.text[179]"
				}
,
				"obj-1::obj-8::obj-15" : 				{
					"parameter_longname" : "live.text[188]"
				}
,
				"obj-1::obj-8::obj-32" : 				{
					"parameter_longname" : "live.text[173]"
				}
,
				"obj-1::obj-8::obj-33" : 				{
					"parameter_longname" : "live.text[184]"
				}
,
				"obj-1::obj-8::obj-34" : 				{
					"parameter_longname" : "live.text[168]"
				}
,
				"obj-1::obj-8::obj-45" : 				{
					"parameter_longname" : "live.text[175]"
				}
,
				"obj-1::obj-8::obj-57" : 				{
					"parameter_longname" : "live.text[174]"
				}
,
				"obj-1::obj-8::obj-59" : 				{
					"parameter_longname" : "live.text[180]"
				}
,
				"obj-1::obj-8::obj-61" : 				{
					"parameter_longname" : "live.text[182]"
				}
,
				"obj-1::obj-8::obj-63" : 				{
					"parameter_longname" : "live.text[183]"
				}
,
				"obj-1::obj-8::obj-64" : 				{
					"parameter_longname" : "live.numbox[22]"
				}
,
				"obj-1::obj-8::obj-65" : 				{
					"parameter_longname" : "live.text[170]"
				}
,
				"obj-1::obj-8::obj-66" : 				{
					"parameter_longname" : "live.text[181]"
				}
,
				"obj-1::obj-8::obj-67" : 				{
					"parameter_longname" : "live.text[185]"
				}
,
				"obj-1::obj-8::obj-68" : 				{
					"parameter_longname" : "live.text[186]"
				}
,
				"obj-1::obj-8::obj-69" : 				{
					"parameter_longname" : "live.text[176]"
				}
,
				"obj-1::obj-8::obj-70" : 				{
					"parameter_longname" : "live.text[169]"
				}
,
				"obj-1::obj-8::obj-71" : 				{
					"parameter_longname" : "live.text[187]"
				}
,
				"obj-1::obj-8::obj-72" : 				{
					"parameter_longname" : "live.text[178]"
				}
,
				"obj-1::obj-8::obj-74" : 				{
					"parameter_longname" : "live.text[171]"
				}
,
				"obj-1::obj-8::obj-75" : 				{
					"parameter_longname" : "live.text[177]"
				}
,
				"obj-1::obj-8::obj-95" : 				{
					"parameter_longname" : "live.menu[14]"
				}
,
				"obj-27::obj-2" : 				{
					"parameter_longname" : "live.menu[8]"
				}
,
				"obj-27::obj-28" : 				{
					"parameter_longname" : "live.menu[18]"
				}
,
				"obj-27::obj-29" : 				{
					"parameter_longname" : "live.menu[7]"
				}
,
				"obj-27::obj-32::obj-1" : 				{
					"parameter_longname" : "live.numbox[9]"
				}
,
				"obj-27::obj-32::obj-13" : 				{
					"parameter_longname" : "live.text[210]"
				}
,
				"obj-27::obj-32::obj-14" : 				{
					"parameter_longname" : "live.text[220]"
				}
,
				"obj-27::obj-32::obj-15" : 				{
					"parameter_longname" : "live.text[222]"
				}
,
				"obj-27::obj-32::obj-32" : 				{
					"parameter_longname" : "live.text[223]"
				}
,
				"obj-27::obj-32::obj-33" : 				{
					"parameter_longname" : "live.text[211]"
				}
,
				"obj-27::obj-32::obj-34" : 				{
					"parameter_longname" : "live.text[221]"
				}
,
				"obj-27::obj-32::obj-42" : 				{
					"parameter_longname" : "live.text[166]"
				}
,
				"obj-27::obj-32::obj-44" : 				{
					"parameter_longname" : "live.text[164]"
				}
,
				"obj-27::obj-32::obj-46" : 				{
					"parameter_longname" : "live.text[213]"
				}
,
				"obj-27::obj-32::obj-5" : 				{
					"parameter_longname" : "live.menu[16]"
				}
,
				"obj-27::obj-32::obj-52" : 				{
					"parameter_longname" : "live.text[208]"
				}
,
				"obj-27::obj-32::obj-55" : 				{
					"parameter_longname" : "live.text[215]"
				}
,
				"obj-27::obj-32::obj-57" : 				{
					"parameter_longname" : "live.text[217]"
				}
,
				"obj-27::obj-32::obj-61" : 				{
					"parameter_longname" : "live.text[167]"
				}
,
				"obj-27::obj-32::obj-62" : 				{
					"parameter_longname" : "live.text[218]"
				}
,
				"obj-27::obj-32::obj-63" : 				{
					"parameter_longname" : "live.text[212]"
				}
,
				"obj-27::obj-32::obj-64" : 				{
					"parameter_longname" : "live.text[165]"
				}
,
				"obj-27::obj-32::obj-65" : 				{
					"parameter_longname" : "live.text[214]"
				}
,
				"obj-27::obj-32::obj-69" : 				{
					"parameter_longname" : "live.text[216]"
				}
,
				"obj-27::obj-32::obj-70" : 				{
					"parameter_longname" : "live.text[207]"
				}
,
				"obj-27::obj-32::obj-71" : 				{
					"parameter_longname" : "live.text[219]"
				}
,
				"obj-27::obj-32::obj-72" : 				{
					"parameter_longname" : "live.text[209]"
				}
,
				"obj-27::obj-41" : 				{
					"parameter_longname" : "live.text[270]"
				}
,
				"obj-27::obj-43" : 				{
					"parameter_longname" : "live.text[275]"
				}
,
				"obj-27::obj-44" : 				{
					"parameter_longname" : "live.text[269]"
				}
,
				"obj-27::obj-45" : 				{
					"parameter_longname" : "live.text[271]"
				}
,
				"obj-27::obj-46" : 				{
					"parameter_longname" : "live.text[283]"
				}
,
				"obj-27::obj-47" : 				{
					"parameter_longname" : "live.text[279]"
				}
,
				"obj-27::obj-48" : 				{
					"parameter_longname" : "live.text[285]"
				}
,
				"obj-27::obj-50" : 				{
					"parameter_longname" : "live.text[280]"
				}
,
				"obj-27::obj-51" : 				{
					"parameter_longname" : "live.text[277]"
				}
,
				"obj-27::obj-52" : 				{
					"parameter_longname" : "live.text[276]"
				}
,
				"obj-27::obj-53" : 				{
					"parameter_longname" : "live.text[281]"
				}
,
				"obj-27::obj-5::obj-1" : 				{
					"parameter_longname" : "live.numbox[11]"
				}
,
				"obj-27::obj-5::obj-13" : 				{
					"parameter_longname" : "live.text[253]"
				}
,
				"obj-27::obj-5::obj-14" : 				{
					"parameter_longname" : "live.text[259]"
				}
,
				"obj-27::obj-5::obj-15" : 				{
					"parameter_longname" : "live.text[267]"
				}
,
				"obj-27::obj-5::obj-32" : 				{
					"parameter_longname" : "live.text[254]"
				}
,
				"obj-27::obj-5::obj-33" : 				{
					"parameter_longname" : "live.text[261]"
				}
,
				"obj-27::obj-5::obj-34" : 				{
					"parameter_longname" : "live.text[248]"
				}
,
				"obj-27::obj-5::obj-42" : 				{
					"parameter_longname" : "live.text[263]"
				}
,
				"obj-27::obj-5::obj-44" : 				{
					"parameter_longname" : "live.text[250]"
				}
,
				"obj-27::obj-5::obj-46" : 				{
					"parameter_longname" : "live.text[266]"
				}
,
				"obj-27::obj-5::obj-5" : 				{
					"parameter_longname" : "live.menu[17]"
				}
,
				"obj-27::obj-5::obj-52" : 				{
					"parameter_longname" : "live.text[258]"
				}
,
				"obj-27::obj-5::obj-55" : 				{
					"parameter_longname" : "live.text[252]"
				}
,
				"obj-27::obj-5::obj-57" : 				{
					"parameter_longname" : "live.text[256]"
				}
,
				"obj-27::obj-5::obj-61" : 				{
					"parameter_longname" : "live.text[268]"
				}
,
				"obj-27::obj-5::obj-62" : 				{
					"parameter_longname" : "live.text[260]"
				}
,
				"obj-27::obj-5::obj-63" : 				{
					"parameter_longname" : "live.text[264]"
				}
,
				"obj-27::obj-5::obj-64" : 				{
					"parameter_longname" : "live.text[257]"
				}
,
				"obj-27::obj-5::obj-65" : 				{
					"parameter_longname" : "live.text[251]"
				}
,
				"obj-27::obj-5::obj-69" : 				{
					"parameter_longname" : "live.text[262]"
				}
,
				"obj-27::obj-5::obj-70" : 				{
					"parameter_longname" : "live.text[255]"
				}
,
				"obj-27::obj-5::obj-71" : 				{
					"parameter_longname" : "live.text[249]"
				}
,
				"obj-27::obj-5::obj-72" : 				{
					"parameter_longname" : "live.text[265]"
				}
,
				"obj-27::obj-61" : 				{
					"parameter_longname" : "live.text[284]"
				}
,
				"obj-27::obj-63" : 				{
					"parameter_longname" : "live.text[273]"
				}
,
				"obj-27::obj-69" : 				{
					"parameter_longname" : "live.text[274]"
				}
,
				"obj-27::obj-6::obj-1" : 				{
					"parameter_longname" : "live.numbox[10]"
				}
,
				"obj-27::obj-6::obj-13" : 				{
					"parameter_longname" : "live.text[233]"
				}
,
				"obj-27::obj-6::obj-14" : 				{
					"parameter_longname" : "live.text[242]"
				}
,
				"obj-27::obj-6::obj-15" : 				{
					"parameter_longname" : "live.text[226]"
				}
,
				"obj-27::obj-6::obj-32" : 				{
					"parameter_longname" : "live.text[246]"
				}
,
				"obj-27::obj-6::obj-33" : 				{
					"parameter_longname" : "live.text[235]"
				}
,
				"obj-27::obj-6::obj-34" : 				{
					"parameter_longname" : "live.text[244]"
				}
,
				"obj-27::obj-6::obj-42" : 				{
					"parameter_longname" : "live.text[224]"
				}
,
				"obj-27::obj-6::obj-44" : 				{
					"parameter_longname" : "live.text[227]"
				}
,
				"obj-27::obj-6::obj-46" : 				{
					"parameter_longname" : "live.text[243]"
				}
,
				"obj-27::obj-6::obj-5" : 				{
					"parameter_longname" : "live.menu[12]"
				}
,
				"obj-27::obj-6::obj-52" : 				{
					"parameter_longname" : "live.text[234]"
				}
,
				"obj-27::obj-6::obj-55" : 				{
					"parameter_longname" : "live.text[245]"
				}
,
				"obj-27::obj-6::obj-57" : 				{
					"parameter_longname" : "live.text[240]"
				}
,
				"obj-27::obj-6::obj-61" : 				{
					"parameter_longname" : "live.text[236]"
				}
,
				"obj-27::obj-6::obj-62" : 				{
					"parameter_longname" : "live.text[228]"
				}
,
				"obj-27::obj-6::obj-63" : 				{
					"parameter_longname" : "live.text[237]"
				}
,
				"obj-27::obj-6::obj-64" : 				{
					"parameter_longname" : "live.text[229]"
				}
,
				"obj-27::obj-6::obj-65" : 				{
					"parameter_longname" : "live.text[238]"
				}
,
				"obj-27::obj-6::obj-69" : 				{
					"parameter_longname" : "live.text[247]"
				}
,
				"obj-27::obj-6::obj-70" : 				{
					"parameter_longname" : "live.text[239]"
				}
,
				"obj-27::obj-6::obj-71" : 				{
					"parameter_longname" : "live.text[225]"
				}
,
				"obj-27::obj-6::obj-72" : 				{
					"parameter_longname" : "live.text[241]"
				}
,
				"obj-27::obj-70" : 				{
					"parameter_longname" : "live.text[230]"
				}
,
				"obj-27::obj-72" : 				{
					"parameter_longname" : "live.text[278]"
				}
,
				"obj-27::obj-8" : 				{
					"parameter_longname" : "live.text[282]"
				}
,
				"obj-27::obj-82" : 				{
					"parameter_longname" : "live.text[272]"
				}
,
				"obj-27::obj-83" : 				{
					"parameter_longname" : "live.numbox[12]"
				}
,
				"obj-28::obj-16::obj-1" : 				{
					"parameter_longname" : "live.numbox[14]"
				}
,
				"obj-28::obj-16::obj-13" : 				{
					"parameter_longname" : "live.text[311]"
				}
,
				"obj-28::obj-16::obj-14" : 				{
					"parameter_longname" : "live.text[317]"
				}
,
				"obj-28::obj-16::obj-15" : 				{
					"parameter_longname" : "live.text[324]"
				}
,
				"obj-28::obj-16::obj-32" : 				{
					"parameter_longname" : "live.text[312]"
				}
,
				"obj-28::obj-16::obj-33" : 				{
					"parameter_longname" : "live.text[319]"
				}
,
				"obj-28::obj-16::obj-34" : 				{
					"parameter_longname" : "live.text[327]"
				}
,
				"obj-28::obj-16::obj-42" : 				{
					"parameter_longname" : "live.text[320]"
				}
,
				"obj-28::obj-16::obj-44" : 				{
					"parameter_longname" : "live.text[307]"
				}
,
				"obj-28::obj-16::obj-46" : 				{
					"parameter_longname" : "live.text[322]"
				}
,
				"obj-28::obj-16::obj-5" : 				{
					"parameter_longname" : "live.menu[20]"
				}
,
				"obj-28::obj-16::obj-52" : 				{
					"parameter_longname" : "live.text[315]"
				}
,
				"obj-28::obj-16::obj-55" : 				{
					"parameter_longname" : "live.text[310]"
				}
,
				"obj-28::obj-16::obj-57" : 				{
					"parameter_longname" : "live.text[313]"
				}
,
				"obj-28::obj-16::obj-61" : 				{
					"parameter_longname" : "live.text[325]"
				}
,
				"obj-28::obj-16::obj-62" : 				{
					"parameter_longname" : "live.text[318]"
				}
,
				"obj-28::obj-16::obj-63" : 				{
					"parameter_longname" : "live.text[326]"
				}
,
				"obj-28::obj-16::obj-64" : 				{
					"parameter_longname" : "live.text[308]"
				}
,
				"obj-28::obj-16::obj-65" : 				{
					"parameter_longname" : "live.text[321]"
				}
,
				"obj-28::obj-16::obj-69" : 				{
					"parameter_longname" : "live.text[314]"
				}
,
				"obj-28::obj-16::obj-70" : 				{
					"parameter_longname" : "live.text[309]"
				}
,
				"obj-28::obj-16::obj-71" : 				{
					"parameter_longname" : "live.text[323]"
				}
,
				"obj-28::obj-16::obj-72" : 				{
					"parameter_longname" : "live.text[316]"
				}
,
				"obj-28::obj-1::obj-1" : 				{
					"parameter_longname" : "live.numbox[13]"
				}
,
				"obj-28::obj-1::obj-13" : 				{
					"parameter_longname" : "live.text[291]"
				}
,
				"obj-28::obj-1::obj-14" : 				{
					"parameter_longname" : "live.text[286]"
				}
,
				"obj-28::obj-1::obj-15" : 				{
					"parameter_longname" : "live.text[297]"
				}
,
				"obj-28::obj-1::obj-32" : 				{
					"parameter_longname" : "live.text[296]"
				}
,
				"obj-28::obj-1::obj-33" : 				{
					"parameter_longname" : "live.text[306]"
				}
,
				"obj-28::obj-1::obj-34" : 				{
					"parameter_longname" : "live.text[303]"
				}
,
				"obj-28::obj-1::obj-42" : 				{
					"parameter_longname" : "live.text[299]"
				}
,
				"obj-28::obj-1::obj-44" : 				{
					"parameter_longname" : "live.text[301]"
				}
,
				"obj-28::obj-1::obj-46" : 				{
					"parameter_longname" : "live.text[292]"
				}
,
				"obj-28::obj-1::obj-5" : 				{
					"parameter_longname" : "live.menu[19]"
				}
,
				"obj-28::obj-1::obj-52" : 				{
					"parameter_longname" : "live.text[304]"
				}
,
				"obj-28::obj-1::obj-55" : 				{
					"parameter_longname" : "live.text[294]"
				}
,
				"obj-28::obj-1::obj-57" : 				{
					"parameter_longname" : "live.text[289]"
				}
,
				"obj-28::obj-1::obj-61" : 				{
					"parameter_longname" : "live.text[287]"
				}
,
				"obj-28::obj-1::obj-62" : 				{
					"parameter_longname" : "live.text[300]"
				}
,
				"obj-28::obj-1::obj-63" : 				{
					"parameter_longname" : "live.text[290]"
				}
,
				"obj-28::obj-1::obj-64" : 				{
					"parameter_longname" : "live.text[302]"
				}
,
				"obj-28::obj-1::obj-65" : 				{
					"parameter_longname" : "live.text[293]"
				}
,
				"obj-28::obj-1::obj-69" : 				{
					"parameter_longname" : "live.text[305]"
				}
,
				"obj-28::obj-1::obj-70" : 				{
					"parameter_longname" : "live.text[295]"
				}
,
				"obj-28::obj-1::obj-71" : 				{
					"parameter_longname" : "live.text[298]"
				}
,
				"obj-28::obj-1::obj-72" : 				{
					"parameter_longname" : "live.text[288]"
				}
,
				"obj-28::obj-24" : 				{
					"parameter_longname" : "live.menu[21]"
				}
,
				"obj-28::obj-30" : 				{
					"parameter_longname" : "live.text[328]"
				}
,
				"obj-28::obj-32" : 				{
					"parameter_longname" : "live.text[330]"
				}
,
				"obj-28::obj-33" : 				{
					"parameter_longname" : "live.text[329]"
				}
,
				"obj-28::obj-34" : 				{
					"parameter_longname" : "live.text[332]"
				}
,
				"obj-28::obj-36" : 				{
					"parameter_longname" : "live.text[331]"
				}
,
				"obj-2::obj-2" : 				{
					"parameter_longname" : "live.menu[46]"
				}
,
				"obj-2::obj-28" : 				{
					"parameter_longname" : "live.menu[9]"
				}
,
				"obj-2::obj-29" : 				{
					"parameter_longname" : "live.menu[11]"
				}
,
				"obj-2::obj-32::obj-1" : 				{
					"parameter_longname" : "live.numbox[1]"
				}
,
				"obj-2::obj-32::obj-13" : 				{
					"parameter_longname" : "live.text[3]"
				}
,
				"obj-2::obj-32::obj-14" : 				{
					"parameter_longname" : "live.text[12]"
				}
,
				"obj-2::obj-32::obj-15" : 				{
					"parameter_longname" : "live.text[4]"
				}
,
				"obj-2::obj-32::obj-32" : 				{
					"parameter_longname" : "live.text[15]"
				}
,
				"obj-2::obj-32::obj-33" : 				{
					"parameter_longname" : "live.text[5]"
				}
,
				"obj-2::obj-32::obj-34" : 				{
					"parameter_longname" : "live.text[13]"
				}
,
				"obj-2::obj-32::obj-42" : 				{
					"parameter_longname" : "live.text[16]"
				}
,
				"obj-2::obj-32::obj-44" : 				{
					"parameter_longname" : "live.text[17]"
				}
,
				"obj-2::obj-32::obj-46" : 				{
					"parameter_longname" : "live.text[14]"
				}
,
				"obj-2::obj-32::obj-5" : 				{
					"parameter_longname" : "live.menu[1]"
				}
,
				"obj-2::obj-32::obj-52" : 				{
					"parameter_longname" : "live.text[6]"
				}
,
				"obj-2::obj-32::obj-55" : 				{
					"parameter_longname" : "live.text[18]"
				}
,
				"obj-2::obj-32::obj-57" : 				{
					"parameter_longname" : "live.text[7]"
				}
,
				"obj-2::obj-32::obj-61" : 				{
					"parameter_longname" : "live.text[8]"
				}
,
				"obj-2::obj-32::obj-62" : 				{
					"parameter_longname" : "live.text[20]"
				}
,
				"obj-2::obj-32::obj-63" : 				{
					"parameter_longname" : "live.text[19]"
				}
,
				"obj-2::obj-32::obj-64" : 				{
					"parameter_longname" : "live.text[9]"
				}
,
				"obj-2::obj-32::obj-65" : 				{
					"parameter_longname" : "live.text[1]"
				}
,
				"obj-2::obj-32::obj-69" : 				{
					"parameter_longname" : "live.text[11]"
				}
,
				"obj-2::obj-32::obj-70" : 				{
					"parameter_longname" : "live.text[21]"
				}
,
				"obj-2::obj-32::obj-71" : 				{
					"parameter_longname" : "live.text[10]"
				}
,
				"obj-2::obj-32::obj-72" : 				{
					"parameter_longname" : "live.text[2]"
				}
,
				"obj-2::obj-41" : 				{
					"parameter_longname" : "live.text[105]"
				}
,
				"obj-2::obj-43" : 				{
					"parameter_longname" : "live.text[99]"
				}
,
				"obj-2::obj-44" : 				{
					"parameter_longname" : "live.text[104]"
				}
,
				"obj-2::obj-45" : 				{
					"parameter_longname" : "live.text[106]"
				}
,
				"obj-2::obj-46" : 				{
					"parameter_longname" : "live.text[101]"
				}
,
				"obj-2::obj-47" : 				{
					"parameter_longname" : "live.text[107]"
				}
,
				"obj-2::obj-48" : 				{
					"parameter_longname" : "live.text[100]"
				}
,
				"obj-2::obj-50" : 				{
					"parameter_longname" : "live.text[189]"
				}
,
				"obj-2::obj-51" : 				{
					"parameter_longname" : "live.text[192]"
				}
,
				"obj-2::obj-52" : 				{
					"parameter_longname" : "live.text[109]"
				}
,
				"obj-2::obj-53" : 				{
					"parameter_longname" : "live.text[193]"
				}
,
				"obj-2::obj-5::obj-1" : 				{
					"parameter_longname" : "live.numbox[4]"
				}
,
				"obj-2::obj-5::obj-13" : 				{
					"parameter_longname" : "live.text[86]"
				}
,
				"obj-2::obj-5::obj-14" : 				{
					"parameter_longname" : "live.text[91]"
				}
,
				"obj-2::obj-5::obj-15" : 				{
					"parameter_longname" : "live.text[80]"
				}
,
				"obj-2::obj-5::obj-32" : 				{
					"parameter_longname" : "live.text[89]"
				}
,
				"obj-2::obj-5::obj-33" : 				{
					"parameter_longname" : "live.text[95]"
				}
,
				"obj-2::obj-5::obj-34" : 				{
					"parameter_longname" : "live.text[79]"
				}
,
				"obj-2::obj-5::obj-42" : 				{
					"parameter_longname" : "live.text[93]"
				}
,
				"obj-2::obj-5::obj-44" : 				{
					"parameter_longname" : "live.text[92]"
				}
,
				"obj-2::obj-5::obj-46" : 				{
					"parameter_longname" : "live.text[83]"
				}
,
				"obj-2::obj-5::obj-5" : 				{
					"parameter_longname" : "live.menu[5]"
				}
,
				"obj-2::obj-5::obj-52" : 				{
					"parameter_longname" : "live.text[77]"
				}
,
				"obj-2::obj-5::obj-55" : 				{
					"parameter_longname" : "live.text[78]"
				}
,
				"obj-2::obj-5::obj-57" : 				{
					"parameter_longname" : "live.text[87]"
				}
,
				"obj-2::obj-5::obj-61" : 				{
					"parameter_longname" : "live.text[94]"
				}
,
				"obj-2::obj-5::obj-62" : 				{
					"parameter_longname" : "live.text[81]"
				}
,
				"obj-2::obj-5::obj-63" : 				{
					"parameter_longname" : "live.text[85]"
				}
,
				"obj-2::obj-5::obj-64" : 				{
					"parameter_longname" : "live.text[96]"
				}
,
				"obj-2::obj-5::obj-65" : 				{
					"parameter_longname" : "live.text[88]"
				}
,
				"obj-2::obj-5::obj-69" : 				{
					"parameter_longname" : "live.text[82]"
				}
,
				"obj-2::obj-5::obj-70" : 				{
					"parameter_longname" : "live.text[97]"
				}
,
				"obj-2::obj-5::obj-71" : 				{
					"parameter_longname" : "live.text[90]"
				}
,
				"obj-2::obj-5::obj-72" : 				{
					"parameter_longname" : "live.text[84]"
				}
,
				"obj-2::obj-61" : 				{
					"parameter_longname" : "live.text[102]"
				}
,
				"obj-2::obj-63" : 				{
					"parameter_longname" : "live.text[103]"
				}
,
				"obj-2::obj-69" : 				{
					"parameter_longname" : "live.text[190]"
				}
,
				"obj-2::obj-6::obj-1" : 				{
					"parameter_longname" : "live.numbox[2]"
				}
,
				"obj-2::obj-6::obj-13" : 				{
					"parameter_longname" : "live.text[70]"
				}
,
				"obj-2::obj-6::obj-14" : 				{
					"parameter_longname" : "live.text[24]"
				}
,
				"obj-2::obj-6::obj-15" : 				{
					"parameter_longname" : "live.text[68]"
				}
,
				"obj-2::obj-6::obj-32" : 				{
					"parameter_longname" : "live.text[28]"
				}
,
				"obj-2::obj-6::obj-33" : 				{
					"parameter_longname" : "live.text[72]"
				}
,
				"obj-2::obj-6::obj-34" : 				{
					"parameter_longname" : "live.text[26]"
				}
,
				"obj-2::obj-6::obj-42" : 				{
					"parameter_longname" : "live.text[66]"
				}
,
				"obj-2::obj-6::obj-44" : 				{
					"parameter_longname" : "live.text[69]"
				}
,
				"obj-2::obj-6::obj-46" : 				{
					"parameter_longname" : "live.text[25]"
				}
,
				"obj-2::obj-6::obj-5" : 				{
					"parameter_longname" : "live.menu[4]"
				}
,
				"obj-2::obj-6::obj-52" : 				{
					"parameter_longname" : "live.text[71]"
				}
,
				"obj-2::obj-6::obj-55" : 				{
					"parameter_longname" : "live.text[27]"
				}
,
				"obj-2::obj-6::obj-57" : 				{
					"parameter_longname" : "live.text[22]"
				}
,
				"obj-2::obj-6::obj-61" : 				{
					"parameter_longname" : "live.text[73]"
				}
,
				"obj-2::obj-6::obj-62" : 				{
					"parameter_longname" : "live.text[29]"
				}
,
				"obj-2::obj-6::obj-63" : 				{
					"parameter_longname" : "live.text[74]"
				}
,
				"obj-2::obj-6::obj-64" : 				{
					"parameter_longname" : "live.text[64]"
				}
,
				"obj-2::obj-6::obj-65" : 				{
					"parameter_longname" : "live.text[75]"
				}
,
				"obj-2::obj-6::obj-69" : 				{
					"parameter_longname" : "live.text[65]"
				}
,
				"obj-2::obj-6::obj-70" : 				{
					"parameter_longname" : "live.text[76]"
				}
,
				"obj-2::obj-6::obj-71" : 				{
					"parameter_longname" : "live.text[67]"
				}
,
				"obj-2::obj-6::obj-72" : 				{
					"parameter_longname" : "live.text[23]"
				}
,
				"obj-2::obj-70" : 				{
					"parameter_longname" : "live.text[191]"
				}
,
				"obj-2::obj-72" : 				{
					"parameter_longname" : "live.text[98]"
				}
,
				"obj-2::obj-8" : 				{
					"parameter_longname" : "live.text[110]"
				}
,
				"obj-2::obj-82" : 				{
					"parameter_longname" : "live.text[108]"
				}
,
				"obj-2::obj-83" : 				{
					"parameter_longname" : "live.numbox[5]"
				}
,
				"obj-3::obj-31::obj-1" : 				{
					"parameter_longname" : "live.numbox[6]"
				}
,
				"obj-3::obj-31::obj-13" : 				{
					"parameter_longname" : "live.text[130]"
				}
,
				"obj-3::obj-31::obj-14" : 				{
					"parameter_longname" : "live.text[117]"
				}
,
				"obj-3::obj-31::obj-15" : 				{
					"parameter_longname" : "live.text[128]"
				}
,
				"obj-3::obj-31::obj-32" : 				{
					"parameter_longname" : "live.text[121]"
				}
,
				"obj-3::obj-31::obj-33" : 				{
					"parameter_longname" : "live.text[111]"
				}
,
				"obj-3::obj-31::obj-34" : 				{
					"parameter_longname" : "live.text[119]"
				}
,
				"obj-3::obj-31::obj-42" : 				{
					"parameter_longname" : "live.text[127]"
				}
,
				"obj-3::obj-31::obj-44" : 				{
					"parameter_longname" : "live.text[129]"
				}
,
				"obj-3::obj-31::obj-46" : 				{
					"parameter_longname" : "live.text[118]"
				}
,
				"obj-3::obj-31::obj-5" : 				{
					"parameter_longname" : "live.menu[6]"
				}
,
				"obj-3::obj-31::obj-52" : 				{
					"parameter_longname" : "live.text[131]"
				}
,
				"obj-3::obj-31::obj-55" : 				{
					"parameter_longname" : "live.text[120]"
				}
,
				"obj-3::obj-31::obj-57" : 				{
					"parameter_longname" : "live.text[116]"
				}
,
				"obj-3::obj-31::obj-61" : 				{
					"parameter_longname" : "live.text[112]"
				}
,
				"obj-3::obj-31::obj-62" : 				{
					"parameter_longname" : "live.text[122]"
				}
,
				"obj-3::obj-31::obj-63" : 				{
					"parameter_longname" : "live.text[123]"
				}
,
				"obj-3::obj-31::obj-64" : 				{
					"parameter_longname" : "live.text[113]"
				}
,
				"obj-3::obj-31::obj-65" : 				{
					"parameter_longname" : "live.text[124]"
				}
,
				"obj-3::obj-31::obj-69" : 				{
					"parameter_longname" : "live.text[114]"
				}
,
				"obj-3::obj-31::obj-70" : 				{
					"parameter_longname" : "live.text[125]"
				}
,
				"obj-3::obj-31::obj-71" : 				{
					"parameter_longname" : "live.text[115]"
				}
,
				"obj-3::obj-31::obj-72" : 				{
					"parameter_longname" : "live.text[126]"
				}
,
				"obj-3::obj-32::obj-1" : 				{
					"parameter_longname" : "live.numbox[7]"
				}
,
				"obj-3::obj-32::obj-13" : 				{
					"parameter_longname" : "live.text[132]"
				}
,
				"obj-3::obj-32::obj-14" : 				{
					"parameter_longname" : "live.text[137]"
				}
,
				"obj-3::obj-32::obj-15" : 				{
					"parameter_longname" : "live.text[145]"
				}
,
				"obj-3::obj-32::obj-32" : 				{
					"parameter_longname" : "live.text[148]"
				}
,
				"obj-3::obj-32::obj-33" : 				{
					"parameter_longname" : "live.text[139]"
				}
,
				"obj-3::obj-32::obj-34" : 				{
					"parameter_longname" : "live.text[147]"
				}
,
				"obj-3::obj-32::obj-42" : 				{
					"parameter_longname" : "live.text[134]"
				}
,
				"obj-3::obj-32::obj-44" : 				{
					"parameter_longname" : "live.text[142]"
				}
,
				"obj-3::obj-32::obj-46" : 				{
					"parameter_longname" : "live.text[140]"
				}
,
				"obj-3::obj-32::obj-5" : 				{
					"parameter_longname" : "live.menu[47]"
				}
,
				"obj-3::obj-32::obj-52" : 				{
					"parameter_longname" : "live.text[141]"
				}
,
				"obj-3::obj-32::obj-55" : 				{
					"parameter_longname" : "live.text[150]"
				}
,
				"obj-3::obj-32::obj-57" : 				{
					"parameter_longname" : "live.text[149]"
				}
,
				"obj-3::obj-32::obj-61" : 				{
					"parameter_longname" : "live.text[143]"
				}
,
				"obj-3::obj-32::obj-62" : 				{
					"parameter_longname" : "live.text[135]"
				}
,
				"obj-3::obj-32::obj-63" : 				{
					"parameter_longname" : "live.text[151]"
				}
,
				"obj-3::obj-32::obj-64" : 				{
					"parameter_longname" : "live.text[146]"
				}
,
				"obj-3::obj-32::obj-65" : 				{
					"parameter_longname" : "live.text[138]"
				}
,
				"obj-3::obj-32::obj-69" : 				{
					"parameter_longname" : "live.text[133]"
				}
,
				"obj-3::obj-32::obj-70" : 				{
					"parameter_longname" : "live.text[144]"
				}
,
				"obj-3::obj-32::obj-71" : 				{
					"parameter_longname" : "live.text[136]"
				}
,
				"obj-3::obj-32::obj-72" : 				{
					"parameter_longname" : "live.text[152]"
				}
,
				"obj-3::obj-72" : 				{
					"parameter_longname" : "live.text[194]"
				}
,
				"obj-3::obj-8" : 				{
					"parameter_longname" : "live.text[195]"
				}
,
				"obj-3::obj-82" : 				{
					"parameter_longname" : "live.text[196]"
				}
,
				"obj-7::obj-13" : 				{
					"parameter_longname" : "live.text[156]"
				}
,
				"obj-7::obj-14" : 				{
					"parameter_longname" : "live.text[161]"
				}
,
				"obj-7::obj-15" : 				{
					"parameter_longname" : "live.text[199]"
				}
,
				"obj-7::obj-32" : 				{
					"parameter_longname" : "live.text[205]"
				}
,
				"obj-7::obj-33" : 				{
					"parameter_longname" : "live.text[162]"
				}
,
				"obj-7::obj-34" : 				{
					"parameter_longname" : "live.text[201]"
				}
,
				"obj-7::obj-45" : 				{
					"parameter_longname" : "live.text[204]"
				}
,
				"obj-7::obj-57" : 				{
					"parameter_longname" : "live.text[203]"
				}
,
				"obj-7::obj-59" : 				{
					"parameter_longname" : "live.text[197]"
				}
,
				"obj-7::obj-61" : 				{
					"parameter_longname" : "live.text[159]"
				}
,
				"obj-7::obj-63" : 				{
					"parameter_longname" : "live.text[154]"
				}
,
				"obj-7::obj-64" : 				{
					"parameter_longname" : "live.numbox[8]"
				}
,
				"obj-7::obj-65" : 				{
					"parameter_longname" : "live.text[206]"
				}
,
				"obj-7::obj-66" : 				{
					"parameter_longname" : "live.text[157]"
				}
,
				"obj-7::obj-67" : 				{
					"parameter_longname" : "live.text[202]"
				}
,
				"obj-7::obj-68" : 				{
					"parameter_longname" : "live.text[163]"
				}
,
				"obj-7::obj-69" : 				{
					"parameter_longname" : "live.text[158]"
				}
,
				"obj-7::obj-70" : 				{
					"parameter_longname" : "live.text[153]"
				}
,
				"obj-7::obj-71" : 				{
					"parameter_longname" : "live.text[198]"
				}
,
				"obj-7::obj-72" : 				{
					"parameter_longname" : "live.text[160]"
				}
,
				"obj-7::obj-74" : 				{
					"parameter_longname" : "live.text[155]"
				}
,
				"obj-7::obj-75" : 				{
					"parameter_longname" : "live.text[200]"
				}
,
				"obj-7::obj-95" : 				{
					"parameter_longname" : "live.menu[15]"
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
				"name" : "ser.addmul.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers",
				"patcherrelativepath" : "../../../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.corpus.multislider.maxpat",
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
				"name" : "ser.phasepulse.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/ongoing",
				"patcherrelativepath" : "../../../patchers/ongoing",
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
