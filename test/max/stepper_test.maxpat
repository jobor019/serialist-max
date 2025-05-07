{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 9,
			"minor" : 0,
			"revision" : 3,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 34.0, 87.0, 2492.0, 1256.0 ],
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
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 26.0, 2492.0, 1230.0 ],
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
						"originid" : "pat-168"
					}
,
					"patching_rect" : [ 104.0, 21.0, 69.0, 22.0 ],
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"text" : "p R1.1.1a"
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
							"revision" : 3,
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
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 401.0, 163.0, 35.0, 22.0 ],
									"text" : "reset"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 24.0,
									"id" : "obj-76",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 125.0, 579.5, 631.0, 60.0 ],
									"text" : "TEST IN PROGRESS: NEITHER TITLE / TAB NAME NOR CONTENT IS RELEVANT AT THE MOMENT"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 206.0, 181.0, 24.0, 24.0 ]
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
									"name" : "ser.stepper.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 186.0, 250.0, 143.0, 131.0 ],
									"varname" : "ser.stepper.ui",
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
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-186"
					}
,
					"patching_rect" : [ 23.0, 20.0, 59.0, 22.0 ],
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"text" : "p N1.1b",
					"varname" : "N1.1b"
				}

			}
 ],
		"lines" : [  ],
		"originid" : "pat-166",
		"parameters" : 		{
			"obj-1::obj-1::obj-113" : [ "live.text[272]", "live.text", 0 ],
			"obj-1::obj-1::obj-40" : [ "live.text", "live.text", 0 ],
			"obj-1::obj-1::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-1::obj-1::obj-48" : [ "live.text[2]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-87" : [ "live.gain~[3]", "live.gain~", 0 ],
			"obj-1::obj-1::obj-90" : [ "live.text[6]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-92" : [ "live.text[5]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-94" : [ "live.text[7]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-95" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-1::obj-5::obj-1::obj-1" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-1::obj-5::obj-1::obj-13" : [ "live.text[29]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-1::obj-14" : [ "live.text[24]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-1::obj-15" : [ "live.text[34]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-1::obj-32" : [ "live.text[27]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-1::obj-33" : [ "live.text[68]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-1::obj-34" : [ "live.text[65]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-1::obj-42" : [ "live.text[31]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-44" : [ "live.text[35]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-46" : [ "live.text[25]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-5" : [ "live.menu[5]", "live.menu", 0 ],
			"obj-1::obj-5::obj-1::obj-52" : [ "live.text[33]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-55" : [ "live.text[22]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-57" : [ "live.text[32]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-61" : [ "live.text[70]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-62" : [ "live.text[26]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-63" : [ "live.text[64]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-64" : [ "live.text[30]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-65" : [ "live.text[66]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-69" : [ "live.text[67]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-70" : [ "live.text[69]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-71" : [ "live.text[23]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-1::obj-72" : [ "live.text[28]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-22" : [ "live.text[269]", "live.text[189]", 0 ],
			"obj-1::obj-5::obj-24" : [ "live.menu[24]", "live.menu", 0 ],
			"obj-1::obj-5::obj-39::obj-1" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-1::obj-5::obj-39::obj-13" : [ "live.text[42]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-39::obj-14" : [ "live.text[38]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-39::obj-15" : [ "live.text[36]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-39::obj-32" : [ "live.text[52]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-39::obj-33" : [ "live.text[48]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-39::obj-34" : [ "live.text[47]", "live.text[36]", 0 ],
			"obj-1::obj-5::obj-39::obj-42" : [ "live.text[40]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-44" : [ "live.text[56]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-46" : [ "live.text[37]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-5" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-1::obj-5::obj-39::obj-52" : [ "live.text[41]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-55" : [ "live.text[45]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-57" : [ "live.text[54]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-61" : [ "live.text[46]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-62" : [ "live.text[51]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-63" : [ "live.text[39]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-64" : [ "live.text[43]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-65" : [ "live.text[49]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-69" : [ "live.text[44]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-70" : [ "live.text[50]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-71" : [ "live.text[53]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-39::obj-72" : [ "live.text[55]", "live.text[15]", 0 ],
			"obj-1::obj-5::obj-82" : [ "live.text[271]", "live.text", 0 ],
			"obj-1::obj-5::obj-83" : [ "live.numbox[42]", "live.numbox", 0 ],
			"obj-3::obj-1::obj-113" : [ "live.text[8]", "live.text", 0 ],
			"obj-3::obj-1::obj-40" : [ "live.text[9]", "live.text", 0 ],
			"obj-3::obj-1::obj-42" : [ "live.text[13]", "live.text", 0 ],
			"obj-3::obj-1::obj-48" : [ "live.text[10]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-87" : [ "live.gain~[4]", "live.gain~", 0 ],
			"obj-3::obj-1::obj-90" : [ "live.text[12]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-92" : [ "live.text[14]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-94" : [ "live.text[11]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-95" : [ "live.numbox[2]", "live.numbox", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"parameter_overrides" : 			{
				"obj-1::obj-5::obj-39::obj-1" : 				{
					"parameter_longname" : "live.numbox[3]"
				}
,
				"obj-1::obj-5::obj-39::obj-13" : 				{
					"parameter_longname" : "live.text[42]"
				}
,
				"obj-1::obj-5::obj-39::obj-14" : 				{
					"parameter_longname" : "live.text[38]"
				}
,
				"obj-1::obj-5::obj-39::obj-15" : 				{
					"parameter_longname" : "live.text[36]"
				}
,
				"obj-1::obj-5::obj-39::obj-32" : 				{
					"parameter_longname" : "live.text[52]"
				}
,
				"obj-1::obj-5::obj-39::obj-33" : 				{
					"parameter_longname" : "live.text[48]"
				}
,
				"obj-1::obj-5::obj-39::obj-34" : 				{
					"parameter_longname" : "live.text[47]"
				}
,
				"obj-1::obj-5::obj-39::obj-42" : 				{
					"parameter_longname" : "live.text[40]"
				}
,
				"obj-1::obj-5::obj-39::obj-44" : 				{
					"parameter_longname" : "live.text[56]"
				}
,
				"obj-1::obj-5::obj-39::obj-46" : 				{
					"parameter_longname" : "live.text[37]"
				}
,
				"obj-1::obj-5::obj-39::obj-5" : 				{
					"parameter_longname" : "live.menu[1]"
				}
,
				"obj-1::obj-5::obj-39::obj-52" : 				{
					"parameter_longname" : "live.text[41]"
				}
,
				"obj-1::obj-5::obj-39::obj-55" : 				{
					"parameter_longname" : "live.text[45]"
				}
,
				"obj-1::obj-5::obj-39::obj-57" : 				{
					"parameter_longname" : "live.text[54]"
				}
,
				"obj-1::obj-5::obj-39::obj-61" : 				{
					"parameter_longname" : "live.text[46]"
				}
,
				"obj-1::obj-5::obj-39::obj-62" : 				{
					"parameter_longname" : "live.text[51]"
				}
,
				"obj-1::obj-5::obj-39::obj-63" : 				{
					"parameter_longname" : "live.text[39]"
				}
,
				"obj-1::obj-5::obj-39::obj-64" : 				{
					"parameter_longname" : "live.text[43]"
				}
,
				"obj-1::obj-5::obj-39::obj-65" : 				{
					"parameter_longname" : "live.text[49]"
				}
,
				"obj-1::obj-5::obj-39::obj-69" : 				{
					"parameter_longname" : "live.text[44]"
				}
,
				"obj-1::obj-5::obj-39::obj-70" : 				{
					"parameter_longname" : "live.text[50]"
				}
,
				"obj-1::obj-5::obj-39::obj-71" : 				{
					"parameter_longname" : "live.text[53]"
				}
,
				"obj-1::obj-5::obj-39::obj-72" : 				{
					"parameter_longname" : "live.text[55]"
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
				"obj-3::obj-1::obj-95" : 				{
					"parameter_longname" : "live.numbox[2]"
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
				"name" : "ser.corpus.variable.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers",
				"patcherrelativepath" : "../../patchers",
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
				"name" : "ser.slidermapping.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.stepper.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers",
				"patcherrelativepath" : "../../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.transport.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.transport.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers",
				"patcherrelativepath" : "../../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
