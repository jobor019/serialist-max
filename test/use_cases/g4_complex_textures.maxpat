{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 9,
			"minor" : 0,
			"revision" : 5,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 34.0, 87.0, 2512.0, 1256.0 ],
		"gridsize" : [ 15.0, 15.0 ],
		"subpatcher_template" : "serialist_test",
		"showontab" : 1,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 26.0, 2512.0, 1230.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 1044.000000029802322, 587.0, 45.0, 45.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 641.0, 146.0, 150.0, 20.0 ],
									"text" : "..."
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-27",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1003.0, 240.0, 50.0, 22.0 ],
									"text" : "active 0"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"hidden" : 1,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1003.0, 209.0, 257.0, 22.0 ],
									"text" : "r serialist.global.test.singular_transport_control"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 793.0, 140.0, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.1421581805, 0.6723723412, 0.2530546784, 1.0 ],
									"hidden" : 1,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1003.0, 176.0, 259.0, 22.0 ],
									"text" : "s serialist.global.test.singular_transport_control"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-18",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 845.0, 203.0, 50.0, 22.0 ],
									"text" : "active 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 752.0, 107.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 641.0, 109.0, 150.0, 20.0 ],
									"text" : "Activate transport:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 8.0, 48.0, 631.0, 20.0 ],
									"text" : "If needed, we can provide a longer description here to describe in detail what this requirement should do"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 24.0,
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 8.0, 10.0, 631.0, 33.0 ],
									"text" : "R1.1.1a. Title of Given Requirement"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
									"hidden" : 1,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 885.0, 242.0, 105.0, 22.0 ],
									"text" : "loadmess active 0"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-1",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.transport.ui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 9,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "", "", "signal" ],
									"patching_rect" : [ 885.0, 287.0, 178.000000029802322, 269.0 ],
									"varname" : "ser.transport.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"fontsize" : 10.0,
									"hint" : "",
									"id" : "obj-41",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 460.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 656.0, 415.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "12",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"fontsize" : 10.0,
									"hint" : "",
									"id" : "obj-40",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 434.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 656.0, 389.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "11",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"fontsize" : 10.0,
									"hint" : "",
									"id" : "obj-37",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 408.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 374.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "10",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-36",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 375.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 341.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "9",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-35",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 342.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 308.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "8",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-34",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 309.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 275.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "7",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-33",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 276.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 242.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "6",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-32",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 243.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 209.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "5",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-31",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 210.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 176.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "4",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-30",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 177.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 626.0, 161.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "3",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-12",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 109.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "1",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-29",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 611.0, 146.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 611.0, 146.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "2",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 1 ],
									"order" : 0,
									"source" : [ "obj-1", 8 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"order" : 1,
									"source" : [ "obj-1", 8 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"hidden" : 1,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"hidden" : 1,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"hidden" : 1,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"hidden" : 1,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"hidden" : 1,
									"source" : [ "obj-22", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"hidden" : 1,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"hidden" : 1,
									"source" : [ "obj-27", 0 ]
								}

							}
 ],
						"originid" : "pat-6"
					}
