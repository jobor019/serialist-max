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
						"originid" : "pat-353"
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
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 553.0, 752.0, 68.0, 22.0 ],
									"text" : "ser.op + 60"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 659.0, 524.0, 29.5, 22.0 ],
									"text" : "8"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 566.5, 530.0, 71.0, 22.0 ],
									"text" : "waveform 3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 573.0, 499.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 554.0, 717.0, 66.0, 22.0 ],
									"text" : "ser.op * 14"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 98.0, 552.0, 29.5, 22.0 ],
									"text" : "t l l"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-7",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.stepper.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 554.0, 567.0, 144.0, 128.0 ],
									"varname" : "ser.stepper.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 265.0, 275.0, 80.0, 22.0 ],
									"text" : "loadmess 0.9"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-48",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 685.0, 449.5, 29.5, 22.0 ],
									"text" : "55"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
									"id" : "obj-46",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 706.0, 485.0, 59.0, 22.0 ],
									"text" : "pgmout 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 237.0, 448.5, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 237.0, 485.0, 81.0, 22.0 ],
									"text" : "immediate $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 126.5, 453.0, 100.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_enum" : [ "sustain", "pause" ],
											"parameter_longname" : "live.menu",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_shortname" : "live.menu",
											"parameter_type" : 2
										}

									}
,
									"varname" : "live.menu"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 126.5, 485.0, 55.0, 22.0 ],
									"text" : "mode $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 430.0, 490.0, 29.5, 22.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 397.0, 490.0, 29.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-11",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.makenote.ui.maxpat",
									"numinlets" : 4,
									"numoutlets" : 2,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 107.0, 870.0, 375.0, 102.0 ],
									"varname" : "ser.makenote.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 98.0, 524.0, 106.0, 22.0 ],
									"text" : "ser.pulsefilter"
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
									"name" : "ser.phase.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 98.5, 128.0, 146.0, 161.0 ],
									"varname" : "ser.phase.ui",
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
									"id" : "obj-5",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.phasepulse.ui.maxpat",
									"numinlets" : 2,
									"numoutlets" : 7,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "" ],
									"patching_rect" : [ 98.0, 320.0, 147.0, 108.0 ],
									"varname" : "ser.phasepulse.ui",
									"viewvisibility" : 1
								}

							}
, 							{
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
									"text" : "If needed, we can provide a longer description here to describe in detail what this narrative should do"
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
									"text" : "N1.1b. Title of Given Narrative"
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
									"destination" : [ "obj-13", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-13", 1 ]
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
									"destination" : [ "obj-51", 0 ],
									"source" : [ "obj-17", 0 ]
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
									"destination" : [ "obj-44", 0 ],
									"order" : 1,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"order" : 0,
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
									"destination" : [ "obj-10", 1 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 1 ],
									"source" : [ "obj-25", 0 ]
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
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 1 ],
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
 ],
						"originid" : "pat-375"
					}
,
					"patching_rect" : [ 23.0, 20.0, 59.0, 22.0 ],
					"text" : "p N1.1b",
					"varname" : "N1.1b"
				}

			}
 ],
		"lines" : [  ],
		"originid" : "pat-351",
		"parameters" : 		{
			"obj-1::obj-11::obj-29::obj-1" : [ "live.numbox[14]", "live.numbox", 0 ],
			"obj-1::obj-11::obj-33::obj-1" : [ "live.numbox[15]", "live.numbox", 0 ],
			"obj-1::obj-11::obj-34" : [ "live.toggle[12]", "live.toggle", 0 ],
			"obj-1::obj-11::obj-35" : [ "live.text[122]", "live.text[189]", 0 ],
			"obj-1::obj-11::obj-83" : [ "live.numbox[26]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-113" : [ "live.text[272]", "live.text", 0 ],
			"obj-1::obj-1::obj-34::obj-1" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-40" : [ "live.text", "live.text", 0 ],
			"obj-1::obj-1::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-1::obj-1::obj-48" : [ "live.text[2]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-87" : [ "live.gain~[3]", "live.gain~", 0 ],
			"obj-1::obj-1::obj-90" : [ "live.text[6]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-92" : [ "live.text[5]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-94" : [ "live.text[7]", "live.text[2]", 0 ],
			"obj-1::obj-39" : [ "live.menu", "live.menu", 0 ],
			"obj-1::obj-5::obj-16::obj-1" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-1::obj-5::obj-22" : [ "live.toggle[2]", "live.toggle", 0 ],
			"obj-1::obj-5::obj-26" : [ "live.text[56]", "live.text[189]", 0 ],
			"obj-1::obj-5::obj-83" : [ "live.numbox[92]", "live.numbox", 0 ],
			"obj-1::obj-7::obj-12" : [ "live.toggle[1]", "live.toggle[1]", 0 ],
			"obj-1::obj-7::obj-22" : [ "live.text[110]", "live.text[189]", 0 ],
			"obj-1::obj-7::obj-24" : [ "live.menu[24]", "live.menu", 0 ],
			"obj-1::obj-7::obj-28::obj-1" : [ "live.numbox[17]", "live.numbox", 0 ],
			"obj-1::obj-7::obj-5::obj-1" : [ "live.numbox[16]", "live.numbox", 0 ],
			"obj-1::obj-7::obj-83" : [ "live.numbox[42]", "live.numbox", 0 ],
			"obj-1::obj-8::obj-2" : [ "live.menu[8]", "live.menu", 0 ],
			"obj-1::obj-8::obj-21" : [ "live.toggle", "live.toggle", 0 ],
			"obj-1::obj-8::obj-22::obj-1" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-1::obj-8::obj-28" : [ "live.menu[18]", "live.menu", 0 ],
			"obj-1::obj-8::obj-29" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-1::obj-8::obj-33" : [ "live.text[235]", "live.text[235]", 0 ],
			"obj-1::obj-8::obj-36::obj-1" : [ "live.numbox[4]", "live.numbox", 0 ],
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
			"obj-1::obj-8::obj-65::obj-1" : [ "live.numbox[5]", "live.numbox", 0 ],
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
				"obj-1::obj-11::obj-29::obj-1" : 				{
					"parameter_longname" : "live.numbox[14]"
				}
,
				"obj-1::obj-11::obj-33::obj-1" : 				{
					"parameter_longname" : "live.numbox[15]"
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
				"obj-1::obj-5::obj-16::obj-1" : 				{
					"parameter_longname" : "live.numbox[2]"
				}
,
				"obj-1::obj-7::obj-28::obj-1" : 				{
					"parameter_longname" : "live.numbox[17]"
				}
,
				"obj-1::obj-7::obj-5::obj-1" : 				{
					"parameter_longname" : "live.numbox[16]"
				}
,
				"obj-1::obj-8::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[3]"
				}
,
				"obj-1::obj-8::obj-36::obj-1" : 				{
					"parameter_longname" : "live.numbox[4]"
				}
,
				"obj-1::obj-8::obj-65::obj-1" : 				{
					"parameter_longname" : "live.numbox[5]"
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
				"name" : "ser.makenote.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.phase.mxo",
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
				"name" : "ser.phase.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/generatives",
				"patcherrelativepath" : "../../patchers/generatives",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.phasepulse.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/generatives",
				"patcherrelativepath" : "../../patchers/generatives",
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
				"name" : "ser.scope2.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/view",
				"patcherrelativepath" : "../../patchers/view",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
