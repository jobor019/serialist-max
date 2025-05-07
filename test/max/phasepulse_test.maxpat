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
		"rect" : [ 34.0, 87.0, 1810.0, 1256.0 ],
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
						"rect" : [ 0.0, 26.0, 1810.0, 1230.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontsize" : 24.0,
									"id" : "obj-76",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 151.0, 723.0, 631.0, 60.0 ],
									"text" : "TEST IN PROGRESS: NEITHER TITLE / TAB NAME NOR CONTENT IS RELEVANT AT THE MOMENT",
									"textcolor" : [ 0.996078431372549, 0.423529411764706, 0.423529411764706, 1.0 ]
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
						"originid" : "pat-6"
					}
,
					"patching_rect" : [ 104.0, 21.0, 69.0, 22.0 ],
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
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 34.0, 113.0, 1810.0, 1230.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 521.0, 350.0, 29.5, 22.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 280.0, 356.0, 29.5, 22.0 ],
									"text" : "null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 514.0, 326.0, 89.0, 22.0 ],
									"text" : "0.5 -0.5 0.5 0.5"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 418.0, 103.0, 29.5, 22.0 ],
									"text" : "-2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-52",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 487.0, 225.5, 135.0, 22.0 ],
									"text" : "0.33 0.33 0.33 0.5 0.5 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 507.0, 267.0, 79.0, 22.0 ],
									"text" : "0.25 0.25 0.5"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 514.0, 302.0, 59.0, 22.0 ],
									"text" : "0.33 0.67"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-47",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.scope.ui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 2,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 477.0, 397.0, 89.0, 42.0 ],
									"varname" : "ser.scope.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 320.0, 332.0, 84.0, 22.0 ],
									"text" : "ser.phasemap"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 275.0, 592.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 383.5, 103.0, 29.5, 22.0 ],
									"text" : "-1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 442.0, 526.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 364.0, 540.0, 32.0, 22.0 ],
									"text" : "gate"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 323.0, 470.0, 29.5, 22.0 ],
									"text" : "t l l"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 355.0, 506.0, 29.5, 22.0 ],
									"text" : "> 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-85",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
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
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-6",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 26.5, 121.0, 35.0, 22.0 ],
													"text" : "1000"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-4",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 26.5, 20.0, 29.0, 20.0 ],
													"text" : "freq"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 26.5, 84.0, 54.0, 22.0 ],
													"text" : "sel \\#1 0"
												}

											}