,
					"patching_rect" : [ 104.0, 21.0, 69.0, 22.0 ],
					"text" : "p R1.1.1a",
					"varname" : "R1.1.1a"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 34.0, 113.0, 2512.0, 1230.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-60",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 449.0, 467.0, 70.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 445.0, 495.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 328.0, 543.0, 127.0, 22.0 ],
									"text" : "ser.op + @triggers 0 1"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.4616160095, 1.0, 0.8905446529, 1.0 ],
									"bgcolor2" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
									"bgfillcolor_autogradient" : 0.0,
									"bgfillcolor_color" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
									"bgfillcolor_color1" : [ 0.4616160095, 1.0, 0.8905446529, 1.0 ],
									"bgfillcolor_color2" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
									"bgfillcolor_type" : "gradient",
									"gradient" : 1,
									"id" : "obj-17",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1989.0, 21.0, 347.0, 22.0 ],
									"text" : "HALion: omfg uses mod wheel for sustain instead of velocity. ffs"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-69",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1708.0, 794.0, 125.0, 22.0 ],
									"text" : "loadmess waveform 4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1478.0, 89.0, 307.0, 74.0 ],
									"text" : "- ser.multislider is horrible to work with (too short sliders \n- pattr issues (obviously)\n- critical bugs in sustain/pause\n- not having a convenient way to pass args to bpatcher objects is truly horrible (so much loadbanging)"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.4616160095, 1.0, 0.8905446529, 1.0 ],
									"bgcolor2" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
									"bgfillcolor_autogradient" : 0.0,
									"bgfillcolor_color" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
									"bgfillcolor_color1" : [ 0.4616160095, 1.0, 0.8905446529, 1.0 ],
									"bgfillcolor_color2" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
									"bgfillcolor_type" : "gradient",
									"gradient" : 1,
									"id" : "obj-52",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1478.0, 62.0, 249.0, 22.0 ],
									"text" : "A number of problems are shown here so far:"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.4616160095, 1.0, 0.8905446529, 1.0 ],
									"bgcolor2" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
									"bgfillcolor_autogradient" : 0.0,
									"bgfillcolor_color" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
									"bgfillcolor_color1" : [ 0.4616160095, 1.0, 0.8905446529, 1.0 ],
									"bgfillcolor_color2" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
									"bgfillcolor_type" : "gradient",
									"gradient" : 1,
									"id" : "obj-46",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1478.0, 21.0, 452.0, 22.0 ],
									"text" : "Note: this is just one layer of many. We can implement the other layers in other tabs"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1937.0, 175.0, 82.0, 82.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 995.25, 321.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 999.0, 345.0, 71.0, 22.0 ],
									"text" : "waveform 4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1332.0, 63.0, 45.0, 22.0 ],
									"text" : "3 5 4 7"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "bang" ],
									"patching_rect" : [ 1261.0, 33.0, 42.0, 22.0 ],
									"text" : "t b b b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1854.0, 269.0, 113.0, 22.0 ],
									"text" : "loadmess tempo 60"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 1351.0, 283.0, 29.5, 22.0 ],
									"text" : "int"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-192",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 2102.0, 805.0, 87.0, 22.0 ],
									"text" : "loadmess 0.96"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-191",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1870.0, 816.0, 80.0, 22.0 ],
									"text" : "loadmess 0.9"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-190",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1348.0, 199.0, 77.0, 22.0 ],
									"text" : "loadmess 16"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-187",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 1259.0, 4.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-185",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1164.0, 112.0, 50.0, 35.0 ],
									"text" : "3. 5. 4. 7."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-183",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 457.0, 90.0, 70.0, 22.0 ],
									"text" : "loadmess 7"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-181",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 499.0, 255.0, 50.0, 35.0 ],
									"text" : "34 52 65 75"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-180",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 484.0, 755.0, 51.0, 22.0 ],
									"text" : "zl.group"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-179",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "int" ],
									"patching_rect" : [ 465.0, 713.0, 44.0, 22.0 ],
									"text" : "uzi 1 1"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-176",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.slider.ui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 2137.0, 877.0, 60.0, 32.0 ],
									"varname" : "ser.slider.ui[5]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-174",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.slider.ui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 1854.0, 881.0, 60.0, 32.0 ],
									"varname" : "ser.slider.ui[4]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-173",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 598.0, 300.0, 47.0, 22.0 ],
									"text" : "size $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-171",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 571.0, 497.0, 50.0, 35.0 ],
									"text" : "34 46 56 64"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-165",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 374.0, 312.0, 127.0, 130.0 ],
									"setminmax" : [ 21.0, 108.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 4,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-163",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1022.0, 13.5, 105.0, 22.0 ],
									"text" : "range 2 16, type 1"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-161",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.core.multislider.maxpat",
									"numinlets" : 1,
									"numoutlets" : 4,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 1022.0, 52.5, 84.0, 43.0 ],
									"varname" : "ser.core.multislider[1]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-160",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 1022.0, 109.0, 37.0, 22.0 ],
									"text" : "zl.len"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-159",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 957.0, 287.0, 59.0, 22.0 ],
									"text" : "voices $1"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-146",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.stepper.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 1994.0, 877.0, 144.0, 128.0 ],
									"varname" : "ser.stepper.ui[2]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-144",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.stepper.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 1708.0, 881.0, 144.0, 128.0 ],
									"varname" : "ser.stepper.ui[1]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-143",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1708.0, 855.0, 47.0, 20.0 ],
									"text" : "sustain"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-142",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1998.0, 851.0, 47.0, 20.0 ],
									"text" : "pause"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-139",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 1994.0, 1024.0, 72.0, 22.0 ],
									"text" : "ser.op < 0.9"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-138",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 1708.0, 1028.0, 72.0, 22.0 ],
									"text" : "ser.op < 0.9"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-101",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1009.5, 862.0, 29.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-102",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 976.5, 862.0, 29.5, 22.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-99",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1009.5, 731.0, 29.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-97",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 976.5, 731.0, 29.5, 22.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-95",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 797.0, 904.0, 161.0, 22.0 ],
									"text" : "ser.pulsefilter @mode 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-94",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 797.0, 862.0, 161.0, 22.0 ],
									"text" : "ser.pulsefilter @mode 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-100",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 797.0, 952.0, 61.0, 22.0 ],
									"text" : "t l l l l l"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-93",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.0, 703.0, 160.0, 22.0 ],
									"text" : "loadmess device \"IAC IAC2\""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-86",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 757.0, 580.0, 52.0, 22.0 ],
									"text" : "ser.op +"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-85",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 835.0, 570.0, 69.0, 22.0 ],
									"text" : "ser.op * 0.1"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-84",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.oscillator.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 835.0, 359.0, 146.0, 161.0 ],
									"varname" : "ser.oscillator.ui[2]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-83",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 791.0, 68.0, 70.0, 22.0 ],
									"text" : "loadmess 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-82",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 884.0, 137.0, 113.0, 22.0 ],
									"text" : "ser.op / @triggers 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-78",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1414.0, 660.0, 77.0, 22.0 ],
									"text" : "loadmess 79"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 1078.0, 813.0, 49.0, 22.0 ],
									"text" : "ser.op *"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-76",
									"linecount" : 8,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1478.0, 421.0, 127.0, 116.0 ],
									"text" : "loadmess 1. 0.74359 0.692308 0.782051 0.897436 0.717949 0.820513 0.807692 0.897436 0.782051 0.820513 0.833333 0.923077 0.858974 0.897436 0.935897"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-70",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1373.0, 561.0, 131.0, 78.0 ],
									"setminmax" : [ 0.0, 1.0 ],
									"setstyle" : 1,
									"size" : 16,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-67",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1596.0, 534.0, 125.0, 22.0 ],
									"text" : "1. 0.92 0.95 0.93 0.98"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-65",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1461.0, 703.0, 79.0, 20.0 ],
									"text" : "Peak velocity"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "@range", 0, 127, "@type", 1 ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-58",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.slider.ui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 1390.0, 697.0, 60.0, 32.0 ],
									"varname" : "ser.slider.ui[2]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 1078.0, 337.0, 54.0, 22.0 ],
									"text" : "t l l"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "@range", 2, 16, "@type", 1 ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-54",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.slider.ui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 1352.0, 239.0, 60.0, 32.0 ],
									"varname" : "ser.slider.ui[1]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1352.0, 348.0, 29.5, 22.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 1352.0, 379.0, 51.0, 22.0 ],
									"text" : "zl.group"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "int" ],
									"patching_rect" : [ 1352.0, 321.0, 44.0, 22.0 ],
									"text" : "uzi 0 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 1078.0, 393.0, 84.0, 22.0 ],
									"text" : "ser.phasemap"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1218.0, 102.5, 75.0, 22.0 ],
									"text" : "periodtype 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 1218.0, 75.5, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-43",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.phasepulse.ui.maxpat",
									"numinlets" : 2,
									"numoutlets" : 7,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "" ],
									"patching_rect" : [ 1078.0, 447.0, 147.0, 108.0 ],
									"varname" : "ser.phasepulse.ui[1]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
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
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 1078.0, 162.5, 146.0, 161.0 ],
									"varname" : "ser.oscillator.ui[1]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"args" : [ "f" ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-38",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.interpolator.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 1078.0, 651.0, 154.0, 139.0 ],
									"varname" : "ser.interpolator.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1078.0, 131.5, 60.0, 20.0 ],
									"text" : "Velocities"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 457.0, 179.0, 29.5, 22.0 ],
									"text" : "* 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 245.0, 589.0, 50.0, 35.0 ],
									"text" : "6. 1. 7. 1."
								}

							}
