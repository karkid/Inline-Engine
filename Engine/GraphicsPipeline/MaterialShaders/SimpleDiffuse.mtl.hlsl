float4 main(float4 diffuse) {
	//albedo = diffuse;
	//roughnessMetalness = float2(1.0, 0.0);
	return float4(GetLighting(g_ndcPos, diffuse, g_normal, g_vsPos, 1.0, 0.0), 1.0);// +0.5*float4(0.6, 0, 0, 1.0f);;
	// Normal debugging
	//return float4(normalize(saturate(g_normal)), 1.0f);// +0.5*float4(0.6, 0, 0, 1.0f);;
	//float lighting = saturate(dot(-g_lightDir, g_normal));
	//return float4(lighting, lighting, lighting, lighting);
}