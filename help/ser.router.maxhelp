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
		"subpatcher_template" : "serialist_help",
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-7",
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
						"openrect" : [ 0.0, 0.0, 1040.0, 740.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"showontab" : 1,
						"integercoordinates" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 17.0, 281.0, 70.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.1,
									"bubbleside" : 2,
									"id" : "obj-22",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 61.0, 355.0, 59.0, 66.0 ],
									"text" : "switch between inputs"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.0, 428.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 189.0, 429.0, 57.0, 22.0 ],
									"text" : "ser.pulse"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-36",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 145.0, 70.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.0, 175.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 0,
									"patching_rect" : [ 327.0, 574.0, 49.0, 22.0 ],
									"text" : "noteout"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-32",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.scope.ui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 2,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 214.0, 319.0, 87.0, 41.0 ],
									"varname" : "ser.scope.ui[2]",
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
									"id" : "obj-30",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.scope.ui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 2,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 388.0, 319.0, 87.0, 41.0 ],
									"varname" : "ser.scope.ui[1]",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-29",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 207.0, 68.0, 22.0 ],
									"text" : "enabled $1"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-26",
									"lockeddragscroll" : 0,
									"lockedsize" : 0,
									"maxclass" : "bpatcher",
									"name" : "ser.pulseview.ui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 0,
									"offset" : [ 0.0, 0.0 ],
									"patching_rect" : [ 202.0, 505.0, 83.0, 20.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
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
													"id" : "obj-23",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 50.0, 175.0, 68.0, 22.0 ],
													"text" : "ser.op + 48"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-22",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 50.0, 137.0, 66.0, 22.0 ],
													"text" : "ser.op * 24"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-21",
													"maxclass" : "newobj",
													"numinlets" : 4,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 50.0, 100.0, 124.0, 22.0 ],
													"text" : "ser.random @mode 3"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-24",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 50.0, 257.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-22", 0 ],
													"source" : [ "obj-21", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-23", 0 ],
													"source" : [ "obj-22", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"source" : [ "obj-23", 0 ]
												}

											}
 ],
										"originid" : "pat-754"
									}
,
									"patching_rect" : [ 370.0, 466.0, 102.0, 22.0 ],
									"text" : "p pitch_generator"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 327.0, 525.0, 148.0, 22.0 ],
									"text" : "ser.makenote"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 189.0, 250.0, 119.0, 22.0 ],
									"text" : "ser.phase @period 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 466.0, 296.0, 22.0 ],
									"text" : "ser.router 2 1 pulse"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 166.0, 139.0, 383.0, 60.0 ],
									"text" : "The third argument sets the ser.router to handle pulses. Technically, it's fully possible to handle pulses with the default mode too. The main distinction is that the pulse mode will always handle flushing correctly if the routing changes while a pulse on is held in a particular voice"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 362.0, 281.0, 94.0, 22.0 ],
									"text" : "ser.phasemap 7"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 362.0, 250.0, 119.0, 22.0 ],
									"text" : "ser.phase @period 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 327.0, 429.0, 57.0, 22.0 ],
									"text" : "ser.pulse"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "ser.router" ],
									"maxclass" : "jsui",
									"nofsaa" : 1,
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 895.0, 120.0 ]
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
									"numinlets" : 3,
									"numoutlets" : 9,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "", "", "signal" ],
									"patching_rect" : [ 776.0, 196.0, 178.0, 269.0 ],
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
									"id" : "obj-27",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 81.0, 428.0, 20.0, 20.0 ],
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
									"id" : "obj-24",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 81.0, 177.0, 20.0, 20.0 ],
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
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.9, 0.65, 0.05, 1.0 ],
									"fontface" : 1,
									"hint" : "",
									"id" : "obj-6",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 746.0, 223.0, 20.0, 20.0 ],
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
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"order" : 0,
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"midpoints" : [ 336.5, 496.5, 211.5, 496.5 ],
									"order" : 1,
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"order" : 1,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"order" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"hidden" : 1,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 1 ],
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"midpoints" : [ 59.5, 236.5, 198.5, 236.5 ],
									"order" : 2,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"midpoints" : [ 59.5, 236.5, 371.5, 236.5 ],
									"order" : 0,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 2 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"hidden" : 1,
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"order" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"order" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-730"
					}