, 							{
								"box" : 								{
									"args" : [ "@range", 2, 16, "@type", 1 ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-64",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.slider.ui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 457.0, 119.5, 60.0, 32.0 ],
									"varname" : "ser.slider.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-63",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 151.0, 447.0, 59.0, 22.0 ],
									"text" : "ser.op * 8"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-61",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 288.0, 250.0, 71.0, 22.0 ],
									"text" : "waveform 3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 288.0, 217.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-59",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.stepper.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 151.0, 305.0, 144.0, 128.0 ],
									"varname" : "ser.stepper.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 261.5, 457.0, 39.0, 22.0 ],
									"text" : "48 60"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-55",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 154.5, 515.0, 52.0, 22.0 ],
									"text" : "ser.op +"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-48",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.makenote.ui.maxpat",
									"numinlets" : 4,
									"numoutlets" : 2,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 126.0, 851.0, 375.0, 102.0 ],
									"varname" : "ser.makenote.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 757.0, 161.0, 60.0, 20.0 ],
									"text" : "Durations"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 149.0, 274.0, 35.0, 20.0 ],
									"text" : "Pitch"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-10",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.phasepulse.ui.maxpat",
									"numinlets" : 2,
									"numoutlets" : 7,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "" ],
									"patching_rect" : [ 757.0, 636.0, 147.0, 108.0 ],
									"varname" : "ser.phasepulse.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-8",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.oscillator.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 757.0, 192.0, 146.0, 161.0 ],
									"varname" : "ser.oscillator.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 2194.000000029802322, 606.0, 45.0, 45.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1791.0, 175.0, 144.0, 20.0 ],
									"text" : "Update parameters again"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-27",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 2153.0, 269.0, 50.0, 22.0 ],
									"text" : "active 0"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"hidden" : 1,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 2153.0, 238.0, 257.0, 22.0 ],
									"text" : "r serialist.global.test.singular_transport_control"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 1943.0, 169.0, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.1421581805, 0.6723723412, 0.2530546784, 1.0 ],
									"hidden" : 1,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 2153.0, 205.0, 259.0, 22.0 ],
									"text" : "s serialist.global.test.singular_transport_control"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-18",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1995.0, 232.0, 50.0, 22.0 ],
									"text" : "active 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1902.0, 136.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1791.0, 138.0, 150.0, 20.0 ],
									"text" : "Activate transport:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 8.0, 48.0, 631.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 24.0,
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 8.0, 10.0, 631.0, 33.0 ],
									"text" : "G4. Complex Textures"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
									"hidden" : 1,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 2035.0, 271.0, 105.0, 22.0 ],
									"text" : "loadmess active 0"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-1",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.transport.ui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 9,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "", "", "signal" ],
									"patching_rect" : [ 2035.0, 316.0, 178.000000029802322, 269.0 ],
									"varname" : "ser.transport.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"fontsize" : 10.0,
									"hint" : "",
									"id" : "obj-41",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 489.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 656.0, 415.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "12",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"fontsize" : 10.0,
									"hint" : "",
									"id" : "obj-40",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 463.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 656.0, 389.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "11",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"fontsize" : 10.0,
									"hint" : "",
									"id" : "obj-37",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 437.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 374.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "10",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-36",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 404.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 341.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "9",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-35",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 371.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 308.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "8",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-34",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 338.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 275.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "7",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-33",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 305.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 242.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "6",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-32",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 272.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 209.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "5",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-31",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 239.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 641.0, 176.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "4",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-30",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 206.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 626.0, 161.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "3",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-12",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 138.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "1",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-29",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1761.0, 175.0, 20.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 611.0, 146.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"saved_attribute_attributes" : 									{
										"bgcolor" : 										{
											"expression" : "themecolor.lesson_step_circle"
										}

									}
