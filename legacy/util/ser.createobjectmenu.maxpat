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
		"rect" : [ 34.0, 87.0, 2512.0, 1256.0 ],
		"openinpresentation" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"integercoordinates" : 1,
		"boxes" : [ 			{
				"box" : 				{
					"color" : [ 0.1421581805, 0.6723723412, 0.2530546784, 1.0 ],
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1.0, 129.0, 159.0, 22.0 ],
					"text" : "s ser.global.create.createobj"
				}

			}
, 			{
				"box" : 				{
					"button" : 1,
					"fontname" : "Ableton Sans Medium",
					"fontsize" : 9.5,
					"id" : "obj-19",
					"maxclass" : "tab",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1.0, 2.0, 148.0, 96.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.0, 2.0, 110.0, 92.0 ],
					"tabcolor" : [ 0.125490196078431, 0.125490196078431, 0.125490196078431, 1.0 ],
					"tabs" : [ "Dummy Oscillator", "Oscillator", "PhasePulse", "Interpolator" ],
					"textcolor" : [ 0.933333333333333, 0.933333333333333, 0.933333333333333, 1.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-19", 1 ]
				}

			}
 ],
		"originid" : "pat-13485",
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