,
					"patching_rect" : [ 610.0, 20.0, 62.0, 22.0 ],
					"text" : "p pulses",
					"varname" : "basic[6]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
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
						"openrect" : [ 0.0, 0.0, 1040.0, 740.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"showontab" : 1,
						"integercoordinates" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-29",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 58.0, 433.0, 320.0, 60.0 ],
									"text" : "This can be useful if we don't want to decide beforehand how many voices we're receiving, e.g. index 4 will always correspond to the 4th voice, while 0.4 will differ depending on whether we have 2, 5 or 20 incoming voices"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 2,
									"id" : "obj-28",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 378.0, 228.0, 56.0, 39.0 ],
									"text" : "fraction"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 2,
									"id" : "obj-27",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 69.0, 232.0, 46.0, 39.0 ],
									"text" : "index"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 389.0, 295.0, 35.0, 22.0 ],
									"text" : "0 0.2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 111.0, 276.0, 30.0, 22.0 ],
									"text" : "0 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 560.0, 363.0, 72.0, 29.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 2,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 436.0, 364.0, 119.0, 22.0 ],
									"text" : "null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 373.0, 271.0, 95.0, 22.0 ],
									"text" : "0 0.2 0.4 0.4 0.4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 613.0, 272.0, 43.0, 20.0 ],
									"text" : "values"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 546.0, 196.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 546.0, 228.0, 99.0, 22.0 ],
									"text" : "0 10 20 30 40 50"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-17",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 546.0, 260.0, 58.0, 31.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 373.0, 320.0, 192.0, 35.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 1 1 @mode 0 @mapping_trigger 1 @index 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 227.0, 360.0, 72.0, 29.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 5,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 136.0, 360.0, 89.0, 22.0 ],
									"text" : "null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.0, 276.0, 55.0, 22.0 ],
									"text" : "0 2 4 4 4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 294.0, 272.0, 43.0, 20.0 ],
									"text" : "values"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 227.0, 196.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 227.0, 228.0, 82.0, 22.0 ],
									"text" : "0 10 20 30 40"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-24",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 227.0, 260.0, 58.0, 31.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 5,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 54.0, 143.0, 201.0, 47.0 ],
									"text" : "All modes support either indices or fractions as input. use @index 0 to specifcy fractions instead"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-144",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 54.0, 320.0, 247.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 1 1 @mode 0 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "ser.router" ],
									"maxclass" : "jsui",
									"nofsaa" : 1,
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 895.0, 120.0 ]
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
									"numinlets" : 3,
									"numoutlets" : 9,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "", "", "signal" ],
									"patching_rect" : [ 776.0, 196.0, 178.0, 269.0 ],
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
									"id" : "obj-6",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 746.0, 223.0, 20.0, 20.0 ],
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
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 1 ],
									"midpoints" : [ 291.5, 351.0, 215.5, 351.0 ],
									"order" : 1,
									"source" : [ "obj-144", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"midpoints" : [ 291.5, 351.0, 236.5, 351.0 ],
									"order" : 0,
									"source" : [ "obj-144", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"hidden" : 1,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"order" : 0,
									"source" : [ "obj-19", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"order" : 1,
									"source" : [ "obj-19", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 0 ],
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 1 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"hidden" : 1,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
 ],
						"originid" : "pat-776"
					}
,
					"patching_rect" : [ 475.0, 20.0, 114.0, 22.0 ],
					"text" : "p \"fraction vs index\"",
					"varname" : "basic[5]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
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
						"openrect" : [ 0.0, 0.0, 1040.0, 740.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"showontab" : 1,
						"integercoordinates" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-10",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 632.0, 288.0, 90.0, 37.0 ],
									"presentation_linecount" : 2,
									"text" : "@mode 5: distribute"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.2,
									"bubbleside" : 2,
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 124.0, 253.0, 118.0, 39.0 ],
									"text" : "@mode 3: split"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 253.0, 99.0, 22.0 ],
									"text" : "[ [ 8 ] [ 5 8 ] [ 8 ] ]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 390.0, 253.0, 96.0, 22.0 ],
									"text" : "[ null [ 5 7 ] null ]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 379.0, 131.0, 286.0, 33.0 ],
									"text" : "Split voices from a single inlet into multiple outlets by specifying exact order of indices from each outlet"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 128.0, 206.0, 33.0 ],
									"text" : "Split voices from a single inlet into multiple outlets by voice count"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 379.0, 229.0, 169.0, 22.0 ],
									"text" : "[ [ 0 1 4 ] [ 5 5 5 ] [ 9 8 1 4 0 ] ]"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 18.0,
									"id" : "obj-69",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 379.0, 99.0, 116.0, 27.0 ],
									"text" : "DISTRIBUTE"
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
									"patching_rect" : [ 597.0, 419.0, 53.0, 22.0 ],
									"text" : "0, size 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"ignoreclick" : 1,
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 589.0, 375.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 589.0, 335.0, 58.0, 22.0 ],
									"text" : "route null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-52",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 628.0, 372.0, 51.0, 27.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 498.0, 419.0, 53.0, 22.0 ],
									"text" : "0, size 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-55",
									"ignoreclick" : 1,
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 490.0, 375.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 490.0, 335.0, 58.0, 22.0 ],
									"text" : "route null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 529.0, 372.0, 51.0, 27.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"spacing" : 1
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
									"patching_rect" : [ 387.0, 419.0, 53.0, 22.0 ],
									"text" : "0, size 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-60",
									"ignoreclick" : 1,
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 379.0, 375.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-61",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 379.0, 335.0, 58.0, 22.0 ],
									"text" : "route null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 418.0, 372.0, 51.0, 27.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 2,
									"id" : "obj-63",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 383.0, 171.0, 121.0, 52.0 ],
									"text" : "list of list of indices (per outlet)"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-65",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 607.0, 150.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-66",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 607.0, 175.0, 129.0, 35.0 ],
									"text" : "0 5 10 15 20 25 30 35 40 45 50 55 60"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-67",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 607.0, 228.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 13,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 379.0, 295.0, 247.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 1 3 @mode 5 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-22",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 280.0, 401.0, 53.0, 22.0 ],
									"text" : "0, size 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"ignoreclick" : 1,
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 244.0, 375.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 244.0, 335.0, 58.0, 22.0 ],
									"text" : "route null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 283.0, 372.0, 47.0, 27.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 165.0, 404.0, 53.0, 22.0 ],
									"text" : "0, size 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"ignoreclick" : 1,
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 139.0, 375.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 139.0, 335.0, 58.0, 22.0 ],
									"text" : "route null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 178.0, 372.0, 47.0, 27.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-84",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 59.0, 401.0, 53.0, 22.0 ],
									"text" : "0, size 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 60.0, 263.0, 50.0, 22.0 ],
									"text" : "5 2 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"ignoreclick" : 1,
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 31.0, 375.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 31.0, 335.0, 58.0, 22.0 ],
									"text" : "route null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-152",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 70.0, 372.0, 47.0, 27.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.3,
									"bubbleside" : 2,
									"id" : "obj-151",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 171.0, 91.0, 52.0 ],
									"text" : "num voices from each inlet"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-145",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 31.0, 227.0, 61.0, 25.0 ],
									"setminmax" : [ 0.0, 13.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-141",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 259.0, 141.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-142",
									"linecount" : 3,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 259.0, 166.0, 95.0, 49.0 ],
									"text" : "0 5 10 15 20 25 30 35 40 45 50 55 60"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-143",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 259.0, 228.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 13,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-144",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 31.0, 295.0, 247.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 1 3 @mode 3 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 18.0,
									"id" : "obj-121",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 31.0, 99.0, 75.0, 27.0 ],
									"text" : "SPLIT"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "ser.router" ],
									"maxclass" : "jsui",
									"nofsaa" : 1,
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 895.0, 120.0 ]
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
									"numinlets" : 3,
									"numoutlets" : 9,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "", "", "signal" ],
									"patching_rect" : [ 776.0, 196.0, 178.0, 269.0 ],
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
									"id" : "obj-6",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 746.0, 225.0, 20.0, 20.0 ],
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
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"hidden" : 1,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"hidden" : 1,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-142", 0 ],
									"hidden" : 1,
									"source" : [ "obj-141", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-143", 0 ],
									"hidden" : 1,
									"source" : [ "obj-142", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 1 ],
									"source" : [ "obj-143", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"source" : [ "obj-144", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"source" : [ "obj-144", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-144", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 0 ],
									"order" : 1,
									"source" : [ "obj-145", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 0,
									"source" : [ "obj-145", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"source" : [ "obj-16", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"hidden" : 1,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-84", 0 ],
									"hidden" : 1,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"hidden" : 1,
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-29", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-152", 0 ],
									"source" : [ "obj-38", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"hidden" : 1,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"hidden" : 1,
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-68", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"source" : [ "obj-51", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"hidden" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"hidden" : 1,
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-55", 0 ],
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"source" : [ "obj-56", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"hidden" : 1,
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"hidden" : 1,
									"source" : [ "obj-60", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"source" : [ "obj-61", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-66", 0 ],
									"hidden" : 1,
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"hidden" : 1,
									"source" : [ "obj-66", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-68", 1 ],
									"source" : [ "obj-67", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"source" : [ "obj-68", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"source" : [ "obj-68", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-61", 0 ],
									"source" : [ "obj-68", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-68", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-68", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-152", 0 ],
									"hidden" : 1,
									"source" : [ "obj-84", 0 ]
								}

							}
 ],
						"originid" : "pat-798"
					}
,
					"patching_rect" : [ 335.0, 20.0, 112.0, 22.0 ],
					"text" : "p \"split & distribute\"",
					"varname" : "basic[4]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
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
						"openrect" : [ 0.0, 0.0, 1040.0, 740.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"showontab" : 1,
						"integercoordinates" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 0,
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 65.0, 657.0, 118.0, 39.0 ],
									"text" : "@mode 4: mix"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 0,
									"id" : "obj-88",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 68.0, 331.0, 118.0, 39.0 ],
									"text" : "@mode 2: merge"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 262.0, 730.0, 53.0, 22.0 ],
									"text" : "0, size 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 19.0, 459.0, 266.0, 33.0 ],
									"text" : "Merge multiple inlets into a single outlet by selecting individual voices from individual inlets"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 18.0, 132.0, 240.0, 33.0 ],
									"text" : "Merge multiple inlets into a single outlet by specifying number of voices from each inlet"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.66,
									"bubbleside" : 0,
									"id" : "obj-12",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 422.0, 338.0, 189.0, 39.0 ],
									"text" : "@index 0 to use fraction / phase"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 95.0, 101.0, 90.0, 22.0 ],
									"text" : "loadmess 6 6 6"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-86",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 644.0, 417.0, 53.0, 22.0 ],
									"text" : "0, size 1"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-84",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 219.0, 410.0, 53.0, 22.0 ],
									"text" : "0, size 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-80",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 17.0, 586.0, 119.0, 22.0 ],
									"text" : "[ [ 2 0 ] [ 1 0 ] [ 0 0 ] ]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-79",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 17.0, 562.0, 152.0, 22.0 ],
									"text" : "[ [ 0 0 ] [ 0 1 ] [ 0 2 ] [ 0 3 ] ]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-78",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 17.0, 536.0, 119.0, 22.0 ],
									"text" : "[ [ 0 0 ] [ 1 0 ] [ 2 0 ] ]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-61",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 262.0, 697.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 262.0, 657.0, 58.0, 22.0 ],
									"text" : "route null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-63",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 301.0, 694.0, 72.0, 29.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.32,
									"bubbleside" : 2,
									"id" : "obj-64",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 19.0, 499.0, 176.0, 39.0 ],
									"text" : "pairs (inlet_index, voice_index)"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-66",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 354.0, 516.0, 58.0, 22.0 ],
									"text" : "loadbang"
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
									"patching_rect" : [ 354.0, 553.0, 39.0, 22.0 ],
									"text" : "55 60"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-68",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 299.0, 585.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 2,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-69",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 266.0, 516.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-70",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 263.0, 553.0, 55.0, 22.0 ],
									"text" : "30 35 40"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-71",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 242.0, 585.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-72",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 183.0, 516.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-73",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 183.0, 541.0, 75.0, 22.0 ],
									"text" : "0 5 10 15 20"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-74",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 183.0, 585.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 5,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-75",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 17.0, 626.0, 301.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 3 1 @mode 4 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 18.0,
									"id" : "obj-76",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 19.0, 430.0, 75.0, 27.0 ],
									"text" : "MIX"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-52",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 409.0, 275.0, 73.0, 35.0 ],
									"text" : "0.6 0.56 0.52"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 48.0, 275.0, 50.0, 22.0 ],
									"text" : "6 6 6"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"ignoreclick" : 1,
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 631.0, 378.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 631.0, 339.0, 58.0, 22.0 ],
									"text" : "route null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 670.0, 376.0, 72.0, 29.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.3,
									"bubbleside" : 2,
									"id" : "obj-5",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 372.0, 180.0, 104.0, 52.0 ],
									"text" : "fraction of voices from each inlet"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-7",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 392.0, 239.0, 61.0, 25.0 ],
									"setminmax" : [ 0.0, 1.0 ],
									"setstyle" : 1,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 674.0, 171.0, 58.0, 22.0 ],
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
									"patching_rect" : [ 674.0, 208.0, 49.0, 22.0 ],
									"text" : "0 60 30"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-10",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 674.0, 240.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 583.0, 171.0, 58.0, 22.0 ],
									"text" : "loadbang"
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
									"patching_rect" : [ 580.0, 208.0, 55.0, 22.0 ],
									"text" : "10 10 10"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-15",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 580.0, 240.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 486.0, 171.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-20",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 486.0, 196.0, 56.0, 35.0 ],
									"text" : "0 10 20 30 40 50"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-21",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 486.0, 240.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 392.0, 307.0, 301.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 3 1 @mode 2 @index 0 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"ignoreclick" : 1,
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 219.0, 379.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 219.0, 339.0, 58.0, 22.0 ],
									"text" : "route null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-152",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 258.0, 376.0, 72.0, 29.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 12,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.25,
									"bubbleside" : 2,
									"id" : "obj-151",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 18.0, 184.0, 92.0, 52.0 ],
									"text" : "num voices from each inlet"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-145",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 19.0, 239.0, 61.0, 25.0 ],
									"setminmax" : [ 0.0, 6.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-134",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 258.0, 171.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-135",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.0, 208.0, 49.0, 22.0 ],
									"text" : "0 60 30"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-136",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 258.0, 240.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-137",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 181.0, 171.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-138",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 178.0, 208.0, 55.0, 22.0 ],
									"text" : "10 10 10"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-139",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 178.0, 240.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-141",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 99.0, 171.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-142",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 99.0, 196.0, 56.0, 35.0 ],
									"text" : "0 10 20 30 40 50"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-143",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 99.0, 240.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-144",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 19.0, 307.0, 258.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 3 1 @mode 2 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 18.0,
									"id" : "obj-121",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 18.0, 101.0, 75.0, 27.0 ],
									"text" : "MERGE"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "ser.router" ],
									"maxclass" : "jsui",
									"nofsaa" : 1,
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 895.0, 120.0 ]
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
									"numinlets" : 3,
									"numoutlets" : 9,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "", "", "signal" ],
									"patching_rect" : [ 776.0, 196.0, 178.0, 269.0 ],
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
									"id" : "obj-6",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 745.0, 221.0, 20.0, 20.0 ],
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
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 3 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
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
									"destination" : [ "obj-135", 0 ],
									"hidden" : 1,
									"source" : [ "obj-134", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-136", 0 ],
									"hidden" : 1,
									"source" : [ "obj-135", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 3 ],
									"source" : [ "obj-136", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-138", 0 ],
									"hidden" : 1,
									"source" : [ "obj-137", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-139", 0 ],
									"hidden" : 1,
									"source" : [ "obj-138", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 2 ],
									"source" : [ "obj-139", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-142", 0 ],
									"hidden" : 1,
									"source" : [ "obj-141", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-143", 0 ],
									"hidden" : 1,
									"source" : [ "obj-142", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 1 ],
									"source" : [ "obj-143", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-144", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 0 ],
									"order" : 1,
									"source" : [ "obj-145", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 0,
									"source" : [ "obj-145", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 2 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"hidden" : 1,
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-63", 0 ],
									"hidden" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"hidden" : 1,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 1 ],
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-84", 0 ],
									"hidden" : 1,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-25", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-86", 0 ],
									"hidden" : 1,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-152", 0 ],
									"source" : [ "obj-38", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-145", 0 ],
									"hidden" : 1,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"source" : [ "obj-42", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"hidden" : 1,
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
									"destination" : [ "obj-63", 0 ],
									"source" : [ "obj-62", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"hidden" : 1,
									"source" : [ "obj-66", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-68", 0 ],
									"hidden" : 1,
									"source" : [ "obj-67", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 3 ],
									"source" : [ "obj-68", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-70", 0 ],
									"hidden" : 1,
									"source" : [ "obj-69", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 0 ],
									"order" : 1,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 1 ],
									"midpoints" : [ 401.5, 269.5, 472.5, 269.5 ],
									"order" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"hidden" : 1,
									"source" : [ "obj-70", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 2 ],
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"hidden" : 1,
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"hidden" : 1,
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 1 ],
									"source" : [ "obj-74", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"source" : [ "obj-75", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 0 ],
									"source" : [ "obj-78", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-75", 0 ],
									"source" : [ "obj-79", 0 ]
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
									"destination" : [ "obj-75", 0 ],
									"source" : [ "obj-80", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-152", 0 ],
									"hidden" : 1,
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"hidden" : 1,
									"source" : [ "obj-86", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"hidden" : 1,
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-820"
					}
,
					"patching_rect" : [ 223.0, 20.0, 94.0, 22.0 ],
					"text" : "p \"merge & mix\"",
					"varname" : "basic[3]"
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
						"openrect" : [ 0.0, 0.0, 1040.0, 740.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"showontab" : 1,
						"integercoordinates" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-88",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 245.0, 582.0, 125.0, 24.0 ],
									"text" : "@mode 1: through"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-84",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 976.0, 602.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.996078431372549, 0.423529411764706, 0.423529411764706, 1.0 ],
									"bgcolor2" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1.0 ],
									"bgfillcolor_angle" : 270.0,
									"bgfillcolor_autogradient" : 0.0,
									"bgfillcolor_color" : [ 0.996078431372549, 0.423529411764706, 0.423529411764706, 1.0 ],
									"bgfillcolor_color1" : [ 0.996078431372549, 0.423529411764706, 0.423529411764706, 1.0 ],
									"bgfillcolor_color2" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1.0 ],
									"bgfillcolor_proportion" : 0.5,
									"bgfillcolor_type" : "gradient",
									"gradient" : 1,
									"id" : "obj-83",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 566.0, 697.0, 199.0, 35.0 ],
									"text" : "TODO: This needs to be improved! Way too inconveninent for a gate!!"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-72",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 866.0, 634.0, 59.0, 22.0 ],
									"presentation_linecount" : 2,
									"text" : "null null 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-65",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 823.0, 634.0, 37.0, 22.0 ],
									"presentation_linecount" : 2,
									"text" : "null 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-63",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 791.0, 634.0, 30.0, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 984.0, 481.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 963.0, 508.0, 35.0, 22.0 ],
									"text" : "7 8 9"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 906.0, 508.0, 35.0, 22.0 ],
									"text" : "4 5 6"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 932.0, 568.0, 50.0, 22.0 ],
									"text" : "1. 2. 3."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"maxclass" : "number",
									"maximum" : 2,
									"minimum" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 791.0, 508.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 848.0, 508.0, 35.0, 22.0 ],
									"text" : "1 2 3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 742.0, 540.0, 45.0, 20.0 ],
									"presentation_linecount" : 2,
									"text" : "switch:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 791.0, 539.0, 191.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 3 1 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 932.0, 697.0, 50.0, 22.0 ],
									"text" : "1. 2. 3."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 875.0, 697.0, 50.0, 22.0 ],
									"text" : "null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 820.0, 697.0, 47.0, 22.0 ],
									"text" : "null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 963.0, 634.0, 35.0, 22.0 ],
									"text" : "1 2 3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 742.0, 668.0, 35.0, 20.0 ],
									"text" : "gate:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 791.0, 667.0, 191.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 1 3 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 724.0, 476.0, 97.0, 20.0 ],
									"text" : "Gate and Switch"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-10",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 224.0, 658.0, 58.0, 31.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 224.0, 617.0, 117.0, 35.0 ],
									"text" : "ser.util nullmap @nullreplacement 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-118",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 542.0, 617.0, 82.0, 22.0 ],
									"text" : "null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-117",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 428.0, 617.0, 82.0, 22.0 ],
									"text" : "null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-113",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 428.0, 519.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-112",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 377.0, 519.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-95",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 377.0, 552.0, 70.0, 22.0 ],
									"text" : "pak 0 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-97",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 420.0, 489.0, 48.0, 20.0 ],
									"text" : "outlet 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-98",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 365.0, 489.0, 48.0, 20.0 ],
									"text" : "outlet 0"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-103",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 607.0, 450.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-104",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 604.0, 487.0, 55.0, 22.0 ],
									"text" : "10 10 10"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-105",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 604.0, 519.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-106",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 365.0, 452.0, 71.0, 20.0 ],
									"text" : "N-N routing"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-107",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 490.0, 450.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-108",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 475.0, 65.0, 22.0 ],
									"text" : "0 10 20 30"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-109",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 490.0, 519.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 4,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-110",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 376.0, 583.0, 247.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 2 2 @mode 1 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-91",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 20.0, 623.0, 198.0, 22.0 ],
									"text" : "null"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.7,
									"id" : "obj-77",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 83.0, 489.0, 130.0, 51.0 ],
									"text" : "boolean mask (open/closed) for each voice"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-78",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 291.0, 527.0, 43.0, 20.0 ],
									"text" : "values"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-79",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.0, 450.0, 155.0, 20.0 ],
									"text" : "Within Voices (1-1 routing)"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-80",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 224.0, 451.0, 58.0, 22.0 ],
									"text" : "loadbang"
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
									"patching_rect" : [ 224.0, 483.0, 99.0, 22.0 ],
									"text" : "0 10 20 30 40 50"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-82",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 224.0, 515.0, 58.0, 31.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-85",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 16.0, 484.0, 65.0, 22.0 ],
									"text" : "1 1 1 1 1 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-86",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 35.0, 553.0, 75.0, 22.0 ],
									"text" : "1 0 1 0 0 1"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-87",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 16.0, 518.0, 61.0, 25.0 ],
									"setminmax" : [ 0.0, 1.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-89",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 16.0, 583.0, 227.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router @mode 1 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 18.0,
									"id" : "obj-75",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.0, 412.0, 99.0, 27.0 ],
									"text" : "THROUGH"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-74",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 83.0, 237.0, 109.0, 37.0 ],
									"text" : "list of incoming voice indices"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 277.0, 255.0, 43.0, 20.0 ],
									"text" : "values"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 640.0, 342.0, 67.0, 27.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-70",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 512.0, 342.0, 67.0, 27.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-69",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 383.0, 277.0, 58.0, 22.0 ],
									"text" : "pak 0 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"maxclass" : "number",
									"maximum" : 2,
									"minimum" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 422.0, 242.0, 36.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-67",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 422.0, 214.0, 48.0, 20.0 ],
									"text" : "outlet 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-66",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 377.0, 214.0, 48.0, 20.0 ],
									"text" : "outlet 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-64",
									"maxclass" : "number",
									"maximum" : 2,
									"minimum" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 383.0, 242.0, 36.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-62",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 640.0, 241.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 557.0, 172.0, 58.0, 22.0 ],
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
									"patching_rect" : [ 554.0, 209.0, 55.0, 22.0 ],
									"text" : "10 10 10"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-59",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 554.0, 241.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 383.0, 173.0, 71.0, 20.0 ],
									"text" : "N-M routing"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-47",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 469.0, 172.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-48",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 469.0, 197.0, 56.0, 35.0 ],
									"text" : "0 10 20 30 40 50"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-49",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 469.0, 241.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 383.0, 308.0, 276.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 3 2 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 21.0, 175.0, 155.0, 20.0 ],
									"text" : "Within Voices (1-1 routing)"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 18.0,
									"id" : "obj-43",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 21.0, 134.0, 71.0, 27.0 ],
									"text" : "ROUTE"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 210.0, 179.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-38",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 210.0, 211.0, 99.0, 22.0 ],
									"text" : "0 10 20 30 40 50"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-24",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 210.0, 243.0, 58.0, 31.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 210.0, 348.0, 72.0, 29.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 101.0, 209.0, 65.0, 22.0 ],
									"text" : "5 4 3 2 1 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 20.0, 209.0, 75.0, 22.0 ],
									"text" : "5 5 5 3 1 2 4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 38.0, 284.0, 75.0, 22.0 ],
									"text" : "5 4 3 2 1 0"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-15",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 20.0, 243.0, 61.0, 25.0 ],
									"setminmax" : [ 0.0, 5.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 128.0, 352.0, 145.0, 22.0 ],
									"text" : "50. 40. 30. 20. 10. 0."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 20.0, 308.0, 209.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "ser.router" ],
									"maxclass" : "jsui",
									"nofsaa" : 1,
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 895.0, 120.0 ]
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
									"numinlets" : 3,
									"numoutlets" : 9,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "", "", "signal" ],
									"patching_rect" : [ 776.0, 196.0, 178.0, 269.0 ],
									"varname" : "ser.transport.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 0.0 ],
									"border" : 1,
									"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
									"id" : "obj-3",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 721.0, 475.0, 289.0, 256.0 ],
									"proportion" : 0.5,
									"rounded" : 0
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
									"patching_rect" : [ 745.0, 221.0, 20.0, 20.0 ],
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
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-104", 0 ],
									"hidden" : 1,
									"source" : [ "obj-103", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-105", 0 ],
									"hidden" : 1,
									"source" : [ "obj-104", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-110", 2 ],
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-108", 0 ],
									"hidden" : 1,
									"source" : [ "obj-107", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-109", 0 ],
									"hidden" : 1,
									"source" : [ "obj-108", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-110", 1 ],
									"source" : [ "obj-109", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-117", 1 ],
									"source" : [ "obj-110", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-118", 1 ],
									"source" : [ "obj-110", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-95", 0 ],
									"source" : [ "obj-112", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-95", 1 ],
									"source" : [ "obj-113", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 1 ],
									"order" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"order" : 1,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 1 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 1 ],
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 1 ],
									"source" : [ "obj-37", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"hidden" : 1,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"hidden" : 1,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 2 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 3 ],
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"hidden" : 1,
									"order" : 2,
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"hidden" : 1,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"hidden" : 1,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 1 ],
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
									"destination" : [ "obj-70", 0 ],
									"source" : [ "obj-56", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"source" : [ "obj-56", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"hidden" : 1,
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"hidden" : 1,
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 2 ],
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 1 ],
									"source" : [ "obj-6", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 1 ],
									"source" : [ "obj-6", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"source" : [ "obj-6", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 3 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 0 ],
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 1 ],
									"source" : [ "obj-68", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"source" : [ "obj-69", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 1 ],
									"midpoints" : [ 219.5, 338.5, 263.5, 338.5 ],
									"order" : 0,
									"source" : [ "obj-7", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"order" : 1,
									"source" : [ "obj-7", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"hidden" : 1,
									"source" : [ "obj-80", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-82", 0 ],
									"hidden" : 1,
									"source" : [ "obj-81", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-89", 1 ],
									"source" : [ "obj-82", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"hidden" : 1,
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-87", 0 ],
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-86", 1 ],
									"midpoints" : [ 25.5, 548.0, 100.5, 548.0 ],
									"order" : 0,
									"source" : [ "obj-87", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-89", 0 ],
									"order" : 1,
									"source" : [ "obj-87", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"order" : 0,
									"source" : [ "obj-89", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 1 ],
									"order" : 1,
									"source" : [ "obj-89", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-110", 0 ],
									"source" : [ "obj-95", 0 ]
								}

							}
 ],
						"originid" : "pat-842"
					}
,
					"patching_rect" : [ 98.0, 21.0, 110.0, 22.0 ],
					"text" : "p \"route & through\"",
					"varname" : "basic[2]"
				}

			}
, 			{
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
						"boxes" : [  ],
						"lines" : [  ],
						"originid" : "pat-864"
					}
,
					"patching_rect" : [ 755.0, 20.0, 25.0, 22.0 ],
					"text" : "p ?"
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
						"rect" : [ 0.0, 26.0, 2512.0, 1230.0 ],
						"openrect" : [ 0.0, 0.0, 1040.0, 740.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"showontab" : 1,
						"integercoordinates" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.2,
									"id" : "obj-8",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 266.0, 307.0, 257.0, 37.0 ],
									"presentation_linecount" : 5,
									"text" : "@mapping_trigger (default 0): trigger output when mapping (first inlet) changes "
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.2,
									"bubbleside" : 0,
									"id" : "obj-16",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 25.0, 573.0, 129.0, 52.0 ],
									"text" : "Note that all routing specs are 0-indexed! "
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 1.0,
									"id" : "obj-14",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 155.0, 233.0, 130.0, 51.0 ],
									"text" : "similar to [gate], leftmost inlet controls routing"
								}

							}
, 							{
								"box" : 								{
									"attr" : "index",
									"id" : "obj-57",
									"lock" : 1,
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 436.0, 254.0, 103.0, 22.0 ],
									"text_width" : 63.0
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-55",
									"linecount" : 14,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 676.0, 483.0, 329.0, 194.0 ],
									"text" : "Modes:\n\n- Route (0): 1-1 or N-M routing of voices / inlets by index/phase\n\n- Through (1): 1-1 or N-N routing of voices by boolean mask\n\n- Merge (2): N-1 routing by voice count\n\n- Split (3): 1-M routing by voice count\n\n- Mix (4): N-1 routing with detailed control\n\n- Distribute (5): 1-M routing with detailed control"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 458.0, 589.0, 193.0, 20.0 ],
									"text" : "Routing pulses (see \"pulses\" tab):"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-53",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 554.0, 498.0, 102.0, 37.0 ],
									"text" : "these three are equivalent"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 458.0, 505.0, 59.0, 22.0 ],
									"text" : "ser.router"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 458.0, 531.0, 89.0, 22.0 ],
									"text" : "ser.router 1 1 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 458.0, 555.0, 123.0, 22.0 ],
									"text" : "ser.router 1 1 number"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 458.0, 642.0, 89.0, 22.0 ],
									"text" : "ser.router 1 1 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 458.0, 474.0, 150.0, 20.0 ],
									"text" : "Routing numbers:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 458.0, 613.0, 111.0, 22.0 ],
									"text" : "ser.router 1 1 pulse"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 340.0, 582.0, 67.0, 27.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-70",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 182.0, 582.0, 67.0, 27.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-69",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 25.0, 516.0, 70.0, 22.0 ],
									"text" : "pak 0 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"maxclass" : "number",
									"maximum" : 2,
									"minimum" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 76.0, 481.0, 41.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-67",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 87.0, 453.0, 48.0, 20.0 ],
									"text" : "outlet 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-66",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 26.0, 453.0, 48.0, 20.0 ],
									"text" : "outlet 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-64",
									"maxclass" : "number",
									"maximum" : 2,
									"minimum" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 25.0, 481.0, 41.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-61",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 327.0, 451.0, 49.0, 22.0 ],
									"text" : "0 60 30"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-62",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 340.0, 483.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
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
									"patching_rect" : [ 258.0, 451.0, 55.0, 22.0 ],
									"text" : "10 10 10"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-59",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 235.0, 483.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 3,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-47",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 342.0, 427.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-48",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 148.0, 439.0, 56.0, 35.0 ],
									"text" : "0 10 20 30 40 50"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-49",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 130.0, 483.0, 50.0, 24.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 25.0, 547.0, 334.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router 3 2 @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 25.0, 424.0, 296.0, 20.0 ],
									"text" : "Routing between multiple inlets (N-M routing)"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.2,
									"bubbleside" : 2,
									"id" : "obj-9",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 471.0, 202.0, 179.0, 52.0 ],
									"text" : "unlike most other objects, router defaults to @index 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 98.0, 254.0, 75.0, 22.0 ],
									"text" : "5 5 5 3 1 2 4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 110.0, 278.0, 30.0, 22.0 ],
									"text" : "2 3"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubblepoint" : 0.2,
									"bubbleside" : 0,
									"fontface" : 1,
									"id" : "obj-154",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 47.0, 334.0, 119.0, 52.0 ],
									"text" : "note: leftmost outlet is dumpout",
									"textcolor" : [ 0.996078431372549, 0.423529411764706, 0.423529411764706, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-74",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 138.0, 206.0, 82.0, 24.0 ],
									"text" : "set indices"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 363.0, 255.0, 43.0, 20.0 ],
									"text" : "values"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 25.0, 169.0, 296.0, 20.0 ],
									"text" : "Routing individual voices on a single inlet (1-1 routing)"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 318.0, 175.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 296.0, 211.0, 99.0, 22.0 ],
									"text" : "0 10 20 30 40 50"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-24",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 296.0, 243.0, 58.0, 31.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 6,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"ignoreclick" : 1,
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 242.0, 357.0, 72.0, 29.0 ],
									"setminmax" : [ 0.0, 60.0 ],
									"setstyle" : 1,
									"settype" : 0,
									"size" : 7,
									"spacing" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 84.0, 231.0, 65.0, 22.0 ],
									"text" : "5 4 3 2 1 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 64.0, 207.0, 65.0, 22.0 ],
									"text" : "0 1 2 3 4 5"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 327.0, 357.0, 89.0, 22.0 ],
									"text" : "null"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 64.0, 306.0, 197.0, 22.0 ],
									"saved_object_attributes" : 									{
										"mapping_trigger" : 1
									}