,
									"text" : "2",
									"textcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 1 ],
									"order" : 0,
									"source" : [ "obj-1", 8 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"order" : 1,
									"source" : [ "obj-1", 8 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 0 ],
									"order" : 1,
									"source" : [ "obj-10", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-146", 0 ],
									"order" : 0,
									"source" : [ "obj-10", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-94", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-100", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-100", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-95", 1 ],
									"source" : [ "obj-101", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-95", 1 ],
									"source" : [ "obj-102", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 1 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-94", 1 ],
									"source" : [ "obj-138", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-95", 1 ],
									"source" : [ "obj-139", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-138", 0 ],
									"source" : [ "obj-144", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-139", 0 ],
									"source" : [ "obj-146", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-163", 0 ],
									"source" : [ "obj-15", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-181", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"source" : [ "obj-15", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-84", 0 ],
									"source" : [ "obj-159", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"hidden" : 1,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-159", 0 ],
									"order" : 0,
									"source" : [ "obj-160", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-173", 0 ],
									"order" : 1,
									"source" : [ "obj-160", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-179", 0 ],
									"order" : 2,
									"source" : [ "obj-160", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-160", 0 ],
									"order" : 1,
									"source" : [ "obj-161", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-185", 1 ],
									"order" : 0,
									"source" : [ "obj-161", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-82", 1 ],
									"order" : 2,
									"source" : [ "obj-161", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-161", 0 ],
									"source" : [ "obj-163", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-171", 1 ],
									"order" : 0,
									"source" : [ "obj-165", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 0 ],
									"order" : 1,
									"source" : [ "obj-165", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-165", 0 ],
									"source" : [ "obj-173", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-138", 1 ],
									"source" : [ "obj-174", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-139", 1 ],
									"source" : [ "obj-176", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-180", 0 ],
									"source" : [ "obj-179", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-180", 0 ],
									"source" : [ "obj-179", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"hidden" : 1,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 3 ],
									"source" : [ "obj-180", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-165", 0 ],
									"source" : [ "obj-181", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-183", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-187", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-190", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-174", 0 ],
									"source" : [ "obj-191", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-176", 0 ],
									"source" : [ "obj-192", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"hidden" : 1,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-161", 0 ],
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"hidden" : 1,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"hidden" : 1,
									"source" : [ "obj-22", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"hidden" : 1,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-181", 0 ],
									"order" : 1,
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"order" : 0,
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-84", 0 ],
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"hidden" : 1,
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 1 ],
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"source" : [ "obj-50", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 1 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 1 ],
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 1 ],
									"source" : [ "obj-56", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 1 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 1 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-63", 0 ],
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"source" : [ "obj-60", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-61", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"order" : 1,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"order" : 0,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"order" : 0,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-63", 1 ],
									"order" : 1,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 0 ],
									"order" : 1,
									"source" : [ "obj-69", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-146", 0 ],
									"order" : 0,
									"source" : [ "obj-69", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 2 ],
									"source" : [ "obj-70", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 1 ],
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-70", 0 ],
									"source" : [ "obj-76", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 2 ],
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-78", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-86", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 1 ],
									"source" : [ "obj-82", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-82", 0 ],
									"source" : [ "obj-83", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-85", 0 ],
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-86", 1 ],
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-86", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-93", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-95", 0 ],
									"source" : [ "obj-94", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-100", 0 ],
									"source" : [ "obj-95", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-94", 1 ],
									"source" : [ "obj-97", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-94", 1 ],
									"source" : [ "obj-99", 0 ]
								}

							}
 ],
						"originid" : "pat-28",
						"boxgroups" : [ 							{
								"boxes" : [ "obj-68", "obj-52" ]
							}
 ]
					}
,
					"patching_rect" : [ 23.0, 20.0, 59.0, 22.0 ],
					"text" : "p N1.1b",
					"varname" : "N1.1b"
				}

			}
 ],
		"lines" : [  ],
		"originid" : "pat-4",
		"parameters" : 		{
			"obj-1::obj-10::obj-16::obj-1" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-1::obj-10::obj-22" : [ "live.toggle[2]", "live.toggle", 0 ],
			"obj-1::obj-10::obj-26" : [ "live.text[56]", "live.text[189]", 0 ],
			"obj-1::obj-10::obj-83" : [ "live.numbox[92]", "live.numbox", 0 ],
			"obj-1::obj-144::obj-12" : [ "live.toggle[14]", "live.toggle[1]", 0 ],
			"obj-1::obj-144::obj-22" : [ "live.text[190]", "live.text[189]", 0 ],
			"obj-1::obj-144::obj-24" : [ "live.menu[13]", "live.menu", 0 ],
			"obj-1::obj-144::obj-28::obj-1" : [ "live.numbox[29]", "live.numbox", 0 ],
			"obj-1::obj-144::obj-5::obj-1" : [ "live.numbox[28]", "live.numbox", 0 ],
			"obj-1::obj-144::obj-83" : [ "live.numbox[30]", "live.numbox", 0 ],
			"obj-1::obj-146::obj-12" : [ "live.toggle[15]", "live.toggle[1]", 0 ],
			"obj-1::obj-146::obj-22" : [ "live.text[191]", "live.text[189]", 0 ],
			"obj-1::obj-146::obj-24" : [ "live.menu[14]", "live.menu", 0 ],
			"obj-1::obj-146::obj-28::obj-1" : [ "live.numbox[31]", "live.numbox", 0 ],
			"obj-1::obj-146::obj-5::obj-1" : [ "live.numbox[24]", "live.numbox", 0 ],
			"obj-1::obj-146::obj-83" : [ "live.numbox[52]", "live.numbox", 0 ],
			"obj-1::obj-161::obj-64" : [ "live.numbox[33]", "live.numbox", 0 ],
			"obj-1::obj-174::obj-42" : [ "live.text[120]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-44" : [ "live.text[116]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-46" : [ "live.text[121]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-5" : [ "live.menu[27]", "live.menu", 0 ],
			"obj-1::obj-174::obj-52" : [ "live.text[35]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-55" : [ "live.text[134]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-57" : [ "live.text[33]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-61" : [ "live.text[129]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-62" : [ "live.text[117]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-63" : [ "live.text[130]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-64" : [ "live.text[118]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-65" : [ "live.text[119]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-69" : [ "live.text[34]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-70" : [ "live.text[133]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-71" : [ "live.text[131]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-72" : [ "live.text[132]", "live.text[15]", 0 ],
			"obj-1::obj-174::obj-85" : [ "live.numbox[53]", "live.numbox", 0 ],
			"obj-1::obj-174::obj-94::obj-1" : [ "live.numbox[34]", "live.numbox", 0 ],
			"obj-1::obj-176::obj-42" : [ "live.text[147]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-44" : [ "live.text[140]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-46" : [ "live.text[142]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-5" : [ "live.menu[15]", "live.menu", 0 ],
			"obj-1::obj-176::obj-52" : [ "live.text[145]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-55" : [ "live.text[143]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-57" : [ "live.text[135]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-61" : [ "live.text[146]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-62" : [ "live.text[148]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-63" : [ "live.text[136]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-64" : [ "live.text[137]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-65" : [ "live.text[139]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-69" : [ "live.text[141]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-70" : [ "live.text[144]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-71" : [ "live.text[149]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-72" : [ "live.text[138]", "live.text[15]", 0 ],
			"obj-1::obj-176::obj-85" : [ "live.numbox[50]", "live.numbox", 0 ],
			"obj-1::obj-176::obj-94::obj-1" : [ "live.numbox[54]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-113" : [ "live.text[272]", "live.text", 0 ],
			"obj-1::obj-1::obj-34::obj-1" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-40" : [ "live.text", "live.text", 0 ],
			"obj-1::obj-1::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-1::obj-1::obj-48" : [ "live.text[2]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-87" : [ "live.gain~[3]", "live.gain~", 0 ],
			"obj-1::obj-1::obj-90" : [ "live.text[6]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-92" : [ "live.text[5]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-94" : [ "live.text[7]", "live.text[2]", 0 ],
			"obj-1::obj-38::obj-22" : [ "live.numbox[72]", "live.numbox", 0 ],
			"obj-1::obj-38::obj-41" : [ "live.menu[17]", "live.menu", 0 ],
			"obj-1::obj-38::obj-57::obj-1" : [ "live.numbox[11]", "live.numbox", 0 ],
			"obj-1::obj-38::obj-9" : [ "live.toggle[7]", "live.toggle", 0 ],
			"obj-1::obj-43::obj-16::obj-1" : [ "live.numbox[17]", "live.numbox", 0 ],
			"obj-1::obj-43::obj-22" : [ "live.toggle[8]", "live.toggle", 0 ],
			"obj-1::obj-43::obj-26" : [ "live.text[32]", "live.text[189]", 0 ],
			"obj-1::obj-43::obj-83" : [ "live.numbox[18]", "live.numbox", 0 ],
			"obj-1::obj-44::obj-2" : [ "live.menu[25]", "live.menu", 0 ],
			"obj-1::obj-44::obj-21" : [ "live.toggle[13]", "live.toggle", 0 ],
			"obj-1::obj-44::obj-22::obj-1" : [ "live.numbox[14]", "live.numbox", 0 ],
			"obj-1::obj-44::obj-28" : [ "live.menu[9]", "live.menu", 0 ],
			"obj-1::obj-44::obj-29" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-1::obj-44::obj-33" : [ "live.text[17]", "live.text[235]", 0 ],
			"obj-1::obj-44::obj-36::obj-1" : [ "live.numbox[15]", "live.numbox", 0 ],
			"obj-1::obj-44::obj-41" : [ "live.text[19]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-43" : [ "live.text[21]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-44" : [ "live.text[25]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-45" : [ "live.text[15]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-46" : [ "live.text[27]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-47" : [ "live.text[30]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-48" : [ "live.text[31]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-50" : [ "live.text[22]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-51" : [ "live.text[23]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-52" : [ "live.text[28]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-53" : [ "live.text[26]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-61" : [ "live.text[29]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-63" : [ "live.text[16]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-65::obj-1" : [ "live.numbox[45]", "live.numbox", 0 ],
			"obj-1::obj-44::obj-69" : [ "live.text[24]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-70" : [ "live.text[20]", "live.text[15]", 0 ],
			"obj-1::obj-44::obj-8" : [ "live.text[18]", "live.text[36]", 0 ],
			"obj-1::obj-44::obj-83" : [ "live.numbox[16]", "live.numbox", 0 ],
			"obj-1::obj-48::obj-29::obj-1" : [ "live.numbox[7]", "live.numbox", 0 ],
			"obj-1::obj-48::obj-33::obj-1" : [ "live.numbox[8]", "live.numbox", 0 ],
			"obj-1::obj-48::obj-34" : [ "live.toggle[12]", "live.toggle", 0 ],
			"obj-1::obj-48::obj-35" : [ "live.text[122]", "live.text[189]", 0 ],
			"obj-1::obj-48::obj-83" : [ "live.numbox[26]", "live.numbox", 0 ],
			"obj-1::obj-54::obj-42" : [ "live.text[66]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-44" : [ "live.text[57]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-46" : [ "live.text[59]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-5" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-1::obj-54::obj-52" : [ "live.text[61]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-55" : [ "live.text[63]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-57" : [ "live.text[69]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-61" : [ "live.text[65]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-62" : [ "live.text[68]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-63" : [ "live.text[71]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-64" : [ "live.text[58]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-65" : [ "live.text[60]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-69" : [ "live.text[62]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-70" : [ "live.text[64]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-71" : [ "live.text[67]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-72" : [ "live.text[70]", "live.text[15]", 0 ],
			"obj-1::obj-54::obj-85" : [ "live.numbox[20]", "live.numbox", 0 ],
			"obj-1::obj-54::obj-94::obj-1" : [ "live.numbox[19]", "live.numbox", 0 ],
			"obj-1::obj-58::obj-42" : [ "live.text[73]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-44" : [ "live.text[75]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-46" : [ "live.text[81]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-5" : [ "live.menu[26]", "live.menu", 0 ],
			"obj-1::obj-58::obj-52" : [ "live.text[77]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-55" : [ "live.text[82]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-57" : [ "live.text[74]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-61" : [ "live.text[83]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-62" : [ "live.text[72]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-63" : [ "live.text[76]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-64" : [ "live.text[78]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-65" : [ "live.text[84]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-69" : [ "live.text[85]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-70" : [ "live.text[79]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-71" : [ "live.text[111]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-72" : [ "live.text[80]", "live.text[15]", 0 ],
			"obj-1::obj-58::obj-85" : [ "live.numbox[27]", "live.numbox", 0 ],
			"obj-1::obj-58::obj-94::obj-1" : [ "live.numbox[21]", "live.numbox", 0 ],
			"obj-1::obj-59::obj-12" : [ "live.toggle[1]", "live.toggle[1]", 0 ],
			"obj-1::obj-59::obj-22" : [ "live.text[110]", "live.text[189]", 0 ],
			"obj-1::obj-59::obj-24" : [ "live.menu[24]", "live.menu", 0 ],
			"obj-1::obj-59::obj-28::obj-1" : [ "live.numbox[10]", "live.numbox", 0 ],
			"obj-1::obj-59::obj-5::obj-1" : [ "live.numbox[9]", "live.numbox", 0 ],
			"obj-1::obj-59::obj-83" : [ "live.numbox[42]", "live.numbox", 0 ],
			"obj-1::obj-64::obj-42" : [ "live.text[322]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-44" : [ "live.text[335]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-46" : [ "live.text[339]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-5" : [ "live.menu[20]", "live.menu", 0 ],
			"obj-1::obj-64::obj-52" : [ "live.text[315]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-55" : [ "live.text[318]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-57" : [ "live.text[325]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-61" : [ "live.text[320]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-62" : [ "live.text[323]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-63" : [ "live.text[326]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-64" : [ "live.text[338]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-65" : [ "live.text[340]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-69" : [ "live.text[317]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-70" : [ "live.text[319]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-71" : [ "live.text[336]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-72" : [ "live.text[333]", "live.text[15]", 0 ],
			"obj-1::obj-64::obj-85" : [ "live.numbox", "live.numbox", 0 ],
			"obj-1::obj-64::obj-94::obj-1" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-1::obj-84::obj-2" : [ "live.menu[23]", "live.menu", 0 ],
			"obj-1::obj-84::obj-21" : [ "live.toggle[3]", "live.toggle", 0 ],
			"obj-1::obj-84::obj-22::obj-1" : [ "live.numbox[46]", "live.numbox", 0 ],
			"obj-1::obj-84::obj-28" : [ "live.menu[21]", "live.menu", 0 ],
			"obj-1::obj-84::obj-29" : [ "live.menu[22]", "live.menu", 0 ],
			"obj-1::obj-84::obj-33" : [ "live.text[99]", "live.text[235]", 0 ],
			"obj-1::obj-84::obj-36::obj-1" : [ "live.numbox[47]", "live.numbox", 0 ],
			"obj-1::obj-84::obj-41" : [ "live.text[102]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-43" : [ "live.text[106]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-44" : [ "live.text[97]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-45" : [ "live.text[101]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-46" : [ "live.text[100]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-47" : [ "live.text[115]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-48" : [ "live.text[98]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-50" : [ "live.text[113]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-51" : [ "live.text[105]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-52" : [ "live.text[126]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-53" : [ "live.text[114]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-61" : [ "live.text[104]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-63" : [ "live.text[107]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-65::obj-1" : [ "live.numbox[48]", "live.numbox", 0 ],
			"obj-1::obj-84::obj-69" : [ "live.text[128]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-70" : [ "live.text[103]", "live.text[15]", 0 ],
			"obj-1::obj-84::obj-8" : [ "live.text[127]", "live.text[36]", 0 ],
			"obj-1::obj-84::obj-83" : [ "live.numbox[49]", "live.numbox", 0 ],
			"obj-1::obj-8::obj-2" : [ "live.menu[8]", "live.menu", 0 ],
			"obj-1::obj-8::obj-21" : [ "live.toggle", "live.toggle", 0 ],
			"obj-1::obj-8::obj-22::obj-1" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-1::obj-8::obj-28" : [ "live.menu[18]", "live.menu", 0 ],
			"obj-1::obj-8::obj-29" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-1::obj-8::obj-33" : [ "live.text[235]", "live.text[235]", 0 ],
			"obj-1::obj-8::obj-36::obj-1" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-1::obj-8::obj-41" : [ "live.text[270]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-43" : [ "live.text[275]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-44" : [ "live.text[269]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-45" : [ "live.text[271]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-46" : [ "live.text[283]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-47" : [ "live.text[279]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-48" : [ "live.text[285]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-50" : [ "live.text[280]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-51" : [ "live.text[277]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-52" : [ "live.text[276]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-53" : [ "live.text[281]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-61" : [ "live.text[284]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-63" : [ "live.text[273]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-65::obj-1" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-1::obj-8::obj-69" : [ "live.text[274]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-70" : [ "live.text[230]", "live.text[15]", 0 ],
			"obj-1::obj-8::obj-8" : [ "live.text[282]", "live.text[36]", 0 ],
			"obj-1::obj-8::obj-83" : [ "live.numbox[13]", "live.numbox", 0 ],
			"obj-3::obj-1::obj-113" : [ "live.text[8]", "live.text", 0 ],
			"obj-3::obj-1::obj-34::obj-1" : [ "live.numbox[44]", "live.numbox", 0 ],
			"obj-3::obj-1::obj-40" : [ "live.text[9]", "live.text", 0 ],
			"obj-3::obj-1::obj-42" : [ "live.text[13]", "live.text", 0 ],
			"obj-3::obj-1::obj-48" : [ "live.text[10]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-87" : [ "live.gain~[4]", "live.gain~", 0 ],
			"obj-3::obj-1::obj-90" : [ "live.text[12]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-92" : [ "live.text[14]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-94" : [ "live.text[11]", "live.text[2]", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"parameter_overrides" : 			{
				"obj-1::obj-10::obj-16::obj-1" : 				{
					"parameter_longname" : "live.numbox[5]"
				}
,
				"obj-1::obj-144::obj-12" : 				{
					"parameter_longname" : "live.toggle[14]"
				}
,
				"obj-1::obj-144::obj-22" : 				{
					"parameter_longname" : "live.text[190]"
				}
,
				"obj-1::obj-144::obj-24" : 				{
					"parameter_longname" : "live.menu[13]"
				}
,
				"obj-1::obj-144::obj-28::obj-1" : 				{
					"parameter_longname" : "live.numbox[29]"
				}
,
				"obj-1::obj-144::obj-5::obj-1" : 				{
					"parameter_longname" : "live.numbox[28]"
				}
,
				"obj-1::obj-144::obj-83" : 				{
					"parameter_longname" : "live.numbox[30]"
				}
,
				"obj-1::obj-146::obj-12" : 				{
					"parameter_longname" : "live.toggle[15]"
				}
,
				"obj-1::obj-146::obj-22" : 				{
					"parameter_longname" : "live.text[191]"
				}
,
				"obj-1::obj-146::obj-24" : 				{
					"parameter_longname" : "live.menu[14]"
				}
,
				"obj-1::obj-146::obj-28::obj-1" : 				{
					"parameter_longname" : "live.numbox[31]"
				}
,
				"obj-1::obj-146::obj-5::obj-1" : 				{
					"parameter_longname" : "live.numbox[24]"
				}
,
				"obj-1::obj-146::obj-83" : 				{
					"parameter_longname" : "live.numbox[52]"
				}
,
				"obj-1::obj-161::obj-64" : 				{
					"parameter_longname" : "live.numbox[33]"
				}
,
				"obj-1::obj-174::obj-42" : 				{
					"parameter_longname" : "live.text[120]"
				}
,
				"obj-1::obj-174::obj-44" : 				{
					"parameter_longname" : "live.text[116]"
				}
,
				"obj-1::obj-174::obj-46" : 				{
					"parameter_longname" : "live.text[121]"
				}
,
				"obj-1::obj-174::obj-5" : 				{
					"parameter_longname" : "live.menu[27]"
				}
,
				"obj-1::obj-174::obj-52" : 				{
					"parameter_longname" : "live.text[35]"
				}
,
				"obj-1::obj-174::obj-55" : 				{
					"parameter_longname" : "live.text[134]"
				}
,
				"obj-1::obj-174::obj-57" : 				{
					"parameter_longname" : "live.text[33]"
				}
,
				"obj-1::obj-174::obj-61" : 				{
					"parameter_longname" : "live.text[129]"
				}
,
				"obj-1::obj-174::obj-62" : 				{
					"parameter_longname" : "live.text[117]"
				}
,
				"obj-1::obj-174::obj-63" : 				{
					"parameter_longname" : "live.text[130]"
				}
,
				"obj-1::obj-174::obj-64" : 				{
					"parameter_longname" : "live.text[118]"
				}
,
				"obj-1::obj-174::obj-65" : 				{
					"parameter_longname" : "live.text[119]"
				}
,
				"obj-1::obj-174::obj-69" : 				{
					"parameter_longname" : "live.text[34]"
				}
,
				"obj-1::obj-174::obj-70" : 				{
					"parameter_longname" : "live.text[133]"
				}
,
				"obj-1::obj-174::obj-71" : 				{
					"parameter_longname" : "live.text[131]"
				}
,
				"obj-1::obj-174::obj-72" : 				{
					"parameter_longname" : "live.text[132]"
				}
,
				"obj-1::obj-174::obj-85" : 				{
					"parameter_longname" : "live.numbox[53]"
				}
,
				"obj-1::obj-174::obj-94::obj-1" : 				{
					"parameter_longname" : "live.numbox[34]"
				}
,
				"obj-1::obj-176::obj-42" : 				{
					"parameter_longname" : "live.text[147]"
				}
,
				"obj-1::obj-176::obj-44" : 				{
					"parameter_longname" : "live.text[140]"
				}
,
				"obj-1::obj-176::obj-46" : 				{
					"parameter_longname" : "live.text[142]"
				}
,
				"obj-1::obj-176::obj-5" : 				{
					"parameter_longname" : "live.menu[15]"
				}
,
				"obj-1::obj-176::obj-52" : 				{
					"parameter_longname" : "live.text[145]"
				}
,
				"obj-1::obj-176::obj-55" : 				{
					"parameter_longname" : "live.text[143]"
				}
,
				"obj-1::obj-176::obj-57" : 				{
					"parameter_longname" : "live.text[135]"
				}
,
				"obj-1::obj-176::obj-61" : 				{
					"parameter_longname" : "live.text[146]"
				}
,
				"obj-1::obj-176::obj-62" : 				{
					"parameter_longname" : "live.text[148]"
				}
,
				"obj-1::obj-176::obj-63" : 				{
					"parameter_longname" : "live.text[136]"
				}
,
				"obj-1::obj-176::obj-64" : 				{
					"parameter_longname" : "live.text[137]"
				}
,
				"obj-1::obj-176::obj-65" : 				{
					"parameter_longname" : "live.text[139]"
				}
,
				"obj-1::obj-176::obj-69" : 				{
					"parameter_longname" : "live.text[141]"
				}
,
				"obj-1::obj-176::obj-70" : 				{
					"parameter_longname" : "live.text[144]"
				}
,
				"obj-1::obj-176::obj-71" : 				{
					"parameter_longname" : "live.text[149]"
				}
,
				"obj-1::obj-176::obj-72" : 				{
					"parameter_longname" : "live.text[138]"
				}
,
				"obj-1::obj-176::obj-85" : 				{
					"parameter_longname" : "live.numbox[50]"
				}
,
				"obj-1::obj-176::obj-94::obj-1" : 				{
					"parameter_longname" : "live.numbox[54]"
				}
,
				"obj-1::obj-1::obj-34::obj-1" : 				{
					"parameter_longname" : "live.numbox[1]"
				}
,
				"obj-1::obj-1::obj-42" : 				{
					"parameter_longname" : "live.text[1]"
				}
,
				"obj-1::obj-1::obj-48" : 				{
					"parameter_longname" : "live.text[2]"
				}
,
				"obj-1::obj-1::obj-90" : 				{
					"parameter_longname" : "live.text[6]"
				}
,
				"obj-1::obj-1::obj-92" : 				{
					"parameter_longname" : "live.text[5]"
				}
,
				"obj-1::obj-1::obj-94" : 				{
					"parameter_longname" : "live.text[7]"
				}
,
				"obj-1::obj-38::obj-57::obj-1" : 				{
					"parameter_longname" : "live.numbox[11]"
				}
,
				"obj-1::obj-43::obj-16::obj-1" : 				{
					"parameter_longname" : "live.numbox[17]"
				}
,
				"obj-1::obj-43::obj-22" : 				{
					"parameter_longname" : "live.toggle[8]"
				}
,
				"obj-1::obj-43::obj-26" : 				{
					"parameter_longname" : "live.text[32]"
				}
,
				"obj-1::obj-43::obj-83" : 				{
					"parameter_longname" : "live.numbox[18]"
				}
,
				"obj-1::obj-44::obj-2" : 				{
					"parameter_longname" : "live.menu[25]"
				}
,
				"obj-1::obj-44::obj-21" : 				{
					"parameter_longname" : "live.toggle[13]"
				}
,
				"obj-1::obj-44::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[14]"
				}
,
				"obj-1::obj-44::obj-28" : 				{
					"parameter_longname" : "live.menu[9]"
				}
,
				"obj-1::obj-44::obj-29" : 				{
					"parameter_longname" : "live.menu[10]"
				}
,
				"obj-1::obj-44::obj-33" : 				{
					"parameter_longname" : "live.text[17]"
				}
,
				"obj-1::obj-44::obj-36::obj-1" : 				{
					"parameter_longname" : "live.numbox[15]"
				}
,
				"obj-1::obj-44::obj-41" : 				{
					"parameter_longname" : "live.text[19]"
				}
,
				"obj-1::obj-44::obj-43" : 				{
					"parameter_longname" : "live.text[21]"
				}
,
				"obj-1::obj-44::obj-44" : 				{
					"parameter_longname" : "live.text[25]"
				}
,
				"obj-1::obj-44::obj-45" : 				{
					"parameter_longname" : "live.text[15]"
				}
,
				"obj-1::obj-44::obj-46" : 				{
					"parameter_longname" : "live.text[27]"
				}
,
				"obj-1::obj-44::obj-47" : 				{
					"parameter_longname" : "live.text[30]"
				}
,
				"obj-1::obj-44::obj-48" : 				{
					"parameter_longname" : "live.text[31]"
				}
,
				"obj-1::obj-44::obj-50" : 				{
					"parameter_longname" : "live.text[22]"
				}
,
				"obj-1::obj-44::obj-51" : 				{
					"parameter_longname" : "live.text[23]"
				}
,
				"obj-1::obj-44::obj-52" : 				{
					"parameter_longname" : "live.text[28]"
				}
,
				"obj-1::obj-44::obj-53" : 				{
					"parameter_longname" : "live.text[26]"
				}
,
				"obj-1::obj-44::obj-61" : 				{
					"parameter_longname" : "live.text[29]"
				}
,
				"obj-1::obj-44::obj-63" : 				{
					"parameter_longname" : "live.text[16]"
				}
,
				"obj-1::obj-44::obj-65::obj-1" : 				{
					"parameter_longname" : "live.numbox[45]"
				}
,
				"obj-1::obj-44::obj-69" : 				{
					"parameter_longname" : "live.text[24]"
				}
,
				"obj-1::obj-44::obj-70" : 				{
					"parameter_longname" : "live.text[20]"
				}
,
				"obj-1::obj-44::obj-8" : 				{
					"parameter_longname" : "live.text[18]"
				}
,
				"obj-1::obj-44::obj-83" : 				{
					"parameter_longname" : "live.numbox[16]"
				}
,
				"obj-1::obj-48::obj-29::obj-1" : 				{
					"parameter_longname" : "live.numbox[7]"
				}
,
				"obj-1::obj-48::obj-33::obj-1" : 				{
					"parameter_longname" : "live.numbox[8]"
				}
,
				"obj-1::obj-54::obj-42" : 				{
					"parameter_longname" : "live.text[66]"
				}
,
				"obj-1::obj-54::obj-44" : 				{
					"parameter_longname" : "live.text[57]"
				}
,
				"obj-1::obj-54::obj-46" : 				{
					"parameter_longname" : "live.text[59]"
				}
,
				"obj-1::obj-54::obj-5" : 				{
					"parameter_longname" : "live.menu[11]"
				}
,
				"obj-1::obj-54::obj-52" : 				{
					"parameter_longname" : "live.text[61]"
				}
,
				"obj-1::obj-54::obj-55" : 				{
					"parameter_longname" : "live.text[63]"
				}
,
				"obj-1::obj-54::obj-57" : 				{
					"parameter_longname" : "live.text[69]"
				}
,
				"obj-1::obj-54::obj-61" : 				{
					"parameter_longname" : "live.text[65]"
				}
,
				"obj-1::obj-54::obj-62" : 				{
					"parameter_longname" : "live.text[68]"
				}
,
				"obj-1::obj-54::obj-63" : 				{
					"parameter_longname" : "live.text[71]"
				}
,
				"obj-1::obj-54::obj-64" : 				{
					"parameter_longname" : "live.text[58]"
				}
,
				"obj-1::obj-54::obj-65" : 				{
					"parameter_longname" : "live.text[60]"
				}
,
				"obj-1::obj-54::obj-69" : 				{
					"parameter_longname" : "live.text[62]"
				}
,
				"obj-1::obj-54::obj-70" : 				{
					"parameter_longname" : "live.text[64]"
				}
,
				"obj-1::obj-54::obj-71" : 				{
					"parameter_longname" : "live.text[67]"
				}
,
				"obj-1::obj-54::obj-72" : 				{
					"parameter_longname" : "live.text[70]"
				}
,
				"obj-1::obj-54::obj-85" : 				{
					"parameter_longname" : "live.numbox[20]"
				}
,
				"obj-1::obj-54::obj-94::obj-1" : 				{
					"parameter_longname" : "live.numbox[19]"
				}
,
				"obj-1::obj-58::obj-42" : 				{
					"parameter_longname" : "live.text[73]"
				}
,
				"obj-1::obj-58::obj-44" : 				{
					"parameter_longname" : "live.text[75]"
				}
,
				"obj-1::obj-58::obj-46" : 				{
					"parameter_longname" : "live.text[81]"
				}
,
				"obj-1::obj-58::obj-5" : 				{
					"parameter_longname" : "live.menu[26]"
				}
,
				"obj-1::obj-58::obj-52" : 				{
					"parameter_longname" : "live.text[77]"
				}
,
				"obj-1::obj-58::obj-55" : 				{
					"parameter_longname" : "live.text[82]"
				}
,
				"obj-1::obj-58::obj-57" : 				{
					"parameter_longname" : "live.text[74]"
				}
,
				"obj-1::obj-58::obj-61" : 				{
					"parameter_longname" : "live.text[83]"
				}
,
				"obj-1::obj-58::obj-62" : 				{
					"parameter_longname" : "live.text[72]"
				}
,
				"obj-1::obj-58::obj-63" : 				{
					"parameter_longname" : "live.text[76]"
				}
,
				"obj-1::obj-58::obj-64" : 				{
					"parameter_longname" : "live.text[78]"
				}
,
				"obj-1::obj-58::obj-65" : 				{
					"parameter_longname" : "live.text[84]"
				}
,
				"obj-1::obj-58::obj-69" : 				{
					"parameter_longname" : "live.text[85]"
				}
,
				"obj-1::obj-58::obj-70" : 				{
					"parameter_longname" : "live.text[79]"
				}
,
				"obj-1::obj-58::obj-71" : 				{
					"parameter_longname" : "live.text[111]"
				}
,
				"obj-1::obj-58::obj-72" : 				{
					"parameter_longname" : "live.text[80]"
				}
,
				"obj-1::obj-58::obj-85" : 				{
					"parameter_longname" : "live.numbox[27]"
				}
,
				"obj-1::obj-58::obj-94::obj-1" : 				{
					"parameter_longname" : "live.numbox[21]"
				}
,
				"obj-1::obj-59::obj-28::obj-1" : 				{
					"parameter_longname" : "live.numbox[10]"
				}
,
				"obj-1::obj-59::obj-5::obj-1" : 				{
					"parameter_longname" : "live.numbox[9]"
				}
,
				"obj-1::obj-64::obj-94::obj-1" : 				{
					"parameter_longname" : "live.numbox[6]"
				}
,
				"obj-1::obj-84::obj-2" : 				{
					"parameter_longname" : "live.menu[23]"
				}
,
				"obj-1::obj-84::obj-21" : 				{
					"parameter_longname" : "live.toggle[3]"
				}
,
				"obj-1::obj-84::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[46]"
				}
,
				"obj-1::obj-84::obj-28" : 				{
					"parameter_longname" : "live.menu[21]"
				}
,
				"obj-1::obj-84::obj-29" : 				{
					"parameter_longname" : "live.menu[22]"
				}
,
				"obj-1::obj-84::obj-33" : 				{
					"parameter_longname" : "live.text[99]"
				}
,
				"obj-1::obj-84::obj-36::obj-1" : 				{
					"parameter_longname" : "live.numbox[47]"
				}
,
				"obj-1::obj-84::obj-41" : 				{
					"parameter_longname" : "live.text[102]"
				}
,
				"obj-1::obj-84::obj-43" : 				{
					"parameter_longname" : "live.text[106]"
				}
,
				"obj-1::obj-84::obj-44" : 				{
					"parameter_longname" : "live.text[97]"
				}
,
				"obj-1::obj-84::obj-45" : 				{
					"parameter_longname" : "live.text[101]"
				}
,
				"obj-1::obj-84::obj-46" : 				{
					"parameter_longname" : "live.text[100]"
				}
,
				"obj-1::obj-84::obj-47" : 				{
					"parameter_longname" : "live.text[115]"
				}
,
				"obj-1::obj-84::obj-48" : 				{
					"parameter_longname" : "live.text[98]"
				}
,
				"obj-1::obj-84::obj-50" : 				{
					"parameter_longname" : "live.text[113]"
				}
,
				"obj-1::obj-84::obj-51" : 				{
					"parameter_longname" : "live.text[105]"
				}
,
				"obj-1::obj-84::obj-52" : 				{
					"parameter_longname" : "live.text[126]"
				}
,
				"obj-1::obj-84::obj-53" : 				{
					"parameter_longname" : "live.text[114]"
				}
,
				"obj-1::obj-84::obj-61" : 				{
					"parameter_longname" : "live.text[104]"
				}
,
				"obj-1::obj-84::obj-63" : 				{
					"parameter_longname" : "live.text[107]"
				}
,
				"obj-1::obj-84::obj-65::obj-1" : 				{
					"parameter_longname" : "live.numbox[48]"
				}
,
				"obj-1::obj-84::obj-69" : 				{
					"parameter_longname" : "live.text[128]"
				}
,
				"obj-1::obj-84::obj-70" : 				{
					"parameter_longname" : "live.text[103]"
				}
,
				"obj-1::obj-84::obj-8" : 				{
					"parameter_longname" : "live.text[127]"
				}
,
				"obj-1::obj-84::obj-83" : 				{
					"parameter_longname" : "live.numbox[49]"
				}
,
				"obj-1::obj-8::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[2]"
				}
,
				"obj-1::obj-8::obj-36::obj-1" : 				{
					"parameter_longname" : "live.numbox[3]"
				}
,
				"obj-1::obj-8::obj-65::obj-1" : 				{
					"parameter_longname" : "live.numbox[4]"
				}
,
				"obj-3::obj-1::obj-113" : 				{
					"parameter_longname" : "live.text[8]"
				}
,
				"obj-3::obj-1::obj-40" : 				{
					"parameter_longname" : "live.text[9]"
				}
,
				"obj-3::obj-1::obj-42" : 				{
					"parameter_longname" : "live.text[13]"
				}
,
				"obj-3::obj-1::obj-48" : 				{
					"parameter_longname" : "live.text[10]"
				}
,
				"obj-3::obj-1::obj-87" : 				{
					"parameter_longname" : "live.gain~[4]"
				}
,
				"obj-3::obj-1::obj-90" : 				{
					"parameter_longname" : "live.text[12]"
				}
,
				"obj-3::obj-1::obj-92" : 				{
					"parameter_longname" : "live.text[14]"
				}
,
				"obj-3::obj-1::obj-94" : 				{
					"parameter_longname" : "live.text[11]"
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "pyosc.awaitpatcherargs.maxpat",
				"bootpath" : "~/MaxProjects/pyosc/pyosc/patchers",
				"patcherrelativepath" : "../../../pyosc/pyosc/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.interpolator.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.makenote.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.multislider.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/ui",
				"patcherrelativepath" : "../../patchers/ui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.oscillator.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.phasepulse.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.pulsefilter.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.slider.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/ui",
				"patcherrelativepath" : "../../patchers/ui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.transport.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.interpolator.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/generatives",
				"patcherrelativepath" : "../../patchers/generatives",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.makenote.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/generatives",
				"patcherrelativepath" : "../../patchers/generatives",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.op.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.oscillator.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/generatives",
				"patcherrelativepath" : "../../patchers/generatives",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.phasemap.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.phasepulse.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/generatives",
				"patcherrelativepath" : "../../patchers/generatives",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.slider.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/ui",
				"patcherrelativepath" : "../../patchers/ui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.slidermapping.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.stepper.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/generatives",
				"patcherrelativepath" : "../../patchers/generatives",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.transport.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/generatives",
				"patcherrelativepath" : "../../patchers/generatives",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.multiview2.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/view",
				"patcherrelativepath" : "../../patchers/view",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