, 											{
												"box" : 												{
													"color" : [ 0.8207178116, 0.0, 0.7634038329, 1.0 ],
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 26.5, 48.0, 77.0, 22.0 ],
													"text" : "loadmess #1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-73",
													"maxclass" : "button",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 132.0, 108.0, 24.0, 24.0 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-104",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "", "int", "int" ],
													"patching_rect" : [ 132.0, 75.0, 48.0, 22.0 ],
													"text" : "change"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-77",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 50.0, 265.0, 121.0, 22.0 ],
													"text" : "gate~ @ramptime 50"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-78",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 50.0, 205.0, 101.0, 22.0 ],
													"text" : "*~ 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-79",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 132.0, 141.0, 52.0, 22.0 ],
													"text" : "1., 0. 50"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-93",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 2,
													"outlettype" : [ "signal", "bang" ],
													"patching_rect" : [ 132.0, 168.0, 45.0, 22.0 ],
													"text" : "curve~"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-36",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 50.0, 168.0, 66.0, 22.0 ],
													"text" : "cycle~ 300"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-80",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 212.0, 15.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-81",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 132.0, 15.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-83",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 50.0, 347.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-104", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-36", 0 ],
													"source" : [ "obj-2", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"source" : [ "obj-2", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-78", 0 ],
													"source" : [ "obj-36", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-36", 0 ],
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-79", 0 ],
													"source" : [ "obj-73", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-83", 0 ],
													"source" : [ "obj-77", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-77", 1 ],
													"source" : [ "obj-78", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-93", 0 ],
													"source" : [ "obj-79", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-77", 0 ],
													"midpoints" : [ 221.5, 261.1953125, 59.5, 261.1953125 ],
													"source" : [ "obj-80", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-104", 0 ],
													"source" : [ "obj-81", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-78", 1 ],
													"source" : [ "obj-93", 0 ]
												}

											}
 ],
										"originid" : "pat-34"
									}
,
									"patching_rect" : [ 320.0, 587.0, 50.0, 22.0 ],
									"text" : "p sonify"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 289.0, 433.0, 50.0, 22.0 ],
									"text" : "197"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-9",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.phase.ui.maxpat",
									"numinlets" : 3,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 320.0, 156.0, 146.0, 161.0 ],
									"varname" : "ser.phase.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 320.0, 384.5, 116.0, 22.0 ],
									"text" : "ser.phasepulse"
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
									"patching_rect" : [ 155.0, 785.0, 631.0, 60.0 ],
									"text" : "TEST IN PROGRESS: NEITHER TITLE / TAB NAME NOR CONTENT IS RELEVANT AT THE MOMENT",
									"textcolor" : [ 0.996078431372549, 0.423529411764706, 0.423529411764706, 1.0 ]
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
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-25", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 1 ],
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"order" : 1,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-85", 0 ],
									"order" : 0,
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
									"destination" : [ "obj-85", 1 ],
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 1 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 1,
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"order" : 0,
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 1 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 1 ],
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 1 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 1 ],
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 1 ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 1 ],
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 1 ],
									"order" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"order" : 1,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 1 ],
									"order" : 0,
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"order" : 1,
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-24"
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
			"obj-1::obj-1::obj-113" : [ "live.text[272]", "live.text", 0 ],
			"obj-1::obj-1::obj-40" : [ "live.text", "live.text", 0 ],
			"obj-1::obj-1::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-1::obj-1::obj-48" : [ "live.text[2]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-87" : [ "live.gain~[3]", "live.gain~", 0 ],
			"obj-1::obj-1::obj-90" : [ "live.text[6]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-92" : [ "live.text[5]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-94" : [ "live.text[7]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-95" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-1::obj-9::obj-2" : [ "live.menu[8]", "live.menu", 0 ],
			"obj-1::obj-9::obj-21" : [ "live.toggle", "live.toggle", 0 ],
			"obj-1::obj-9::obj-28" : [ "live.menu[18]", "live.menu", 0 ],
			"obj-1::obj-9::obj-29" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-1::obj-9::obj-32::obj-1" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-1::obj-9::obj-32::obj-13" : [ "live.text[17]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-32::obj-14" : [ "live.text[16]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-32::obj-15" : [ "live.text[15]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-32::obj-32" : [ "live.text[20]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-32::obj-33" : [ "live.text[19]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-32::obj-34" : [ "live.text[18]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-32::obj-42" : [ "live.text[21]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-44" : [ "live.text[23]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-46" : [ "live.text[24]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-5" : [ "live.menu[21]", "live.menu", 0 ],
			"obj-1::obj-9::obj-32::obj-52" : [ "live.text[25]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-55" : [ "live.text[26]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-57" : [ "live.text[22]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-61" : [ "live.text[27]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-62" : [ "live.text[28]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-63" : [ "live.text[29]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-64" : [ "live.text[30]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-65" : [ "live.text[31]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-69" : [ "live.text[32]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-70" : [ "live.text[33]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-71" : [ "live.text[34]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-32::obj-72" : [ "live.text[35]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-33" : [ "live.text[235]", "live.text[235]", 0 ],
			"obj-1::obj-9::obj-41" : [ "live.text[270]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-43" : [ "live.text[275]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-44" : [ "live.text[269]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-45" : [ "live.text[271]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-46" : [ "live.text[283]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-47" : [ "live.text[279]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-48" : [ "live.text[285]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-50" : [ "live.text[280]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-51" : [ "live.text[277]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-52" : [ "live.text[276]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-53" : [ "live.text[281]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-1" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-1::obj-9::obj-5::obj-13" : [ "live.text[57]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-5::obj-14" : [ "live.text[72]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-5::obj-15" : [ "live.text[67]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-5::obj-32" : [ "live.text[74]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-5::obj-33" : [ "live.text[68]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-5::obj-34" : [ "live.text[64]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-5::obj-42" : [ "live.text[73]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-44" : [ "live.text[58]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-46" : [ "live.text[61]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-5" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-1::obj-9::obj-5::obj-52" : [ "live.text[65]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-55" : [ "live.text[69]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-57" : [ "live.text[76]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-61" : [ "live.text[71]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-62" : [ "live.text[75]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-63" : [ "live.text[77]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-64" : [ "live.text[60]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-65" : [ "live.text[63]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-69" : [ "live.text[59]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-70" : [ "live.text[62]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-71" : [ "live.text[66]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-5::obj-72" : [ "live.text[70]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-61" : [ "live.text[284]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-63" : [ "live.text[273]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-69" : [ "live.text[274]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-1" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-1::obj-9::obj-6::obj-13" : [ "live.text[53]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-6::obj-14" : [ "live.text[52]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-6::obj-15" : [ "live.text[51]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-6::obj-32" : [ "live.text[56]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-6::obj-33" : [ "live.text[55]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-6::obj-34" : [ "live.text[54]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-6::obj-42" : [ "live.text[36]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-44" : [ "live.text[38]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-46" : [ "live.text[39]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-5" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-1::obj-9::obj-6::obj-52" : [ "live.text[40]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-55" : [ "live.text[41]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-57" : [ "live.text[37]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-61" : [ "live.text[42]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-62" : [ "live.text[43]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-63" : [ "live.text[44]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-64" : [ "live.text[45]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-65" : [ "live.text[46]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-69" : [ "live.text[47]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-70" : [ "live.text[48]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-71" : [ "live.text[49]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-6::obj-72" : [ "live.text[50]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-70" : [ "live.text[230]", "live.text[15]", 0 ],
			"obj-1::obj-9::obj-8" : [ "live.text[282]", "live.text[36]", 0 ],
			"obj-1::obj-9::obj-83" : [ "live.numbox[13]", "live.numbox", 0 ],
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
				"obj-1::obj-9::obj-32::obj-1" : 				{
					"parameter_longname" : "live.numbox[3]"
				}
,
				"obj-1::obj-9::obj-32::obj-13" : 				{
					"parameter_longname" : "live.text[17]"
				}
,
				"obj-1::obj-9::obj-32::obj-14" : 				{
					"parameter_longname" : "live.text[16]"
				}
,
				"obj-1::obj-9::obj-32::obj-15" : 				{
					"parameter_longname" : "live.text[15]"
				}
,
				"obj-1::obj-9::obj-32::obj-32" : 				{
					"parameter_longname" : "live.text[20]"
				}
,
				"obj-1::obj-9::obj-32::obj-33" : 				{
					"parameter_longname" : "live.text[19]"
				}
,
				"obj-1::obj-9::obj-32::obj-34" : 				{
					"parameter_longname" : "live.text[18]"
				}
,
				"obj-1::obj-9::obj-32::obj-42" : 				{
					"parameter_longname" : "live.text[21]"
				}
,
				"obj-1::obj-9::obj-32::obj-44" : 				{
					"parameter_longname" : "live.text[23]"
				}
,
				"obj-1::obj-9::obj-32::obj-46" : 				{
					"parameter_longname" : "live.text[24]"
				}
,
				"obj-1::obj-9::obj-32::obj-5" : 				{
					"parameter_longname" : "live.menu[21]"
				}
,
				"obj-1::obj-9::obj-32::obj-52" : 				{
					"parameter_longname" : "live.text[25]"
				}
,
				"obj-1::obj-9::obj-32::obj-55" : 				{
					"parameter_longname" : "live.text[26]"
				}
,
				"obj-1::obj-9::obj-32::obj-57" : 				{
					"parameter_longname" : "live.text[22]"
				}
,
				"obj-1::obj-9::obj-32::obj-61" : 				{
					"parameter_longname" : "live.text[27]"
				}
,
				"obj-1::obj-9::obj-32::obj-62" : 				{
					"parameter_longname" : "live.text[28]"
				}
,
				"obj-1::obj-9::obj-32::obj-63" : 				{
					"parameter_longname" : "live.text[29]"
				}
,
				"obj-1::obj-9::obj-32::obj-64" : 				{
					"parameter_longname" : "live.text[30]"
				}
,
				"obj-1::obj-9::obj-32::obj-65" : 				{
					"parameter_longname" : "live.text[31]"
				}
,
				"obj-1::obj-9::obj-32::obj-69" : 				{
					"parameter_longname" : "live.text[32]"
				}
,
				"obj-1::obj-9::obj-32::obj-70" : 				{
					"parameter_longname" : "live.text[33]"
				}
,
				"obj-1::obj-9::obj-32::obj-71" : 				{
					"parameter_longname" : "live.text[34]"
				}
,
				"obj-1::obj-9::obj-32::obj-72" : 				{
					"parameter_longname" : "live.text[35]"
				}
,
				"obj-1::obj-9::obj-5::obj-1" : 				{
					"parameter_longname" : "live.numbox[5]"
				}
,
				"obj-1::obj-9::obj-5::obj-13" : 				{
					"parameter_longname" : "live.text[57]"
				}
,
				"obj-1::obj-9::obj-5::obj-14" : 				{
					"parameter_longname" : "live.text[72]"
				}
,
				"obj-1::obj-9::obj-5::obj-15" : 				{
					"parameter_longname" : "live.text[67]"
				}
,
				"obj-1::obj-9::obj-5::obj-32" : 				{
					"parameter_longname" : "live.text[74]"
				}
,
				"obj-1::obj-9::obj-5::obj-33" : 				{
					"parameter_longname" : "live.text[68]"
				}
,
				"obj-1::obj-9::obj-5::obj-34" : 				{
					"parameter_longname" : "live.text[64]"
				}
,
				"obj-1::obj-9::obj-5::obj-42" : 				{
					"parameter_longname" : "live.text[73]"
				}
,
				"obj-1::obj-9::obj-5::obj-44" : 				{
					"parameter_longname" : "live.text[58]"
				}
,
				"obj-1::obj-9::obj-5::obj-46" : 				{
					"parameter_longname" : "live.text[61]"
				}
,
				"obj-1::obj-9::obj-5::obj-5" : 				{
					"parameter_longname" : "live.menu[2]"
				}
,
				"obj-1::obj-9::obj-5::obj-52" : 				{
					"parameter_longname" : "live.text[65]"
				}
,
				"obj-1::obj-9::obj-5::obj-55" : 				{
					"parameter_longname" : "live.text[69]"
				}
,
				"obj-1::obj-9::obj-5::obj-57" : 				{
					"parameter_longname" : "live.text[76]"
				}
,
				"obj-1::obj-9::obj-5::obj-61" : 				{
					"parameter_longname" : "live.text[71]"
				}
,
				"obj-1::obj-9::obj-5::obj-62" : 				{
					"parameter_longname" : "live.text[75]"
				}
,
				"obj-1::obj-9::obj-5::obj-63" : 				{
					"parameter_longname" : "live.text[77]"
				}
,
				"obj-1::obj-9::obj-5::obj-64" : 				{
					"parameter_longname" : "live.text[60]"
				}
,
				"obj-1::obj-9::obj-5::obj-65" : 				{
					"parameter_longname" : "live.text[63]"
				}
,
				"obj-1::obj-9::obj-5::obj-69" : 				{
					"parameter_longname" : "live.text[59]"
				}
,
				"obj-1::obj-9::obj-5::obj-70" : 				{
					"parameter_longname" : "live.text[62]"
				}
,
				"obj-1::obj-9::obj-5::obj-71" : 				{
					"parameter_longname" : "live.text[66]"
				}
,
				"obj-1::obj-9::obj-5::obj-72" : 				{
					"parameter_longname" : "live.text[70]"
				}
,
				"obj-1::obj-9::obj-6::obj-1" : 				{
					"parameter_longname" : "live.numbox[4]"
				}
,
				"obj-1::obj-9::obj-6::obj-13" : 				{
					"parameter_longname" : "live.text[53]"
				}
,
				"obj-1::obj-9::obj-6::obj-14" : 				{
					"parameter_longname" : "live.text[52]"
				}
,
				"obj-1::obj-9::obj-6::obj-15" : 				{
					"parameter_longname" : "live.text[51]"
				}
,
				"obj-1::obj-9::obj-6::obj-32" : 				{
					"parameter_longname" : "live.text[56]"
				}
,
				"obj-1::obj-9::obj-6::obj-33" : 				{
					"parameter_longname" : "live.text[55]"
				}
,
				"obj-1::obj-9::obj-6::obj-34" : 				{
					"parameter_longname" : "live.text[54]"
				}
,
				"obj-1::obj-9::obj-6::obj-42" : 				{
					"parameter_longname" : "live.text[36]"
				}
,
				"obj-1::obj-9::obj-6::obj-44" : 				{
					"parameter_longname" : "live.text[38]"
				}
,
				"obj-1::obj-9::obj-6::obj-46" : 				{
					"parameter_longname" : "live.text[39]"
				}
,
				"obj-1::obj-9::obj-6::obj-5" : 				{
					"parameter_longname" : "live.menu[1]"
				}
,
				"obj-1::obj-9::obj-6::obj-52" : 				{
					"parameter_longname" : "live.text[40]"
				}
,
				"obj-1::obj-9::obj-6::obj-55" : 				{
					"parameter_longname" : "live.text[41]"
				}
,
				"obj-1::obj-9::obj-6::obj-57" : 				{
					"parameter_longname" : "live.text[37]"
				}
,
				"obj-1::obj-9::obj-6::obj-61" : 				{
					"parameter_longname" : "live.text[42]"
				}
,
				"obj-1::obj-9::obj-6::obj-62" : 				{
					"parameter_longname" : "live.text[43]"
				}
,
				"obj-1::obj-9::obj-6::obj-63" : 				{
					"parameter_longname" : "live.text[44]"
				}
,
				"obj-1::obj-9::obj-6::obj-64" : 				{
					"parameter_longname" : "live.text[45]"
				}
,
				"obj-1::obj-9::obj-6::obj-65" : 				{
					"parameter_longname" : "live.text[46]"
				}
,
				"obj-1::obj-9::obj-6::obj-69" : 				{
					"parameter_longname" : "live.text[47]"
				}
,
				"obj-1::obj-9::obj-6::obj-70" : 				{
					"parameter_longname" : "live.text[48]"
				}
,
				"obj-1::obj-9::obj-6::obj-71" : 				{
					"parameter_longname" : "live.text[49]"
				}
,
				"obj-1::obj-9::obj-6::obj-72" : 				{
					"parameter_longname" : "live.text[50]"
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
				"name" : "ser.phase.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.phasepulse.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.transport.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.corpus.variable.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/ui",
				"patcherrelativepath" : "../../patchers/ui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.phase.ui.maxpat",
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
				"name" : "ser.scope.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/view",
				"patcherrelativepath" : "../../patchers/view",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