,
									"text" : "ser.router @mapping_trigger 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 101.0, 379.0, 33.0 ],
									"text" : "ser.router allows routing and/or mixing of either individual voices on a single inlet, or routing entire voices between mutliple outlets"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "ser.router" ],
									"maxclass" : "jsui",
									"nofsaa" : 1,
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 895.0, 120.0 ]
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
									"numinlets" : 3,
									"numoutlets" : 9,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "", "", "", "", "", "", "", "", "signal" ],
									"patching_rect" : [ 695.0, 191.0, 178.0, 269.0 ],
									"varname" : "ser.transport.ui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 0.0 ],
									"border" : 1,
									"bordercolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
									"id" : "obj-3",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 450.0, 459.0, 201.0, 218.0 ],
									"proportion" : 0.5,
									"rounded" : 0
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
									"patching_rect" : [ 664.0, 219.0, 20.0, 20.0 ],
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
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"hidden" : 1,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"hidden" : 1,
									"order" : 2,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-61", 0 ],
									"hidden" : 1,
									"order" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"hidden" : 1,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 1 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-70", 0 ],
									"source" : [ "obj-56", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"source" : [ "obj-56", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"midpoints" : [ 445.5, 299.421875, 73.5, 299.421875 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"hidden" : 1,
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 2 ],
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"hidden" : 1,
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 3 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 0 ],
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 1 ],
									"source" : [ "obj-68", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"source" : [ "obj-69", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 1 ],
									"midpoints" : [ 251.5, 349.06640625, 406.5, 349.06640625 ],
									"order" : 0,
									"source" : [ "obj-7", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"order" : 1,
									"source" : [ "obj-7", 1 ]
								}

							}
 ],
						"originid" : "pat-866"
					}
