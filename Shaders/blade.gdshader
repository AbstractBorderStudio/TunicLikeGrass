shader_type spatial;

group_uniforms generic;
uniform vec3 _col : source_color = vec3(1.0);

group_uniforms force_field;
uniform vec3 _dir = vec3(0.0);
uniform float _strength = 1.0;

group_uniforms wind;
uniform vec3 _wind_dir = vec3(0.0);
uniform float _wind_stg = 1.0;
uniform sampler2D _wind_noise;

void vertex() {
	// add force field
	VERTEX += (1.0 - UV.y) * _dir * _strength; 
	// add wind with some noise
	//vec3 n = texture(_wind_noise, (UV)).rgb;
	//VERTEX += (1.0 - UV.y) * _wind_dir + n;
}

void fragment() {
	ALBEDO = _col;
}