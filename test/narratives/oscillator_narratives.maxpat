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
					"id" : "obj-2",
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
						"originid" : "pat-4086"
					}
,
					"patching_rect" : [ 195.0, 21.0, 69.0, 22.0 ],
					"text" : "p R1.1.1a",
					"varname" : "R1.1.1a[1]"
				}

			}
, 			{
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
									"hidden" : 1,
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1065.0, 240.0, 29.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-51",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 820.0, 417.0, 29.5, 22.0 ],
									"text" : "17"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-45",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 820.0, 387.0, 29.5, 22.0 ],
									"text" : "55"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-38",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 812.0, 342.0, 34.0, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 641.0, 210.0, 81.0, 20.0 ],
									"text" : "Piano sounds"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 641.0, 177.0, 116.0, 20.0 ],
									"text" : "Same value for both"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 759.0, 179.5, 44.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox",
											"parameter_mmax" : 4.0,
											"parameter_mmin" : 0.1,
											"parameter_modmode" : 3,
											"parameter_shortname" : "live.numbox",
											"parameter_type" : 0,
											"parameter_unitstyle" : 1
										}

									}
,
									"varname" : "live.numbox"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 272.0, 557.0, 53.0, 22.0 ],
									"text" : "voices 6"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
									"hidden" : 1,
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 772.0, 498.0, 59.0, 22.0 ],
									"text" : "pgmout 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 759.0, 209.0, 29.5, 22.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 759.0, 209.0, 29.5, 22.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
									"hidden" : 1,
									"id" : "obj-80",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 734.0, 426.0, 59.0, 22.0 ],
									"text" : "pgmout 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-90",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 229.0, 801.0, 44.0, 20.0 ],
									"text" : "cluster"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-88",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 103.0, 476.0, 67.0, 20.0 ],
									"text" : "base curve"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-83",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 447.0, 417.0, 71.0, 22.0 ],
									"text" : "waveform 4"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-81",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 284.0, 836.0, 29.5, 22.0 ],
									"text" : "2"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-79",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 250.0, 836.0, 29.5, 22.0 ],
									"text" : "50"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-77",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 137.0, 504.0, 29.5, 22.0 ],
									"text" : "2.7"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-75",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.makenote.ui.maxpat",
									"numinlets" : 4,
									"numoutlets" : 2,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 12.0, 883.0, 375.0, 102.0 ],
									"varname" : "ser.makenote.ui[1]",
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
									"id" : "obj-74",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.oscillator.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 13.0, 540.0, 146.0, 161.0 ],
									"varname" : "ser.oscillator.ui[4]",
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
									"id" : "obj-73",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.phasepulse.ui.maxpat",
									"numinlets" : 2,
									"numoutlets" : 7,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "" ],
									"patching_rect" : [ 13.0, 714.0, 147.0, 108.0 ],
									"varname" : "ser.phasepulse.ui[1]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-64",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 206.0, 767.0, 59.0, 22.0 ],
									"text" : "ser.op * 6"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 174.0, 800.0, 52.0, 22.0 ],
									"text" : "ser.op +"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-59",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 439.0, 92.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-58",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 488.5, 176.0, 29.5, 22.0 ],
									"text" : "0.3"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-55",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.oscillator.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 481.0, 578.0, 146.0, 161.0 ],
									"varname" : "ser.oscillator.ui[3]",
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
									"id" : "obj-53",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.phasepulse.ui.maxpat",
									"numinlets" : 2,
									"numoutlets" : 7,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "" ],
									"patching_rect" : [ 481.0, 750.0, 147.0, 108.0 ],
									"varname" : "ser.phasepulse.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 131.0, 93.0, 71.0, 22.0 ],
									"text" : "waveform 1"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-48",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 247.0, 84.0, 71.0, 22.0 ],
									"text" : "waveform 4"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-46",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 86.0, 93.0, 29.5, 22.0 ],
									"text" : "11"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-44",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 217.0, 339.0, 29.5, 22.0 ],
									"text" : "24"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-43",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 260.0, 339.0, 29.5, 22.0 ],
									"text" : "60"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-39",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.addmul.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "float/listoflists", "", "" ],
									"patching_rect" : [ 173.0, 376.0, 106.0, 72.0 ],
									"varname" : "ser.addmul.ui[1]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "float/listoflists", "" ],
									"patching_rect" : [ 174.0, 475.0, 52.0, 22.0 ],
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
									"id" : "obj-21",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.makenote.ui.maxpat",
									"numinlets" : 4,
									"numoutlets" : 2,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 481.0, 883.0, 375.0, 102.0 ],
									"varname" : "ser.makenote.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-20",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 767.5, 236.0, 68.0, 22.0 ],
									"text" : "enabled $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 759.0, 144.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-9",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 425.0, 339.0, 29.5, 22.0 ],
									"text" : "8"
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
									"name" : "ser.addmul.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "float/listoflists", "", "" ],
									"patching_rect" : [ 334.0, 381.0, 106.0, 72.0 ],
									"varname" : "ser.addmul.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"args" : [ "@enabled", 0 ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-10",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.oscillator.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 334.0, 135.0, 146.0, 161.0 ],
									"varname" : "ser.oscillator.ui[2]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"args" : [ "@waveform", 4, "@enabled", 0 ],
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
									"patching_rect" : [ 206.0, 593.0, 146.0, 161.0 ],
									"varname" : "ser.oscillator.ui[1]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"args" : [ "@enabled", 0 ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-5",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.oscillator.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 174.0, 141.0, 146.0, 161.0 ],
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
									"patching_rect" : [ 1044.000000029802322, 587.0, 45.0, 45.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 641.0, 146.0, 100.0, 20.0 ],
									"text" : "Activate modules"
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
									"patching_rect" : [ 800.0, 140.0, 32.0, 22.0 ],
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
									"patching_rect" : [ 759.0, 107.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 641.0, 109.0, 105.0, 20.0 ],
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
									"text" : "N1.2c. Adding Clustery Pitch Offsets to Curve"
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
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 1 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-15", 0 ]
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
									"destination" : [ "obj-13", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-80", 0 ],
									"hidden" : 1,
									"order" : 1,
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
									"destination" : [ "obj-10", 0 ],
									"hidden" : 1,
									"order" : 6,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"hidden" : 1,
									"order" : 5,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"hidden" : 1,
									"order" : 4,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"hidden" : 1,
									"order" : 3,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"hidden" : 1,
									"order" : 2,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 0 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"hidden" : 1,
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
									"order" : 1,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 1 ],
									"order" : 1,
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"order" : 0,
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
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
									"destination" : [ "obj-45", 0 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 2 ],
									"hidden" : 1,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 1 ],
									"hidden" : 1,
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-80", 0 ],
									"hidden" : 1,
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 1 ],
									"hidden" : 1,
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 1 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 1 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"hidden" : 1,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"hidden" : 1,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"hidden" : 1,
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"hidden" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 1 ],
									"hidden" : 1,
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"order" : 4,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"hidden" : 1,
									"order" : 5,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"hidden" : 1,
									"order" : 8,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"hidden" : 1,
									"order" : 11,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"hidden" : 1,
									"order" : 7,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"hidden" : 1,
									"order" : 10,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"hidden" : 1,
									"order" : 9,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-79", 0 ],
									"hidden" : 1,
									"order" : 6,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"hidden" : 1,
									"order" : 3,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-83", 0 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"hidden" : 1,
									"order" : 2,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 1 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 1 ],
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 0 ],
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"source" : [ "obj-74", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 1 ],
									"hidden" : 1,
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 2 ],
									"hidden" : 1,
									"source" : [ "obj-79", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 3 ],
									"hidden" : 1,
									"source" : [ "obj-81", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"hidden" : 1,
									"source" : [ "obj-83", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"hidden" : 1,
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-4108"
					}
,
					"patching_rect" : [ 104.0, 21.0, 50.0, 22.0 ],
					"text" : "p N1.2c",
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
						"rect" : [ 59.0, 106.0, 1000.0, 780.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"showontab" : 1,
						"visible" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-17",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1065.0, 240.0, 29.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
									"hidden" : 1,
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 687.0, 414.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-9",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 687.0, 443.0, 29.5, 22.0 ],
									"text" : "17"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-11",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 613.0, 443.0, 29.5, 22.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 650.0, 443.0, 29.5, 22.0 ],
									"text" : "25"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
									"hidden" : 1,
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 651.0, 484.0, 59.0, 22.0 ],
									"text" : "pgmout 2"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 267.0, 400.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
									"hidden" : 1,
									"id" : "obj-75",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 782.0, 81.0, 70.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-74",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 752.0, 144.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-72",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 474.0, 172.0, 68.0, 22.0 ],
									"text" : "enabled $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-69",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 637.0, 146.0, 100.0, 20.0 ],
									"text" : "Activate modules"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-67",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 375.0, 91.0, 29.5, 22.0 ],
									"text" : "2"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-63",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 105.5, 91.0, 59.0, 22.0 ],
									"text" : "0.041667"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-60",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.phasepulse.ui.maxpat",
									"numinlets" : 2,
									"numoutlets" : 7,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "" ],
									"patching_rect" : [ 41.5, 390.0, 147.0, 108.0 ],
									"varname" : "ser.phasepulse.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-56",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 298.0, 91.0, 71.0, 22.0 ],
									"text" : "waveform 3"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-54",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 298.0, 61.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-52",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 262.5, 443.0, 29.5, 22.0 ],
									"text" : "24"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-51",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 306.0, 443.0, 29.5, 22.0 ],
									"text" : "60"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-38",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.addmul.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "float/listoflists", "", "" ],
									"patching_rect" : [ 219.0, 484.0, 106.0, 72.0 ],
									"varname" : "ser.addmul.ui",
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
									"id" : "obj-21",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.makenote.ui.maxpat",
									"numinlets" : 4,
									"numoutlets" : 2,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 41.5, 587.0, 375.0, 102.0 ],
									"varname" : "ser.makenote.ui",
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
									"id" : "obj-10",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.oscillator.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 205.0, 126.0, 146.0, 161.0 ],
									"varname" : "ser.oscillator.ui[1]",
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
									"name" : "ser.oscillator.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 42.0, 126.0, 146.0, 161.0 ],
									"varname" : "ser.oscillator.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
									"hidden" : 1,
									"id" : "obj-59",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 687.0, 305.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-65",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 687.0, 334.0, 29.5, 22.0 ],
									"text" : "55"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-64",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 613.0, 334.0, 29.5, 22.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-83",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 650.0, 334.0, 29.5, 22.0 ],
									"text" : "25"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
									"hidden" : 1,
									"id" : "obj-80",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 651.0, 375.0, 59.0, 22.0 ],
									"text" : "pgmout 1"
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
									"text" : "N1.1a. Pitch Arpeggiation"
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
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"hidden" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"hidden" : 1,
									"source" : [ "obj-13", 0 ]
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
									"destination" : [ "obj-74", 0 ],
									"hidden" : 1,
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
									"destination" : [ "obj-17", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"hidden" : 1,
									"order" : 1,
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
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 1 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 2 ],
									"hidden" : 1,
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 1 ],
									"hidden" : 1,
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-63", 0 ],
									"hidden" : 1,
									"order" : 2,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"hidden" : 1,
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 0 ],
									"hidden" : 1,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"source" : [ "obj-60", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 1 ],
									"hidden" : 1,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-80", 0 ],
									"hidden" : 1,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-80", 0 ],
									"hidden" : 1,
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 1 ],
									"hidden" : 1,
									"source" : [ "obj-67", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"hidden" : 1,
									"order" : 2,
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-72", 0 ],
									"hidden" : 1,
									"source" : [ "obj-74", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"hidden" : 1,
									"source" : [ "obj-75", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"hidden" : 1,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-80", 0 ],
									"hidden" : 1,
									"source" : [ "obj-83", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"hidden" : 1,
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-4374"
					}
,
					"patching_rect" : [ 23.0, 20.0, 51.0, 22.0 ],
					"text" : "p N1.1a",
					"varname" : "N1.1b"
				}

			}
 ],
		"lines" : [  ],
		"originid" : "pat-4084",
		"parameters" : 		{
			"obj-1::obj-10::obj-2" : [ "live.menu[9]", "live.menu", 0 ],
			"obj-1::obj-10::obj-21" : [ "live.toggle[3]", "live.toggle", 0 ],
			"obj-1::obj-10::obj-22::obj-1" : [ "live.numbox[14]", "live.numbox", 0 ],
			"obj-1::obj-10::obj-28" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-1::obj-10::obj-29" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-1::obj-10::obj-33" : [ "live.text[28]", "live.text[235]", 0 ],
			"obj-1::obj-10::obj-36::obj-1" : [ "live.numbox[15]", "live.numbox", 0 ],
			"obj-1::obj-10::obj-41" : [ "live.text[15]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-43" : [ "live.text[18]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-44" : [ "live.text[26]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-45" : [ "live.text[31]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-46" : [ "live.text[23]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-47" : [ "live.text[17]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-48" : [ "live.text[20]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-50" : [ "live.text[21]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-51" : [ "live.text[30]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-52" : [ "live.text[29]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-53" : [ "live.text[24]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-61" : [ "live.text[16]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-63" : [ "live.text[19]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-65::obj-1" : [ "live.numbox[16]", "live.numbox", 0 ],
			"obj-1::obj-10::obj-69" : [ "live.text[22]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-70" : [ "live.text[27]", "live.text[15]", 0 ],
			"obj-1::obj-10::obj-8" : [ "live.text[25]", "live.text[36]", 0 ],
			"obj-1::obj-10::obj-83" : [ "live.numbox[17]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-113" : [ "live.text[272]", "live.text", 0 ],
			"obj-1::obj-1::obj-34::obj-1" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-40" : [ "live.text", "live.text", 0 ],
			"obj-1::obj-1::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-1::obj-1::obj-48" : [ "live.text[2]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-87" : [ "live.gain~[3]", "live.gain~", 0 ],
			"obj-1::obj-1::obj-90" : [ "live.text[6]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-92" : [ "live.text[5]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-94" : [ "live.text[7]", "live.text[2]", 0 ],
			"obj-1::obj-21::obj-29::obj-1" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-1::obj-21::obj-33::obj-1" : [ "live.numbox[7]", "live.numbox", 0 ],
			"obj-1::obj-21::obj-34" : [ "live.toggle[12]", "live.toggle", 0 ],
			"obj-1::obj-21::obj-35" : [ "live.text[122]", "live.text[189]", 0 ],
			"obj-1::obj-21::obj-83" : [ "live.numbox[26]", "live.numbox", 0 ],
			"obj-1::obj-38::obj-22::obj-1" : [ "live.numbox[46]", "live.numbox", 0 ],
			"obj-1::obj-38::obj-24" : [ "live.menu[22]", "live.menu", 0 ],
			"obj-1::obj-38::obj-30" : [ "live.text[328]", "live.text[36]", 0 ],
			"obj-1::obj-38::obj-32" : [ "live.text[330]", "live.text[36]", 0 ],
			"obj-1::obj-38::obj-33" : [ "live.text[329]", "live.text[36]", 0 ],
			"obj-1::obj-38::obj-34" : [ "live.text[332]", "live.text[36]", 0 ],
			"obj-1::obj-38::obj-36" : [ "live.text[331]", "live.text[36]", 0 ],
			"obj-1::obj-38::obj-9::obj-1" : [ "live.numbox[45]", "live.numbox", 0 ],
			"obj-1::obj-5::obj-2" : [ "live.menu[8]", "live.menu", 0 ],
			"obj-1::obj-5::obj-21" : [ "live.toggle", "live.toggle", 0 ],
			"obj-1::obj-5::obj-22::obj-1" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-1::obj-5::obj-28" : [ "live.menu[18]", "live.menu", 0 ],
			"obj-1::obj-5::obj-29" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-1::obj-5::obj-33" : [ "live.text[235]", "live.text[235]", 0 ],
			"obj-1::obj-5::obj-36::obj-1" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-1::obj-5::obj-41" : [ "live.text[270]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-43" : [ "live.text[275]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-44" : [ "live.text[269]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-45" : [ "live.text[271]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-46" : [ "live.text[283]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-47" : [ "live.text[279]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-48" : [ "live.text[285]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-50" : [ "live.text[280]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-51" : [ "live.text[277]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-52" : [ "live.text[276]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-53" : [ "live.text[281]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-61" : [ "live.text[284]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-63" : [ "live.text[273]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-65::obj-1" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-1::obj-5::obj-69" : [ "live.text[274]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-70" : [ "live.text[230]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-8" : [ "live.text[282]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-83" : [ "live.numbox[13]", "live.numbox", 0 ],
			"obj-1::obj-60::obj-16::obj-1" : [ "live.numbox[47]", "live.numbox", 0 ],
			"obj-1::obj-60::obj-22" : [ "live.toggle[2]", "live.toggle", 0 ],
			"obj-1::obj-60::obj-26" : [ "live.text[56]", "live.text[189]", 0 ],
			"obj-1::obj-60::obj-83" : [ "live.numbox[92]", "live.numbox", 0 ],
			"obj-2::obj-1::obj-113" : [ "live.text[33]", "live.text", 0 ],
			"obj-2::obj-1::obj-34::obj-1" : [ "live.numbox[48]", "live.numbox", 0 ],
			"obj-2::obj-1::obj-40" : [ "live.text[32]", "live.text", 0 ],
			"obj-2::obj-1::obj-42" : [ "live.text[190]", "live.text", 0 ],
			"obj-2::obj-1::obj-48" : [ "live.text[187]", "live.text[2]", 0 ],
			"obj-2::obj-1::obj-87" : [ "live.gain~[5]", "live.gain~", 0 ],
			"obj-2::obj-1::obj-90" : [ "live.text[188]", "live.text[2]", 0 ],
			"obj-2::obj-1::obj-92" : [ "live.text[186]", "live.text[2]", 0 ],
			"obj-2::obj-1::obj-94" : [ "live.text[189]", "live.text[2]", 0 ],
			"obj-3::obj-10::obj-2" : [ "live.menu[23]", "live.menu", 0 ],
			"obj-3::obj-10::obj-21" : [ "live.toggle[6]", "live.toggle", 0 ],
			"obj-3::obj-10::obj-22::obj-1" : [ "live.numbox[23]", "live.numbox", 0 ],
			"obj-3::obj-10::obj-28" : [ "live.menu[19]", "live.menu", 0 ],
			"obj-3::obj-10::obj-29" : [ "live.menu[20]", "live.menu", 0 ],
			"obj-3::obj-10::obj-33" : [ "live.text[85]", "live.text[235]", 0 ],
			"obj-3::obj-10::obj-36::obj-1" : [ "live.numbox[24]", "live.numbox", 0 ],
			"obj-3::obj-10::obj-41" : [ "live.text[87]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-43" : [ "live.text[90]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-44" : [ "live.text[93]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-45" : [ "live.text[83]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-46" : [ "live.text[96]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-47" : [ "live.text[89]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-48" : [ "live.text[95]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-50" : [ "live.text[97]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-51" : [ "live.text[88]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-52" : [ "live.text[81]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-53" : [ "live.text[91]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-61" : [ "live.text[86]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-63" : [ "live.text[92]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-65::obj-1" : [ "live.numbox[27]", "live.numbox", 0 ],
			"obj-3::obj-10::obj-69" : [ "live.text[82]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-70" : [ "live.text[84]", "live.text[15]", 0 ],
			"obj-3::obj-10::obj-8" : [ "live.text[94]", "live.text[36]", 0 ],
			"obj-3::obj-10::obj-83" : [ "live.numbox[28]", "live.numbox", 0 ],
			"obj-3::obj-11::obj-22::obj-1" : [ "live.numbox[30]", "live.numbox", 0 ],
			"obj-3::obj-11::obj-24" : [ "live.menu[24]", "live.menu", 0 ],
			"obj-3::obj-11::obj-30" : [ "live.text[101]", "live.text[36]", 0 ],
			"obj-3::obj-11::obj-32" : [ "live.text[100]", "live.text[36]", 0 ],
			"obj-3::obj-11::obj-33" : [ "live.text[99]", "live.text[36]", 0 ],
			"obj-3::obj-11::obj-34" : [ "live.text[98]", "live.text[36]", 0 ],
			"obj-3::obj-11::obj-36" : [ "live.text[102]", "live.text[36]", 0 ],
			"obj-3::obj-11::obj-9::obj-1" : [ "live.numbox[29]", "live.numbox", 0 ],
			"obj-3::obj-1::obj-113" : [ "live.text[8]", "live.text", 0 ],
			"obj-3::obj-1::obj-34::obj-1" : [ "live.numbox[44]", "live.numbox", 0 ],
			"obj-3::obj-1::obj-40" : [ "live.text[9]", "live.text", 0 ],
			"obj-3::obj-1::obj-42" : [ "live.text[13]", "live.text", 0 ],
			"obj-3::obj-1::obj-48" : [ "live.text[10]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-87" : [ "live.gain~[4]", "live.gain~", 0 ],
			"obj-3::obj-1::obj-90" : [ "live.text[12]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-92" : [ "live.text[14]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-94" : [ "live.text[11]", "live.text[2]", 0 ],
			"obj-3::obj-21::obj-29::obj-1" : [ "live.numbox[52]", "live.numbox", 0 ],
			"obj-3::obj-21::obj-33::obj-1" : [ "live.numbox[53]", "live.numbox", 0 ],
			"obj-3::obj-21::obj-34" : [ "live.toggle[13]", "live.toggle", 0 ],
			"obj-3::obj-21::obj-35" : [ "live.text[103]", "live.text[189]", 0 ],
			"obj-3::obj-21::obj-83" : [ "live.numbox[93]", "live.numbox", 0 ],
			"obj-3::obj-39::obj-22::obj-1" : [ "live.numbox[95]", "live.numbox", 0 ],
			"obj-3::obj-39::obj-24" : [ "live.menu[25]", "live.menu", 0 ],
			"obj-3::obj-39::obj-30" : [ "live.text[104]", "live.text[36]", 0 ],
			"obj-3::obj-39::obj-32" : [ "live.text[108]", "live.text[36]", 0 ],
			"obj-3::obj-39::obj-33" : [ "live.text[105]", "live.text[36]", 0 ],
			"obj-3::obj-39::obj-34" : [ "live.text[107]", "live.text[36]", 0 ],
			"obj-3::obj-39::obj-36" : [ "live.text[106]", "live.text[36]", 0 ],
			"obj-3::obj-39::obj-9::obj-1" : [ "live.numbox[94]", "live.numbox", 0 ],
			"obj-3::obj-47" : [ "live.numbox", "live.numbox", 0 ],
			"obj-3::obj-53::obj-16::obj-1" : [ "live.numbox[54]", "live.numbox", 0 ],
			"obj-3::obj-53::obj-22" : [ "live.toggle[14]", "live.toggle", 0 ],
			"obj-3::obj-53::obj-26" : [ "live.text[109]", "live.text[189]", 0 ],
			"obj-3::obj-53::obj-83" : [ "live.numbox[55]", "live.numbox", 0 ],
			"obj-3::obj-55::obj-2" : [ "live.menu[27]", "live.menu", 0 ],
			"obj-3::obj-55::obj-21" : [ "live.toggle[15]", "live.toggle", 0 ],
			"obj-3::obj-55::obj-22::obj-1" : [ "live.numbox[56]", "live.numbox", 0 ],
			"obj-3::obj-55::obj-28" : [ "live.menu[21]", "live.menu", 0 ],
			"obj-3::obj-55::obj-29" : [ "live.menu[26]", "live.menu", 0 ],
			"obj-3::obj-55::obj-33" : [ "live.text[121]", "live.text[235]", 0 ],
			"obj-3::obj-55::obj-36::obj-1" : [ "live.numbox[57]", "live.numbox", 0 ],
			"obj-3::obj-55::obj-41" : [ "live.text[126]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-43" : [ "live.text[112]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-44" : [ "live.text[115]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-45" : [ "live.text[124]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-46" : [ "live.text[117]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-47" : [ "live.text[110]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-48" : [ "live.text[116]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-50" : [ "live.text[118]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-51" : [ "live.text[127]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-52" : [ "live.text[119]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-53" : [ "live.text[113]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-61" : [ "live.text[125]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-63" : [ "live.text[114]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-65::obj-1" : [ "live.numbox[58]", "live.numbox", 0 ],
			"obj-3::obj-55::obj-69" : [ "live.text[123]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-70" : [ "live.text[120]", "live.text[15]", 0 ],
			"obj-3::obj-55::obj-8" : [ "live.text[111]", "live.text[36]", 0 ],
			"obj-3::obj-55::obj-83" : [ "live.numbox[59]", "live.numbox", 0 ],
			"obj-3::obj-5::obj-2" : [ "live.menu[12]", "live.menu", 0 ],
			"obj-3::obj-5::obj-21" : [ "live.toggle[4]", "live.toggle", 0 ],
			"obj-3::obj-5::obj-22::obj-1" : [ "live.numbox[49]", "live.numbox", 0 ],
			"obj-3::obj-5::obj-28" : [ "live.menu[13]", "live.menu", 0 ],
			"obj-3::obj-5::obj-29" : [ "live.menu[14]", "live.menu", 0 ],
			"obj-3::obj-5::obj-33" : [ "live.text[37]", "live.text[235]", 0 ],
			"obj-3::obj-5::obj-36::obj-1" : [ "live.numbox[50]", "live.numbox", 0 ],
			"obj-3::obj-5::obj-41" : [ "live.text[35]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-43" : [ "live.text[34]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-44" : [ "live.text[36]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-45" : [ "live.text[43]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-46" : [ "live.text[39]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-47" : [ "live.text[38]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-48" : [ "live.text[57]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-50" : [ "live.text[58]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-51" : [ "live.text[61]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-52" : [ "live.text[40]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-53" : [ "live.text[62]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-61" : [ "live.text[41]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-63" : [ "live.text[42]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-65::obj-1" : [ "live.numbox[51]", "live.numbox", 0 ],
			"obj-3::obj-5::obj-69" : [ "live.text[59]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-70" : [ "live.text[60]", "live.text[15]", 0 ],
			"obj-3::obj-5::obj-8" : [ "live.text[63]", "live.text[36]", 0 ],
			"obj-3::obj-5::obj-83" : [ "live.numbox[18]", "live.numbox", 0 ],
			"obj-3::obj-73::obj-16::obj-1" : [ "live.numbox[60]", "live.numbox", 0 ],
			"obj-3::obj-73::obj-22" : [ "live.toggle[16]", "live.toggle", 0 ],
			"obj-3::obj-73::obj-26" : [ "live.text[128]", "live.text[189]", 0 ],
			"obj-3::obj-73::obj-83" : [ "live.numbox[61]", "live.numbox", 0 ],
			"obj-3::obj-74::obj-2" : [ "live.menu[29]", "live.menu", 0 ],
			"obj-3::obj-74::obj-21" : [ "live.toggle[17]", "live.toggle", 0 ],
			"obj-3::obj-74::obj-22::obj-1" : [ "live.numbox[62]", "live.numbox", 0 ],
			"obj-3::obj-74::obj-28" : [ "live.menu[30]", "live.menu", 0 ],
			"obj-3::obj-74::obj-29" : [ "live.menu[28]", "live.menu", 0 ],
			"obj-3::obj-74::obj-33" : [ "live.text[133]", "live.text[235]", 0 ],
			"obj-3::obj-74::obj-36::obj-1" : [ "live.numbox[63]", "live.numbox", 0 ],
			"obj-3::obj-74::obj-41" : [ "live.text[131]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-43" : [ "live.text[134]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-44" : [ "live.text[139]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-45" : [ "live.text[129]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-46" : [ "live.text[142]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-47" : [ "live.text[191]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-48" : [ "live.text[141]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-50" : [ "live.text[137]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-51" : [ "live.text[138]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-52" : [ "live.text[130]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-53" : [ "live.text[192]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-61" : [ "live.text[140]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-63" : [ "live.text[136]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-65::obj-1" : [ "live.numbox[64]", "live.numbox", 0 ],
			"obj-3::obj-74::obj-69" : [ "live.text[143]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-70" : [ "live.text[135]", "live.text[15]", 0 ],
			"obj-3::obj-74::obj-8" : [ "live.text[132]", "live.text[36]", 0 ],
			"obj-3::obj-74::obj-83" : [ "live.numbox[65]", "live.numbox", 0 ],
			"obj-3::obj-75::obj-29::obj-1" : [ "live.numbox[96]", "live.numbox", 0 ],
			"obj-3::obj-75::obj-33::obj-1" : [ "live.numbox[97]", "live.numbox", 0 ],
			"obj-3::obj-75::obj-34" : [ "live.toggle[18]", "live.toggle", 0 ],
			"obj-3::obj-75::obj-35" : [ "live.text[193]", "live.text[189]", 0 ],
			"obj-3::obj-75::obj-83" : [ "live.numbox[98]", "live.numbox", 0 ],
			"obj-3::obj-8::obj-2" : [ "live.menu[17]", "live.menu", 0 ],
			"obj-3::obj-8::obj-21" : [ "live.toggle[5]", "live.toggle", 0 ],
			"obj-3::obj-8::obj-22::obj-1" : [ "live.numbox[19]", "live.numbox", 0 ],
			"obj-3::obj-8::obj-28" : [ "live.menu[15]", "live.menu", 0 ],
			"obj-3::obj-8::obj-29" : [ "live.menu[16]", "live.menu", 0 ],
			"obj-3::obj-8::obj-33" : [ "live.text[80]", "live.text[235]", 0 ],
			"obj-3::obj-8::obj-36::obj-1" : [ "live.numbox[20]", "live.numbox", 0 ],
			"obj-3::obj-8::obj-41" : [ "live.text[71]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-43" : [ "live.text[77]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-44" : [ "live.text[64]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-45" : [ "live.text[69]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-46" : [ "live.text[66]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-47" : [ "live.text[78]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-48" : [ "live.text[74]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-50" : [ "live.text[67]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-51" : [ "live.text[79]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-52" : [ "live.text[72]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-53" : [ "live.text[68]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-61" : [ "live.text[73]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-63" : [ "live.text[65]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-65::obj-1" : [ "live.numbox[21]", "live.numbox", 0 ],
			"obj-3::obj-8::obj-69" : [ "live.text[70]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-70" : [ "live.text[75]", "live.text[15]", 0 ],
			"obj-3::obj-8::obj-8" : [ "live.text[76]", "live.text[36]", 0 ],
			"obj-3::obj-8::obj-83" : [ "live.numbox[22]", "live.numbox", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"parameter_overrides" : 			{
				"obj-1::obj-10::obj-2" : 				{
					"parameter_longname" : "live.menu[9]"
				}
,
				"obj-1::obj-10::obj-21" : 				{
					"parameter_longname" : "live.toggle[3]"
				}
,
				"obj-1::obj-10::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[14]"
				}
,
				"obj-1::obj-10::obj-28" : 				{
					"parameter_longname" : "live.menu[10]"
				}
,
				"obj-1::obj-10::obj-29" : 				{
					"parameter_longname" : "live.menu[11]"
				}
,
				"obj-1::obj-10::obj-33" : 				{
					"parameter_longname" : "live.text[28]"
				}
,
				"obj-1::obj-10::obj-36::obj-1" : 				{
					"parameter_longname" : "live.numbox[15]"
				}
,
				"obj-1::obj-10::obj-41" : 				{
					"parameter_longname" : "live.text[15]"
				}
,
				"obj-1::obj-10::obj-43" : 				{
					"parameter_longname" : "live.text[18]"
				}
,
				"obj-1::obj-10::obj-44" : 				{
					"parameter_longname" : "live.text[26]"
				}
,
				"obj-1::obj-10::obj-45" : 				{
					"parameter_longname" : "live.text[31]"
				}
,
				"obj-1::obj-10::obj-46" : 				{
					"parameter_longname" : "live.text[23]"
				}
,
				"obj-1::obj-10::obj-47" : 				{
					"parameter_longname" : "live.text[17]"
				}
,
				"obj-1::obj-10::obj-48" : 				{
					"parameter_longname" : "live.text[20]"
				}
,
				"obj-1::obj-10::obj-50" : 				{
					"parameter_longname" : "live.text[21]"
				}
,
				"obj-1::obj-10::obj-51" : 				{
					"parameter_longname" : "live.text[30]"
				}
,
				"obj-1::obj-10::obj-52" : 				{
					"parameter_longname" : "live.text[29]"
				}
,
				"obj-1::obj-10::obj-53" : 				{
					"parameter_longname" : "live.text[24]"
				}
,
				"obj-1::obj-10::obj-61" : 				{
					"parameter_longname" : "live.text[16]"
				}
,
				"obj-1::obj-10::obj-63" : 				{
					"parameter_longname" : "live.text[19]"
				}
,
				"obj-1::obj-10::obj-65::obj-1" : 				{
					"parameter_longname" : "live.numbox[16]"
				}
,
				"obj-1::obj-10::obj-69" : 				{
					"parameter_longname" : "live.text[22]"
				}
,
				"obj-1::obj-10::obj-70" : 				{
					"parameter_longname" : "live.text[27]"
				}
,
				"obj-1::obj-10::obj-8" : 				{
					"parameter_longname" : "live.text[25]"
				}
,
				"obj-1::obj-10::obj-83" : 				{
					"parameter_longname" : "live.numbox[17]"
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
				"obj-1::obj-21::obj-29::obj-1" : 				{
					"parameter_longname" : "live.numbox[6]"
				}
,
				"obj-1::obj-21::obj-33::obj-1" : 				{
					"parameter_longname" : "live.numbox[7]"
				}
,
				"obj-1::obj-38::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[46]"
				}
,
				"obj-1::obj-38::obj-9::obj-1" : 				{
					"parameter_longname" : "live.numbox[45]"
				}
,
				"obj-1::obj-5::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[2]"
				}
,
				"obj-1::obj-5::obj-36::obj-1" : 				{
					"parameter_longname" : "live.numbox[3]"
				}
,
				"obj-1::obj-5::obj-65::obj-1" : 				{
					"parameter_longname" : "live.numbox[4]"
				}
,
				"obj-1::obj-60::obj-16::obj-1" : 				{
					"parameter_longname" : "live.numbox[47]"
				}
,
				"obj-2::obj-1::obj-113" : 				{
					"parameter_longname" : "live.text[33]"
				}
,
				"obj-2::obj-1::obj-34::obj-1" : 				{
					"parameter_longname" : "live.numbox[48]"
				}
,
				"obj-2::obj-1::obj-40" : 				{
					"parameter_longname" : "live.text[32]"
				}
,
				"obj-2::obj-1::obj-87" : 				{
					"parameter_longname" : "live.gain~[5]"
				}
,
				"obj-3::obj-10::obj-2" : 				{
					"parameter_longname" : "live.menu[23]"
				}
,
				"obj-3::obj-10::obj-21" : 				{
					"parameter_longname" : "live.toggle[6]"
				}
,
				"obj-3::obj-10::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[23]"
				}
,
				"obj-3::obj-10::obj-28" : 				{
					"parameter_longname" : "live.menu[19]"
				}
,
				"obj-3::obj-10::obj-29" : 				{
					"parameter_longname" : "live.menu[20]"
				}
,
				"obj-3::obj-10::obj-33" : 				{
					"parameter_longname" : "live.text[85]"
				}
,
				"obj-3::obj-10::obj-36::obj-1" : 				{
					"parameter_longname" : "live.numbox[24]"
				}
,
				"obj-3::obj-10::obj-41" : 				{
					"parameter_longname" : "live.text[87]"
				}
,
				"obj-3::obj-10::obj-43" : 				{
					"parameter_longname" : "live.text[90]"
				}
,
				"obj-3::obj-10::obj-44" : 				{
					"parameter_longname" : "live.text[93]"
				}
,
				"obj-3::obj-10::obj-45" : 				{
					"parameter_longname" : "live.text[83]"
				}
,
				"obj-3::obj-10::obj-46" : 				{
					"parameter_longname" : "live.text[96]"
				}
,
				"obj-3::obj-10::obj-47" : 				{
					"parameter_longname" : "live.text[89]"
				}
,
				"obj-3::obj-10::obj-48" : 				{
					"parameter_longname" : "live.text[95]"
				}
,
				"obj-3::obj-10::obj-50" : 				{
					"parameter_longname" : "live.text[97]"
				}
,
				"obj-3::obj-10::obj-51" : 				{
					"parameter_longname" : "live.text[88]"
				}
,
				"obj-3::obj-10::obj-52" : 				{
					"parameter_longname" : "live.text[81]"
				}
,
				"obj-3::obj-10::obj-53" : 				{
					"parameter_longname" : "live.text[91]"
				}
,
				"obj-3::obj-10::obj-61" : 				{
					"parameter_longname" : "live.text[86]"
				}
,
				"obj-3::obj-10::obj-63" : 				{
					"parameter_longname" : "live.text[92]"
				}
,
				"obj-3::obj-10::obj-65::obj-1" : 				{
					"parameter_longname" : "live.numbox[27]"
				}
,
				"obj-3::obj-10::obj-69" : 				{
					"parameter_longname" : "live.text[82]"
				}
,
				"obj-3::obj-10::obj-70" : 				{
					"parameter_longname" : "live.text[84]"
				}
,
				"obj-3::obj-10::obj-8" : 				{
					"parameter_longname" : "live.text[94]"
				}
,
				"obj-3::obj-10::obj-83" : 				{
					"parameter_longname" : "live.numbox[28]"
				}
,
				"obj-3::obj-11::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[30]"
				}
,
				"obj-3::obj-11::obj-24" : 				{
					"parameter_longname" : "live.menu[24]"
				}
,
				"obj-3::obj-11::obj-30" : 				{
					"parameter_longname" : "live.text[101]"
				}
,
				"obj-3::obj-11::obj-32" : 				{
					"parameter_longname" : "live.text[100]"
				}
,
				"obj-3::obj-11::obj-33" : 				{
					"parameter_longname" : "live.text[99]"
				}
,
				"obj-3::obj-11::obj-34" : 				{
					"parameter_longname" : "live.text[98]"
				}
,
				"obj-3::obj-11::obj-36" : 				{
					"parameter_longname" : "live.text[102]"
				}
,
				"obj-3::obj-11::obj-9::obj-1" : 				{
					"parameter_longname" : "live.numbox[29]"
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
,
				"obj-3::obj-21::obj-29::obj-1" : 				{
					"parameter_longname" : "live.numbox[52]"
				}
,
				"obj-3::obj-21::obj-33::obj-1" : 				{
					"parameter_longname" : "live.numbox[53]"
				}
,
				"obj-3::obj-21::obj-34" : 				{
					"parameter_longname" : "live.toggle[13]"
				}
,
				"obj-3::obj-21::obj-35" : 				{
					"parameter_longname" : "live.text[103]"
				}
,
				"obj-3::obj-21::obj-83" : 				{
					"parameter_longname" : "live.numbox[93]"
				}
,
				"obj-3::obj-39::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[95]"
				}
,
				"obj-3::obj-39::obj-24" : 				{
					"parameter_longname" : "live.menu[25]"
				}
,
				"obj-3::obj-39::obj-30" : 				{
					"parameter_longname" : "live.text[104]"
				}
,
				"obj-3::obj-39::obj-32" : 				{
					"parameter_longname" : "live.text[108]"
				}
,
				"obj-3::obj-39::obj-33" : 				{
					"parameter_longname" : "live.text[105]"
				}
,
				"obj-3::obj-39::obj-34" : 				{
					"parameter_longname" : "live.text[107]"
				}
,
				"obj-3::obj-39::obj-36" : 				{
					"parameter_longname" : "live.text[106]"
				}
,
				"obj-3::obj-39::obj-9::obj-1" : 				{
					"parameter_longname" : "live.numbox[94]"
				}
,
				"obj-3::obj-53::obj-16::obj-1" : 				{
					"parameter_longname" : "live.numbox[54]"
				}
,
				"obj-3::obj-53::obj-22" : 				{
					"parameter_longname" : "live.toggle[14]"
				}
,
				"obj-3::obj-53::obj-26" : 				{
					"parameter_longname" : "live.text[109]"
				}
,
				"obj-3::obj-53::obj-83" : 				{
					"parameter_longname" : "live.numbox[55]"
				}
,
				"obj-3::obj-55::obj-2" : 				{
					"parameter_longname" : "live.menu[27]"
				}
,
				"obj-3::obj-55::obj-21" : 				{
					"parameter_longname" : "live.toggle[15]"
				}
,
				"obj-3::obj-55::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[56]"
				}
,
				"obj-3::obj-55::obj-28" : 				{
					"parameter_longname" : "live.menu[21]"
				}
,
				"obj-3::obj-55::obj-29" : 				{
					"parameter_longname" : "live.menu[26]"
				}
,
				"obj-3::obj-55::obj-33" : 				{
					"parameter_longname" : "live.text[121]"
				}
,
				"obj-3::obj-55::obj-36::obj-1" : 				{
					"parameter_longname" : "live.numbox[57]"
				}
,
				"obj-3::obj-55::obj-41" : 				{
					"parameter_longname" : "live.text[126]"
				}
,
				"obj-3::obj-55::obj-43" : 				{
					"parameter_longname" : "live.text[112]"
				}
,
				"obj-3::obj-55::obj-44" : 				{
					"parameter_longname" : "live.text[115]"
				}
,
				"obj-3::obj-55::obj-45" : 				{
					"parameter_longname" : "live.text[124]"
				}
,
				"obj-3::obj-55::obj-46" : 				{
					"parameter_longname" : "live.text[117]"
				}
,
				"obj-3::obj-55::obj-47" : 				{
					"parameter_longname" : "live.text[110]"
				}
,
				"obj-3::obj-55::obj-48" : 				{
					"parameter_longname" : "live.text[116]"
				}
,
				"obj-3::obj-55::obj-50" : 				{
					"parameter_longname" : "live.text[118]"
				}
,
				"obj-3::obj-55::obj-51" : 				{
					"parameter_longname" : "live.text[127]"
				}
,
				"obj-3::obj-55::obj-52" : 				{
					"parameter_longname" : "live.text[119]"
				}
,
				"obj-3::obj-55::obj-53" : 				{
					"parameter_longname" : "live.text[113]"
				}
,
				"obj-3::obj-55::obj-61" : 				{
					"parameter_longname" : "live.text[125]"
				}
,
				"obj-3::obj-55::obj-63" : 				{
					"parameter_longname" : "live.text[114]"
				}
,
				"obj-3::obj-55::obj-65::obj-1" : 				{
					"parameter_longname" : "live.numbox[58]"
				}
,
				"obj-3::obj-55::obj-69" : 				{
					"parameter_longname" : "live.text[123]"
				}
,
				"obj-3::obj-55::obj-70" : 				{
					"parameter_longname" : "live.text[120]"
				}
,
				"obj-3::obj-55::obj-8" : 				{
					"parameter_longname" : "live.text[111]"
				}
,
				"obj-3::obj-55::obj-83" : 				{
					"parameter_longname" : "live.numbox[59]"
				}
,
				"obj-3::obj-5::obj-2" : 				{
					"parameter_longname" : "live.menu[12]"
				}
,
				"obj-3::obj-5::obj-21" : 				{
					"parameter_longname" : "live.toggle[4]"
				}
,
				"obj-3::obj-5::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[49]"
				}
,
				"obj-3::obj-5::obj-28" : 				{
					"parameter_longname" : "live.menu[13]"
				}
,
				"obj-3::obj-5::obj-29" : 				{
					"parameter_longname" : "live.menu[14]"
				}
,
				"obj-3::obj-5::obj-33" : 				{
					"parameter_longname" : "live.text[37]"
				}
,
				"obj-3::obj-5::obj-36::obj-1" : 				{
					"parameter_longname" : "live.numbox[50]"
				}
,
				"obj-3::obj-5::obj-41" : 				{
					"parameter_longname" : "live.text[35]"
				}
,
				"obj-3::obj-5::obj-43" : 				{
					"parameter_longname" : "live.text[34]"
				}
,
				"obj-3::obj-5::obj-44" : 				{
					"parameter_longname" : "live.text[36]"
				}
,
				"obj-3::obj-5::obj-45" : 				{
					"parameter_longname" : "live.text[43]"
				}
,
				"obj-3::obj-5::obj-46" : 				{
					"parameter_longname" : "live.text[39]"
				}
,
				"obj-3::obj-5::obj-47" : 				{
					"parameter_longname" : "live.text[38]"
				}
,
				"obj-3::obj-5::obj-48" : 				{
					"parameter_longname" : "live.text[57]"
				}
,
				"obj-3::obj-5::obj-50" : 				{
					"parameter_longname" : "live.text[58]"
				}
,
				"obj-3::obj-5::obj-51" : 				{
					"parameter_longname" : "live.text[61]"
				}
,
				"obj-3::obj-5::obj-52" : 				{
					"parameter_longname" : "live.text[40]"
				}
,
				"obj-3::obj-5::obj-53" : 				{
					"parameter_longname" : "live.text[62]"
				}
,
				"obj-3::obj-5::obj-61" : 				{
					"parameter_longname" : "live.text[41]"
				}
,
				"obj-3::obj-5::obj-63" : 				{
					"parameter_longname" : "live.text[42]"
				}
,
				"obj-3::obj-5::obj-65::obj-1" : 				{
					"parameter_longname" : "live.numbox[51]"
				}
,
				"obj-3::obj-5::obj-69" : 				{
					"parameter_longname" : "live.text[59]"
				}
,
				"obj-3::obj-5::obj-70" : 				{
					"parameter_longname" : "live.text[60]"
				}
,
				"obj-3::obj-5::obj-8" : 				{
					"parameter_longname" : "live.text[63]"
				}
,
				"obj-3::obj-5::obj-83" : 				{
					"parameter_longname" : "live.numbox[18]"
				}
,
				"obj-3::obj-73::obj-16::obj-1" : 				{
					"parameter_longname" : "live.numbox[60]"
				}
,
				"obj-3::obj-73::obj-22" : 				{
					"parameter_longname" : "live.toggle[16]"
				}
,
				"obj-3::obj-73::obj-26" : 				{
					"parameter_longname" : "live.text[128]"
				}
,
				"obj-3::obj-73::obj-83" : 				{
					"parameter_longname" : "live.numbox[61]"
				}
,
				"obj-3::obj-74::obj-2" : 				{
					"parameter_longname" : "live.menu[29]"
				}
,
				"obj-3::obj-74::obj-21" : 				{
					"parameter_longname" : "live.toggle[17]"
				}
,
				"obj-3::obj-74::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[62]"
				}
,
				"obj-3::obj-74::obj-28" : 				{
					"parameter_longname" : "live.menu[30]"
				}
,
				"obj-3::obj-74::obj-29" : 				{
					"parameter_longname" : "live.menu[28]"
				}
,
				"obj-3::obj-74::obj-33" : 				{
					"parameter_longname" : "live.text[133]"
				}
,
				"obj-3::obj-74::obj-36::obj-1" : 				{
					"parameter_longname" : "live.numbox[63]"
				}
,
				"obj-3::obj-74::obj-41" : 				{
					"parameter_longname" : "live.text[131]"
				}
,
				"obj-3::obj-74::obj-43" : 				{
					"parameter_longname" : "live.text[134]"
				}
,
				"obj-3::obj-74::obj-44" : 				{
					"parameter_longname" : "live.text[139]"
				}
,
				"obj-3::obj-74::obj-45" : 				{
					"parameter_longname" : "live.text[129]"
				}
,
				"obj-3::obj-74::obj-46" : 				{
					"parameter_longname" : "live.text[142]"
				}
,
				"obj-3::obj-74::obj-47" : 				{
					"parameter_longname" : "live.text[191]"
				}
,
				"obj-3::obj-74::obj-48" : 				{
					"parameter_longname" : "live.text[141]"
				}
,
				"obj-3::obj-74::obj-50" : 				{
					"parameter_longname" : "live.text[137]"
				}
,
				"obj-3::obj-74::obj-51" : 				{
					"parameter_longname" : "live.text[138]"
				}
,
				"obj-3::obj-74::obj-52" : 				{
					"parameter_longname" : "live.text[130]"
				}
,
				"obj-3::obj-74::obj-53" : 				{
					"parameter_longname" : "live.text[192]"
				}
,
				"obj-3::obj-74::obj-61" : 				{
					"parameter_longname" : "live.text[140]"
				}
,
				"obj-3::obj-74::obj-63" : 				{
					"parameter_longname" : "live.text[136]"
				}
,
				"obj-3::obj-74::obj-65::obj-1" : 				{
					"parameter_longname" : "live.numbox[64]"
				}
,
				"obj-3::obj-74::obj-69" : 				{
					"parameter_longname" : "live.text[143]"
				}
,
				"obj-3::obj-74::obj-70" : 				{
					"parameter_longname" : "live.text[135]"
				}
,
				"obj-3::obj-74::obj-8" : 				{
					"parameter_longname" : "live.text[132]"
				}
,
				"obj-3::obj-74::obj-83" : 				{
					"parameter_longname" : "live.numbox[65]"
				}
,
				"obj-3::obj-75::obj-29::obj-1" : 				{
					"parameter_longname" : "live.numbox[96]"
				}
,
				"obj-3::obj-75::obj-33::obj-1" : 				{
					"parameter_longname" : "live.numbox[97]"
				}
,
				"obj-3::obj-75::obj-34" : 				{
					"parameter_longname" : "live.toggle[18]"
				}
,
				"obj-3::obj-75::obj-35" : 				{
					"parameter_longname" : "live.text[193]"
				}
,
				"obj-3::obj-75::obj-83" : 				{
					"parameter_longname" : "live.numbox[98]"
				}
,
				"obj-3::obj-8::obj-2" : 				{
					"parameter_longname" : "live.menu[17]"
				}
,
				"obj-3::obj-8::obj-21" : 				{
					"parameter_longname" : "live.toggle[5]"
				}
,
				"obj-3::obj-8::obj-22::obj-1" : 				{
					"parameter_longname" : "live.numbox[19]"
				}
,
				"obj-3::obj-8::obj-28" : 				{
					"parameter_longname" : "live.menu[15]"
				}
,
				"obj-3::obj-8::obj-29" : 				{
					"parameter_longname" : "live.menu[16]"
				}
,
				"obj-3::obj-8::obj-33" : 				{
					"parameter_longname" : "live.text[80]"
				}
,
				"obj-3::obj-8::obj-36::obj-1" : 				{
					"parameter_longname" : "live.numbox[20]"
				}
,
				"obj-3::obj-8::obj-41" : 				{
					"parameter_longname" : "live.text[71]"
				}
,
				"obj-3::obj-8::obj-43" : 				{
					"parameter_longname" : "live.text[77]"
				}
,
				"obj-3::obj-8::obj-44" : 				{
					"parameter_longname" : "live.text[64]"
				}
,
				"obj-3::obj-8::obj-45" : 				{
					"parameter_longname" : "live.text[69]"
				}
,
				"obj-3::obj-8::obj-46" : 				{
					"parameter_longname" : "live.text[66]"
				}
,
				"obj-3::obj-8::obj-47" : 				{
					"parameter_longname" : "live.text[78]"
				}
,
				"obj-3::obj-8::obj-48" : 				{
					"parameter_longname" : "live.text[74]"
				}
,
				"obj-3::obj-8::obj-50" : 				{
					"parameter_longname" : "live.text[67]"
				}
,
				"obj-3::obj-8::obj-51" : 				{
					"parameter_longname" : "live.text[79]"
				}
,
				"obj-3::obj-8::obj-52" : 				{
					"parameter_longname" : "live.text[72]"
				}
,
				"obj-3::obj-8::obj-53" : 				{
					"parameter_longname" : "live.text[68]"
				}
,
				"obj-3::obj-8::obj-61" : 				{
					"parameter_longname" : "live.text[73]"
				}
,
				"obj-3::obj-8::obj-63" : 				{
					"parameter_longname" : "live.text[65]"
				}
,
				"obj-3::obj-8::obj-65::obj-1" : 				{
					"parameter_longname" : "live.numbox[21]"
				}
,
				"obj-3::obj-8::obj-69" : 				{
					"parameter_longname" : "live.text[70]"
				}
,
				"obj-3::obj-8::obj-70" : 				{
					"parameter_longname" : "live.text[75]"
				}
,
				"obj-3::obj-8::obj-8" : 				{
					"parameter_longname" : "live.text[76]"
				}
,
				"obj-3::obj-8::obj-83" : 				{
					"parameter_longname" : "live.numbox[22]"
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
				"name" : "ser.addmul.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/generatives",
				"patcherrelativepath" : "../../patchers/generatives",
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
				"name" : "ser.phasepulse.mxo",
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
				"name" : "ser.oscillator.ui.maxpat",
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