,
					"patching_rect" : [ 23.0, 20.0, 47.0, 22.0 ],
					"text" : "p basic",
					"varname" : "basic[1]"
				}

			}
 ],
		"lines" : [  ],
		"originid" : "pat-728",
		"parameters" : 		{
			"obj-1::obj-1::obj-113" : [ "live.text[272]", "live.text", 0 ],
			"obj-1::obj-1::obj-34::obj-1" : [ "live.numbox[44]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-40" : [ "live.text", "live.text", 0 ],
			"obj-1::obj-1::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-1::obj-1::obj-48" : [ "live.text[2]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-87" : [ "live.gain~[3]", "live.gain~", 0 ],
			"obj-1::obj-1::obj-90" : [ "live.text[6]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-92" : [ "live.text[5]", "live.text[2]", 0 ],
			"obj-1::obj-1::obj-94" : [ "live.text[7]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-113" : [ "live.text[8]", "live.text", 0 ],
			"obj-3::obj-1::obj-34::obj-1" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-3::obj-1::obj-40" : [ "live.text[11]", "live.text", 0 ],
			"obj-3::obj-1::obj-42" : [ "live.text[12]", "live.text", 0 ],
			"obj-3::obj-1::obj-48" : [ "live.text[14]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-87" : [ "live.gain~[4]", "live.gain~", 0 ],
			"obj-3::obj-1::obj-90" : [ "live.text[13]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-92" : [ "live.text[9]", "live.text[2]", 0 ],
			"obj-3::obj-1::obj-94" : [ "live.text[10]", "live.text[2]", 0 ],
			"obj-4::obj-1::obj-113" : [ "live.text[16]", "live.text", 0 ],
			"obj-4::obj-1::obj-34::obj-1" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-4::obj-1::obj-40" : [ "live.text[21]", "live.text", 0 ],
			"obj-4::obj-1::obj-42" : [ "live.text[17]", "live.text", 0 ],
			"obj-4::obj-1::obj-48" : [ "live.text[20]", "live.text[2]", 0 ],
			"obj-4::obj-1::obj-87" : [ "live.gain~[5]", "live.gain~", 0 ],
			"obj-4::obj-1::obj-90" : [ "live.text[19]", "live.text[2]", 0 ],
			"obj-4::obj-1::obj-92" : [ "live.text[15]", "live.text[2]", 0 ],
			"obj-4::obj-1::obj-94" : [ "live.text[18]", "live.text[2]", 0 ],
			"obj-5::obj-1::obj-113" : [ "live.text[25]", "live.text", 0 ],
			"obj-5::obj-1::obj-34::obj-1" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-5::obj-1::obj-40" : [ "live.text[26]", "live.text", 0 ],
			"obj-5::obj-1::obj-42" : [ "live.text[23]", "live.text", 0 ],
			"obj-5::obj-1::obj-48" : [ "live.text[28]", "live.text[2]", 0 ],
			"obj-5::obj-1::obj-87" : [ "live.gain~[6]", "live.gain~", 0 ],
			"obj-5::obj-1::obj-90" : [ "live.text[22]", "live.text[2]", 0 ],
			"obj-5::obj-1::obj-92" : [ "live.text[27]", "live.text[2]", 0 ],
			"obj-5::obj-1::obj-94" : [ "live.text[24]", "live.text[2]", 0 ],
			"obj-6::obj-1::obj-113" : [ "live.text[29]", "live.text", 0 ],
			"obj-6::obj-1::obj-34::obj-1" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-6::obj-1::obj-40" : [ "live.text[30]", "live.text", 0 ],
			"obj-6::obj-1::obj-42" : [ "live.text[33]", "live.text", 0 ],
			"obj-6::obj-1::obj-48" : [ "live.text[32]", "live.text[2]", 0 ],
			"obj-6::obj-1::obj-87" : [ "live.gain~[7]", "live.gain~", 0 ],
			"obj-6::obj-1::obj-90" : [ "live.text[31]", "live.text[2]", 0 ],
			"obj-6::obj-1::obj-92" : [ "live.text[35]", "live.text[2]", 0 ],
			"obj-6::obj-1::obj-94" : [ "live.text[34]", "live.text[2]", 0 ],
			"obj-7::obj-1::obj-113" : [ "live.text[37]", "live.text", 0 ],
			"obj-7::obj-1::obj-34::obj-1" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-7::obj-1::obj-40" : [ "live.text[42]", "live.text", 0 ],
			"obj-7::obj-1::obj-42" : [ "live.text[36]", "live.text", 0 ],
			"obj-7::obj-1::obj-48" : [ "live.text[41]", "live.text[2]", 0 ],
			"obj-7::obj-1::obj-87" : [ "live.gain~[8]", "live.gain~", 0 ],
			"obj-7::obj-1::obj-90" : [ "live.text[40]", "live.text[2]", 0 ],
			"obj-7::obj-1::obj-92" : [ "live.text[39]", "live.text[2]", 0 ],
			"obj-7::obj-1::obj-94" : [ "live.text[38]", "live.text[2]", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"parameter_overrides" : 			{
				"obj-1::obj-1::obj-113" : 				{
					"parameter_initial" : 0,
					"parameter_initial_enable" : 0,
					"parameter_longname" : "live.text[272]"
				}
,
				"obj-1::obj-1::obj-40" : 				{
					"parameter_longname" : "live.text"
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
				"obj-1::obj-1::obj-87" : 				{
					"parameter_longname" : "live.gain~[3]"
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
				"obj-3::obj-1::obj-113" : 				{
					"parameter_longname" : "live.text[8]"
				}
,
				"obj-3::obj-1::obj-34::obj-1" : 				{
					"parameter_longname" : "live.numbox[1]"
				}
,
				"obj-3::obj-1::obj-40" : 				{
					"parameter_longname" : "live.text[11]"
				}
,
				"obj-3::obj-1::obj-42" : 				{
					"parameter_longname" : "live.text[12]"
				}
,
				"obj-3::obj-1::obj-48" : 				{
					"parameter_longname" : "live.text[14]"
				}
,
				"obj-3::obj-1::obj-87" : 				{
					"parameter_longname" : "live.gain~[4]"
				}
,
				"obj-3::obj-1::obj-90" : 				{
					"parameter_longname" : "live.text[13]"
				}
,
				"obj-3::obj-1::obj-92" : 				{
					"parameter_longname" : "live.text[9]"
				}
,
				"obj-3::obj-1::obj-94" : 				{
					"parameter_longname" : "live.text[10]"
				}
,
				"obj-4::obj-1::obj-113" : 				{
					"parameter_longname" : "live.text[16]"
				}
,
				"obj-4::obj-1::obj-34::obj-1" : 				{
					"parameter_longname" : "live.numbox[2]"
				}
,
				"obj-4::obj-1::obj-40" : 				{
					"parameter_longname" : "live.text[21]"
				}
,
				"obj-4::obj-1::obj-42" : 				{
					"parameter_longname" : "live.text[17]"
				}
,
				"obj-4::obj-1::obj-48" : 				{
					"parameter_longname" : "live.text[20]"
				}
,
				"obj-4::obj-1::obj-87" : 				{
					"parameter_longname" : "live.gain~[5]"
				}
,
				"obj-4::obj-1::obj-90" : 				{
					"parameter_longname" : "live.text[19]"
				}
,
				"obj-4::obj-1::obj-92" : 				{
					"parameter_longname" : "live.text[15]"
				}
,
				"obj-4::obj-1::obj-94" : 				{
					"parameter_longname" : "live.text[18]"
				}
,
				"obj-5::obj-1::obj-113" : 				{
					"parameter_longname" : "live.text[25]"
				}
,
				"obj-5::obj-1::obj-34::obj-1" : 				{
					"parameter_longname" : "live.numbox[3]"
				}
,
				"obj-5::obj-1::obj-40" : 				{
					"parameter_longname" : "live.text[26]"
				}
,
				"obj-5::obj-1::obj-42" : 				{
					"parameter_longname" : "live.text[23]"
				}
,
				"obj-5::obj-1::obj-48" : 				{
					"parameter_longname" : "live.text[28]"
				}
,
				"obj-5::obj-1::obj-87" : 				{
					"parameter_longname" : "live.gain~[6]"
				}
,
				"obj-5::obj-1::obj-90" : 				{
					"parameter_longname" : "live.text[22]"
				}
,
				"obj-5::obj-1::obj-92" : 				{
					"parameter_longname" : "live.text[27]"
				}
,
				"obj-5::obj-1::obj-94" : 				{
					"parameter_longname" : "live.text[24]"
				}
,
				"obj-6::obj-1::obj-113" : 				{
					"parameter_longname" : "live.text[29]"
				}
,
				"obj-6::obj-1::obj-34::obj-1" : 				{
					"parameter_longname" : "live.numbox[4]"
				}
,
				"obj-6::obj-1::obj-40" : 				{
					"parameter_longname" : "live.text[30]"
				}
,
				"obj-6::obj-1::obj-42" : 				{
					"parameter_longname" : "live.text[33]"
				}
,
				"obj-6::obj-1::obj-48" : 				{
					"parameter_longname" : "live.text[32]"
				}
,
				"obj-6::obj-1::obj-87" : 				{
					"parameter_longname" : "live.gain~[7]"
				}
,
				"obj-6::obj-1::obj-90" : 				{
					"parameter_longname" : "live.text[31]"
				}
,
				"obj-6::obj-1::obj-92" : 				{
					"parameter_longname" : "live.text[35]"
				}
,
				"obj-6::obj-1::obj-94" : 				{
					"parameter_longname" : "live.text[34]"
				}
,
				"obj-7::obj-1::obj-113" : 				{
					"parameter_longname" : "live.text[37]"
				}
,
				"obj-7::obj-1::obj-34::obj-1" : 				{
					"parameter_longname" : "live.numbox[5]"
				}
,
				"obj-7::obj-1::obj-40" : 				{
					"parameter_longname" : "live.text[42]"
				}
,
				"obj-7::obj-1::obj-42" : 				{
					"parameter_longname" : "live.text[36]"
				}
,
				"obj-7::obj-1::obj-48" : 				{
					"parameter_longname" : "live.text[41]"
				}
,
				"obj-7::obj-1::obj-87" : 				{
					"parameter_longname" : "live.gain~[8]"
				}
,
				"obj-7::obj-1::obj-90" : 				{
					"parameter_longname" : "live.text[40]"
				}
,
				"obj-7::obj-1::obj-92" : 				{
					"parameter_longname" : "live.text[39]"
				}
,
				"obj-7::obj-1::obj-94" : 				{
					"parameter_longname" : "live.text[38]"
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "helpdetails.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "pyosc.awaitpatcherargs.maxpat",
				"bootpath" : "~/MaxProjects/pyosc/pyosc/patchers",
				"patcherrelativepath" : "../../pyosc/pyosc/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.core.slider.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/ui",
				"patcherrelativepath" : "../patchers/ui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.makenote.mxo",
				"type" : "iLaX"
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
				"name" : "ser.phasemap.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.pulse.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.pulseview.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/ui",
				"patcherrelativepath" : "../patchers/ui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.random.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.router.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.scope.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/view",
				"patcherrelativepath" : "../patchers/view",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.slidermapping.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.transport.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ser.transport.ui.maxpat",
				"bootpath" : "~/MaxProjects/serialist-max/patchers/generatives",
				"patcherrelativepath" : "../patchers/generatives",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ser.util.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
