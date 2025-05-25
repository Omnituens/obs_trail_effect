uniform bool useCustomAlpha<
	string label = "Use Custom Alpha";
> = false;

uniform float customAlpha<
    string label = "Alpha";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 1.0;
    float step = 0.001;
> = 0.8; //<Range(0.0, 1.0)>

uniform float4 colour0 = {0, 0, 0, 1.0};
uniform float colour0th<
    string label = "Colour 0 Threshold";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 1.0;
    float step = 0.01;
> = 0.8;

uniform float4 colour1 = {0, 0, 0, 1.0};
uniform float colour1th<
    string label = "Colour 1 Threshold";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 1.0;
    float step = 0.01;
> = 0.6;

uniform float4 colour2 = {0, 0, 0, 1.0};
uniform float colour2th<
    string label = "Colour 2 Threshold";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 1.0;
    float step = 0.01;
> = 0.4;

uniform float4 colour3 = {0, 0, 0, 1.0};
uniform float colour3th<
    string label = "Colour 3 Threshold";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 1.0;
    float step = 0.01;
> = 0.2;

uniform float4 colour4 = {0, 0, 0, 1.0};
uniform float colour4th<
    string label = "Colour 4 Threshold";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 1.0;
    float step = 0.01;
> = 0.0;

uniform float4 colour5 = {0, 0, 0, 1.0};
uniform float colour5th<
    string label = "Colour 5 Threshold";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 1.0;
    float step = 0.01;
> = 0.0;

uniform float4 colour6 = {0, 0, 0, 1.0};
uniform float colour6th<
    string label = "Colour 6 Threshold";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 1.0;
    float step = 0.01;
> = 0.0;

float4 mainImage(VertData v_in) : TARGET
{
	float4 colour = image.Sample(textureSampler, v_in.uv);
	if(colour.a < 0.05) return float4(0.0, 0.0, 0.0, 0.0);
	
	float4 finalColour;
	
	if(colour.a >= colour0th) finalColour = colour0;
	else if(colour.a >= colour1th) finalColour = colour1;
	else if(colour.a >= colour2th) finalColour = colour2;
	else if(colour.a >= colour3th) finalColour = colour3;
	else if(colour.a >= colour4th) finalColour = colour4;
	else if(colour.a >= colour5th) finalColour = colour5;
	else finalColour = colour6;
	
	if(useCustomAlpha) finalColour.a = customAlpha;
	else finalColour.a = colour.a;
	
	return finalColour;
}